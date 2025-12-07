from __future__ import annotations

from pathlib import Path
from typing import Any, Callable, Sequence

import sqlite3


RunQueryFn = Callable[[str], Sequence[Any]]


def make_spider_sqlite_run_query(
    dataset_root: Path,
    db_id: str,
    split: str = "test",
) -> RunQueryFn:
    """
    Spider(spider_data) 경로 안에 있는 SQLite DB에 대해
    실제로 SQL을 실행하는 run_query 콜백을 생성합니다.

    - dataset_root: 보통 <project_root>/spider_data
    - db_id: Spider 예제의 db_id (예: "soccer_3")
    - split:
        - "test"  → spider_data/test_database/{db_id}/{db_id}.sqlite
        - "train"/"dev" → spider_data/database/{db_id}/{db_id}.sqlite
    """
    split = split.lower()
    if split == "test":
        base_dir = dataset_root / "test_database"
    else:
        base_dir = dataset_root / "database"

    db_path = base_dir / db_id / f"{db_id}.sqlite"
    if not db_path.exists():
        raise FileNotFoundError(f"SQLite DB not found for db_id={db_id}: {db_path}")

    def run_query(sql: str) -> Sequence[Any]:
        # 간단히 매 호출마다 커넥션을 열고 닫는 형태 (Spider DB는 작으므로 부담이 크지 않음).
        conn = sqlite3.connect(str(db_path))
        try:
            cur = conn.cursor()
            cur.execute(sql)
            rows = cur.fetchall()
            return rows
        finally:
            conn.close()

    return run_query


