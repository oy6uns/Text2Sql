# run_eval_dev_small.py (프로젝트 루트에 임시로)
from pathlib import Path
from src.text2sql.datasets.load_spider import evaluate_spider

def main():
    # 이 파일은 src/run_eval.py 에 있으므로,
    # 프로젝트 루트는 부모 디렉터리(../)이다.
    project_root = Path(__file__).resolve().parents[1]
    dataset_root = project_root / "spider_data"

    evaluate_spider(
        dataset_root=dataset_root,
        n_examples=3,
        n_candidates=1,
        mode="fixed",
        split="dev",
        include_train_others=False,
    )

if __name__ == "__main__":
    main()