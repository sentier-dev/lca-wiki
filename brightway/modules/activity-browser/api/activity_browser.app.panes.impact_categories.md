**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.panes.impact_categories` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.panes.impact_categories cfg.yml > activity_browser.app.panes.impact_categories.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.panes.impact_categories"></a>

# activity\_browser.app.panes.impact\_categories

<a id="activity_browser.app.panes.impact_categories.live_impact_category_selection"></a>

#### live\_impact\_category\_selection

```python
def live_impact_category_selection() -> Optional[List[tuple]]
```

Return selected impact-category names from the Impact categories pane.

On any failure (no main window, pane missing, etc.) return ``None`` so
callers can fall back to the empty-selection / export-all prompt.

<a id="activity_browser.app.panes.impact_categories.resolve_methods_for_export"></a>

#### resolve\_methods\_for\_export

```python
def resolve_methods_for_export(
        method_names: Optional[List[tuple]] = None) -> Optional[List[tuple]]
```

Resolve which impact categories to export.

If ``method_names`` is None, use the live pane selection. When nothing is
selected, ask whether to export all. Returns ``None`` if the user cancels
or the project has no methods.

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesPane"></a>

## ImpactCategoriesPane Objects

```python
class ImpactCategoriesPane(widgets.ABAbstractPane)
```

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesPane.title"></a>

#### title

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesPane.unique"></a>

#### unique

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesPane.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesPane.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesPane.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesPane.sync"></a>

#### sync

```python
def sync()
```

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesPane.build_df"></a>

#### build\_df

```python
def build_df()
```

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesView"></a>

## ImpactCategoriesView Objects

```python
class ImpactCategoriesView(widgets.ABTreeView)
```

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesView.ContextMenu"></a>

## ContextMenu Objects

```python
class ContextMenu(widgets.ABMenu)
```

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesView.ContextMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesView.ExportContextMenu"></a>

## ExportContextMenu Objects

```python
class ExportContextMenu(widgets.ABMenu)
```

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesView.ExportContextMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesView.selected_impact_categories"></a>

#### selected\_impact\_categories

```python
@property
def selected_impact_categories()
```

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesView.mouseDoubleClickEvent"></a>

#### mouseDoubleClickEvent

```python
def mouseDoubleClickEvent(event) -> None
```

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesModel"></a>

## ImpactCategoriesModel Objects

```python
class ImpactCategoriesModel(core.ABTreeModel)
```

A model representing the data for the impact categories.

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesModel.indexDragEnabled"></a>

#### indexDragEnabled

```python
def indexDragEnabled(index: QtCore.QModelIndex) -> bool
```

Enable drag for all items.

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesModel.mimeData"></a>

#### mimeData

```python
def mimeData(indices: list[QtCore.QModelIndex])
```

Returns the mime data for the given indices.

**Arguments**:

- `indices` _list[QtCore.QModelIndex]_ - The indices to get the mime data for.
  

**Returns**:

- `core.ABMimeData` - The mime data.

<a id="activity_browser.app.panes.impact_categories.ImpactCategoriesModel.get_impact_categories"></a>

#### get\_impact\_categories

```python
def get_impact_categories(index: QtCore.QModelIndex)
```

Get all impact category method names for the given index.

For leaf nodes (full depth paths), returns the single method name.
For branch nodes (partial depth paths), returns all child method names.

**Arguments**:

- `index` - The index to get impact categories for.
  

**Returns**:

- `list` - List of method name tuples.
