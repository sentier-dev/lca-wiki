**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.backtest` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_brightway.backtest cfg.yml > sentier_brightway.backtest.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.backtest"></a>

# sentier\_brightway.backtest

Backtest of the file-mode export against BAFU's published openLCA EF 3.1 results.

``run_backtest(files_dir, xlsx, out_dir)`` scores every registry process for the 25 EF 3.1
categories, joins the BAFU LCIA table, and writes the dashboard data folder. The scorer
(``bw2calc``) is imported lazily inside ``run_backtest`` so ``import sentier_brightway``
stays cheap.

<a id="sentier_brightway.backtest.DEFAULT_XLSX"></a>

#### DEFAULT\_XLSX

<a id="sentier_brightway.backtest.FIXTURE_CATEGORIES"></a>

#### FIXTURE\_CATEGORIES

<a id="sentier_brightway.backtest.SUMMARY_COLUMNS"></a>

#### SUMMARY\_COLUMNS

<a id="sentier_brightway.backtest.BacktestResult"></a>

## BacktestResult Objects

```python
@dataclass(frozen=True)
class BacktestResult()
```

<a id="sentier_brightway.backtest.BacktestResult.scores"></a>

#### scores

<a id="sentier_brightway.backtest.BacktestResult.summary"></a>

#### summary

<a id="sentier_brightway.backtest.BacktestResult.out_dir"></a>

#### out\_dir

<a id="sentier_brightway.backtest.BacktestResult.n_mapped"></a>

#### n\_mapped

<a id="sentier_brightway.backtest.BacktestResult.n_unmatched"></a>

#### n\_unmatched

<a id="sentier_brightway.backtest.BacktestResult.n_unit_skipped"></a>

#### n\_unit\_skipped

<a id="sentier_brightway.backtest.run_backtest"></a>

#### run\_backtest

```python
def run_backtest(files_dir: Path | str,
                 xlsx: Path | str,
                 out_dir: Path | str,
                 categories: tuple[Category, ...] = CATEGORIES,
                 check_n: int = 3) -> BacktestResult
```

Score ``files_dir`` (a file-mode export) for ``categories``, spot-check ``check_n``
processes against the plain bw2calc loop, compare with the BAFU table at ``xlsx`` and
write ``emissions.csv``, ``vs_bafu.csv``, ``vs_bafu_meta.json``, ``outlier_reasons.json``,
``boxes.json``, ``worst/<short>.json``, ``backtest/*.parquet`` and ``run_report.json``
into ``out_dir`` (created only once the inputs are read).

<a id="sentier_brightway.backtest.render_summary"></a>

#### render\_summary

```python
def render_summary(result: BacktestResult) -> str
```

Human-readable outcome: where it went, the match counts and one line per category
(median, quartiles, outliers beyond the whiskers, largest |pct|).
