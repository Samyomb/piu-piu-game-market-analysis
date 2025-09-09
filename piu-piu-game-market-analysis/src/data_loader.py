from pathlib import Path
import pandas as pd
from .config import DATA_RAW

def load_csv(name: str) -> pd.DataFrame:
    path = DATA_RAW / name
    if not path.exists():
        raise FileNotFoundError(f"Missing file: {path}")
    return pd.read_csv(path)

def save_parquet(df: pd.DataFrame, name: str) -> None:
    out = DATA_RAW.parent / "processed" / name
    out.parent.mkdir(parents=True, exist_ok=True)
    df.to_parquet(out, index=False)