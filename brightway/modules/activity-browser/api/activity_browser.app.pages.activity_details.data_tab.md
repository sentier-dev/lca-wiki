**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.activity_details.data_tab` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.activity_details.data_tab cfg.yml > activity_browser.app.pages.activity_details.data_tab.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.activity_details.data_tab"></a>

# activity\_browser.app.pages.activity\_details.data\_tab

<a id="activity_browser.app.pages.activity_details.data_tab.DataTab"></a>

## DataTab Objects

```python
class DataTab(QtWidgets.QWidget)
```

A widget that displays the data structure of a specific activity.

**Attributes**:

- `activity` _tuple | int | bd.Node_ - The activity to display data for.
- `data_view` _DataView_ - The view displaying the data.
- `data_model` _DataModel_ - The model containing the data.

<a id="activity_browser.app.pages.activity_details.data_tab.DataTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(activity: tuple | int | bd.Node, parent=None)
```

Initializes the DataTab widget.

**Arguments**:

- `activity` _tuple | int | bd.Node_ - The activity to display data for.
- `parent` _QtWidgets.QWidget, optional_ - The parent widget. Defaults to None.

<a id="activity_browser.app.pages.activity_details.data_tab.DataTab.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Builds the layout of the widget.

<a id="activity_browser.app.pages.activity_details.data_tab.DataTab.sync"></a>

#### sync

```python
def sync() -> None
```

Synchronizes the widget with the current state of the activity.

<a id="activity_browser.app.pages.activity_details.data_tab.DataTab.build_df"></a>

#### build\_df

```python
def build_df() -> pd.DataFrame
```

Builds a DataFrame from the activity data.

**Returns**:

- `pd.DataFrame` - The DataFrame containing the activity data.

<a id="activity_browser.app.pages.activity_details.data_tab.DataView"></a>

## DataView Objects

```python
class DataView(widgets.ABTreeView)
```

A view that displays the data in a tree structure.

**Attributes**:

- `defaultColumnDelegates` _dict_ - The default column delegates for the view.

<a id="activity_browser.app.pages.activity_details.data_tab.DataView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.app.pages.activity_details.data_tab.DataModel"></a>

## DataModel Objects

```python
class DataModel(core.ABTreeModel)
```

A model representing the data for the activity.

<a id="activity_browser.app.pages.activity_details.data_tab.DataModel.setData"></a>

#### setData

```python
def setData(index: QtCore.QModelIndex,
            value,
            role: int = QtCore.Qt.ItemDataRole.EditRole) -> bool
```

Sets the data for the given index.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index to set data for.
- `value` - The value to set.
- `role` _int_ - The role for which to set the data.
  

**Returns**:

- `bool` - True if the data was set successfully, False otherwise.

<a id="activity_browser.app.pages.activity_details.data_tab.DataModel.indexEditable"></a>

#### indexEditable

```python
def indexEditable(index: QtCore.QModelIndex) -> bool
```

Returns whether the index is editable.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index to check.
  

**Returns**:

- `bool` - True if the index is editable, False otherwise.

<a id="activity_browser.app.pages.activity_details.data_tab.DataModel.displayData"></a>

#### displayData

```python
def displayData(index: QtCore.QModelIndex) -> any
```

Provides display data for the model.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index for which to provide display data.
  

**Returns**:

  The display data for the index.
