from __future__ import annotations

"""
Spider2-snow용 Text2SQL + BoN 시스템이
Spider2 evaluation_suite에서 요구하는 submission 형식(.sql 파일들)을
자동으로 생성해 주는 스크립트.

이 스크립트로 생성한 submission 폴더를
Spider2의 evaluation_suite/evaluate.py 에 넘기면,
공식 baseline 과 동일한 방식으로 exec_result CSV 및 점수를 얻을 수 있다.
"""

import json
from pathlib import Path
from typing import List, Optional

from src.text2sql.datasets.load_spider import (
    SpiderExample,
    build_schema_text_from_ddl,
    load_spider_examples,
)
from src.text2sql.pipeline import Mode, PipelineResultItem, run_text2sql_bon_pipeline
from src.text2sql.db.sqlite_runner import make_spider_sqlite_run_query


def export_spider_submission_fixed(
    dataset_root: Path,
    submission_dir: Path,
    n_examples: Optional[int] = None,
    n_candidates: int = 5,
    mode: Mode = "fixed",
) -> None:
    """
    Spider2-snow jsonl을 순회하면서,
    각 instance_id에 대해 BoN 파이프라인으로 best SQL을 생성하고
    `<instance_id>.sql` 파일로 저장한다.

    ※ 주의: 이 함수는 exec_result까지 만들지 않고,
           Spider2 evaluation_suite가 요구하는 submission(.sql) 폴더까지만 생성한다.
           이후 exec_result 및 평가 점수는 Spider2의 evaluate.py로 계산한다.
    """
    submission_dir.mkdir(parents=True, exist_ok=True)

    examples = load_spider_examples(dataset_root)

    if n_examples is not None:
        examples = examples[:n_examples]

    # 후보 SQL + 점수 캐시 위치
    # 프로젝트 루트의 src/results/bon_cache 아래에 저장
    # dataset_root == <project_root>/spider_data 이므로, parent()가 project_root
    project_root = dataset_root.parent
    cache_root = project_root / "src" / "results" / "bon_cache"

    def _get_cache_path(example: SpiderExample) -> Path:
        mode_str = str(mode)
        dir_path = cache_root / f"{mode_str}_N{n_candidates}"
        dir_path.mkdir(parents=True, exist_ok=True)
        return dir_path / f"{example.instance_id}.json"

    for idx, ex in enumerate(examples, start=1):
        print(
            f"[SUBMIT] ({idx}/{len(examples)}) instance_id={ex.instance_id}, db_id={ex.db_id}",
            flush=True,
        )

        schema_text = build_schema_text_from_ddl(dataset_root, ex.db_id)

        # 스키마가 너무 크면 LLM 호출을 스킵 (토큰 한도 보호)
        from .load_spider import MAX_SCHEMA_CHARS_FOR_LLM  # lazy import to avoid cycles

        if len(schema_text) > MAX_SCHEMA_CHARS_FOR_LLM:
            print(
                f"[SUBMIT]   schema for db_id={ex.db_id} too large "
                f"({len(schema_text)} chars), skipping.",
                flush=True,
            )
            continue
        cache_path = _get_cache_path(ex)

        # 1) 후보 SQL/점수는 캐시 사용 (없으면 BoN 파이프라인 호출)
        if cache_path.exists():
            try:
                with cache_path.open("r", encoding="utf-8") as f:
                    cached: List[PipelineResultItem] = json.load(f)
                results = cached
                print(f"[SUBMIT]   loaded cached candidates from {cache_path}", flush=True)
            except Exception as e:  # noqa: BLE001
                print(f"[WARN][SUBMIT] failed to load cache {cache_path}: {e}", flush=True)
                results = []
        else:
            # 실행 기반 execution_score를 사용하기 위해 SQLite run_query를 준비
            run_query = None
            try:
                run_query = make_spider_sqlite_run_query(
                    dataset_root=dataset_root,
                    db_id=ex.db_id,
                    split="test",
                )
            except FileNotFoundError as e:
                print(f"[WARN][SUBMIT] {e} (fallback to heuristic execution score)", flush=True)

            results = run_text2sql_bon_pipeline(
                question=ex.instruction,
                schema_text=schema_text,
                n_candidates=n_candidates,
                mode=mode,
                run_query=run_query,
            )
            try:
                with cache_path.open("w", encoding="utf-8") as f:
                    json.dump(results, f, ensure_ascii=False, indent=2)
                print(f"[SUBMIT]   saved candidates cache to {cache_path}", flush=True)
            except Exception as e:  # noqa: BLE001
                print(f"[WARN][SUBMIT] failed to save cache {cache_path}: {e}", flush=True)

        if not results:
            print(f"[WARN][SUBMIT] no candidates for {ex.instance_id}, skip writing .sql", flush=True)
            continue

        best_sql = results[0]["sql"]

        # 2) Spider2 submission 형식에 맞게 .sql 파일로 저장
        out_path = submission_dir / f"{ex.instance_id}.sql"
        with out_path.open("w", encoding="utf-8") as f:
            f.write(best_sql.strip() + "\n")


def main() -> None:
    """
    간단 CLI:

    python -m src.text2sql.datasets.spider_to_sql_fixed

    을 실행하면, 프로젝트 루트의 `spider_data` 폴더를
    Spider/Spider2 계열 데이터셋 루트로 가정하고,
    그 하위의 `evaluation_suite/submissions/bon_fixed_N5` 위치에
    우리 BoN 시스템이 생성한 submission(.sql) 파일들이 생성된다.

    ※ 주의: 기존에는 `Spider2/spider2-snow` 구조를 가정했으므로,
      새 `spider_data` 폴더 구조(예: train_spider.json 등)에 맞게
      상단의 로딩 로직을 추가로 수정해야 합니다.
    """
    project_root = Path(__file__).resolve().parents[3]
    dataset_root = project_root / "spider_data"

    # src 폴더 내부에 submission 결과를 저장할 디렉터리
    # 예: src/results/bon_fixed_N5
    submission_dir = project_root / "src" / "results" / "bon_fixed_N5"

    print(f"[SUBMIT] project_root   = {project_root}", flush=True)
    print(f"[SUBMIT] dataset_root   = {dataset_root}", flush=True)
    print(f"[SUBMIT] submission_dir = {submission_dir}", flush=True)

    export_spider_submission_fixed(
        dataset_root=dataset_root,
        submission_dir=submission_dir,
        n_examples=None,   # 전체 사용
        n_candidates=5,
        mode="fixed",
    )

    print("\n[SUBMIT] submission export 완료.", flush=True)
    print(
        "[SUBMIT] 이제 Spider2/spider2-snow/evaluation_suite 디렉터리에서\n"
        "  python evaluate.py --submission_folder submissions/bon_fixed_N10\n"
        "와 같이 실행하면 exec_result CSV 및 공식 점수를 얻을 수 있습니다.",
        flush=True,
    )


if __name__ == "__main__":
    main()


