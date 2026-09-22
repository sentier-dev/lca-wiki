**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.lca_results.contribution_tree_d3_plot` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.lca_results.contribution_tree_d3_plot cfg.yml > activity_browser.app.pages.lca_results.contribution_tree_d3_plot.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot"></a>

# activity\_browser.app.pages.lca\_results.contribution\_tree\_d3\_plot

D3 WebEngine host for the Contribution Tree plot.

Thin Qt wrapper: Python pushes ``d3_plot_payload`` JSON; JavaScript emits click ids.

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.HTML_FILE"></a>

#### HTML\_FILE

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.partition_segment_edge_color"></a>

#### partition\_segment\_edge\_color

```python
def partition_segment_edge_color(*, dark: bool) -> str
```

Contrast stroke for D3 partition segments (matches ``graph_theme.css``).

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Bridge"></a>

## ContributionTreeD3Bridge Objects

```python
class ContributionTreeD3Bridge(QObject)
```

WebChannel object: Python → JSON plot, JavaScript → click_uid.

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Bridge.update_plot"></a>

#### update\_plot

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Bridge.ready"></a>

#### ready

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Bridge.segment_clicked"></a>

#### segment\_clicked

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Bridge.context_requested"></a>

#### context\_requested

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Bridge.is_ready"></a>

#### is\_ready

```python
@Slot()
def is_ready() -> None
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Bridge.click_segment"></a>

#### click\_segment

```python
@Slot(int)
def click_segment(uid: int) -> None
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Bridge.context_segment"></a>

#### context\_segment

```python
@Slot(str)
def context_segment(payload: str) -> None
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Plot"></a>

## ContributionTreeD3Plot Objects

```python
class ContributionTreeD3Plot(QtWidgets.QWidget)
```

WebEngine pane that draws the Contribution Tree plot.

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Plot.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Plot.set_segment_click_handler"></a>

#### set\_segment\_click\_handler

```python
def set_segment_click_handler(handler: Callable[[dict], None] | None) -> None
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Plot.set_segment_context_handler"></a>

#### set\_segment\_context\_handler

```python
def set_segment_context_handler(
        handler: Callable[[dict], None] | None) -> None
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Plot.style_from_palette"></a>

#### style\_from\_palette

```python
def style_from_palette() -> dict
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Plot.set_payload"></a>

#### set\_payload

```python
def set_payload(payload: dict) -> None
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Plot.show_empty"></a>

#### show\_empty

```python
def show_empty(message: str | None = None) -> None
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Plot.export_figure"></a>

#### export\_figure

```python
def export_figure(path: str, selected_filter: str = "") -> None
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Plot.notify_viewport"></a>

#### notify\_viewport

```python
def notify_viewport(*, reset_zoom: bool = False, force: bool = False) -> None
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_d3_plot.ContributionTreeD3Plot.resizeEvent"></a>

#### resizeEvent

```python
def resizeEvent(event: QtGui.QResizeEvent) -> None
```
