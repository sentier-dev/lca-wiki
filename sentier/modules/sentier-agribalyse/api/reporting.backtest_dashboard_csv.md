**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `reporting.backtest_dashboard_csv` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-agribalyse repo && git -C repo checkout 3d0df56
SP=repo/src
cat > cfg.yml <<'YML'
processors:
  - type: filter
    documented_only: false
    expression: "type(obj).__name__ != 'Indirection' and default()"
  - type: smart
renderer:
  type: markdown
  render_toc: false
YML
uvx --python 3.11 --from pydoc-markdown==4.8.2 pydoc-markdown \
  -I "$SP" -m reporting.backtest_dashboard_csv cfg.yml > reporting.backtest_dashboard_csv.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="reporting.backtest_dashboard_csv"></a>

# reporting.backtest\_dashboard\_csv

``BacktestPass1Emitter`` — write ``dashboard/backtest_pass1.csv``.

Translates the long-form method columns produced by ``BacktestPipeline``
(``"climate change"``, ``"climate change: biogenic"``, ...) into the 19
short IDs the dashboard HTML expects (``"climate"``, ``"cc_bio"``, ...).
Replaces the previously manual regeneration of
``dashboard/backtest_pass1.csv`` from ``dashboard/backtest/diff_pct.parquet``.

Only rows where ``scores_df["mapped"]`` is True are emitted — the
dashboard's "resolution=mapped" filter excludes unmapped reference rows
that carry no computed diff.

<a id="reporting.backtest_dashboard_csv.BacktestPass1Emitter"></a>

## BacktestPass1Emitter Objects

```python
@dataclass(frozen=True)
class BacktestPass1Emitter()
```

<a id="reporting.backtest_dashboard_csv.BacktestPass1Emitter.out_path"></a>

#### out\_path

<a id="reporting.backtest_dashboard_csv.BacktestPass1Emitter.LONG_TO_SHORT"></a>

#### LONG\_TO\_SHORT

<a id="reporting.backtest_dashboard_csv.BacktestPass1Emitter.SHORT_ORDER"></a>

#### SHORT\_ORDER

<a id="reporting.backtest_dashboard_csv.BacktestPass1Emitter.HEADER"></a>

#### HEADER

<a id="reporting.backtest_dashboard_csv.BacktestPass1Emitter.write"></a>

#### write

```python
def write(scores_df: pd.DataFrame, diff_pct_df: pd.DataFrame) -> Path
```
