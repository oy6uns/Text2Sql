import streamlit as st
from src.text2sql.pipeline import run_text2sql_bon_pipeline


def main():
    st.set_page_config(
        page_title="Text2SQL + BoN Demo",
        layout="wide",
    )

    st.title("Text2SQL + BoN 데모 UI")
    st.markdown(
        "자연어 질문과 DB 스키마를 입력하면, N개의 SQL 후보를 생성하고 "
        "BoN 방식으로 스코어링해 최적의 SQL을 선택하는 시스템의 프론트엔드입니다."
    )

    with st.sidebar:
        st.header("설정")
        n_candidates = st.slider("N (후보 SQL 개수)", min_value=1, max_value=10, value=5, step=1)
        mode = st.radio(
            "프롬프트 모드",
            options=["fixed", "diverse"],
            index=0,
            help="fixed: 동일 프롬프트 + 샘플링, diverse: 여러 프롬프트 조합",
        )

    col_question, col_schema = st.columns(2)

    with col_question:
        st.subheader("자연어 질문")
        question = st.text_area(
            "질문을 입력하세요",
            placeholder="예) 2020년 이후 가입한 사용자 수를 알려줘",
            height=150,
        )

    with col_schema:
        st.subheader("DB 스키마")
        schema_text = st.text_area(
            "스키마 정보를 텍스트로 붙여넣으세요",
            placeholder="예) users(id INT, name TEXT, created_at DATE), orders(id INT, user_id INT, ...)",
            height=150,
        )

    run_button = st.button("SQL 후보 생성 및 평가", type="primary")

    st.markdown("---")
    st.subheader("결과")

    if run_button:
        if not question.strip():
            st.warning("질문을 입력해주세요.")
            return

        if not schema_text.strip():
            st.warning("DB 스키마를 입력해주세요.")
            return

        with st.spinner("SQL 후보를 생성하고 평가하는 중입니다..."):
            results = run_text2sql_bon_pipeline(
                question=question,
                schema_text=schema_text,
                n_candidates=n_candidates,
                mode=mode,
            )

        if not results:
            st.error("후보 SQL을 생성하지 못했습니다.")
            return

        # 상위 1개 강조
        best = results[0]
        st.success("최적 후보(SQL)입니다:")
        st.code(best["sql"], language="sql")
        st.caption(f"Score: {best['score']:.3f}")

        # 전체 후보 테이블 표시
        with st.expander("전체 후보 및 점수 보기", expanded=True):
            for item in results:
                st.markdown(f"**Rank {item['rank']}** (Score: {item['score']:.3f})")
                st.code(item["sql"], language="sql")
                st.markdown("---")


if __name__ == "__main__":
    main()


