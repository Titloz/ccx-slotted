#!/usr/bin/env python3
"""
Analyse benchmark results (semicolon-separated CSV).

Outputs:
  1. Mean / median (and a few extras) for every numeric statistic -> printed + summary_stats.csv
  2. Same breakdown per stop-reason                               -> summary_by_stop_reason.csv
  3. Bar plot of `nodes` for every name                           -> nodes_all.png
  4. Bar plot of `nodes` for the top-N names                      -> nodes_top<N>.png

Usage:
    python analyze_results.py results_nodisequality.csv
    python analyze_results.py results_nodisequality.csv --outdir figs --top 40 --linear
"""

import argparse
from pathlib import Path

import matplotlib
matplotlib.use("Agg")  # no display needed
import matplotlib.pyplot as plt
import pandas as pd

# Column that identifies each run, and the one we plot.
NAME_COL = "name"
GROUP_COL = "stop-reason"
PLOT_COL = "nodes"


def load(path: Path) -> pd.DataFrame:
    """Read the ';'-separated results file."""
    df = pd.read_csv(path, sep=";")
    df.columns = [c.strip() for c in df.columns]
    # Force every non-identifier column to numeric; unparsable cells become NaN.
    for col in df.columns:
        if col not in (NAME_COL, GROUP_COL):
            df[col] = pd.to_numeric(df[col], errors="coerce")
    return df


def numeric_columns(df: pd.DataFrame) -> list:
    return [c for c in df.select_dtypes("number").columns]


def summarise(df: pd.DataFrame) -> pd.DataFrame:
    """Mean, median and friends for every numeric statistic.

    NaN rows (e.g. crashed runs with no measurements) are ignored per column,
    which is why `count` is reported alongside.
    """
    cols = numeric_columns(df)
    stats = pd.DataFrame(
        {
            "count": df[cols].count(),
            "missing": df[cols].isna().sum(),
            "mean": df[cols].mean(),
            "median": df[cols].median(),
            "std": df[cols].std(),
            "min": df[cols].min(),
            "max": df[cols].max(),
        }
    )
    stats.index.name = "statistic"
    return stats


def summarise_by_group(df: pd.DataFrame) -> pd.DataFrame:
    """Mean and median of every statistic, split by stop-reason."""
    if GROUP_COL not in df.columns:
        return pd.DataFrame()
    cols = numeric_columns(df)
    out = df.groupby(GROUP_COL)[cols].agg(["count", "mean", "median"])
    return out


def plot_all_names(df: pd.DataFrame, outdir: Path, log: bool = True) -> Path:
    """One bar per name, sorted descending.

    With ~1000+ names individual labels are unreadable, so they are dropped and
    the x-axis just shows rank. Use the top-N plot to read off actual names.
    """
    data = df.dropna(subset=[PLOT_COL]).sort_values(PLOT_COL, ascending=False)

    fig, ax = plt.subplots(figsize=(16, 6))
    ax.bar(range(len(data)), data[PLOT_COL], width=1.0, color="#3b6ea5", linewidth=0)
    ax.set_xlim(-0.5, len(data) - 0.5)
    ax.set_xlabel(f"benchmark (sorted by {PLOT_COL}, {len(data)} entries)")
    ax.set_ylabel(PLOT_COL + (" (log scale)" if log else ""))
    ax.set_title(f"Number of graph nodes per benchmark")
    if log:
        ax.set_yscale("log")
    ax.axhline(
        data[PLOT_COL].median(),
        color="crimson",
        linestyle="--",
        linewidth=1,
        label=f"median = {data[PLOT_COL].median():,.0f}",
    )
    ax.axhline(
        data[PLOT_COL].mean(),
        color="darkorange",
        linestyle=":",
        linewidth=1,
        label=f"mean = {data[PLOT_COL].mean():,.0f}",
    )
    ax.legend()
    ax.grid(axis="y", alpha=0.3)
    fig.tight_layout()

    path = outdir / "nodes_all.png"
    fig.savefig(path, dpi=150)
    plt.close(fig)
    return path


def plot_top_names(df: pd.DataFrame, outdir: Path, top: int = 30) -> Path:
    """Horizontal bar chart of the N heaviest benchmarks, with readable labels."""
    data = (
        df.dropna(subset=[PLOT_COL])
        .nlargest(top, PLOT_COL)
        .sort_values(PLOT_COL)  # smallest at the bottom
    )

    fig, ax = plt.subplots(figsize=(10, max(4, 0.3 * len(data))))
    ax.barh(data[NAME_COL], data[PLOT_COL], color="#3b6ea5")
    ax.set_xlabel(PLOT_COL)
    ax.set_ylabel(NAME_COL)
    ax.set_title(f"Top {len(data)} benchmarks by number of nodes")
    ax.tick_params(axis="y", labelsize=7)
    ax.grid(axis="x", alpha=0.3)
    fig.tight_layout()

    path = outdir / f"nodes_top{len(data)}.png"
    fig.savefig(path, dpi=150)
    plt.close(fig)
    return path


def main() -> None:
    p = argparse.ArgumentParser(description="Summarise and plot benchmark results.")
    p.add_argument("csv", type=Path, help="path to the ';'-separated results file")
    p.add_argument("--outdir", type=Path, default=Path("."), help="where to write outputs")
    p.add_argument("--top", type=int, default=30, help="how many names in the top-N plot")
    p.add_argument("--linear", action="store_true", help="linear y-axis instead of log")
    args = p.parse_args()

    args.outdir.mkdir(parents=True, exist_ok=True)
    df = load(args.csv)
    print(f"Loaded {len(df)} rows from {args.csv}\n")

    stats = summarise(df)
    pd.set_option("display.float_format", lambda v: f"{v:,.3f}")
    print("=== Mean / median per statistic ===")
    print(stats.to_string())
    stats.to_csv(args.outdir / "summary_stats.csv")

    by_group = summarise_by_group(df)
    if not by_group.empty:
        print(f"\n=== Per {GROUP_COL} ===")
        print(df[GROUP_COL].value_counts().to_string())
        by_group.to_csv(args.outdir / "summary_by_stop_reason.csv")

    p1 = plot_all_names(df, args.outdir, log=not args.linear)
    p2 = plot_top_names(df, args.outdir, top=args.top)
    print(f"\nWrote: {args.outdir/'summary_stats.csv'}, {p1}, {p2}")


if __name__ == "__main__":
    main()
