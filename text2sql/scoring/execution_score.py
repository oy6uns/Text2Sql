from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Callable, List, Literal, Optional, Sequence


QuestionType = Literal["COUNT", "OTHER"]


@dataclass
class ExecutionScoreDetail:
    """
    실행 기반 스코어 요약.

    total:
        최종 execution 기반 점수.
    """

    total: float
    error: Optional[str]
    timed_out: bool
    row_count: int
    too_many_rows: bool
    question_type: QuestionType
    count_keyword_in_sql: bool


def infer_question_type(question: str) -> QuestionType:
    """
    자연어 질문에서 매우 단순하게 question_type을 추론.
    """
    q = question.lower()
    if any(kw in q for kw in ["how many", "number of", "count", "몇 개", "개수"]):
        return "COUNT"
    return "OTHER"


def execute_with_timeout(
    run_query: Callable[[str], Sequence[Any]],
    sql: str,
    timeout_runner: Optional[Callable[[Callable[[], Sequence[Any]], float], Sequence[Any] | None]] = None,
    timeout_seconds: float = 1.0,
) -> Sequence[Any]:
    """
    DB에 대해 SQL을 실제 실행하기 위한 헬퍼.

    - run_query: `rows = run_query(sql)` 형태의 콜백 (DB-API, ORM 등 자유롭게 구현).
    - timeout_runner: 선택적으로, `(func, timeout) -> rows` 형태의 타임아웃 래퍼.
      예: signal 기반 run_with_timeout 등을 감싸서 넘길 수 있음.
    """

    def _inner() -> Sequence[Any]:
        return run_query(sql)

    if timeout_runner is not None:
        result = timeout_runner(_inner, timeout_seconds)
        if result is None:
            # timeout_runner 쪽에서 이미 로깅 했다고 가정
            raise TimeoutError(f"SQL execution timed out after {timeout_seconds} seconds")
        return result

    # 타임아웃 래퍼가 없으면 바로 실행
    return run_query(sql)


def compute_execution_score(
    sql: str,
    question: str,
    run_query: Callable[[str], Sequence[Any]],
    timeout_runner: Optional[Callable[[Callable[[], Sequence[Any]], float], Sequence[Any] | None]] = None,
    timeout_seconds: float = 1.0,
    max_rows_for_penalty: int = 1000,
) -> ExecutionScoreDetail:
    """
    pdf의 execution-based score 아이디어를 코드로 구현한 함수.

    기본 아이디어:
      - (a) non-empty 결과 선호 → len(rows) > 0 이면 +1
      - (b) 너무 많은 row (e.g., > max_rows_for_penalty)면 살짝 감점 (-0.5)
      - (c) question_type(COUNT)에 반하는 사용이면 감점

    여기서 (c)는 "COUNT 질문인데 SQL에 COUNT가 전혀 없는 경우"만 감점(-1)하고,
    그 외에는 추가 보너스를 주지 않는다.
    즉, COUNT가 아닌 질문도 (a), (b) 관점에서는 동일한 기준으로 점수를 받을 수 있다.

    이 함수는 score 뿐 아니라 디버깅을 위한 세부 정보도 함께 반환합니다.
    """
    qt = infer_question_type(question)
    upper_sql = sql.upper()
    has_count_keyword = "COUNT(" in upper_sql or " COUNT " in upper_sql

    rows: Sequence[Any] = []
    error: Optional[str] = None
    timed_out = False

    try:
        rows = execute_with_timeout(
            run_query=run_query,
            sql=sql,
            timeout_runner=timeout_runner,
            timeout_seconds=timeout_seconds,
        )
    except TimeoutError as e:
        error = str(e)
        timed_out = True
    except Exception as e:  # noqa: BLE001
        error = str(e)

    # 실행 실패 시 큰 패널티
    if error is not None:
        return ExecutionScoreDetail(
            total=-100.0,
            error=error,
            timed_out=timed_out,
            row_count=0,
            too_many_rows=False,
            question_type=qt,
            count_keyword_in_sql=has_count_keyword,
        )

    # rows가 None인 경우도 실패로 간주하지 않고 빈 결과로 취급
    row_count = len(rows) if rows is not None else 0
    score = 0.0

    # (a) non-empty 결과 선호
    if row_count > 0:
        score += 1.0

    # (b) 너무 많은 row면 살짝 감점
    too_many_rows = row_count > max_rows_for_penalty
    if too_many_rows:
        score -= 0.5

    # (c) question_type에 맞는지 (count/aggregation 등)
    #     - COUNT 질문인데 SQL에 COUNT 키워드가 전혀 없으면 감점(-1.0)
    #     - 그 외에는 추가 보너스를 주지 않는다 (베이스라인을 맞추기 위함).
    if qt == "COUNT" and not has_count_keyword:
        score -= 1.0

    return ExecutionScoreDetail(
        total=score,
        error=None,
        timed_out=False,
        row_count=row_count,
        too_many_rows=too_many_rows,
        question_type=qt,
        count_keyword_in_sql=has_count_keyword,
    )


