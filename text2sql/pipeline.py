from dataclasses import dataclass, asdict
from typing import Any, Callable, List, Literal, Optional, Sequence, TypedDict

from openai import OpenAI

from src.text2sql.scoring.syntax_score import (
    SyntaxScoreDetail,
    compute_syntax_score,
)
from src.text2sql.scoring.semantic_score import (
    SemanticScoreDetail,
    compute_semantic_score,
)
from src.text2sql.scoring.execution_score import (
    ExecutionScoreDetail,
    compute_execution_score,
)


Mode = Literal["fixed", "diverse"]
# diverse 모드에서 어떤 프롬프트 조합을 쓸지 지정
DiverseStrategy = Literal["p1p2", "p1p3", "p1p2p3"]


class PipelineResultItem(TypedDict):
    """
    BoN 후보 SQL 1개에 대한 결과 + 스코어 디테일.

    이 구조는 JSON으로 그대로 저장해서,
    나중에 실험 시 LLM/DB를 다시 호출하지 않고 재사용할 수 있도록 설계되었습니다.
    """

    rank: int
    sql: str
    score: float
    syntax_score: float
    schema_score: float
    execution_score: float
    # 원본 자연어 질문 (분석용으로 함께 저장)
    question: str
    # 각 점수에 대한 세부 정보(감점/가점 이유)를 함께 저장
    syntax_detail: dict
    schema_detail: dict
    execution_detail: Optional[dict]


@dataclass
class CandidateSQL:
    sql: str
    syntax_score: float
    schema_score: float
    execution_score: float
    syntax_detail: SyntaxScoreDetail
    semantic_detail: SemanticScoreDetail
    execution_detail: Optional[ExecutionScoreDetail]

    @property
    def total_score(self) -> float:
        return self.syntax_score + self.schema_score + self.execution_score


_OPENAI_MODEL_NAME = "gpt-4.1-mini"
_openai_client: OpenAI | None = None


def _get_openai_client() -> OpenAI:
    """
    전역 OpenAI 클라이언트를 lazy하게 초기화합니다.
    OPENAI_API_KEY 환경변수를 사용합니다.
    """
    global _openai_client
    if _openai_client is None:
        _openai_client = OpenAI()  # 환경변수 OPENAI_API_KEY를 자동으로 읽음
    return _openai_client


def _build_prompt_fixed(question: str, schema_text: str) -> str:
    """
    P1: 직접 SQL 프롬프트.
    """
    return (
        "You are a Text-to-SQL expert. Given a natural language question and a database schema, "
        "generate a single SQL query that correctly answers the question.\n\n"
        "Rules:\n"
        "- Return ONLY the SQL query, no explanation.\n"
        "- Use standard SQL compatible with Snowflake.\n"
        "- Do not wrap the query in markdown code blocks.\n\n"
        f"Schema:\n{schema_text}\n\n"
        f"Question:\n{question}\n\n"
        "SQL:"
    )


def _build_prompt_reasoning(question: str, schema_text: str) -> str:
    """
    P2: CoT 프롬프트.
    """
    return (
        "You are a Text-to-SQL expert. First think step by step in natural language, "
        "then output the final SQL query.\n\n"
        "Format:\n"
        "Reasoning:\n"
        "<your reasoning here>\n"
        "SQL:\n"
        "<final SQL here>\n\n"
        "Guidelines:\n"
        "- Return ONLY the final SQL query, without any explanation.\n"
        "- Do NOT wrap the SQL in markdown code fences (no ``` or ```sql).\n"
        "- Use table and column names exactly as they appear in the Schema (respect case, spelling, and underscores).\n\n"
        f"Schema:\n{schema_text}\n\n"
        f"Question:\n{question}\n"
    )


def _build_prompt_hint_structured(question: str, schema_text: str) -> str:
    """
    P3: 힌트를 주는 프롬프트.

    - JOIN / GROUP BY / 집계 구조를 의식해서 설계하도록 유도
    - 오류가 많이 나는 스키마/조인/집계 부분을 조금 더 명시적으로 생각하게 함
    """
    return (
        "You are a senior data engineer writing analytical SQL queries.\n"
        "Given a natural language question and a database schema, design a SQL query that:\n"
        "- Uses appropriate JOINs with correct ON conditions (avoid Cartesian products).\n"
        "- Uses GROUP BY whenever aggregations (COUNT, SUM, AVG, etc.) are needed.\n"
        "- Selects only the necessary columns that answer the question.\n"
        "- Uses table and column names exactly as they appear in the Schema (respect case, spelling, and underscores).\n\n"
        "Output rules:\n"
        "- Output ONLY the final SQL query, without any explanation.\n"
        "- Do NOT wrap the SQL in markdown code fences (no ``` or ```sql).\n\n"
        f"Schema:\n{schema_text}\n\n"
        f"Question:\n{question}\n\n"
        "SQL:"
    )


def _extract_sql_from_response(text: str) -> str:
    """
    모델 응답에서 SQL 부분만 최대한 잘라냅니다.
    - 'SQL:' 이후를 우선 사용
    - 아니면 전체를 그대로 반환
    """
    lower = text.lower()
    if "sql:" in lower:
        idx = lower.rfind("sql:")
        return text[idx + 4 :].strip()
    return text.strip()


def _generate_candidates(question: str, schema_text: str, n_candidates: int, mode: Mode) -> List[str]:
    """
    OpenAI Chat Completions API를 사용해 N개의 SQL 후보를 생성합니다.

    - mode == 'fixed': 동일한 프롬프트에 대해 샘플링만 달리하여 N개 생성
    - mode == 'diverse': 서로 다른 프롬프트 조합(P1/P2/P3)을 섞어서 N개 생성
    """
    client = _get_openai_client()

    candidates: List[str] = []

    if mode == "fixed":
        prompt = _build_prompt_fixed(question, schema_text)
        for _ in range(n_candidates):
            resp = client.chat.completions.create(
                model=_OPENAI_MODEL_NAME,
                messages=[{"role": "user", "content": prompt}],
                temperature=0.7,
                top_p=0.9,
                max_tokens=512,
            )
            text = (resp.choices[0].message.content or "").strip()
            candidates.append(_extract_sql_from_response(text))
    else:
        # diverse 모드:
        # - N=5인 경우: P1=1, P2=2, P3=2 (mixed 설정)
        # - 그 외 N: P1/P2/P3를 순환하면서 균등하게 사용
        if n_candidates == 5:
            seq = [
                (_build_prompt_fixed, 512),          # 1 x P1
                (_build_prompt_reasoning, 768),      # 2 x P2
                (_build_prompt_reasoning, 768),
                (_build_prompt_hint_structured, 768),# 2 x P3
                (_build_prompt_hint_structured, 768),
            ]
        else:
            prompt_builders = [
                (_build_prompt_fixed, 512),
                (_build_prompt_reasoning, 768),
                (_build_prompt_hint_structured, 768),
            ]
            seq = [
                prompt_builders[i % len(prompt_builders)]
                for i in range(n_candidates)
            ]

        for builder, max_tokens in seq:
            prompt = builder(question, schema_text)
            resp = client.chat.completions.create(
                model=_OPENAI_MODEL_NAME,
                messages=[{"role": "user", "content": prompt}],
                temperature=0.7,
                top_p=0.9,
                max_tokens=max_tokens,
            )
            text = (resp.choices[0].message.content or "").strip()
            candidates.append(_extract_sql_from_response(text))

    return candidates


def generate_diverse_candidates_with_counts(
    question: str,
    schema_text: str,
    p1_count: int,
    p2_count: int,
    p3_count: int,
) -> List[str]:
    """
    P1/P2/P3 각각을 원하는 개수만큼 사용해 다양한 후보를 생성하는 헬퍼.
    실험(예: P1=2, P2=4, P3=4)용으로 사용한다.
    OpenAI Chat Completions 기반 구현.
    """
    client = _get_openai_client()

    seq = (
        [(_build_prompt_fixed, 512)] * p1_count
        + [(_build_prompt_reasoning, 768)] * p2_count
        + [(_build_prompt_hint_structured, 768)] * p3_count
    )

    candidates: List[str] = []
    for builder, max_tokens in seq:
        prompt = builder(question, schema_text)
        resp = client.chat.completions.create(
            model=_OPENAI_MODEL_NAME,
            messages=[{"role": "user", "content": prompt}],
            temperature=0.7,
            top_p=0.9,
            max_tokens=max_tokens,
        )
        text = (resp.choices[0].message.content or "").strip()
        candidates.append(_extract_sql_from_response(text))

    return candidates


RunQueryFn = Callable[[str], Sequence[Any]]
TimeoutRunnerFn = Callable[[Callable[[], Sequence[Any]], float], Optional[Sequence[Any]]]


def run_text2sql_bon_with_sql_candidates(
    question: str,
    schema_text: str,
    sql_candidates: List[str],
    run_query: Optional[RunQueryFn] = None,
    timeout_runner: Optional[TimeoutRunnerFn] = None,
) -> List[PipelineResultItem]:
    """
    이미 생성된 SQL 후보 리스트에 대해 scoring + BoN 선택만 수행하는 헬퍼.
    (generation은 외부에서 P1/P2/P3 조합을 마음대로 설계할 수 있다.)
    """
    candidates: List[CandidateSQL] = []
    for sql in sql_candidates:
        candidate = _score_candidate(
            sql=sql,
            question=question,
            schema_text=schema_text,
            run_query=run_query,
            timeout_runner=timeout_runner,
        )
        candidates.append(candidate)

    candidates.sort(key=lambda c: c.total_score, reverse=True)

    results: List[PipelineResultItem] = []
    for i, cand in enumerate(candidates):
        results.append(
            PipelineResultItem(
                rank=i + 1,
                sql=cand.sql,
                score=cand.total_score,
                syntax_score=cand.syntax_score,
                schema_score=cand.schema_score,
                execution_score=cand.execution_score,
                question=question,
                syntax_detail=asdict(cand.syntax_detail),
                schema_detail=asdict(cand.semantic_detail),
                execution_detail=asdict(cand.execution_detail)
                if cand.execution_detail is not None
                else None,
            )
        )

    return results


def _score_candidate(
    sql: str,
    question: str,
    schema_text: str,
    run_query: Optional[RunQueryFn] = None,
    timeout_runner: Optional[TimeoutRunnerFn] = None,
) -> CandidateSQL:
    """
    한 개의 SQL 후보에 대해
    - syntactic / format
    - semantic / logical
    - execution / runtime
    세 관점의 점수를 계산합니다.

    점수 범위는 대략 각 0~3 정도가 되도록 설계합니다.
    """

    def execution_score_heuristic(sql_text: str, q: str) -> float:
        """
        실제 DB 실행 없이도 적용 가능한 간단한 실행 기반 휴리스틱.

        - COUNT / 집계 여부를 질문 타입과 맞춰보는 정도만 구현.
        """
        score = 0.0
        upper = sql_text.upper()
        question_lower = q.lower()

        # question_type 검출 (아주 단순)
        if any(kw in question_lower for kw in ["how many", "number of", "count", "몇 개", "개수"]):
            question_type = "COUNT"
        else:
            question_type = "OTHER"

        # (c) question_type에 맞는지
        if question_type == "COUNT":
            if "COUNT(" in upper:
                score += 1.0
            else:
                score -= 1.0

        return score

    # syntax / semantic 점수는 별도 모듈에서 계산
    syntax_detail = compute_syntax_score(sql)
    semantic_detail = compute_semantic_score(sql, schema_text, question)
    syntax = syntax_detail.total
    semantic = semantic_detail.total

    # 실행 점수: run_query가 주어지면 실제 DB 실행 기반 스코어, 아니면 휴리스틱
    exec_detail: Optional[ExecutionScoreDetail] = None
    if run_query is not None:
        exec_detail = compute_execution_score(
            sql=sql,
            question=question,
            run_query=run_query,
            timeout_runner=timeout_runner,
        )
        exec_score = exec_detail.total
    else:
        exec_score = execution_score_heuristic(sql, question)

    return CandidateSQL(
        sql=sql,
        syntax_score=syntax,
        schema_score=semantic,
        execution_score=exec_score,
        syntax_detail=syntax_detail,
        semantic_detail=semantic_detail,
        execution_detail=exec_detail,
    )


def run_text2sql_bon_pipeline(
    question: str,
    schema_text: str,
    n_candidates: int,
    mode: Mode = "fixed",
    run_query: Optional[RunQueryFn] = None,
    timeout_runner: Optional[TimeoutRunnerFn] = None,
) -> List[PipelineResultItem]:
    """
    Text2SQL + BoN 파이프라인의 엔트리 포인트.

    1) NL 질문 + 스키마를 받아 N개의 SQL 후보를 생성하고
    2) 각 후보에 대해 syntax/schema/execution 스코어를 계산한 다음
    3) total_score 기준으로 정렬하여 상위부터 반환합니다.
    """
    raw_sql_candidates = _generate_candidates(
        question=question,
        schema_text=schema_text,
        n_candidates=n_candidates,
        mode=mode,
    )

    candidates: List[CandidateSQL] = []
    for sql in raw_sql_candidates:
        candidate = _score_candidate(
            sql=sql,
            question=question,
            schema_text=schema_text,
            run_query=run_query,
            timeout_runner=timeout_runner,
        )
        candidates.append(candidate)

    # total_score 기준으로 내림차순 정렬
    candidates.sort(key=lambda c: c.total_score, reverse=True)

    results: List[PipelineResultItem] = []
    for i, cand in enumerate(candidates):
        results.append(
            PipelineResultItem(
                rank=i + 1,
                sql=cand.sql,
                score=cand.total_score,
                syntax_score=cand.syntax_score,
                schema_score=cand.schema_score,
                execution_score=cand.execution_score,
                question=question,
                syntax_detail=asdict(cand.syntax_detail),
                schema_detail=asdict(cand.semantic_detail),
                execution_detail=asdict(cand.execution_detail)
                if cand.execution_detail is not None
                else None,
            )
        )

    return results


