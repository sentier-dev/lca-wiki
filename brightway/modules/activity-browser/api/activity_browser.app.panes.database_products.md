**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.panes.database_products` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.panes.database_products cfg.yml > activity_browser.app.panes.database_products.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.panes.database_products"></a>

# activity\_browser.app.panes.database\_products

<a id="activity_browser.app.panes.database_products.NODETYPES"></a>

#### NODETYPES

<a id="activity_browser.app.panes.database_products.DatabaseProductsPane"></a>

## DatabaseProductsPane Objects

```python
class DatabaseProductsPane(widgets.ABAbstractPane)
```

A widget that displays products related to a specific database.

**Attributes**:

- `database` _bd.Database_ - The database to display products for.
- `model` _ProductModel_ - The model containing the data for the products.
- `table_view` _ProductView_ - The view displaying the products.
- `search` _widgets.ABLineEdit_ - The search bar for quick search.

<a id="activity_browser.app.panes.database_products.DatabaseProductsPane.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent, db_name: str)
```

Initializes the DatabaseProductsPane widget.

**Arguments**:

- `parent` _QtWidgets.QWidget_ - The parent widget.
- `db_name` _str_ - The name of the database to display products for.

<a id="activity_browser.app.panes.database_products.DatabaseProductsPane.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

<a id="activity_browser.app.panes.database_products.DatabaseProductsPane.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

<a id="activity_browser.app.panes.database_products.DatabaseProductsPane.on_metadata_changed"></a>

#### on\_metadata\_changed

```python
def on_metadata_changed(added, updated, deleted)
```

<a id="activity_browser.app.panes.database_products.DatabaseProductsPane.update_loading_state"></a>

#### update\_loading\_state

```python
def update_loading_state()
```

Show the spinner until metadata for this database is available.

<a id="activity_browser.app.panes.database_products.DatabaseProductsPane.sync"></a>

#### sync

```python
def sync()
```

Synchronizes the widget with the current state of the database.

<a id="activity_browser.app.panes.database_products.DatabaseProductsPane.update_table_style"></a>

#### update\_table\_style

```python
def update_table_style()
```

<a id="activity_browser.app.panes.database_products.DatabaseProductsPane.update_column_visibility"></a>

#### update\_column\_visibility

```python
def update_column_visibility()
```

<a id="activity_browser.app.panes.database_products.DatabaseProductsPane.build_df"></a>

#### build\_df

```python
def build_df() -> pd.DataFrame
```

Builds a DataFrame from the database products.

**Returns**:

- `pd.DataFrame` - The DataFrame containing the products data.

<a id="activity_browser.app.panes.database_products.DatabaseProductsPane.on_database_deleted"></a>

#### on\_database\_deleted

```python
def on_database_deleted(db_name: str)
```

Handles the database deleted signal by closing the widget if the database is deleted.

**Arguments**:

- `db_name` _str_ - The name of the deleted database.

<a id="activity_browser.app.panes.database_products.DatabaseProductsPane.apply_view_mode_from_settings"></a>

#### apply\_view\_mode\_from\_settings

```python
def apply_view_mode_from_settings()
```

Sync card/table layout from global appearance settings (after Save in Settings).

<a id="activity_browser.app.panes.database_products.ProductView"></a>

## ProductView Objects

```python
class ProductView(ui.widgets.ABTreeView)
```

A view that displays the products in a tree structure.

**Attributes**:

- `defaultColumnDelegates` _dict_ - The default column delegates for the view.

<a id="activity_browser.app.panes.database_products.ProductView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.app.panes.database_products.ProductView.ContextMenu"></a>

## ContextMenu Objects

```python
class ContextMenu(ui.widgets.ABMenu)
```

<a id="activity_browser.app.panes.database_products.ProductView.ContextMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.panes.database_products.ProductView.ContextMenu.get_functional_unit_amount"></a>

#### get\_functional\_unit\_amount

```python
@staticmethod
def get_functional_unit_amount(key)
```

<a id="activity_browser.app.panes.database_products.ProductView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: DatabaseProductsPane, db_name: str)
```

Initializes the ProductView.

**Arguments**:

- `parent` _DatabaseProductsPane_ - The parent widget.
- `db_name` _str_ - The name of the database.

<a id="activity_browser.app.panes.database_products.ProductView.setDefaultColumnDelegates"></a>

#### setDefaultColumnDelegates

```python
def setDefaultColumnDelegates()
```

Sets the default column delegates for the view.

<a id="activity_browser.app.panes.database_products.ProductView.mouseDoubleClickEvent"></a>

#### mouseDoubleClickEvent

```python
def mouseDoubleClickEvent(event) -> None
```

Handles the mouse double click event to open the selected activities.

**Arguments**:

- `event` - The mouse double click event.

<a id="activity_browser.app.panes.database_products.ProductView.keyPressEvent"></a>

#### keyPressEvent

```python
def keyPressEvent(event) -> None
```

Handles key press events. Specifically handles Ctrl+C to copy selected data.

**Arguments**:

- `event` - The key press event.

<a id="activity_browser.app.panes.database_products.ProductView.copy_selection_to_clipboard"></a>

#### copy\_selection\_to\_clipboard

```python
def copy_selection_to_clipboard()
```

<a id="activity_browser.app.panes.database_products.ProductView.copy_from_clipboard"></a>

#### copy\_from\_clipboard

```python
def copy_from_clipboard()
```

<a id="activity_browser.app.panes.database_products.ProductView.dragEnterEvent"></a>

#### dragEnterEvent

```python
def dragEnterEvent(event)
```

Handles the drag enter event.

**Arguments**:

- `event` - The drag enter event.

<a id="activity_browser.app.panes.database_products.ProductView.dragMoveEvent"></a>

#### dragMoveEvent

```python
def dragMoveEvent(event)
```

<a id="activity_browser.app.panes.database_products.ProductView.dragLeaveEvent"></a>

#### dragLeaveEvent

```python
def dragLeaveEvent(event)
```

Handles the drag leave event.

**Arguments**:

- `event` - The drag leave event.

<a id="activity_browser.app.panes.database_products.ProductView.dropEvent"></a>

#### dropEvent

```python
def dropEvent(event)
```

Handles the drop event.

**Arguments**:

- `event` - The drop event.

<a id="activity_browser.app.panes.database_products.ProductView.selected_elementary_flows"></a>

#### selected\_elementary\_flows

```python
@property
def selected_elementary_flows() -> list[tuple]
```

Keys of selected biosphere nodes (elementary flows).

<a id="activity_browser.app.panes.database_products.ProductView.selected_products"></a>

#### selected\_products

```python
@property
def selected_products() -> list[tuple]
```

<a id="activity_browser.app.panes.database_products.ProductView.selected_activities"></a>

#### selected\_activities

```python
@property
def selected_activities() -> list[tuple]
```

Keys of selected technosphere activities (processes), excluding elementary flows.

<a id="activity_browser.app.panes.database_products.ProductModel"></a>

## ProductModel Objects

```python
class ProductModel(ui.core.ABTreeModel)
```

<a id="activity_browser.app.panes.database_products.ProductModel.indexDragEnabled"></a>

#### indexDragEnabled

```python
def indexDragEnabled(index: QtCore.QModelIndex) -> bool
```

<a id="activity_browser.app.panes.database_products.ProductModel.displayData"></a>

#### displayData

```python
def displayData(index: QModelIndex) -> any
```

<a id="activity_browser.app.panes.database_products.ProductModel.decorationData"></a>

#### decorationData

```python
def decorationData(index: QtCore.QModelIndex) -> any
```

<a id="activity_browser.app.panes.database_products.ProductModel.toolTipData"></a>

#### toolTipData

```python
def toolTipData(index: QtCore.QModelIndex) -> str
```

<a id="activity_browser.app.panes.database_products.ProductModel.mimeData"></a>

#### mimeData

```python
def mimeData(indices: list[QtCore.QModelIndex])
```

Returns the mime data for the given indices.

**Arguments**:

- `indices` _list[QtCore.QModelIndex]_ - The indices to get the mime data for.
  

**Returns**:

- `core.ABMimeData` - The mime data.

<a id="activity_browser.app.panes.database_products.ProductModel.set_excel_nodes_threaded"></a>

#### set\_excel\_nodes\_threaded

```python
@staticmethod
def set_excel_nodes_threaded(data, keys)
```
