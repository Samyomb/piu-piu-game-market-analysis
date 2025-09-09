import pandas as pd

def compute_revenue(players: int | float, pay_rate: float, basket: float, attach_rate: float = 0.0) -> float:
    """Estimated revenue within sample.
    revenue = players * pay_rate * basket * (1 + attach_rate)
    """
    return float(players) * float(pay_rate) * float(basket) * (1.0 + float(attach_rate))

def avg_price_by(df: pd.DataFrame, group_cols: list[str], price_col: str = "price") -> pd.DataFrame:
    return df.groupby(group_cols, dropna=False)[price_col].mean().reset_index(name="avg_price")

def mix_share(df: pd.DataFrame, group_col: str, weight_col: str | None = None) -> pd.DataFrame:
    if weight_col:
        total = df[weight_col].sum()
        return (df.groupby(group_col)[weight_col].sum() / total).reset_index(name="share")
    total = len(df)
    return (df.groupby(group_col).size() / total).reset_index(name="share")