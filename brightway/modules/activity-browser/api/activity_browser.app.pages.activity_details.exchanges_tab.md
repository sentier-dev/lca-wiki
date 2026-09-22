**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.activity_details.exchanges_tab` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.activity_details.exchanges_tab cfg.yml > activity_browser.app.pages.activity_details.exchanges_tab.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.activity_details.exchanges_tab"></a>

# activity\_browser.app.pages.activity\_details.exchanges\_tab

<a id="activity_browser.app.pages.activity_details.exchanges_tab.EXCHANGE_MAP"></a>

#### EXCHANGE\_MAP

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesTab"></a>

## ExchangesTab Objects

```python
class ExchangesTab(QtWidgets.QWidget)
```

A widget that displays exchanges related to a specific activity.

**Attributes**:

- `activity` _tuple | int | bd.Node_ - The activity to display exchanges for.
- `output_view` _ExchangesView_ - The view displaying the output exchanges.
- `output_model` _ExchangesModel_ - The model containing the data for the output exchanges.
- `input_view` _ExchangesView_ - The view displaying the input exchanges.
- `input_model` _ExchangesModel_ - The model containing the data for the input exchanges.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(activity: tuple | int | bd.Node, parent=None)
```

Initializes the ExchangesTab widget.

**Arguments**:

- `activity` _tuple | int | bd.Node_ - The activity to display exchanges for.
- `parent` _QtWidgets.QWidget, optional_ - The parent widget. Defaults to None.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesTab.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Builds the layout of the widget.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesTab.sync"></a>

#### sync

```python
def sync() -> None
```

Synchronizes the widget with the current state of the activity.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesTab.focus_exchange"></a>

#### focus\_exchange

```python
def focus_exchange(exchange) -> bool
```

Open the Exchanges tab and select *exchange* in the input or output table. (deferred navigation)

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesTab.build_df"></a>

#### build\_df

```python
def build_df(exchanges) -> pd.DataFrame
```

Builds a DataFrame from the given exchanges.

**Arguments**:

- `exchanges` _list_ - The list of exchanges to build the DataFrame from.
  

**Returns**:

- `pd.DataFrame` - The DataFrame containing the exchanges data.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesTab.dragEnterEvent"></a>

#### dragEnterEvent

```python
def dragEnterEvent(event)
```

Handles the drag enter event.

**Arguments**:

- `event` - The drag enter event.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesTab.dragMoveEvent"></a>

#### dragMoveEvent

```python
def dragMoveEvent(event)
```

Handles the drag move event to adjust overlay opacity based on hover position.

**Arguments**:

- `event` - The drag move event.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesTab.dragLeaveEvent"></a>

#### dragLeaveEvent

```python
def dragLeaveEvent(event)
```

Handles the drag leave event.

**Arguments**:

- `event` - The drag leave event.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesTab.dropEvent"></a>

#### dropEvent

```python
def dropEvent(event)
```

Handles the drop event.

**Arguments**:

- `event` - The drop event.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesTab.action_from_mime"></a>

#### action\_from\_mime

```python
def action_from_mime(
    mime: core.ABMimeData
) -> Literal["product", "waste", "resource", "emission", "generic"]
```

Determines the appropriate action based on the mime data.

**Arguments**:

- `mime` _core.ABMimeData_ - The mime data.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.RelinkDelegate"></a>

## RelinkDelegate Objects

```python
class RelinkDelegate(delegates.StringDelegate)
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.RelinkDelegate.matched"></a>

#### matched

<a id="activity_browser.app.pages.activity_details.exchanges_tab.RelinkDelegate.createEditor"></a>

#### createEditor

```python
def createEditor(parent, option, index)
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.RelinkDelegate.setEditorData"></a>

#### setEditorData

```python
def setEditorData(editor: QtWidgets.QComboBox, index)
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.RelinkDelegate.setModelData"></a>

#### setModelData

```python
def setModelData(editor: QtWidgets.QComboBox, model, index)
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView"></a>

## ExchangesView Objects

```python
class ExchangesView(widgets.ABTreeView)
```

A view that displays the exchanges in a tree structure.

**Attributes**:

- `defaultColumnDelegates` _dict_ - The default column delegates for the view.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.HeaderMenu"></a>

## HeaderMenu Objects

```python
class HeaderMenu(widgets.ABMenu)
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.HeaderMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.HeaderMenu.setup_view_menu"></a>

#### setup\_view\_menu

```python
def setup_view_menu()
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.HeaderMenu.setup_allocation"></a>

#### setup\_allocation

```python
def setup_allocation()
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.HeaderMenu.column"></a>

#### column

```python
@property
def column()
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.ContextMenu"></a>

## ContextMenu Objects

```python
class ContextMenu(widgets.ABMenu)
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.ContextMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.ContextMenu.locked"></a>

#### locked

```python
@property
def locked()
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.ContextMenu.activity"></a>

#### activity

```python
@property
def activity()
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.ContextMenu.exchanges"></a>

#### exchanges

```python
@property
def exchanges()
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent)
```

Initializes the ExchangesView.

**Arguments**:

- `parent` _QtWidgets.QWidget_ - The parent widget.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.activity"></a>

#### activity

```python
@property
def activity()
```

Returns the activity associated with the view.

**Returns**:

  The activity associated with the view.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.setDefaultColumnDelegates"></a>

#### setDefaultColumnDelegates

```python
def setDefaultColumnDelegates()
```

Sets the default column delegates for the view.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesView.startDrag"></a>

#### startDrag

```python
def startDrag(supportedActions: Qt.DropAction) -> None
```

Initiates a drag operation with the selected exchanges.

**Arguments**:

- `supportedActions` - The supported drop actions.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel"></a>

## ExchangesModel Objects

```python
class ExchangesModel(core.ABTreeModel)
```

A model representing the data for the exchanges.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel.__init__"></a>

#### \_\_init\_\_

```python
def __init__(tab: ExchangesTab)
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel.mimeTypes"></a>

#### mimeTypes

```python
def mimeTypes() -> list[str]
```

Returns the list of MIME types that this model supports.

**Returns**:

- `list[str]` - List of supported MIME types.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel.mimeData"></a>

#### mimeData

```python
def mimeData(indices: list[QtCore.QModelIndex]) -> core.ABMimeData
```

Returns the MIME data for the given indices.

**Arguments**:

- `indices` _list[QtCore.QModelIndex]_ - The indices to get the MIME data for.
  

**Returns**:

- `core.ABMimeData` - The MIME data containing the exchanges.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel.uncertainty_editor_initial"></a>

#### uncertainty\_editor\_initial

```python
def uncertainty_editor_initial(index: QtCore.QModelIndex) -> dict
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel.uncertainty_editor_enable_pedigree"></a>

#### uncertainty\_editor\_enable\_pedigree

```python
def uncertainty_editor_enable_pedigree(index: QtCore.QModelIndex) -> bool
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel.uncertainty_editor_read_only"></a>

#### uncertainty\_editor\_read\_only

```python
def uncertainty_editor_read_only(index: QtCore.QModelIndex) -> bool
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel.setData"></a>

#### setData

```python
def setData(index: QtCore.QModelIndex,
            value,
            role: int = Qt.ItemDataRole.EditRole) -> bool
```

Sets the data for the given index.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index to set data for.
- `value` - The value to set.
- `role` _int_ - The role for which to set the data.
  

**Returns**:

- `bool` - True if the data was set successfully, False otherwise.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel.decorationData"></a>

#### decorationData

```python
def decorationData(index: QtCore.QModelIndex) -> any
```

Provides decoration data for the model.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index for which to provide decoration data.
  

**Returns**:

  The decoration data for the index.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel.fontData"></a>

#### fontData

```python
def fontData(index: QtCore.QModelIndex) -> any
```

Provides font data for the model.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index for which to provide font data.
  

**Returns**:

- `QtGui.QFont` - The font data for the index.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel.indexEditable"></a>

#### indexEditable

```python
def indexEditable(index)
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel.indexDragEnabled"></a>

#### indexDragEnabled

```python
def indexDragEnabled(index: QModelIndex) -> bool
```

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel.functional"></a>

#### functional

```python
def functional(index)
```

Returns whether the index is functional.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index to check.
  

**Returns**:

- `bool` - True if the index is functional, False otherwise.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel.substituted"></a>

#### substituted

```python
def substituted(index)
```

Returns whether the index is functional.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index to check.
  

**Returns**:

- `bool` - True if the index is functional, False otherwise.

<a id="activity_browser.app.pages.activity_details.exchanges_tab.ExchangesModel.scoped_parameters"></a>

#### scoped\_parameters

```python
def scoped_parameters(index)
```

Returns the scoped parameters for the index.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index to get scoped parameters for.
  

**Returns**:

- `list` - A list of scoped parameters for the index.
