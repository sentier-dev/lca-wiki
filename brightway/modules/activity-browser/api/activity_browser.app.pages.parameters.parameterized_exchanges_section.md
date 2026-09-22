**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.parameters.parameterized_exchanges_section` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.parameters.parameterized_exchanges_section cfg.yml > activity_browser.app.pages.parameters.parameterized_exchanges_section.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section"></a>

# activity\_browser.app.pages.parameters.parameterized\_exchanges\_section

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesSection"></a>

## ParameterizedExchangesSection Objects

```python
class ParameterizedExchangesSection(QtWidgets.QWidget)
```

A widget section that displays all parameterized flows in the current project.

**Attributes**:

- `model` _ParameterizedExchangesModel_ - The model containing the data for the flows.
- `view` _ParameterizedExchangesView_ - The view displaying the flows.

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesSection.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

Initializes the ParameterizedExchangesSection widget.

**Arguments**:

- `parent` _QtWidgets.QWidget, optional_ - The parent widget. Defaults to None.

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesSection.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Builds the layout of the widget.

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesSection.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

Connects signals to their respective slots.

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesSection.syncLater"></a>

#### syncLater

```python
def syncLater()
```

Schedules a sync operation to be performed later.

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesSection.sync"></a>

#### sync

```python
def sync()
```

Synchronizes the widget with the current state of parameterized exchanges.

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesSection.build_exchanges_df"></a>

#### build\_exchanges\_df

```python
def build_exchanges_df() -> pd.DataFrame
```

Build a DataFrame from Brightway's parameterized-flow index.

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesView"></a>

## ParameterizedExchangesView Objects

```python
class ParameterizedExchangesView(widgets.ABTreeView)
```

A view that displays parameterized exchanges in a tree structure.

**Attributes**:

- `defaultColumnDelegates` _dict_ - The default column delegates for the view.

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesView.ContextMenu"></a>

## ContextMenu Objects

```python
class ContextMenu(QtWidgets.QMenu)
```

A context menu for the ParameterizedExchangesView.

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesView.ContextMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(pos, view: "ParameterizedExchangesView")
```

Initializes the ContextMenu.

**Arguments**:

- `pos` - The position of the context menu.
- `view` _ParameterizedExchangesView_ - The view displaying the exchanges.

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesModel"></a>

## ParameterizedExchangesModel Objects

```python
class ParameterizedExchangesModel(core.ABTreeModel)
```

A model representing the data for parameterized exchanges.

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesModel.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

Initializes the ParameterizedExchangesModel.

**Arguments**:

- `parent` _QtWidgets.QWidget, optional_ - The parent widget. Defaults to None.

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesModel.toolTipData"></a>

#### toolTipData

```python
def toolTipData(index: QtCore.QModelIndex)
```

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesModel.setData"></a>

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

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesModel.uncertainty_editor_initial"></a>

#### uncertainty\_editor\_initial

```python
def uncertainty_editor_initial(index: QtCore.QModelIndex) -> dict
```

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesModel.uncertainty_editor_enable_pedigree"></a>

#### uncertainty\_editor\_enable\_pedigree

```python
def uncertainty_editor_enable_pedigree(index: QtCore.QModelIndex) -> bool
```

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesModel.uncertainty_editor_read_only"></a>

#### uncertainty\_editor\_read\_only

```python
def uncertainty_editor_read_only(index: QtCore.QModelIndex) -> bool
```

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesModel.decorationData"></a>

#### decorationData

```python
def decorationData(index: QtCore.QModelIndex) -> any
```

Provides decoration data for the model.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index for which to provide decoration data.
  

**Returns**:

  The decoration data for the index.

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesModel.indexEditable"></a>

#### indexEditable

```python
def indexEditable(index: QtCore.QModelIndex) -> bool
```

Returns whether the index is editable.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index to check.
  

**Returns**:

- `bool` - True if the index is editable, False otherwise.

<a id="activity_browser.app.pages.parameters.parameterized_exchanges_section.ParameterizedExchangesModel.scoped_parameters"></a>

#### scoped\_parameters

```python
def scoped_parameters(index: QtCore.QModelIndex) -> dict[str, Parameter]
```

Returns the parameters in scope of the exchange at the given index.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index to get scoped parameters for.
  

**Returns**:

- `dict` - The parameters in scope.
