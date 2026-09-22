**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.abstract_navigator` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.abstract_navigator cfg.yml > activity_browser.ui.widgets.abstract_navigator.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.abstract_navigator"></a>

# activity\_browser.ui.widgets.abstract\_navigator

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractNavigator"></a>

## ABAbstractNavigator Objects

```python
class ABAbstractNavigator(QtWidgets.QWidget)
```

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractNavigator.HELP_TEXT"></a>

#### HELP\_TEXT

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractNavigator.HTML_FILE"></a>

#### HTML\_FILE

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractNavigator.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None, css_file: str = "", *args, **kwargs)
```

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractNavigator.load_finished_handler"></a>

#### load\_finished\_handler

```python
def load_finished_handler(*args, **kwargs) -> None
```

Executed when webpage has been loaded for the first time or refreshed.

Can be used to trigger a calculation after the webpage has been
completely loaded.

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractNavigator.connect_signals"></a>

#### connect\_signals

```python
@abstractmethod
def connect_signals() -> None
```

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractNavigator.construct_layout"></a>

#### construct\_layout

```python
@abstractmethod
def construct_layout() -> None
```

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractNavigator.toggle_help"></a>

#### toggle\_help

```python
def toggle_help() -> None
```

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractNavigator.go_forward"></a>

#### go\_forward

```python
def go_forward() -> None
```

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractNavigator.go_back"></a>

#### go\_back

```python
def go_back() -> None
```

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractNavigator.send_json"></a>

#### send\_json

```python
def send_json() -> None
```

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractNavigator.draw_graph"></a>

#### draw\_graph

```python
def draw_graph() -> None
```

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractNavigator.random_graph"></a>

#### random\_graph

```python
@abstractmethod
def random_graph() -> None
```

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractNavigator.update_plot_name"></a>

#### update\_plot\_name

```python
def update_plot_name(tab_label: str,
                     method,
                     demand_index: int | None = None,
                     scenario_index: int | None = None) -> None
```

Default export basename: ``{cs}_{tab}_{functional unit}_{method}_{scenario}``.

<a id="activity_browser.ui.widgets.abstract_navigator.ALL_FILTER"></a>

#### ALL\_FILTER

<a id="activity_browser.ui.widgets.abstract_navigator.savefilepath"></a>

#### savefilepath

```python
def savefilepath(default_file_name: str, file_filter: str = ALL_FILTER)
```

<a id="activity_browser.ui.widgets.abstract_navigator.to_svg"></a>

#### to\_svg

```python
def to_svg(svg, default_file_name: str = "Figure")
```

Export to .svg format.

<a id="activity_browser.ui.widgets.abstract_navigator.Bridge"></a>

## Bridge Objects

```python
class Bridge(QObject)
```

<a id="activity_browser.ui.widgets.abstract_navigator.Bridge.graph_ready"></a>

#### graph\_ready

<a id="activity_browser.ui.widgets.abstract_navigator.Bridge.update_graph"></a>

#### update\_graph

<a id="activity_browser.ui.widgets.abstract_navigator.Bridge.style"></a>

#### style

<a id="activity_browser.ui.widgets.abstract_navigator.Bridge.__init__"></a>

#### \_\_init\_\_

```python
def __init__(navigator: ABAbstractNavigator, parent=None)
```

<a id="activity_browser.ui.widgets.abstract_navigator.Bridge.node_clicked"></a>

#### node\_clicked

```python
@Slot(str, name="node_clicked")
def node_clicked(click_text: str)
```

Is called when a node is clicked in Javascript.

**Arguments**:

- `click_text` - string of a serialized json dictionary describing
  - the node that was clicked on
  - mouse button and additional keys pressed

<a id="activity_browser.ui.widgets.abstract_navigator.Bridge.download_triggered"></a>

#### download\_triggered

```python
@Slot(str, name="download_triggered")
def download_triggered(svg: str)
```

Is called when a node is clicked in Javascript.

**Arguments**:

- `svg` - string of svg

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractGraph"></a>

## ABAbstractGraph Objects

```python
class ABAbstractGraph(object)
```

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractGraph.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractGraph.update"></a>

#### update

```python
def update(delete_unstacked: bool = True) -> None
```

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractGraph.forward"></a>

#### forward

```python
def forward() -> bool
```

Go forward, if previously gone back.

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractGraph.back"></a>

#### back

```python
def back() -> bool
```

Go back to previous graph, if any.

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractGraph.store_previous"></a>

#### store\_previous

```python
def store_previous() -> None
```

Store the current graph in the

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractGraph.store_future"></a>

#### store\_future

```python
def store_future() -> None
```

When going back, store current data in a queue.

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractGraph.retrieve_future"></a>

#### retrieve\_future

```python
def retrieve_future() -> None
```

Extract the last graph from the queue.

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractGraph.new_graph"></a>

#### new\_graph

```python
@abstractmethod
def new_graph(*args, **kwargs) -> None
```

<a id="activity_browser.ui.widgets.abstract_navigator.ABAbstractGraph.save_json_to_file"></a>

#### save\_json\_to\_file

```python
def save_json_to_file(filename: str = "graph_data.json") -> None
```

Writes the current model´s JSON representation to the specifies file.

<a id="activity_browser.ui.widgets.abstract_navigator.get_static_js_path"></a>

#### get\_static\_js\_path

```python
def get_static_js_path(file_name: str = "") -> str
```

<a id="activity_browser.ui.widgets.abstract_navigator.get_static_css_path"></a>

#### get\_static\_css\_path

```python
def get_static_css_path(file_name: str = "") -> str
```
