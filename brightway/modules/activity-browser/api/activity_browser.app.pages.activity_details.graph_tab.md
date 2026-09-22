**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.activity_details.graph_tab` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.activity_details.graph_tab cfg.yml > activity_browser.app.pages.activity_details.graph_tab.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.activity_details.graph_tab"></a>

# activity\_browser.app.pages.activity\_details.graph\_tab

<a id="activity_browser.app.pages.activity_details.graph_tab.GRAPH_HELP"></a>

#### GRAPH\_HELP

<a id="activity_browser.app.pages.activity_details.graph_tab.process_card_from_metadata"></a>

#### process\_card\_from\_metadata

```python
def process_card_from_metadata(process_id: int) -> dict | None
```

Display fields from MetaDataStore; BrightwayInventory falls back if this is None.

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphTab"></a>

## GraphTab Objects

```python
class GraphTab(QtWidgets.QWidget)
```

Activity Details Graph explorer (built on first Graph-tab show).

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(activity, parent=None)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphTab.has_been_shown"></a>

#### has\_been\_shown

```python
@property
def has_been_shown() -> bool
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphTab.ensure_loaded"></a>

#### ensure\_loaded

```python
def ensure_loaded()
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphTab.sync"></a>

#### sync

```python
def sync()
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphView"></a>

## GraphView Objects

```python
class GraphView(QtWebEngineWidgets.QWebEngineView)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphView.dragEnterEvent"></a>

#### dragEnterEvent

```python
def dragEnterEvent(event)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphView.dragLeaveEvent"></a>

#### dragLeaveEvent

```python
def dragLeaveEvent(event)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphView.dropEvent"></a>

#### dropEvent

```python
def dropEvent(event)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphBackend"></a>

## GraphBackend Objects

```python
class GraphBackend(QObject)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphBackend.__init__"></a>

#### \_\_init\_\_

```python
def __init__(graph_tab: GraphTab, parent=None)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphBackend.expand_flow"></a>

#### expand\_flow

```python
@Slot(str, str)
def expand_flow(host_id: str, flow_json: str)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphBackend.expand_listed_side"></a>

#### expand\_listed\_side

```python
@Slot(str, str)
def expand_listed_side(process_id: str, side: str)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphBackend.expand_side"></a>

#### expand\_side

```python
@Slot(str, str)
def expand_side(process_id: str, side: str)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphBackend.collapse_side"></a>

#### collapse\_side

```python
@Slot(str, str)
def collapse_side(process_id: str, side: str)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphBackend.remove_process"></a>

#### remove\_process

```python
@Slot(str)
def remove_process(process_id: str)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphBackend.select_process"></a>

#### select\_process

```python
@Slot(str)
def select_process(process_id: str)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphBackend.reset_graph"></a>

#### reset\_graph

```python
@Slot()
def reset_graph()
```

<a id="activity_browser.app.pages.activity_details.graph_tab.GraphBackend.open_process"></a>

#### open\_process

```python
@Slot(str)
def open_process(process_id: str)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.Bridge"></a>

## Bridge Objects

```python
class Bridge(QObject)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.Bridge.update_graph"></a>

#### update\_graph

<a id="activity_browser.app.pages.activity_details.graph_tab.Bridge.ready"></a>

#### ready

<a id="activity_browser.app.pages.activity_details.graph_tab.Bridge.is_ready"></a>

#### is\_ready

```python
@Slot()
def is_ready()
```

<a id="activity_browser.app.pages.activity_details.graph_tab.Page"></a>

## Page Objects

```python
class Page(QtWebEngineWidgets.QWebEnginePage)
```

<a id="activity_browser.app.pages.activity_details.graph_tab.Page.javaScriptConsoleMessage"></a>

#### javaScriptConsoleMessage

```python
def javaScriptConsoleMessage(level, message: str, line: str, _: str)
```
