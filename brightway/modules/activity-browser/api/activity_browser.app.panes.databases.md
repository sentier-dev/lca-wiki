**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.panes.databases` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.panes.databases cfg.yml > activity_browser.app.panes.databases.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.panes.databases"></a>

# activity\_browser.app.panes.databases

<a id="activity_browser.app.panes.databases.DatabasesPane"></a>

## DatabasesPane Objects

```python
class DatabasesPane(widgets.ABAbstractPane)
```

A widget that displays the databases and their details.

**Attributes**:

- `view` _DatabasesView_ - The view displaying the databases.
- `model` _DatabasesModel_ - The model containing the data for the databases.

<a id="activity_browser.app.panes.databases.DatabasesPane.title"></a>

#### title

<a id="activity_browser.app.panes.databases.DatabasesPane.unique"></a>

#### unique

<a id="activity_browser.app.panes.databases.DatabasesPane.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent)
```

Initializes the DatabasesPane widget.

**Arguments**:

- `parent` _QtWidgets.QWidget_ - The parent widget.

<a id="activity_browser.app.panes.databases.DatabasesPane.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

Connects the signals to the appropriate slots.

<a id="activity_browser.app.panes.databases.DatabasesPane.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Builds the layout of the widget.

<a id="activity_browser.app.panes.databases.DatabasesPane.syncLater"></a>

#### syncLater

```python
def syncLater()
```

Schedules a sync operation to be performed later.

<a id="activity_browser.app.panes.databases.DatabasesPane.sync"></a>

#### sync

```python
def sync()
```

Synchronizes the model with the current state of the databases.

<a id="activity_browser.app.panes.databases.DatabasesPane.build_df"></a>

#### build\_df

```python
def build_df() -> pd.DataFrame
```

Builds a DataFrame from the databases.

**Returns**:

- `pd.DataFrame` - The DataFrame containing the databases data.

<a id="activity_browser.app.panes.databases.DatabasesView"></a>

## DatabasesView Objects

```python
class DatabasesView(widgets.ABTreeView)
```

A view that displays the databases in a tree structure.

**Attributes**:

- `defaultColumnDelegates` _dict_ - The default column delegates for the view.

<a id="activity_browser.app.panes.databases.DatabasesView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.app.panes.databases.DatabasesView.ExportDatabaseContextMenu"></a>

## ExportDatabaseContextMenu Objects

```python
class ExportDatabaseContextMenu(widgets.ABMenu)
```

<a id="activity_browser.app.panes.databases.DatabasesView.ExportDatabaseContextMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.panes.databases.DatabasesView.ContextMenu"></a>

## ContextMenu Objects

```python
class ContextMenu(widgets.ABMenu)
```

<a id="activity_browser.app.panes.databases.DatabasesView.ContextMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.panes.databases.DatabasesView.ContextMenu.selected_readonly"></a>

#### selected\_readonly

```python
@property
def selected_readonly()
```

Returns the read-only state of the selected database.

**Returns**:

- `bool` - The read-only state of the selected database.

<a id="activity_browser.app.panes.databases.DatabasesView.HeaderMenu"></a>

## HeaderMenu Objects

```python
class HeaderMenu(QtWidgets.QMenu)
```

A header menu for the DatabasesView. Currently not used.

<a id="activity_browser.app.panes.databases.DatabasesView.HeaderMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="activity_browser.app.panes.databases.DatabasesView.mouseDoubleClickEvent"></a>

#### mouseDoubleClickEvent

```python
def mouseDoubleClickEvent(event: QtGui.QMouseEvent)
```

Handles the mouse double click event to toggle the read-only state or select the database.

**Arguments**:

- `event` _QtGui.QMouseEvent_ - The mouse double click event.

<a id="activity_browser.app.panes.databases.DatabasesView.keyPressEvent"></a>

#### keyPressEvent

```python
def keyPressEvent(event: QtGui.QKeyEvent)
```

Handles key press events. Specifically handles the Delete key to delete selected databases.

**Arguments**:

- `event` _QtGui.QKeyEvent_ - The key press event.

<a id="activity_browser.app.panes.databases.DatabasesView.selected_databases"></a>

#### selected\_databases

```python
@property
def selected_databases() -> list
```

Returns the database name of the user-selected index.

**Returns**:

- `str` - The name of the selected database.

<a id="activity_browser.app.panes.databases.DatabasesModel"></a>

## DatabasesModel Objects

```python
class DatabasesModel(core.ABTreeModel)
```

A model representing the data for the databases.

<a id="activity_browser.app.panes.databases.DatabasesModel.decorationData"></a>

#### decorationData

```python
def decorationData(index: QtCore.QModelIndex) -> any
```

Provides decoration data for the model.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index for which to provide decoration data.
  

**Returns**:

  The decoration data for the index.

<a id="activity_browser.app.panes.databases.DatabasesModel.displayData"></a>

#### displayData

```python
def displayData(index: QtCore.QModelIndex) -> any
```

Provides display data for the model.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index for which to provide display data.
  

**Returns**:

  The display data for the index.

<a id="activity_browser.app.panes.databases.DatabasesModel.fontData"></a>

#### fontData

```python
def fontData(index: QtCore.QModelIndex) -> any
```

Provides font data for the model.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index for which to provide font data.
  

**Returns**:

- `QtGui.QFont` - The font data for the index.

<a id="activity_browser.app.panes.databases.DatabasesModel.headerData"></a>

#### headerData

```python
def headerData(section,
               orientation=Qt.Orientation.Horizontal,
               role=Qt.ItemDataRole.DisplayRole)
```

Provides header data for the model.

**Arguments**:

- `section` _int_ - The section index.
- `orientation` _Qt.Orientation_ - The orientation of the header.
- `role` _Qt.ItemDataRole_ - The role for which to provide header data.
  

**Returns**:

  The header data for the model.
