**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.lcia_overview` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.lcia_overview cfg.yml > activity_browser.bwutils.lcia_overview.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.lcia_overview"></a>

# activity\_browser.bwutils.lcia\_overview

LCIA overview matrix slicing, normalization, and tidy data for the landing tab plot.

<a id="activity_browser.bwutils.lcia_overview.LCIACompareMode"></a>

## LCIACompareMode Objects

```python
class LCIACompareMode(str, Enum)
```

<a id="activity_browser.bwutils.lcia_overview.LCIACompareMode.REFERENCE_FLOWS"></a>

#### REFERENCE\_FLOWS

<a id="activity_browser.bwutils.lcia_overview.LCIACompareMode.FLOWS_X_METHODS"></a>

#### FLOWS\_X\_METHODS

<a id="activity_browser.bwutils.lcia_overview.LCIACompareMode.FLOWS_X_SCENARIOS"></a>

#### FLOWS\_X\_SCENARIOS

<a id="activity_browser.bwutils.lcia_overview.LCIACompareMode.FLOWS_X_SCENARIOS_X_METHODS"></a>

#### FLOWS\_X\_SCENARIOS\_X\_METHODS

<a id="activity_browser.bwutils.lcia_overview.LCIA_COMPARE_LABELS"></a>

#### LCIA\_COMPARE\_LABELS

<a id="activity_browser.bwutils.lcia_overview.lcia_compare_label"></a>

#### lcia\_compare\_label

```python
def lcia_compare_label(mode: LCIACompareMode) -> str
```

UI label for an LCIA compare mode.

<a id="activity_browser.bwutils.lcia_overview.lcia_compare_mode_from_label"></a>

#### lcia\_compare\_mode\_from\_label

```python
def lcia_compare_mode_from_label(label: str) -> LCIACompareMode
```

Map combo-box text back to :class:`LCIACompareMode`.

<a id="activity_browser.bwutils.lcia_overview.lcia_compare_labels_for_modes"></a>

#### lcia\_compare\_labels\_for\_modes

```python
def lcia_compare_labels_for_modes(modes: list[LCIACompareMode]) -> list[str]
```

Ordered UI labels for the compare modes available in the current setup.

<a id="activity_browser.bwutils.lcia_overview.RELATIVE_Y_LABEL"></a>

#### RELATIVE\_Y\_LABEL

<a id="activity_browser.bwutils.lcia_overview.RF_TABLE_COLUMNS"></a>

#### RF\_TABLE\_COLUMNS

<a id="activity_browser.bwutils.lcia_overview.SCORE_TABLE_COLUMNS"></a>

#### SCORE\_TABLE\_COLUMNS

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewPanel"></a>

## LCIAOverviewPanel Objects

```python
@dataclass
class LCIAOverviewPanel()
```

One grouped bar chart (used for multi-panel compare modes).

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewPanel.title"></a>

#### title

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewPanel.values"></a>

#### values

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewPanel.absolute_values"></a>

#### absolute\_values

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewPanel.group_labels"></a>

#### group\_labels

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewPanel.series_labels"></a>

#### series\_labels

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewPanel.group_units"></a>

#### group\_units

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewPanel.y_label"></a>

#### y\_label

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewData"></a>

## LCIAOverviewData Objects

```python
@dataclass
class LCIAOverviewData()
```

Grouped bar chart payload (groups × series), optionally as subplots.

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewData.values"></a>

#### values

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewData.absolute_values"></a>

#### absolute\_values

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewData.group_labels"></a>

#### group\_labels

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewData.series_labels"></a>

#### series\_labels

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewData.group_units"></a>

#### group\_units

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewData.y_label"></a>

#### y\_label

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewData.normalized"></a>

#### normalized

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewData.table_df"></a>

#### table\_df

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewData.series_units"></a>

#### series\_units

<a id="activity_browser.bwutils.lcia_overview.LCIAOverviewData.panels"></a>

#### panels

<a id="activity_browser.bwutils.lcia_overview.lcia_scores_array"></a>

#### lcia\_scores\_array

```python
def lcia_scores_array(mlca: MLCA | SuperstructureMLCA,
                      scenario_index: int = 0) -> np.ndarray
```

<a id="activity_browser.bwutils.lcia_overview.normalize_column"></a>

#### normalize\_column

```python
def normalize_column(column: np.ndarray, *, relative: bool) -> np.ndarray
```

Normalize a 1-D slice to a percent scale.

Relative mode divides by ``max(|values|)`` in the slice, e.g.
``[-3, 5, 10] → [-30%, 50%, 100%]`` and ``[-11, 5, 10] → [-100%, …]``.

<a id="activity_browser.bwutils.lcia_overview.normalize_lcia_matrix"></a>

#### normalize\_lcia\_matrix

```python
def normalize_lcia_matrix(scores: np.ndarray, *, relative: bool) -> np.ndarray
```

Normalize each impact-category column by max(|score|) across reference flows.

<a id="activity_browser.bwutils.lcia_overview.compare_mode_supports_flip"></a>

#### compare\_mode\_supports\_flip

```python
def compare_mode_supports_flip(mode: LCIACompareMode) -> bool
```

<a id="activity_browser.bwutils.lcia_overview.build_lcia_overview"></a>

#### build\_lcia\_overview

```python
def build_lcia_overview(mlca: MLCA | SuperstructureMLCA,
                        contributions,
                        *,
                        compare: LCIACompareMode,
                        relative: bool,
                        scenario_index: int = 0,
                        method_index: int = 0,
                        flip_groups: bool = False) -> LCIAOverviewData
```

Build grouped-bar data for the LCIA landing tab.

<a id="activity_browser.bwutils.lcia_overview.available_compare_modes"></a>

#### available\_compare\_modes

```python
def available_compare_modes(mlca: MLCA,
                            has_scenarios: bool) -> list[LCIACompareMode]
```
