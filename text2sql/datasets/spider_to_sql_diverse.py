from __future__ import annotations

"""
Spider2-snow용 BoN-diverse (non-fixed prompt) submission 생성 스크립트.

- 질문 → 다양한 프롬프트(P1/P2/힌트 프롬프트)를 사용해 N개 SQL 생성
- syntax/semantic/execution 점수로 BoN 선택
- 선택된 best SQL을 `<instance_id>.sql`로 저장

생성 결과는 Spider2 evaluation_suite에서 사용하는 submission 폴더 형식과 동일하며,
`evaluate.py --submission_folder submissions/bon_diverse_N10` 처럼 바로 사용할 수 있다.
"""

from pathlib import Path
import json
from typing import List

from src.text2sql.datasets.load_spider import (
    SpiderExample,
    build_schema_text_from_ddl,
    load_spider_examples,
)
from src.text2sql.pipeline import (
    PipelineResultItem,
    generate_diverse_candidates_with_counts,
    run_text2sql_bon_with_sql_candidates,
)
from src.text2sql.db.sqlite_runner import make_spider_sqlite_run_query


def main() -> None:
    """
    Spider/Spider2 계열 데이터셋을 대상으로
    diverse BoN submission을 생성하는 간단 CLI.

    기본값으로 프로젝트 루트의 `spider_data` 디렉터리를
    데이터셋 루트로 사용합니다.

    ※ 주의: 기존에는 `Spider2/spider2-snow` 구조를 가정했으므로,
      새 `spider_data` 폴더 구조에 맞게 상단의 로딩/스키마 구성
      로직을 별도로 조정해야 합니다.
    """
    project_root = Path(__file__).resolve().parents[3]
    dataset_root = project_root / "spider_data"

    # src 폴더 내부에 diverse submission 결과를 저장할 디렉터리
    # 예: src/results/bon_mixed_N5 (P1=1, P2=2, P3=2)
    submission_dir = (
        project_root
        / "src"
        / "results"
        / "bon_mixed_N5"
    )

    print(f"[SUBMIT-DIVERSE] project_root   = {project_root}", flush=True)
    print(f"[SUBMIT-DIVERSE] dataset_root   = {dataset_root}", flush=True)
    print(f"[SUBMIT-DIVERSE] submission_dir = {submission_dir}", flush=True)

    submission_dir.mkdir(parents=True, exist_ok=True)

    examples: List[SpiderExample] = load_spider_examples(dataset_root)

    # 후보 SQL + 점수 캐시 (mixed-P1=1,P2=2,P3=2) 저장 디렉터리
    # 프로젝트 루트의 src/results/bon_cache_mixed 아래에 저장
    cache_root = project_root / "src" / "results" / "bon_cache_mixed"

    def _get_cache_path(example: SpiderExample) -> Path:
        dir_path = cache_root
        dir_path.mkdir(parents=True, exist_ok=True)
        return dir_path / f"{example.instance_id}.json"

    for idx, ex in enumerate(examples, start=1):
        print(
            f"[SUBMIT-DIVERSE] ({idx}/{len(examples)}) instance_id={ex.instance_id}, db_id={ex.db_id}",
            flush=True,
        )

        schema_text = build_schema_text_from_ddl(dataset_root, ex.db_id)

        # 스키마가 너무 크면 LLM 호출을 스킵
        from .load_spider import MAX_SCHEMA_CHARS_FOR_LLM  # lazy import

        if len(schema_text) > MAX_SCHEMA_CHARS_FOR_LLM:
            print(
                f"[SUBMIT-DIVERSE]   schema for db_id={ex.db_id} too large "
                f"({len(schema_text)} chars), skipping.",
                flush=True,
            )
            continue
        cache_path = _get_cache_path(ex)

        # 1) 캐시가 있으면 그대로 사용
        if cache_path.exists():
            try:
                with cache_path.open("r", encoding="utf-8") as f:
                    cached: List[PipelineResultItem] = json.load(f)
                results = cached
                print(f"[SUBMIT-DIVERSE]   loaded cached candidates from {cache_path}", flush=True)
            except Exception as e:  # noqa: BLE001
                print(f"[WARN][SUBMIT-DIVERSE] failed to load cache {cache_path}: {e}", flush=True)
                results = []
        else:
            # P1=1, P2=2, P3=2 → 총 N=5 mixed 후보 생성
            sql_candidates = generate_diverse_candidates_with_counts(
                question=ex.instruction,
                schema_text=schema_text,
                p1_count=1,
                p2_count=2,
                p3_count=2,
            )

            # 실행 기반 execution_score를 사용하기 위해 SQLite run_query를 준비
            run_query = None
            try:
                run_query = make_spider_sqlite_run_query(
                    dataset_root=dataset_root,
                    db_id=ex.db_id,
                    split="test",
                )
            except FileNotFoundError as e:
                print(
                    f"[WARN][SUBMIT-DIVERSE] {e} "
                    "(fallback to heuristic execution score)",
                    flush=True,
                )

            results = run_text2sql_bon_with_sql_candidates(
                question=ex.instruction,
                schema_text=schema_text,
                sql_candidates=sql_candidates,
                run_query=run_query,
            )

            try:
                with cache_path.open("w", encoding="utf-8") as f:
                    json.dump(results, f, ensure_ascii=False, indent=2)
                print(f"[SUBMIT-DIVERSE]   saved candidates cache to {cache_path}", flush=True)
            except Exception as e:  # noqa: BLE001
                print(f"[WARN][SUBMIT-DIVERSE] failed to save cache {cache_path}: {e}", flush=True)

        if not results:
            print(f"[WARN][SUBMIT-DIVERSE] no candidates for {ex.instance_id}, skip .sql", flush=True)
            continue

        best_sql = results[0]["sql"]

        out_path = submission_dir / f"{ex.instance_id}.sql"
        with out_path.open("w", encoding="utf-8") as f:
            f.write(best_sql.strip() + "\n")

    print("\n[SUBMIT-DIVERSE] submission export 완료.", flush=True)
    print(
        "[SUBMIT-DIVERSE] 이제 Spider2/spider2-snow/evaluation_suite 디렉터리에서\n"
        "  python evaluate.py --submission_folder submissions/bon_diverse_N10\n"
        "와 같이 실행하면 BoN-diverse 결과에 대한 exec_result CSV 및 공식 점수를 얻을 수 있습니다.",
        flush=True,
    )


if __name__ == "__main__":
    main()


