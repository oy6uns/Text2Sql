from __future__ import annotations

from dataclasses import dataclass
import re
from typing import Dict, List, Optional


@dataclass
class SemanticScoreDetail:
    total: float
    unknown_tables: List[str]
    join_without_on: bool
    order_by_not_in_select: bool
    count_mismatch_with_question: bool


def _extract_tables_from_schema(schema_text: str) -> List[str]:
    """
    스키마 텍스트에서 테이블 이름 리스트를 추출.

    지원하는 포맷:
      1) DDL 형태:  CREATE TABLE <name> ...
      2) Spider용 요약 형태:  TABLE <name>:
    """
    table_names: List[str] = []

    # 1) DDL 기반 추출
    table_names += re.findall(
        r"CREATE\s+TABLE\s+([A-Za-z0-9_\.]+)",
        schema_text,
        flags=re.IGNORECASE,
    )

    # 2) Spider용 요약 텍스트 기반 추출 (예: 'TABLE club:' 형태)
    table_names += re.findall(
        r"^\s*TABLE\s+([A-Za-z0-9_\.]+)\s*:",
        schema_text,
        flags=re.IGNORECASE | re.MULTILINE,
    )

    return table_names


def _extract_columns_from_schema(schema_text: str) -> List[str]:
    """
    매우 단순하게 DDL 안의 'col_name TYPE' 패턴에서 컬럼 이름 후보만 추출.
    정확하진 않지만 ORDER BY / SELECT 검사에 참고 정도로 사용.
    """
    cols = re.findall(
        r"\n\s*([A-Za-z0-9_]+)\s+[A-Z]+",
        schema_text,
        flags=re.IGNORECASE,
    )
    return cols


def _extract_used_tables(sql_upper: str) -> List[str]:
    """
    SQL 문자열에서 FROM / JOIN 뒤에 오는 토큰들을 테이블 이름 후보로 추출.
    """
    matches = re.findall(r"(FROM|JOIN)\s+([A-Za-z0-9_\.]+)", sql_upper)
    return [m[1] for m in matches]


def _extract_selected_columns(sql: str) -> List[str]:
    """
    SELECT 절 안의 간단한 컬럼 이름 후보 목록 추출.
    별칭/함수 등은 완전히 파싱하진 않고, ORDER BY 검사용으로만 사용.
    """
    upper = sql.upper()
    try:
        start = upper.index("SELECT") + len("SELECT")
        end = upper.index(" FROM ", start)
    except ValueError:
        return []
    select_part = sql[start:end]
    # 쉼표 기준으로 나눈 뒤, "table.col AS alias" 패턴에서 col이나 alias 정도만 거칠게 추출
    cols: List[str] = []
    for chunk in select_part.split(","):
        token = chunk.strip()
        # "AS alias"가 있으면 alias 우선
        m_as = re.search(r"\bAS\s+([A-Za-z0-9_]+)", token, flags=re.IGNORECASE)
        if m_as:
            cols.append(m_as.group(1))
            continue
        # table.col 형태면 마지막 토큰 사용
        parts = re.split(r"\s+", token)
        last = parts[-1]
        if "." in last:
            last = last.split(".")[-1]
        # 단순 식별자만 남기는 정도
        m_id = re.match(r"[A-Za-z_][A-Za-z0-9_]*", last)
        if m_id:
            cols.append(m_id.group(0))
    return cols


def _extract_order_by_columns(sql: str) -> List[str]:
    """
    ORDER BY 절에 등장하는 컬럼 이름 후보 추출.
    """
    upper = sql.upper()
    try:
        start = upper.index(" ORDER BY ") + len(" ORDER BY ")
    except ValueError:
        return []

    # ORDER BY 이후 전체를 사용 (LIMIT 등이 있어도 일단 포함)
    order_part = sql[start:]
    cols: List[str] = []
    for chunk in order_part.split(","):
        token = chunk.strip()
        # ASC / DESC 제거
        token = re.sub(r"\bASC\b|\bDESC\b", "", token, flags=re.IGNORECASE).strip()
        if not token:
            continue
        if "." in token:
            token = token.split(".")[-1]
        m_id = re.match(r"[A-Za-z_][A-Za-z0-9_]*", token)
        if m_id:
            cols.append(m_id.group(0))
    return cols


def compute_semantic_score(
    sql: str,
    schema_text: str,
    question: Optional[str] = None,
) -> SemanticScoreDetail:
    """
    Text-to-SQL 오류 taxonomy 중 Schema / Semantic / Logic error에
    해당하는 부분을 정적 분석 기반으로 근사하여 점수화.

    - 존재하지 않는 테이블/컬럼 사용 (Non-Existent Schema, Table-Column Mismatch)
    - JOIN 이 있는데 ON 이 없는 경우 (Violation of Foreign Key Integrity에 가까운 패턴)
    - ORDER BY 컬럼이 SELECT에 없을 때의 불일치
    - 질문이 count/개수 질문인데 COUNT 안 쓰거나 반대인 경우 등
    """
    s = sql.strip()
    if not s:
        return SemanticScoreDetail(
            total=-3.0,
            unknown_tables=[],
            join_without_on=False,
            order_by_not_in_select=False,
            count_mismatch_with_question=False,
        )

    upper = s.upper()
    total = 0.0

    # 1) 스키마에 없는 테이블/컬럼 사용
    schema_tables = _extract_tables_from_schema(schema_text)
    used_tables = _extract_used_tables(upper)

    schema_tables_upper = {st.upper() for st in schema_tables}
    unknown_tables = [t for t in used_tables if t.upper() not in schema_tables_upper]
    if used_tables:
        if unknown_tables:
            total -= 1.5
        else:
            total += 1.0

    # (컬럼은 아직 강하게 쓰지 않지만, 추출만 해두고 ORDER BY 검사에 활용)
    schema_columns = set(col.upper() for col in _extract_columns_from_schema(schema_text))

    # 2) JOIN 조건 오류 (JOIN 있는데 ON 없음)
    join_count = upper.count(" JOIN ")
    on_count = upper.count(" ON ")
    join_without_on = False
    if join_count > 0:
        if on_count == 0:
            join_without_on = True
            total -= 1.0
        else:
            total += 0.5

    # 3) ORDER BY 오류: SELECT에 없는 컬럼으로 정렬하는 패턴 근사
    order_by_cols = _extract_order_by_columns(s)
    select_cols = _extract_selected_columns(s)
    order_by_not_in_select = False
    if order_by_cols:
        # SELECT 절에도 없고, 스키마 컬럼에도 없는 경우 감점
        missing = [
            c
            for c in order_by_cols
            if (c not in select_cols) and (c.upper() not in schema_columns)
        ]
        if missing:
            order_by_not_in_select = True
            total -= 0.5
        else:
            total += 0.5

    # 4) COUNT / Aggregation 관련 misuse (질문과 SQL 간 단순 매칭)
    count_mismatch = False
    if question is not None:
        q_lower = question.lower()
        want_count = any(
            kw in q_lower for kw in ["how many", "number of", "count", "몇 개", "개수"]
        )
        has_count = "COUNT(" in upper

        if want_count and not has_count:
            total -= 0.5
            count_mismatch = True
        elif has_count and not want_count:
            # 굳이 COUNT를 쓸 이유가 없어 보이면 살짝 감점
            total -= 0.25
            count_mismatch = True
        else:
            total += 0.25

    return SemanticScoreDetail(
        total=total,
        unknown_tables=unknown_tables,
        join_without_on=join_without_on,
        order_by_not_in_select=order_by_not_in_select,
        count_mismatch_with_question=count_mismatch,
    )


