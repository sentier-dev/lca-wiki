**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.lca_results.sankey_navigator_tab` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.lca_results.sankey_navigator_tab cfg.yml > activity_browser.app.pages.lca_results.sankey_navigator_tab.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab"></a>

# activity\_browser.app.pages.lca\_results.sankey\_navigator\_tab

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SANKEY_MAX_CALC"></a>

#### SANKEY\_MAX\_CALC

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SANKEY_STARTUP_TIER"></a>

#### SANKEY\_STARTUP\_TIER

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab._StoppableNNEV"></a>

## \_StoppableNNEV Objects

```python
class _StoppableNNEV(NewNodeEachVisitGraphTraversal)
```

NNEV that Stop can halt; nodes already visited stay on the graph.

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab._StoppableNNEV.__init__"></a>

#### \_\_init\_\_

```python
def __init__(lca, settings, should_continue=None, **kwargs)
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab._StoppableNNEV.exceeded_calculation_count"></a>

#### exceeded\_calculation\_count

```python
@property
def exceeded_calculation_count()
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNNEVState"></a>

## SankeyNNEVState Objects

```python
class SankeyNNEVState()
```

Adapter so :func:`run_expand_policy` can one-hop NNEV like SNEV (adjust policy).

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNNEVState.__init__"></a>

#### \_\_init\_\_

```python
def __init__(trav: NewNodeEachVisitGraphTraversal)
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNNEVState.nodes"></a>

#### nodes

```python
@property
def nodes()
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNNEVState.edges"></a>

#### edges

```python
@property
def edges()
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNNEVState.traverse_from_node"></a>

#### traverse\_from\_node

```python
def traverse_from_node(unique_id, depth=1)
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNNEVState.snapshot"></a>

#### snapshot

```python
def snapshot()
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNNEVState.restore"></a>

#### restore

```python
def restore(snap) -> None
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget"></a>

## SankeyNavigatorWidget Objects

```python
class SankeyNavigatorWidget(widgets.ABAbstractNavigator)
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.HELP_TEXT"></a>

#### HELP\_TEXT

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.HTML_FILE"></a>

#### HTML\_FILE

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.__init__"></a>

#### \_\_init\_\_

```python
def __init__(cs_name, parent=None)
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.load_finished_handler"></a>

#### load\_finished\_handler

```python
@Slot(name="loadFinishedHandler")
def load_finished_handler() -> None
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.show_sankey_help"></a>

#### show\_sankey\_help

```python
@Slot()
def show_sankey_help()
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.construct_layout"></a>

#### construct\_layout

```python
def construct_layout() -> None
```

Layout of Sankey Navigator

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.get_scenario_labels"></a>

#### get\_scenario\_labels

```python
def get_scenario_labels() -> List[str]
```

Get scenario labels if scenario is used.

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.configure_scenario"></a>

#### configure\_scenario

```python
def configure_scenario()
```

Determine if scenario Qt widgets are visible or not and retrieve
scenario labels for the selection drop-down box.

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.func_units"></a>

#### func\_units

```python
@property
def func_units()
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.methods"></a>

#### methods

```python
@property
def methods()
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.update_calculation_setup"></a>

#### update\_calculation\_setup

```python
def update_calculation_setup(cs_name=None) -> None
```

Update Calculation Setup, reference flows and impact categories, and dropdown menus.

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.new_sankey"></a>

#### new\_sankey

```python
def new_sankey(*, apply_adjust: bool = False) -> None
```

(re)-generate the sankey diagram.

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.update_sankey"></a>

#### update\_sankey

```python
def update_sankey(demand: dict,
                  method: tuple,
                  demand_index: int = None,
                  method_index: int = None,
                  scenario_index: int = None,
                  scenario_lca: bool = False,
                  cut_off=0.001,
                  max_calc=SANKEY_MAX_CALC,
                  max_depth: int | None = None,
                  display_mode: str | None = None,
                  display_value: float | None = None,
                  apply_adjust: bool = False) -> None
```

Ensure a calculated NNEV graph; continue Adjust only when requested.

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.SankeyNavigatorWidget.random_graph"></a>

#### random\_graph

```python
def random_graph() -> None
```

Not used in the Sankey tab (random activity is not offered here).

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.Graph"></a>

## Graph Objects

```python
class Graph(widgets.ABAbstractGraph)
```

Python side representation of the graph.
Functionality for graph navigation (e.g. adding and removing nodes).
A JSON representation of the graph (edges and nodes) enables its use in javascript/html/css.

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.Graph.new_graph"></a>

#### new\_graph

```python
def new_graph(data,
              included_uids=None,
              *,
              aggregate_by=None,
              color_by="direct",
              metadata_lookup=None)
```

<a id="activity_browser.app.pages.lca_results.sankey_navigator_tab.Graph.get_json_data"></a>

#### get\_json\_data

```python
@staticmethod
def get_json_data(data,
                  included_uids=None,
                  *,
                  aggregate_by=None,
                  color_by="direct",
                  metadata_lookup=None,
                  preserve_view=False) -> str
```

JSON for the Sankey web view: ``d3_graph_payload`` plus edge amounts.
