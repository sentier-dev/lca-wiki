**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `pipelines.backtest` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m pipelines.backtest cfg.yml > pipelines.backtest.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="pipelines.backtest"></a>

# pipelines.backtest

``BacktestPipeline`` — score every mapped product against ADEME's reference.

<a id="pipelines.backtest.BacktestOptions"></a>

## BacktestOptions Objects

```python
@dataclass(frozen=True)
class BacktestOptions()
```

<a id="pipelines.backtest.BacktestOptions.solver"></a>

#### solver

<a id="pipelines.backtest.BacktestOptions.n_workers"></a>

#### n\_workers

<a id="pipelines.backtest.BacktestOptions.n_products"></a>

#### n\_products

If set, score only the first N reference rows (deterministic order). For quick spot-checks.

<a id="pipelines.backtest.BacktestOptions.match_mode"></a>

#### match\_mode

How to map ADEME reference rows → AGB DB activities.

* ``"all"`` — current default: CIQUAL code → exact LCI Name → substring fallback.
* ``"exact_name"`` — only keep rows whose ``LCI Name`` exactly matches an
  AGB DB process/product name (the SimaPro-style restored name). Used for
  the curated "32 products with exact-name match to SimaPro" subset.

<a id="pipelines.backtest.BacktestPipeline"></a>

## BacktestPipeline Objects

```python
@dataclass
class BacktestPipeline()
```

<a id="pipelines.backtest.BacktestPipeline.settings"></a>

#### settings

<a id="pipelines.backtest.BacktestPipeline.options"></a>

#### options

<a id="pipelines.backtest.BacktestPipeline.INFO_COLS"></a>

#### INFO\_COLS

<a id="pipelines.backtest.BacktestPipeline.ADEME_STORAGE_TO_AGB"></a>

#### ADEME\_STORAGE\_TO\_AGB

<a id="pipelines.backtest.BacktestPipeline.NEAR_ZERO_FACTOR"></a>

#### NEAR\_ZERO\_FACTOR

``|x| < factor * median(|reference|)`` → both computed and reference rounded to 0.

<a id="pipelines.backtest.BacktestPipeline.DASHBOARD_PASS1_CSV"></a>

#### DASHBOARD\_PASS1\_CSV

<a id="pipelines.backtest.BacktestPipeline.METHOD_TO_ADEME"></a>

#### METHOD\_TO\_ADEME

<a id="pipelines.backtest.BacktestPipeline.run"></a>

#### run

```python
def run() -> dict[str, Any]
```

<a id="pipelines.backtest.BacktestPipeline.EMBALLAGE_CORRIGE_TOKEN"></a>

#### EMBALLAGE\_CORRIGE\_TOKEN
