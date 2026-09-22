**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.calculation_setup.functional_unit_section` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.calculation_setup.functional_unit_section cfg.yml > activity_browser.app.pages.calculation_setup.functional_unit_section.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section"></a>

# activity\_browser.app.pages.calculation\_setup.functional\_unit\_section

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitSection"></a>

## FunctionalUnitSection Objects

```python
class FunctionalUnitSection(QtWidgets.QWidget)
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitSection.__init__"></a>

#### \_\_init\_\_

```python
def __init__(calculation_setup_name: str, parent=None)
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitSection.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitSection.sync"></a>

#### sync

```python
def sync()
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitSection.build_df"></a>

#### build\_df

```python
def build_df()
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitView"></a>

## FunctionalUnitView Objects

```python
class FunctionalUnitView(CSTableView)
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitView.ContextMenu"></a>

## ContextMenu Objects

```python
class ContextMenu(widgets.ABMenu)
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitView.ContextMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitView.mouseDoubleClickEvent"></a>

#### mouseDoubleClickEvent

```python
def mouseDoubleClickEvent(event) -> None
```

Handles the mouse double click event to open the selected activities.

**Arguments**:

- `event` - The mouse double click event.

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitView.dragMoveEvent"></a>

#### dragMoveEvent

```python
def dragMoveEvent(event) -> None
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitView.dragEnterEvent"></a>

#### dragEnterEvent

```python
def dragEnterEvent(event)
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitView.dropEvent"></a>

#### dropEvent

```python
def dropEvent(event) -> None
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitView.selected_row_indices"></a>

#### selected\_row\_indices

```python
def selected_row_indices()
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitView.cs_name"></a>

#### cs\_name

```python
def cs_name()
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitView.selected_processes"></a>

#### selected\_processes

```python
def selected_processes()
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitModel"></a>

## FunctionalUnitModel Objects

```python
class FunctionalUnitModel(CSListModel)
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitModel.list_key"></a>

#### list\_key

A model representing the data for the functional units.

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitModel.setData"></a>

#### setData

```python
def setData(index: QtCore.QModelIndex,
            value,
            role: int = Qt.ItemDataRole.EditRole) -> bool
```

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitModel.decorationData"></a>

#### decorationData

```python
def decorationData(index: QtCore.QModelIndex) -> any
```

Provides decoration data (icons) for the model.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index for which to provide decoration data.
  

**Returns**:

  The decoration data (icon) for the index.

<a id="activity_browser.app.pages.calculation_setup.functional_unit_section.FunctionalUnitModel.indexEditable"></a>

#### indexEditable

```python
def indexEditable(index: QtCore.QModelIndex) -> bool
```

Returns whether the index is editable.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index to check.
  

**Returns**:

- `bool` - True if the index is editable, False otherwise.
