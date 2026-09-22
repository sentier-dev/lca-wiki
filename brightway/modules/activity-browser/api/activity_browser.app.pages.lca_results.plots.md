**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.lca_results.plots` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'activity-browser==3.0.0b202608291724'
SP="$(pkg/bin/python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
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
  -I "$SP" -m activity_browser.app.pages.lca_results.plots cfg.yml > activity_browser.app.pages.lca_results.plots.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.lca_results.plots"></a>

# activity\_browser.app.pages.lca\_results.plots

Matplotlib LCA results plots (subclasses of :class:`~activity_browser.ui.widgets.ABPlot`).

Each class implements ``plot(...)`` and finishes with :meth:`ABPlot.finish_plot`.
Contributor label resolution lives in ``bwutils.contribution_labels``.

<a id="activity_browser.app.pages.lca_results.plots._ContributionFrame"></a>

## \_ContributionFrame Objects

```python
class _ContributionFrame(NamedTuple)
```

<a id="activity_browser.app.pages.lca_results.plots._ContributionFrame.dfp"></a>

#### dfp

<a id="activity_browser.app.pages.lca_results.plots._ContributionFrame.full_rows"></a>

#### full\_rows

<a id="activity_browser.app.pages.lca_results.plots._ContributionFrame.full_cols"></a>

#### full\_cols

<a id="activity_browser.app.pages.lca_results.plots._ContributionFrame.bar_values"></a>

#### bar\_values

<a id="activity_browser.app.pages.lca_results.plots._ContributionFrame.col_scores"></a>

#### col\_scores

<a id="activity_browser.app.pages.lca_results.plots._ContributionFrame.col_units"></a>

#### col\_units

<a id="activity_browser.app.pages.lca_results.plots._ContributionFrame.relative"></a>

#### relative

<a id="activity_browser.app.pages.lca_results.plots._ContributionFrame.horizontal"></a>

#### horizontal

<a id="activity_browser.app.pages.lca_results.plots._ContributionFrame.unit"></a>

#### unit

<a id="activity_browser.app.pages.lca_results.plots.LCIAResultsOverviewPlot"></a>

## LCIAResultsOverviewPlot Objects

```python
class LCIAResultsOverviewPlot(ABPlot)
```

Grouped (never stacked) bars for the LCIA landing tab.

<a id="activity_browser.app.pages.lca_results.plots.LCIAResultsOverviewPlot.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.plots.LCIAResultsOverviewPlot.format_bar_tooltip"></a>

#### format\_bar\_tooltip

```python
def format_bar_tooltip(series_idx: int, bar_idx: int, value: float) -> str
```

<a id="activity_browser.app.pages.lca_results.plots.LCIAResultsOverviewPlot.plot"></a>

#### plot

```python
def plot(data: LCIAOverviewData,
         *,
         relative: bool = True,
         horizontal: bool = False) -> None
```

<a id="activity_browser.app.pages.lca_results.plots.ContributionPlot"></a>

## ContributionPlot Objects

```python
class ContributionPlot(ABPlot)
```

Stacked bar chart of process/flow contributions.

<a id="activity_browser.app.pages.lca_results.plots.ContributionPlot.MAX_LEGEND"></a>

#### MAX\_LEGEND

<a id="activity_browser.app.pages.lca_results.plots.ContributionPlot.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.plots.ContributionPlot.format_bar_tooltip"></a>

#### format\_bar\_tooltip

```python
def format_bar_tooltip(container_idx: int, category_idx: int,
                       value: float) -> str
```

<a id="activity_browser.app.pages.lca_results.plots.ContributionPlot.plot"></a>

#### plot

```python
def plot(df: pd.DataFrame, unit: str = None)
```

<a id="activity_browser.app.pages.lca_results.plots.MonteCarloPlot"></a>

## MonteCarloPlot Objects

```python
class MonteCarloPlot(ABPlot)
```

Overlaid histograms with mean lines per reference flow.

<a id="activity_browser.app.pages.lca_results.plots.MonteCarloPlot.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.plots.MonteCarloPlot.plot"></a>

#### plot

```python
def plot(df: pd.DataFrame, method: tuple)
```

<a id="activity_browser.app.pages.lca_results.plots.GSAPlot"></a>

## GSAPlot Objects

```python
class GSAPlot(ABPlot)
```

Delta sensitivity indices with confidence intervals.

<a id="activity_browser.app.pages.lca_results.plots.GSAPlot.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.plots.GSAPlot.format_bar_tooltip"></a>

#### format\_bar\_tooltip

```python
def format_bar_tooltip(container_idx: int, category_idx: int,
                       value: float) -> str
```

<a id="activity_browser.app.pages.lca_results.plots.GSAPlot.plot"></a>

#### plot

```python
def plot(df: pd.DataFrame, max_rows: int = 10)
```

<a id="activity_browser.app.pages.lca_results.plots.GSAPlot.resizeEvent"></a>

#### resizeEvent

```python
def resizeEvent(event)
```
