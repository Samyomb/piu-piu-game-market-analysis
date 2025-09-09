import matplotlib.pyplot as plt
import pandas as pd
from .config import FIGURES

def bar_series(s: pd.Series, title: str, fname: str):
    plt.figure()
    s.plot(kind="bar")
    plt.title(title)
    plt.tight_layout()
    path = FIGURES / fname
    plt.savefig(path, dpi=180)
    plt.close()
    return path