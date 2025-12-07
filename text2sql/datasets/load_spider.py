from __future__ import annotations

import csv
import json
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional

import pandas as pd

from src.text2sql.pipeline import Mode, PipelineResultItem, run_text2sql_bon_pipeline
from src.text2sql.db.sqlite_runner import make_spider_sqlite_run_query


@dataclass
class SpiderExample:
    instance_id: str
    db_id: str
    instruction: str
    external_knowledge: Optional[str]


@dataclass
class SpiderEvalResult:
    total: int
    matched_exact: int

    @property
    def accuracy(self) -> float:
        if self.total == 0:
            return 0.0
        return self.matched_exact / self.total


@dataclass
class SpiderExecEvalResult:
    total: int
    matched_exec: int

    @property
    def accuracy(self) -> float:
        if self.total == 0:
            return 0.0
        return self.matched_exec / self.total


def _normalize_sql(sql: str) -> str:
    # 매우 단순한 정규화: 소문자 + 공백 하나로 축소
    return " ".join(sql.strip().lower().split())


# LLM 프롬프트에 사용할 최대 스키마 길이(문자 기준).
# 너무 큰 스키마는 Groq/OpenAI 토큰 제한에 걸리므로 통째로 스킵한다.
MAX_SCHEMA_CHARS_FOR_LLM = 20000


def _load_spider_dataset(
    dataset_root: Path,
    split: str = "dev",
    include_train_others: bool = False,
) -> tuple[List[SpiderExample], Dict[str, str]]:
    """
    Spider 원본 데이터셋(`spider_data`)의 JSON 파일(train_spider.json, dev.json, test.json 등)을
    SpiderExample 리스트 + gold SQL 매핑으로 변환합니다.

    - split:
        - "train" → train_spider.json (+ 옵션으로 train_others.json 포함)
        - "dev"   → dev.json
        - "test"  → test.json
    - instance_id는 `{split}_{index:05d}` 혹은 `train_others_{index:05d}` 형태로 생성합니다.
    """
    split = split.lower()
    if split not in {"train", "dev", "test"}:
        raise ValueError(f"Unsupported split: {split}")

    path_map = {
        "train": dataset_root / "train_spider.json",
        "dev": dataset_root / "dev.json",
        "test": dataset_root / "test.json",
    }
    json_path = path_map[split]

    if not json_path.exists():
        raise FileNotFoundError(f"Spider JSON not found for split={split}: {json_path}")

    def _add_examples(
        data: List[dict],
        prefix: str,
        examples: List[SpiderExample],
        gold_map: Dict[str, str],
    ) -> None:
        for idx, obj in enumerate(data):
            instance_id = f"{prefix}_{idx:05d}"
            db_id = obj["db_id"]
            question = obj["question"]
            gold_sql = (obj.get("query") or "").strip()

            examples.append(
                SpiderExample(
                    instance_id=instance_id,
                    db_id=db_id,
                    instruction=question,
                    external_knowledge=None,
                )
            )
            if gold_sql:
                gold_map[instance_id] = gold_sql

    examples: List[SpiderExample] = []
    gold_map: Dict[str, str] = {}

    with json_path.open("r", encoding="utf-8") as f:
        data = json.load(f)
    _add_examples(data, prefix=split, examples=examples, gold_map=gold_map)

    # train split일 때 train_others.json까지 포함하고 싶다면 옵션으로 추가
    if split == "train" and include_train_others:
        others_path = dataset_root / "train_others.json"
        if others_path.exists():
            with others_path.open("r", encoding="utf-8") as f:
                others_data = json.load(f)
            _add_examples(
                others_data,
                prefix="train_others",
                examples=examples,
                gold_map=gold_map,
            )

    return examples, gold_map


def _load_examples_and_gold_for_eval(
    dataset_root: Path,
    split: str = "dev",
    include_train_others: bool = False,
) -> tuple[List[SpiderExample], Dict[str, str]]:
    """
    평가용으로 예제 리스트와 gold SQL 매핑을 동시에 로드합니다.

    - Spider2-snow 형식(dataset_root/spider2-snow.jsonl 존재)인 경우:
        - 기존 jsonl + evaluation_suite/gold/sql 기반 로더 사용
    - Spider 원본(spider_data: train_spider.json, dev.json, test.json 존재)인 경우:
        - 위의 _load_spider_dataset_as_spider2_snow 를 사용하여 변환
    """
    jsonl_path = dataset_root / "spider2-snow.jsonl"
    spider_train_path = dataset_root / "train_spider.json"

    # 1) Spider2-snow 전용 포맷
    if jsonl_path.exists():
        examples = load_spider_examples(dataset_root)
        gold_sql_map = load_spider2_snow_gold_sql(dataset_root)
        return examples, gold_sql_map

    # 2) Spider 원본(spider_data) 포맷
    if spider_train_path.exists():
        return _load_spider_dataset(
            dataset_root=dataset_root,
            split=split,
            include_train_others=include_train_others,
        )

    raise FileNotFoundError(
        f"Unsupported dataset layout under {dataset_root}. "
        "Neither spider2-snow.jsonl nor train_spider.json is found."
    )


def load_spider_examples(
    dataset_root: Path,
    *,
    split_for_spider: str = "test",
) -> List[SpiderExample]:
    """
    Spider2-snow 또는 Spider(spider_data)를 공통 인터페이스로 로드합니다.

    - Spider2-snow:
        - dataset_root/spider2-snow.jsonl 을 읽어서 예제를 로드.
    - Spider(spider_data):
        - 기본적으로 `split_for_spider`(기본값 "test") split을 로드.
          (submission 스크립트에서는 보통 테스트 세트를 대상으로 하므로 기본값을 test로 둡니다.)
    """
    jsonl_path = dataset_root / "spider2-snow.jsonl"
    spider_train_path = dataset_root / "train_spider.json"

    # 1) Spider2-snow 전용 포맷
    if jsonl_path.exists():
        examples: List[SpiderExample] = []

        with jsonl_path.open("r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                obj = json.loads(line)
                examples.append(
                    SpiderExample(
                        instance_id=obj["instance_id"],
                        db_id=obj["db_id"],
                        instruction=obj["instruction"],
                        external_knowledge=obj.get("external_knowledge"),
                    )
                )

        return examples

    # 2) Spider(spider_data) 포맷
    if spider_train_path.exists():
        examples, _ = _load_spider_dataset(
            dataset_root=dataset_root,
            split=split_for_spider,
            include_train_others=False,
        )
        return examples

    raise FileNotFoundError(
        f"Unsupported dataset layout under {dataset_root}. "
        "Neither spider2-snow.jsonl nor train_spider.json is found."
    )


def load_spider2_snow_gold_sql(dataset_root: Path) -> Dict[str, str]:
    """
    Spider2-snow 전용:
    evaluation_suite/gold/sql/*.sql 에 들어있는 정답 SQL을
    instance_id -> gold_sql 문자열 매핑으로 로드합니다.

    Spider(spider_data) 포맷에서는 _load_spider_dataset_as_spider2_snow 가
    gold SQL 매핑을 함께 생성하므로, 이 함수는 사용되지 않습니다.
    """
    sql_dir = dataset_root / "evaluation_suite" / "gold" / "sql"
    gold_map: Dict[str, str] = {}

    if not sql_dir.exists():
        return gold_map

    for sql_path in sql_dir.glob("*.sql"):
        instance_id = sql_path.stem
        with sql_path.open("r", encoding="utf-8") as f:
            sql = f.read().strip()
        gold_map[instance_id] = sql

    return gold_map


def load_spider2_snow_eval_meta(dataset_root: Path) -> Dict[str, dict]:
    """
    spider2snow_eval.jsonl에서 instance_id별 condition_cols, ignore_order 메타데이터를 로드합니다.
    """
    meta_path = dataset_root / "evaluation_suite" / "gold" / "spider2snow_eval.jsonl"
    meta: Dict[str, dict] = {}

    if not meta_path.exists():
        return meta

    with meta_path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            obj = json.loads(line)
            instance_id = obj["instance_id"]
            meta[instance_id] = {
                "condition_cols": obj.get("condition_cols", []),
                "ignore_order": obj.get("ignore_order", False),
            }

    return meta


def _build_schema_text_from_spider_tables(dataset_root: Path, db_id: str) -> str:
    """
    Spider(spider_data)의 tables.json / test_tables.json을 사용해
    프롬프트용 스키마 텍스트를 생성합니다.
    """
    table_files = ["tables.json", "test_tables.json"]

    db_meta = None
    for file_name in table_files:
        path = dataset_root / file_name
        if not path.exists():
            continue
        try:
            with path.open("r", encoding="utf-8") as f:
                all_dbs = json.load(f)
        except Exception:
            continue

        for db in all_dbs:
            if db.get("db_id") == db_id:
                db_meta = db
                break
        if db_meta is not None:
            break

    if db_meta is None:
        return f"-- Schema for database {db_id} not found in Spider tables.\n"

    table_names = db_meta.get("table_names_original") or db_meta.get("table_names") or []
    column_names = db_meta.get("column_names_original") or db_meta.get("column_names") or []
    column_types = db_meta.get("column_types") or []
    foreign_keys = db_meta.get("foreign_keys") or []

    # 테이블 인덱스 → 테이블 이름
    table_idx_to_name = {idx: name for idx, name in enumerate(table_names)}

    # 테이블별 컬럼 리스트 구성
    table_to_columns: Dict[int, List[tuple[str, str]]] = {}
    for col_idx, (table_idx, col_name) in enumerate(column_names):
        if table_idx == -1:
            continue  # 전체(*) 컬럼은 스킵
        col_type = column_types[col_idx] if col_idx < len(column_types) else "text"
        table_to_columns.setdefault(table_idx, []).append((col_name, col_type))

    # foreign key 정보 구성
    fk_descriptions: List[str] = []
    for src_col_idx, tgt_col_idx in foreign_keys:
        if not (0 <= src_col_idx < len(column_names) and 0 <= tgt_col_idx < len(column_names)):
            continue
        src_tid, src_col_name = column_names[src_col_idx]
        tgt_tid, tgt_col_name = column_names[tgt_col_idx]
        if src_tid == -1 or tgt_tid == -1:
            continue
        src_tname = table_idx_to_name.get(src_tid, f"table_{src_tid}")
        tgt_tname = table_idx_to_name.get(tgt_tid, f"table_{tgt_tid}")
        fk_descriptions.append(
            f"- FK: {src_tname}.{src_col_name} -> {tgt_tname}.{tgt_col_name}"
        )

    lines: List[str] = [f"-- Schema for database {db_id} (Spider)", ""]

    for tid, tname in enumerate(table_names):
        lines.append(f"TABLE {tname}:")
        cols = table_to_columns.get(tid, [])
        for col_name, col_type in cols:
            lines.append(f"  - {col_name} ({col_type})")
        lines.append("")  # 테이블 간 빈 줄

    if fk_descriptions:
        lines.append("-- Foreign Keys")
        lines.extend(fk_descriptions)

    return "\n".join(lines) + "\n"


def build_schema_text_from_ddl(dataset_root: Path, db_id: str, max_files: int = 3) -> str:
    """
    스키마 텍스트 생성 (Spider2-snow 우선, 없으면 Spider(spider_data) fallback).

    1) Spider2-snow:
        - resource/databases/{db_id}/ 하위에서 DDL.csv 파일들을 찾아
          CREATE TABLE DDL을 이어 붙여 프롬프트용 스키마 텍스트를 만듭니다.
    2) Spider(spider_data):
        - tables.json / test_tables.json 메타데이터를 사용해 간단한 스키마 설명 텍스트 생성.
    """
    # 1) Spider2-snow DDL 기반 시도
    db_root = dataset_root / "resource" / "databases" / db_id
    if db_root.exists():
        ddl_files = list(db_root.rglob("DDL.csv"))
        if not ddl_files:
            return f"-- No DDL.csv found for {db_id}.\n"

        ddl_files = ddl_files[:max_files]
        ddl_snippets: List[str] = []

        for ddl_path in ddl_files:
            with ddl_path.open("r", encoding="utf-8") as f:
                reader = csv.DictReader(f)
                for row in reader:
                    ddl = (row.get("DDL") or "").strip()
                    if ddl:
                        ddl_snippets.append(ddl)

        if not ddl_snippets:
            return f"-- Failed to parse DDL for {db_id}.\n"

        header = f"-- Schema (partial) for database {db_id}\n"
        return header + "\n\n".join(ddl_snippets)

    # 2) Spider(spider_data) 메타데이터 기반 스키마 텍스트
    return _build_schema_text_from_spider_tables(dataset_root, db_id)


def load_gold_exec_results(dataset_root: Path, instance_id: str) -> List[pd.DataFrame]:
    """
    gold/exec_result 디렉터리에서 해당 instance_id의 실행 결과 CSV들을 모두 로드합니다.
    예: sf_bq091_a.csv, sf_bq091_b.csv, ...
    """
    exec_dir = dataset_root / "evaluation_suite" / "gold" / "exec_result"
    if not exec_dir.exists():
        return []

    dfs: List[pd.DataFrame] = []
    for csv_path in sorted(exec_dir.glob(f"{instance_id}*.csv")):
        try:
            dfs.append(pd.read_csv(csv_path))
        except Exception as e:
            print(f"[WARN] Failed to read gold exec_result: {csv_path} ({e})", flush=True)

    return dfs


def _compare_exec_tables(
    pred: pd.DataFrame,
    gold_list: List[pd.DataFrame],
    condition_cols: Optional[List[int]] = None,
    ignore_order: bool = False,
) -> bool:
    """
    예측 실행 결과(pred)와 gold 실행 결과들(gold_list)을 비교합니다.
    - condition_cols: 비교에 사용할 컬럼 인덱스 리스트
    - ignore_order: 행 순서를 무시할지 여부
    """
    if not gold_list:
        return False

    def normalize_df(df: pd.DataFrame) -> pd.DataFrame:
        if condition_cols:
            try:
                cols = [df.columns[i] for i in condition_cols]
                df = df[cols]
            except Exception:
                pass
        if ignore_order and not df.empty:
            df = df.sort_values(list(df.columns)).reset_index(drop=True)
        return df.reset_index(drop=True)

    pred_norm = normalize_df(pred)

    for gold in gold_list:
        gold_norm = normalize_df(gold)
        if pred_norm.equals(gold_norm):
            return True

    return False


def evaluate_spider(
    dataset_root: Path,
    n_examples: Optional[int] = None,
    n_candidates: int = 5,
    mode: Mode = "fixed",
    split: str = "dev",
    include_train_others: bool = False,
) -> SpiderEvalResult:
    """
    우리 run_text2sql_bon_pipeline을 Spider2-snow 또는 Spider(spider_data) 데이터에 대해
    평가하는 간단한 루프입니다.

    현재 평가는 매우 단순하게:
      - gold SQL과 우리가 고른 best SQL을 문자열 정규화 후 exact match로 비교합니다.

    - Spider2-snow 형식:
        - dataset_root/spider2-snow.jsonl + evaluation_suite/gold/sql/*.sql 사용
        - split, include_train_others 인자는 무시됩니다.
    - Spider(spider_data) 형식:
        - split: "train" | "dev" | "test"
        - include_train_others: train split일 때 train_others.json 포함 여부
    """
    examples, gold_sql_map = _load_examples_and_gold_for_eval(
        dataset_root=dataset_root,
        split=split,
        include_train_others=include_train_others,
    )

    print(f"[DEBUG] Loaded examples: {len(examples)}", flush=True)
    print(f"[DEBUG] Loaded gold SQLs: {len(gold_sql_map)}", flush=True)

    # gold SQL이 존재하는 예제만 사용
    filtered = [ex for ex in examples if ex.instance_id in gold_sql_map]
    print(f"[DEBUG] Filtered examples with gold SQL: {len(filtered)}", flush=True)

    if n_examples is not None:
        filtered = filtered[:n_examples]
        print(f"[DEBUG] Using first {len(filtered)} examples for evaluation", flush=True)

    matched_exact = 0

    # BoN LLM 호출 결과를 캐시할 디렉터리 (질문+스키마 → 후보 SQL 리스트)
    # 결과는 src/results/bon_cache 아래에 저장하도록 구성
    # dataset_root == <project_root>/spider_data 이므로, parent()가 project_root
    project_root = dataset_root.parent
    cache_root = project_root / "src" / "results" / "bon_cache"

    def _get_cache_path(example: SpiderExample) -> Path:
        mode_str = str(mode)
        dir_path = cache_root / f"{mode_str}_N{n_candidates}"
        dir_path.mkdir(parents=True, exist_ok=True)
        return dir_path / f"{example.instance_id}.json"

    for idx, ex in enumerate(filtered, start=1):
        print(
            f"[DEBUG] ({idx}/{len(filtered)}) Evaluating instance_id={ex.instance_id}, db_id={ex.db_id}",
            flush=True,
        )

        schema_text = build_schema_text_from_ddl(dataset_root, ex.db_id)

        # 스키마가 너무 크면 해당 예제는 LLM 호출에서 스킵
        if len(schema_text) > MAX_SCHEMA_CHARS_FOR_LLM:
            print(
                f"[WARN] schema for db_id={ex.db_id} too large "
                f"({len(schema_text)} chars), skipping LLM call for {ex.instance_id}",
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
                print(f"[DEBUG] Loaded cached candidates from {cache_path}", flush=True)
            except Exception as e:
                print(f"[WARN] Failed to load cache {cache_path}: {e}", flush=True)
                results = []
        else:
            # 실행 기반 execution_score를 사용하기 위해,
            # 해당 db_id에 대한 SQLite run_query 콜백을 준비한다.
            run_query = None
            try:
                run_query = make_spider_sqlite_run_query(
                    dataset_root=dataset_root,
                    db_id=ex.db_id,
                    split=split,
                )
            except FileNotFoundError as e:
                print(f"[WARN] {e} (fallback to heuristic execution score)", flush=True)

            results: List[PipelineResultItem] = run_text2sql_bon_pipeline(
                question=ex.instruction,
                schema_text=schema_text,
                n_candidates=n_candidates,
                mode=mode,
                run_query=run_query,
            )
            try:
                with cache_path.open("w", encoding="utf-8") as f:
                    json.dump(results, f, ensure_ascii=False, indent=2)
                print(f"[DEBUG] Saved candidates cache to {cache_path}", flush=True)
            except Exception as e:
                print(f"[WARN] Failed to save cache {cache_path}: {e}", flush=True)

        if not results:
            continue

        best_sql = results[0]["sql"]
        gold_sql = gold_sql_map[ex.instance_id]

        if _normalize_sql(best_sql) == _normalize_sql(gold_sql):
            matched_exact += 1

    return SpiderEvalResult(total=len(filtered), matched_exact=matched_exact)


def evaluate_spider_exec_based(
    dataset_root: Path,
    pred_exec_dir: Path,
    n_examples: Optional[int] = None,
) -> SpiderExecEvalResult:
    """
    Spider2-snow의 gold exec_result/*.csv와
    사용자가 미리 실행해둔 predicted exec_result CSV를 비교하는 실행결과 기반 평가.

    전제:
      - pred_exec_dir 안에 `{instance_id}.csv` 형태의 예측 실행 결과 파일이 존재해야 합니다.
      - gold 실행 결과는 evaluation_suite/gold/exec_result/*.csv 에 있습니다.
      - 조건 컬럼 및 ignore_order 설정은 spider2snow_eval.jsonl 을 사용합니다.

    ※ 주의: 현재 이 함수는 Spider2-snow 전용입니다.
      spider_data(원본 Spider) 포맷에는 gold exec_result 메타가 없으므로
      exec 기반 평가는 사용할 수 없습니다.
    """
    examples = load_spider_examples(dataset_root)
    eval_meta = load_spider2_snow_eval_meta(dataset_root)

    exec_dir = dataset_root / "evaluation_suite" / "gold" / "exec_result"
    instance_ids_with_exec = {
        p.name.split(".csv")[0].split("_")[0] for p in exec_dir.glob("*.csv")
    }

    filtered = [ex for ex in examples if ex.instance_id in instance_ids_with_exec]
    if n_examples is not None:
        filtered = filtered[:n_examples]

    print(f"[DEBUG][EXEC] Using {len(filtered)} examples for exec-result evaluation", flush=True)

    matched_exec = 0

    for idx, ex in enumerate(filtered, start=1):
        print(f"[DEBUG][EXEC] ({idx}/{len(filtered)}) instance_id={ex.instance_id}", flush=True)

        pred_path = pred_exec_dir / f"{ex.instance_id}.csv"
        if not pred_path.exists():
            print(f"[WARN][EXEC] Predicted exec_result not found: {pred_path}", flush=True)
            continue

        try:
            pred_df = pd.read_csv(pred_path)
        except Exception as e:
            print(f"[WARN][EXEC] Failed to read predicted exec_result: {pred_path} ({e})", flush=True)
            continue

        gold_dfs = load_gold_exec_results(dataset_root, ex.instance_id)
        if not gold_dfs:
            print(f"[WARN][EXEC] No gold exec_result for {ex.instance_id}", flush=True)
            continue

        meta = eval_meta.get(ex.instance_id, {})
        condition_cols = meta.get("condition_cols", [])
        ignore_order = meta.get("ignore_order", False)

        if _compare_exec_tables(
            pred=pred_df,
            gold_list=gold_dfs,
            condition_cols=condition_cols,
            ignore_order=ignore_order,
        ):
            matched_exec += 1

    return SpiderExecEvalResult(total=len(filtered), matched_exec=matched_exec)


def main():
    """
    간단한 CLI 실행용 엔트리 포인트.
    기본값으로 프로젝트 루트의 `spider_data` 디렉터리를
    Spider/Spider2 계열 데이터셋 루트로 사용합니다.

    ※ 주의: 기존에는 `Spider2/spider2-snow` 구조를 가정했으므로,
      새 `spider_data` 폴더 구조(예: train_spider.json 등)에 맞게
      상단의 로딩 로직을 별도로 수정해 주어야 실제 평가가 정상 동작합니다.
    """
    # 사용자가 실제 경로를 인자로 넘기는 형태로 바꿔도 됩니다.
    project_root = Path(__file__).resolve().parents[3]
    dataset_root = project_root / "spider_data"

    print(f"[DEBUG] Project root: {project_root}", flush=True)
    print(f"[DEBUG] Dataset root: {dataset_root}", flush=True)

    # 1) SQL 문자열 기반 exact match 평가
    #    - spider_data인 경우 기본적으로 dev split을 사용합니다.
    result = evaluate_spider(
        dataset_root=dataset_root,
        n_examples=None,
        n_candidates=3,
        mode="fixed",
        split="dev",
        include_train_others=False,
    )

    print(f"[STR] Evaluated {result.total} examples")
    print(f"[STR] Exact match: {result.matched_exact} / {result.total} "
          f"({result.accuracy * 100:.2f}%)")

    # 2) 실행 결과 기반 평가는 Spider2-snow 전용이므로,
    #    spider_data(원본 Spider) 경로에서는 건너뜁니다.
    spider2_jsonl = dataset_root / "spider2-snow.jsonl"
    if spider2_jsonl.exists():
        pred_exec_dir = (
            project_root / "src" / "results" / "spider2_snow" / "exec_result_pred"
        )
        print(f"[DEBUG][EXEC] Predicted exec_result dir: {pred_exec_dir}", flush=True)

        exec_result = evaluate_spider_exec_based(
            dataset_root=dataset_root,
            pred_exec_dir=pred_exec_dir,
            n_examples=5,
        )

        print(f"[EXEC] Evaluated {exec_result.total} examples")
        print(
            f"[EXEC] Exec-match: {exec_result.matched_exec} / {exec_result.total} "
            f"({exec_result.accuracy * 100:.2f}%)"
        )
    else:
        print(
            "[EXEC] spider2-snow.jsonl 이 없어 exec 기반 평가는 건너뜁니다 "
            "(spider_data 등 Spider 원본 포맷으로 간주).",
            flush=True,
        )


if __name__ == "__main__":
    main()


