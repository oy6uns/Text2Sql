## BKMS2 Text2SQL + BoN 프로젝트

이 프로젝트는 **자연어 질문 + DB 스키마 → 여러 개의 SQL 후보 생성(BoN) → 자동 점수화 → 최적 SQL 선택**까지
전 과정을 실험할 수 있도록 구성된 Text2SQL 파이프라인입니다.

주요 특징은 다음과 같습니다.

- **Spider 데이터셋(`spider_data/`) 지원**
- **LLM 후보 생성**: OpenAI `gpt-4.1-mini` 기반
- **Syntax / Schema / Execution 3종 스코어** 계산
- **실제 SQLite DB 실행 기반 execution_score** (Spider의 `database/`, `test_database/` 사용)
- **BoN 설정 비교**: `fixed_N1`, `fixed_N3`, `fixed_N5`, `mixed_N5(P1=1,P2=2,P3=2)` 등
- **후보/점수/에러 로그를 JSON으로 저장**해서 분석 가능

---

## 1. 환경 설정

### 1-1. 의존성 설치

```bash
pip install -r requirements.txt
```

필수 패키지:

- **openai**: `gpt-4.1-mini` 모델 사용
- **pandas**, **snowflake-connector-python** 등 (일부는 추후 실험용)

OpenAI 키 환경변수:

```bash
export OPENAI_API_KEY="YOUR_OPENAI_API_KEY"
```

### 1-2. 데이터셋 준비 (`spider_data/`)

이 레포지토리는 Spider 데이터셋 파일을 포함하지 않습니다.  
먼저 공식 Spider 페이지에서 Spider 1.0 데이터를 내려받아야 합니다.

- Spider 공식 페이지: [Spider Text-to-SQL Challenge](https://yale-lily.github.io/spider)
  - 데이터 다운로드 링크는 위 페이지의 안내를 따르세요.

다운로드한 Spider 1.0 데이터를 **프로젝트 루트의 `spider_data/` 디렉터리에 풀어 놓아야** 합니다.  
구조 예시는 다음과 같습니다.

- `spider_data/train_spider.json`, `dev.json`, `test.json`
- `spider_data/tables.json`, `test_tables.json`
- `spider_data/database/{db_id}/{db_id}.sqlite`
- `spider_data/test_database/{db_id}/{db_id}.sqlite`

LLM 프롬프트에 들어가는 스키마 요약은 `tables.json` / `test_tables.json`에서 자동 생성됩니다.

---

## 2. BoN 평가/생성 파이프라인

### 2-1. 핵심 엔트리 포인트

- **파이프라인 함수**: `src/text2sql/pipeline.py`
  - `run_text2sql_bon_pipeline(question, schema_text, n_candidates, mode, run_query)`
  - 후보 N개 생성 후, 각 후보에 대해
    - `syntax_score`, `schema_score`, `execution_score`를 계산하고
    - 합산 스코어 기준으로 정렬하여 상위부터 반환

- **후보/점수 JSON 구조**: `PipelineResultItem`
  - `rank`, `sql`, `score`
  - `syntax_score`, `schema_score`, `execution_score`
  - `question` (원본 자연어 질문)
  - `syntax_detail`, `schema_detail`, `execution_detail`  
    → 감점/가점 이유(따옴표/괄호 오류, unknown_tables, row_count, error 메시지 등)를 모두 포함

### 2-2. 후보/점수 저장 위치

프로젝트 루트 기준:

- **fixed 모드 캐시(JSON)**  
  - `src/results/bon_cache/fixed_N1/*.json`  
  - `src/results/bon_cache/fixed_N3/*.json`  
  - `src/results/bon_cache/fixed_N5/*.json`

- **diverse(mixed) 모드 캐시(JSON)**  
  - `src/results/bon_cache_diverse/*.json`  (mixed_N5: P1=1, P2=2, P3=2)

- **최종 제출용 SQL(.sql)**  
  - fixed N5: `src/results/bon_fixed_N5/*.sql`  
  - mixed N5: `src/results/bon_mixed_N5/*.sql`

각 JSON 파일 이름은 Spider `instance_id` (`test_00000` 등)와 일치합니다.

---

## 3. 실행 방법

### 3-1. 평가 전용 (작은 스케일 테스트)

`src/run_eval.py`는 dev/test 일부에 대해 간단히 평가를 돌려보는 예시입니다.
필요에 따라 `split`, `n_examples`, `n_candidates`, `mode`를 수정해서 사용합니다.

```bash
python -m src.run_eval
```

이 스크립트는 내부적으로:

- `spider_data/`에서 예제를 로드
- `tables.json` 기반으로 스키마 텍스트 생성
- LLM으로 후보 N개 생성
- SQLite DB에 실제 쿼리를 날려 execution_score 계산
- 결과를 `src/results/bon_cache/...` 에 JSON으로 저장

### 3-2. fixed 모드 submission 생성 (N=5)

`fixed_N5` 설정으로 test split 전체에 대해 BoN을 적용하고,
각 예제당 best SQL 1개를 `.sql` 파일로 저장합니다.

```bash
python -m src.text2sql.datasets.spider2_snow_submission
```

결과:

- **최종 SQL**: `src/results/bon_fixed_N5/test_00000.sql`, ...
- **후보/점수 JSON**: `src/results/bon_cache/fixed_N5/test_00000.json`, ...

### 3-3. mixed diverse 모드 submission 생성 (N=5, P1=1/P2=2/P3=2)

`mixed_N5` 설정(P1=1, P2=2, P3=2)으로 다양한 프롬프트를 섞어
각 예제당 5개 후보를 생성하고 BoN을 적용합니다.

```bash
python -m src.text2sql.datasets.spider2_snow_submission_diverse
```

결과:

- **최종 SQL**: `src/results/bon_mixed_N5/test_00000.sql`, ...
- **후보/점수 JSON**: `src/results/bon_cache_diverse/test_00000.json`, ...

---

## 4. 점수 체계 요약

### 4-1. Syntax score (`syntax_score.py`)

- 따옴표/괄호 짝 검사
- `SELECT` / `FROM` 존재 여부 및 대략적인 순서
- 키워드 순서(`WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`) 체크
- 집계 함수 vs `GROUP BY` 일관성

### 4-2. Schema/Semantic score (`semantic_score.py`)

- 스키마에 없는 테이블/컬럼 사용 (`unknown_tables` – 대소문자 무시)
- JOIN이 있는데 ON이 없는 경우 (`join_without_on`)
- `ORDER BY` 컬럼이 SELECT/스키마에 없는 경우
- 질문이 COUNT 유형인데 SQL에 COUNT가 없는/불필요하게 있는 경우

### 4-3. Execution score (`execution_score.py`)

- `make_spider_sqlite_run_query`로 Spider SQLite(DB)에 실제 쿼리 실행
- 실행 실패/타임아웃 시 큰 패널티(-100)
- 결과 row 개수가 0/너무 많은 경우 감점
- COUNT 질문인데 SQL에 COUNT가 전혀 없으면 추가 감점

`execution_detail`에 error 메시지, row_count, too_many_rows, question_type 등을 함께 저장해서
후분석 시 어떤 이유로 감점되었는지 쉽게 확인할 수 있습니다.

---

## 5. Streamlit 데모 (선택)

간단한 Text2SQL + BoN 프론트엔드를 실행하려면:

```bash
streamlit run app.py
```

이 앱은:

- 자연어 질문과 스키마 텍스트를 직접 입력
- N 및 mode(fixed/diverse)를 선택
- 후보 SQL과 점수를 화면에서 바로 확인할 수 있습니다.

---

## 6. 실험 팁

- **N 값 비교**: `fixed_N1`, `fixed_N3`, `fixed_N5`, `mixed_N5`를 모두 돌리고
  `src/results/bon_cache` / `bon_cache_diverse`의 JSON을 집계하면
  설정별 평균 점수, 실행 실패율 등을 쉽게 비교할 수 있습니다.
- **프롬프트 수정 실험**:  
  `src/text2sql/pipeline.py`의 `_build_prompt_fixed/_reasoning/_hint_structured`
  내용을 바꾸고 다시 돌리면, 프롬프트 전략에 따른 성능 변화를 볼 수 있습니다.
- **새 DB 추가**:  
  `spider_data/database/` / `test_database/`에 새로운 SQLite를 추가하고
  `tables.json`을 업데이트하면, 추가 DB에 대해서도 동일한 파이프라인을 적용할 수 있습니다.
