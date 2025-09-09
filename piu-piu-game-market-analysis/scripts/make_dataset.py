"""Demo: load CSV from data/raw (games.csv), compute avg price by genre, save a figure."""
import pandas as pd
from src.compute_metrics import avg_price_by
from src.plotting import bar_series
from src.config import DATA_RAW

def main():
    csv = DATA_RAW / "games.csv"
    if not csv.exists():
        print(f"Put a CSV at {csv} to run this demo.")
        return
    df = pd.read_csv(csv)
    out = avg_price_by(df, ["genre"], price_col="price")
    print(out.head())
    fig = bar_series(out.set_index("genre")["avg_price"], "Prix moyen par genre (échantillon)", "avg_price_by_genre.png")
    print(f"Saved figure at: {fig}")

if __name__ == "__main__":
    main()