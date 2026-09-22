**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.activity_details.parameters_tab` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.activity_details.parameters_tab cfg.yml > activity_browser.app.pages.activity_details.parameters_tab.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.activity_details.parameters_tab"></a>

# activity\_browser.app.pages.activity\_details.parameters\_tab

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersTab"></a>

## ParametersTab Objects

```python
class ParametersTab(QtWidgets.QWidget)
```

A widget that displays parameters related to a specific activity.

**Attributes**:

- `activity` _tuple | int | bd.Node_ - The activity to display parameters for.
- `model` _ParametersModel_ - The model containing the data for the parameters.
- `view` _ParametersView_ - The view displaying the parameters.

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(activity, parent=None)
```

Initializes the ParametersTab widget.

**Arguments**:

- `activity` _tuple | int | bd.Node_ - The activity to display parameters for.
- `parent` _QtWidgets.QWidget, optional_ - The parent widget. Defaults to None.

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersTab.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Builds the layout of the widget.

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersTab.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

Connects signals to their respective slots.

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersTab.sync"></a>

#### sync

```python
def sync()
```

Synchronizes the widget with the current state of the activity.

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersTab.build_df"></a>

#### build\_df

```python
def build_df() -> pd.DataFrame
```

Builds a DataFrame from all parameters in the project.

**Returns**:

- `pd.DataFrame` - The DataFrame containing the parameters data.

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersView"></a>

## ParametersView Objects

```python
class ParametersView(widgets.ABTreeView)
```

A view that displays the parameters in a tree structure.

**Attributes**:

- `defaultColumnDelegates` _dict_ - The default column delegates for the view.

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersView.ContextMenu"></a>

## ContextMenu Objects

```python
class ContextMenu(widgets.ABMenu)
```

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersView.ContextMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersView.ContextMenu.locked"></a>

#### locked

```python
@property
def locked()
```

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersView.ContextMenu.activity"></a>

#### activity

```python
@property
def activity()
```

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersView.ContextMenu.parameters"></a>

#### parameters

```python
@property
def parameters()
```

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersView.activity"></a>

#### activity

```python
@property
def activity()
```

Returns the activity associated with the view.

**Returns**:

  The activity associated with the view.

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersModel"></a>

## ParametersModel Objects

```python
class ParametersModel(core.ABTreeModel)
```

A model representing the data for the parameters.

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersModel.__init__"></a>

#### \_\_init\_\_

```python
def __init__(tab: ParametersTab)
```

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersModel.setData"></a>

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

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersModel.uncertainty_editor_initial"></a>

#### uncertainty\_editor\_initial

```python
def uncertainty_editor_initial(index: QtCore.QModelIndex) -> dict
```

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersModel.uncertainty_editor_read_only"></a>

#### uncertainty\_editor\_read\_only

```python
def uncertainty_editor_read_only(index: QtCore.QModelIndex) -> bool
```

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersModel.decorationData"></a>

#### decorationData

```python
def decorationData(index: QtCore.QModelIndex) -> any
```

Provides decoration data for the model.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index for which to provide decoration data.
  

**Returns**:

  The decoration data for the index.

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersModel.fontData"></a>

#### fontData

```python
def fontData(index: QtCore.QModelIndex) -> any
```

Provides font data for the model.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index for which to provide font data.
  

**Returns**:

- `QtGui.QFont` - The font data for the index.

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersModel.indexEditable"></a>

#### indexEditable

```python
def indexEditable(index: QtCore.QModelIndex) -> bool
```

Returns whether the index is editable.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index to check.
  

**Returns**:

- `bool` - True if the index is editable, False otherwise.

<a id="activity_browser.app.pages.activity_details.parameters_tab.ParametersModel.scoped_parameters"></a>

#### scoped\_parameters

```python
def scoped_parameters(index: QtCore.QModelIndex) -> dict[str, Parameter]
```

Returns the parameters in scope of the parameter at the given index.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index to get scoped parameters for.
  

**Returns**:

- `dict` - The parameters in scope.
