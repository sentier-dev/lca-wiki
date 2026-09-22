**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.activity_details.consumers_tab` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.activity_details.consumers_tab cfg.yml > activity_browser.app.pages.activity_details.consumers_tab.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.activity_details.consumers_tab"></a>

# activity\_browser.app.pages.activity\_details.consumers\_tab

<a id="activity_browser.app.pages.activity_details.consumers_tab.ConsumersTab"></a>

## ConsumersTab Objects

```python
class ConsumersTab(QtWidgets.QWidget)
```

A widget that displays consumers related to a specific activity.

**Attributes**:

- `activity` _tuple | int | bd.Node_ - The activity to display consumers for.
- `view` _ConsumersView_ - The view displaying the consumers.
- `model` _ConsumersModel_ - The model containing the data for the consumers.

<a id="activity_browser.app.pages.activity_details.consumers_tab.ConsumersTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(activity: tuple | int | bd.Node, parent=None)
```

Initializes the ConsumersTab widget.

**Arguments**:

- `activity` _tuple | int | bd.Node_ - The activity to display consumers for.
- `parent` _QtWidgets.QWidget, optional_ - The parent widget. Defaults to None.

<a id="activity_browser.app.pages.activity_details.consumers_tab.ConsumersTab.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Builds the layout of the widget.

<a id="activity_browser.app.pages.activity_details.consumers_tab.ConsumersTab.sync"></a>

#### sync

```python
def sync()
```

Synchronizes the widget with the current state of the activity.

<a id="activity_browser.app.pages.activity_details.consumers_tab.ConsumersTab.build_df"></a>

#### build\_df

```python
def build_df(exchanges: list[bd.Edge]) -> pd.DataFrame
```

Builds a DataFrame from the given exchanges.

**Arguments**:

- `exchanges` _list_ - The list of exchanges to build the DataFrame from.
  

**Returns**:

- `pd.DataFrame` - The DataFrame containing the exchanges data.

<a id="activity_browser.app.pages.activity_details.consumers_tab.ConsumersView"></a>

## ConsumersView Objects

```python
class ConsumersView(widgets.ABTreeView)
```

A view that displays the consumers in a tree structure.

<a id="activity_browser.app.pages.activity_details.consumers_tab.ConsumersView.mouseDoubleClickEvent"></a>

#### mouseDoubleClickEvent

```python
def mouseDoubleClickEvent(event) -> None
```

Handles the mouse double-click event.

**Arguments**:

- `event` - The mouse event.

<a id="activity_browser.app.pages.activity_details.consumers_tab.ConsumersModel"></a>

## ConsumersModel Objects

```python
class ConsumersModel(core.ABTreeModel)
```

A model representing the data for the consumers.

<a id="activity_browser.app.pages.activity_details.consumers_tab.ConsumersModel.decorationData"></a>

#### decorationData

```python
def decorationData(index)
```

Provides decoration data for the model.

**Arguments**:

- `index` - The index for which to provide decoration data.
  

**Returns**:

  The decoration data for the model.
