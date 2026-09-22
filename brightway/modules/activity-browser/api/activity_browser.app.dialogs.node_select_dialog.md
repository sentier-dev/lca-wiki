**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.dialogs.node_select_dialog` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.dialogs.node_select_dialog cfg.yml > activity_browser.app.dialogs.node_select_dialog.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.dialogs.node_select_dialog"></a>

# activity\_browser.app.dialogs.node\_select\_dialog

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSelectDialog"></a>

## NodeSelectDialog Objects

```python
class NodeSelectDialog(QtWidgets.QDialog)
```

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSelectDialog.node_selected"></a>

#### node\_selected

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSelectDialog.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None, drag_enabled=False)
```

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSelectDialog.showEvent"></a>

#### showEvent

```python
def showEvent(event)
```

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSelectDialog.on_search"></a>

#### on\_search

```python
def on_search(text: str)
```

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSelectDialog.on_drag_started"></a>

#### on\_drag\_started

```python
def on_drag_started()
```

Handle when a drag operation is started

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSelectDialog.get_selected_node"></a>

#### get\_selected\_node

```python
def get_selected_node()
```

Return the currently selected node data

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSearchModel"></a>

## NodeSearchModel Objects

```python
class NodeSearchModel(core.ABTreeModel)
```

Model for displaying search results in the node select dialog.

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSearchModel.columns"></a>

#### columns

```python
def columns() -> list[str]
```

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSearchModel.indexDragEnabled"></a>

#### indexDragEnabled

```python
def indexDragEnabled(index: QtCore.QModelIndex) -> bool
```

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSearchModel.displayData"></a>

#### displayData

```python
def displayData(index: QtCore.QModelIndex) -> any
```

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSearchModel.decorationData"></a>

#### decorationData

```python
def decorationData(index: QtCore.QModelIndex) -> QtGui.QIcon
```

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSearchModel.mimeData"></a>

#### mimeData

```python
def mimeData(indices: list[QtCore.QModelIndex])
```

Returns the mime data for the given indices.

**Arguments**:

- `indices` _list[QtCore.QModelIndex]_ - The indices to get the mime data for.
  

**Returns**:

- `core.ABMimeData` - The mime data.

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSearchView"></a>

## NodeSearchView Objects

```python
class NodeSearchView(widgets.ABTreeView)
```

Tree view for displaying node search results.

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSearchView.dragStarted"></a>

#### dragStarted

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSearchView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSearchView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: NodeSelectDialog)
```

<a id="activity_browser.app.dialogs.node_select_dialog.NodeSearchView.startDrag"></a>

#### startDrag

```python
def startDrag(supportedActions: Qt.DropAction) -> None
```
