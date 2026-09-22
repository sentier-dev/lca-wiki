**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.backtest.emit` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-brightway repo && git -C repo checkout a9dba75
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
  -I "$SP" -m sentier_brightway.backtest.emit cfg.yml > sentier_brightway.backtest.emit.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.backtest.emit"></a>

# sentier\_brightway.backtest.emit

Write the dashboard CSVs, the box-plot JSON, the worst-N lists, the meta sidecar, the
parquet bundle and the run report.

<a id="sentier_brightway.backtest.emit.BASELINE"></a>

#### BASELINE

<a id="sentier_brightway.backtest.emit.EMISSIONS_CSV"></a>

#### EMISSIONS\_CSV

absolute scores; read by dashboard/backtest_dashboard.html

<a id="sentier_brightway.backtest.emit.VS_BAFU_CSV"></a>

#### VS\_BAFU\_CSV

pct vs BAFU; read by the dashboard

<a id="sentier_brightway.backtest.emit.VS_BAFU_META"></a>

#### VS\_BAFU\_META

<a id="sentier_brightway.backtest.emit.OUTLIER_REASONS"></a>

#### OUTLIER\_REASONS

per-category notes; header (i) + cell tooltip

<a id="sentier_brightway.backtest.emit.BOXES_JSON"></a>

#### BOXES\_JSON

box-plot statistics per sector and category; the page's main view

<a id="sentier_brightway.backtest.emit.WORST_DIR"></a>

#### WORST\_DIR

<short>.json: the WORST_N rows with the largest |pct| per category

<a id="sentier_brightway.backtest.emit.BACKTEST_DIR"></a>

#### BACKTEST\_DIR

parquet bundle folder

<a id="sentier_brightway.backtest.emit.RUN_REPORT"></a>

#### RUN\_REPORT

<a id="sentier_brightway.backtest.emit.SCORE_FORMAT"></a>

#### SCORE\_FORMAT

absolute scores: plain or scientific, 10 significant digits

<a id="sentier_brightway.backtest.emit.PCT_FORMAT"></a>

#### PCT\_FORMAT

pct columns are rounded to 4 decimals by compare()

<a id="sentier_brightway.backtest.emit.write_emissions_csv"></a>

#### write\_emissions\_csv

```python
def write_emissions_csv(scores: pd.DataFrame, aligned: Aligned,
                        categories: tuple[Category, ...], path: Path) -> None
```

One row per process with absolute scores: the value converted to the table's unit
for mapped rows, our raw score (our unit) for unmatched and unit-skipped rows.
NaN cells are written blank.

<a id="sentier_brightway.backtest.emit.write_vs_csv"></a>

#### write\_vs\_csv

```python
def write_vs_csv(compared: Compared, categories: tuple[Category, ...],
                 path: Path) -> None
```

Percent differences for mapped rows, with the reference product and unit.

<a id="sentier_brightway.backtest.emit.write_boxes"></a>

#### write\_boxes

```python
def write_boxes(compared: Compared, categories: tuple[Category, ...],
                path: Path) -> None
```

``boxes.json``: the box-plot statistics of every category, for all mapped rows and
per sector. Compact, keys sorted, so the file is small and byte-identical across runs.

<a id="sentier_brightway.backtest.emit.write_worst"></a>

#### write\_worst

```python
def write_worst(compared: Compared, categories: tuple[Category, ...],
                folder: Path) -> None
```

``worst/<short>.json``: the ``WORST_N`` mapped rows with the largest |pct| per
category (finite pct only), sorted by |pct| descending then code.

<a id="sentier_brightway.backtest.emit.write_meta"></a>

#### write\_meta

```python
def write_meta(compared: Compared, categories: tuple[Category, ...],
               path: Path) -> None
```

Sidecar the dashboard reads for the guard thresholds and the unmatched lists.

<a id="sentier_brightway.backtest.emit.OUTLIER_NOTES"></a>

#### OUTLIER\_NOTES

<a id="sentier_brightway.backtest.emit.write_outlier_reasons"></a>

#### write\_outlier\_reasons

```python
def write_outlier_reasons(path: Path) -> None
```

The fixed, code-owned category notes the dashboard shows behind the header (i).

<a id="sentier_brightway.backtest.emit.write_parquet_bundle"></a>

#### write\_parquet\_bundle

```python
def write_parquet_bundle(scores: pd.DataFrame, compared: Compared,
                         summary: pd.DataFrame, folder: Path) -> None
```

``scores``, ``reference`` (aligned, our unit reconciled), ``diff_pct`` (long) and
``summary`` parquet files for downstream analysis.

<a id="sentier_brightway.backtest.emit.write_run_report"></a>

#### write\_run\_report

```python
def write_run_report(path: Path, pins: list[dict], solver: str, timings: dict,
                     counts: dict) -> None
```

Provenance: version, source pins, solver, timings and row counts of one run.
