**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.impact_category_details.impact_category_details` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.impact_category_details.impact_category_details cfg.yml > activity_browser.app.pages.impact_category_details.impact_category_details.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.impact_category_details.impact_category_details"></a>

# activity\_browser.app.pages.impact\_category\_details.impact\_category\_details

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.ImpactCategoryDetailsPage"></a>

## ImpactCategoryDetailsPage Objects

```python
class ImpactCategoryDetailsPage(widgets.ABAbstractPage)
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.ImpactCategoryDetailsPage.__init__"></a>

#### \_\_init\_\_

```python
def __init__(name: tuple, parent=None)
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.ImpactCategoryDetailsPage.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.ImpactCategoryDetailsPage.on_metadata_changed"></a>

#### on\_metadata\_changed

```python
def on_metadata_changed(added, updated, deleted)
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.ImpactCategoryDetailsPage.on_method_renamed"></a>

#### on\_method\_renamed

```python
def on_method_renamed(old_name, new_name)
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.ImpactCategoryDetailsPage.on_method_deleted"></a>

#### on\_method\_deleted

```python
def on_method_deleted(method)
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.ImpactCategoryDetailsPage.syncLater"></a>

#### syncLater

```python
def syncLater()
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.ImpactCategoryDetailsPage.sync"></a>

#### sync

```python
def sync()
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.ImpactCategoryDetailsPage.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.ImpactCategoryDetailsPage.build_df"></a>

#### build\_df

```python
def build_df()
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.ImpactCategoryDetailsPage.uncertainty_from_cf"></a>

#### uncertainty\_from\_cf

```python
def uncertainty_from_cf(cf)
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsView"></a>

## CharacterizationFactorsView Objects

```python
class CharacterizationFactorsView(widgets.ABTreeView)
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsView.ContextMenu"></a>

## ContextMenu Objects

```python
class ContextMenu(widgets.ABMenu)
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsView.ContextMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsView.ContextMenu.is_editable"></a>

#### is\_editable

```python
@property
def is_editable()
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsView.ContextMenu.impact_category_name"></a>

#### impact\_category\_name

```python
@property
def impact_category_name()
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsView.ContextMenu.char_factors"></a>

#### char\_factors

```python
@property
def char_factors()
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent)
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsView.page"></a>

#### page

```python
@property
def page()
```

Returns the ImpactCategoryDetailsPage associated with the view.

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsView.dragEnterEvent"></a>

#### dragEnterEvent

```python
def dragEnterEvent(event)
```

Handles the drag enter event.

**Arguments**:

- `event` - The drag enter event.

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsView.dragMoveEvent"></a>

#### dragMoveEvent

```python
def dragMoveEvent(event)
```

Handles the drag move event - required for proper drop indicator.

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsView.dragLeaveEvent"></a>

#### dragLeaveEvent

```python
def dragLeaveEvent(event)
```

Handles the drag leave event.

**Arguments**:

- `event` - The drag leave event.

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsView.dropEvent"></a>

#### dropEvent

```python
def dropEvent(event)
```

Handles the drop event.

**Arguments**:

- `event` - The drop event.

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsModel"></a>

## CharacterizationFactorsModel Objects

```python
class CharacterizationFactorsModel(core.ABTreeModel)
```

A model representing the characterization factors data.

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsModel.__init__"></a>

#### \_\_init\_\_

```python
def __init__(page: ImpactCategoryDetailsPage)
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsModel.uncertainty_editor_initial"></a>

#### uncertainty\_editor\_initial

```python
def uncertainty_editor_initial(index: QtCore.QModelIndex) -> dict
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsModel.uncertainty_editor_read_only"></a>

#### uncertainty\_editor\_read\_only

```python
def uncertainty_editor_read_only(index: QtCore.QModelIndex) -> bool
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsModel.sort"></a>

#### sort

```python
def sort(column: int,
         order: Qt.SortOrder = Qt.SortOrder.AscendingOrder) -> None
```

Sorts the model based on the given column and order.

**Arguments**:

- `column` _int_ - The column index to sort by.
- `order` _Qt.SortOrder_ - The order to sort (ascending or descending).

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsModel.setData"></a>

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

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsModel.decorationData"></a>

#### decorationData

```python
def decorationData(index: QtCore.QModelIndex) -> any
```

Provides decoration data for the model.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index for which to provide decoration data.
  

**Returns**:

  The decoration data for the index.

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsModel.fontData"></a>

#### fontData

```python
def fontData(index: QtCore.QModelIndex) -> any
```

Provides font data for the model.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index for which to provide font data.
  

**Returns**:

- `QtGui.QFont` - The font data for the index.

<a id="activity_browser.app.pages.impact_category_details.impact_category_details.CharacterizationFactorsModel.indexEditable"></a>

#### indexEditable

```python
def indexEditable(index)
```

Returns whether the index is editable.

**Arguments**:

- `index` _QtCore.QModelIndex_ - The index to check.
  

**Returns**:

- `bool` - True if the index is editable, False otherwise.
