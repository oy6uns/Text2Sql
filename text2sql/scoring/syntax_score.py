from __future__ import annotations

from dataclasses import dataclass
import re
from typing import List


@dataclass
class SyntaxScoreDetail:
    total: float
    missing_quote: bool
    paren_unbalanced: bool
    missing_select_or_from: bool
    keyword_order_issue: bool
    agg_without_group_by: bool


def _check_quotes_and_parens(sql: str) -> tuple[bool, bool]:
    """따옴표/괄호 짝이 맞는지 간단하게 검사."""
    s = sql.strip()
    # 따옴표
    missing_quote = (s.count("'") % 2 != 0) or (s.count('"') % 2 != 0)

    # 괄호
    balance = 0
    paren_unbalanced = False
    for ch in s:
        if ch == "(":
            balance += 1
        elif ch == ")":
            balance -= 1
        if balance < 0:
            paren_unbalanced = True
            break
    if balance != 0:
        paren_unbalanced = True

    return missing_quote, paren_unbalanced


def _check_core_keywords(sql_upper: str) -> tuple[bool, bool]:
    """
    SELECT / FROM 핵심 키워드 존재 및 대략적인 순서 오류 검사.

    - 공백/줄바꿈에 영향을 덜 받도록, 단순 포함/인덱스 대신 정규식 기반으로 완화.
    """
    # 존재 여부: 단어 경계 기준으로 SELECT / FROM 이 하나라도 있으면 존재한다고 본다.
    has_select = re.search(r"\bSELECT\b", sql_upper) is not None
    has_from = re.search(r"\bFROM\b", sql_upper) is not None
    missing = not (has_select and has_from)

    keyword_order_issue = False
    if has_select and has_from:
        m_select = re.search(r"\bSELECT\b", sql_upper)
        m_from = re.search(r"\bFROM\b", sql_upper)
        if m_select and m_from and m_select.start() > m_from.start():
            keyword_order_issue = True

    return missing, keyword_order_issue


def _check_agg_group_by(sql_upper: str) -> bool:
    """
    집계 관련 포맷 오류:
    - 집계함수는 쓰는데 GROUP BY가 전혀 없는 경우 패널티.
    """
    agg_funcs = ("COUNT(", "SUM(", "AVG(", "MIN(", "MAX(")
    has_agg = any(func in sql_upper for func in agg_funcs)
    has_group_by = " GROUP BY " in sql_upper
    return bool(has_agg and not has_group_by)


def compute_syntax_score(sql: str) -> SyntaxScoreDetail:
    """
    Text-to-SQL 오류 taxonomy 중 Syntax / Format errors 쪽을
    간단한 정규식/규칙 기반으로 점수화.

    대략:
      - 시작 점수 0에서 가점/감점을 누적하고,
      - 대형 오류(파싱 불가 수준)는 큰 패널티를 부여.
    """
    s = sql.strip()
    if not s:
        # 완전히 비어 있으면 거의 탈락
        return SyntaxScoreDetail(
            total=-3.0,
            missing_quote=False,
            paren_unbalanced=False,
            missing_select_or_from=True,
            keyword_order_issue=True,
            agg_without_group_by=False,
        )

    upper = s.upper()
    total = 0.0

    # 1) 따옴표/괄호 짝
    missing_quote, paren_unbalanced = _check_quotes_and_parens(s)
    if not missing_quote:
        total += 1.0
    else:
        total -= 1.5
    if not paren_unbalanced:
        total += 1.0
    else:
        total -= 1.5

    # 2) SELECT / FROM 존재 + 순서
    missing_core, keyword_order_issue = _check_core_keywords(upper)
    if not missing_core:
        total += 1.0
    else:
        total -= 2.0  # FROM 없이 SELECT만 있는 등은 큰 오류

    if keyword_order_issue:
        total -= 0.5

    # 3) 잘못된 키워드 순서 (WHERE가 FROM보다 앞에 오는 등)
    def _idx(kw: str) -> int:
        try:
            return upper.index(kw)
        except ValueError:
            return -1

    from_idx = _idx(" FROM ")
    where_idx = _idx(" WHERE ")
    group_idx = _idx(" GROUP BY ")
    having_idx = _idx(" HAVING ")
    order_idx = _idx(" ORDER BY ")

    keyword_order_issue2 = False
    # WHERE는 FROM 뒤에
    if where_idx != -1 and from_idx != -1 and where_idx < from_idx:
        keyword_order_issue2 = True
    # GROUP BY는 WHERE 뒤 혹은 FROM 뒤
    if group_idx != -1:
        base = where_idx if where_idx != -1 else from_idx
        if base != -1 and group_idx < base:
            keyword_order_issue2 = True
    # HAVING은 GROUP BY 뒤
    if having_idx != -1 and group_idx != -1 and having_idx < group_idx:
        keyword_order_issue2 = True
    # ORDER BY는 GROUP/HAVING 뒤
    tail_base = having_idx if having_idx != -1 else group_idx
    if order_idx != -1 and tail_base != -1 and order_idx < tail_base:
        keyword_order_issue2 = True

    if keyword_order_issue2:
        total -= 0.5

    # 4) 집계 관련 포맷 오류
    agg_without_group_by = _check_agg_group_by(upper)
    if agg_without_group_by:
        total -= 0.5

    return SyntaxScoreDetail(
        total=total,
        missing_quote=missing_quote,
        paren_unbalanced=paren_unbalanced,
        missing_select_or_from=missing_core,
        keyword_order_issue=(keyword_order_issue or keyword_order_issue2),
        agg_without_group_by=agg_without_group_by,
    )


