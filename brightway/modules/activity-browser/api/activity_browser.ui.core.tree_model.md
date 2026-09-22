**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.core.tree_model` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.core.tree_model cfg.yml > activity_browser.ui.core.tree_model.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.core.tree_model"></a>

# activity\_browser.ui.core.tree\_model

<a id="activity_browser.ui.core.tree_model.TreeNode"></a>

## TreeNode Objects

```python
class TreeNode()
```

Optimized node object that combines children_map, row_indices, loaded_counts, 
and DataFrame position for O(1) lookups.

<a id="activity_browser.ui.core.tree_model.TreeNode.__slots__"></a>

#### \_\_slots\_\_

<a id="activity_browser.ui.core.tree_model.TreeNode.__init__"></a>

#### \_\_init\_\_

```python
def __init__(path: tuple, df_position: int = -1)
```

<a id="activity_browser.ui.core.tree_model.TreeNode.add_child"></a>

#### add\_child

```python
def add_child(child: 'TreeNode') -> None
```

Add a child node and update its row_in_parent.

<a id="activity_browser.ui.core.tree_model.TreeNode.get_child"></a>

#### get\_child

```python
def get_child(path: tuple) -> Optional['TreeNode']
```

Get a child by its path (O(1) lookup).

<a id="activity_browser.ui.core.tree_model.TreeNode.get_child_at"></a>

#### get\_child\_at

```python
def get_child_at(row: int) -> Optional['TreeNode']
```

Get a child by its row index (O(1) lookup).

<a id="activity_browser.ui.core.tree_model.TreeNode.total_children"></a>

#### total\_children

```python
def total_children() -> int
```

Total number of children (for lazy loading comparison).

<a id="activity_browser.ui.core.tree_model.TreeNode.can_fetch_more"></a>

#### can\_fetch\_more

```python
def can_fetch_more() -> bool
```

Check if more children can be loaded.

<a id="activity_browser.ui.core.tree_model.ABTreeModel"></a>

## ABTreeModel Objects

```python
class ABTreeModel(QAbstractItemModel)
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.__init__"></a>

#### \_\_init\_\_

```python
def __init__(df: pd.DataFrame = None,
             parent: Optional[QWidget] = None,
             chunk_size: int = -1,
             enable_sorting: bool = False) -> None
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.columns"></a>

#### columns

```python
def columns() -> list[str]
```

Return the list of column names, including the tree column.

<a id="activity_browser.ui.core.tree_model.ABTreeModel.column_name"></a>

#### column\_name

```python
def column_name(index: QModelIndex) -> str
```

Return the name of the column at the given index, including the tree column.

<a id="activity_browser.ui.core.tree_model.ABTreeModel.row"></a>

#### row

```python
def row(index: QModelIndex) -> pd.Series | None
```

Return the DataFrame row corresponding to the given index, or None for non-leaf nodes.

Warning: This is a slow operation and should be avoided in methods called frequently like data(), *Data(), flags(), or index*().

<a id="activity_browser.ui.core.tree_model.ABTreeModel.get"></a>

#### get

```python
def get(index: QModelIndex, column: str | int) -> any
```

Get the data for the given QModelIndex and column name or index.

<a id="activity_browser.ui.core.tree_model.ABTreeModel.index"></a>

#### index

```python
def index(row: int, column: int,
          parent: QModelIndex = QModelIndex()) -> QModelIndex
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.parent"></a>

#### parent

```python
def parent(index: QModelIndex) -> QModelIndex
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.parent_path"></a>

#### parent\_path

```python
def parent_path(path: tuple) -> tuple
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.rowCount"></a>

#### rowCount

```python
def rowCount(parent: QModelIndex = QModelIndex()) -> int
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.columnCount"></a>

#### columnCount

```python
def columnCount(parent: QModelIndex = QModelIndex()) -> int
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.data"></a>

#### data

```python
def data(index: QModelIndex, role: int = Qt.DisplayRole)
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.displayData"></a>

#### displayData

```python
def displayData(index: QModelIndex) -> any
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.editData"></a>

#### editData

```python
def editData(index: QModelIndex) -> any
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.userData"></a>

#### userData

```python
def userData(index: QModelIndex) -> any
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.decorationData"></a>

#### decorationData

```python
def decorationData(index: QModelIndex) -> any
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.fontData"></a>

#### fontData

```python
def fontData(index: QModelIndex) -> any
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.toolTipData"></a>

#### toolTipData

```python
def toolTipData(index: QModelIndex) -> any
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.flags"></a>

#### flags

```python
def flags(index)
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.indexEnabled"></a>

#### indexEnabled

```python
def indexEnabled(index: QModelIndex) -> bool
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.indexSelectable"></a>

#### indexSelectable

```python
def indexSelectable(index: QModelIndex) -> bool
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.indexEditable"></a>

#### indexEditable

```python
def indexEditable(index: QModelIndex) -> bool
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.indexDragEnabled"></a>

#### indexDragEnabled

```python
def indexDragEnabled(index: QModelIndex) -> bool
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.indexDropEnabled"></a>

#### indexDropEnabled

```python
def indexDropEnabled(index: QModelIndex) -> bool
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.indexUserCheckable"></a>

#### indexUserCheckable

```python
def indexUserCheckable(index: QModelIndex) -> bool
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.uncertainty_editor_initial"></a>

#### uncertainty\_editor\_initial

```python
def uncertainty_editor_initial(index: QModelIndex) -> dict
```

Seed ``UncertaintyDialog`` when editing the uncertainty column (display-only data).

Subclasses override for rows where the cell is not a dict (e.g. CF amount-only tuples).

<a id="activity_browser.ui.core.tree_model.ABTreeModel.uncertainty_editor_read_only"></a>

#### uncertainty\_editor\_read\_only

```python
def uncertainty_editor_read_only(index: QModelIndex) -> bool
```

If True, :class:`~activity_browser.ui.dialogs.UncertaintyDialog` opens read-only.

<a id="activity_browser.ui.core.tree_model.ABTreeModel.uncertainty_editor_enable_pedigree"></a>

#### uncertainty\_editor\_enable\_pedigree

```python
def uncertainty_editor_enable_pedigree(index: QModelIndex) -> bool
```

If True, the uncertainty dialog shows the pedigree recipe (flows only).

<a id="activity_browser.ui.core.tree_model.ABTreeModel.isBranchNode"></a>

#### isBranchNode

```python
def isBranchNode(index: QModelIndex) -> bool
```

Check if the given index represents a branch node (non-leaf).

<a id="activity_browser.ui.core.tree_model.ABTreeModel.headerData"></a>

#### headerData

```python
def headerData(section: int,
               orientation: Qt.Orientation = Qt.Horizontal,
               role: int = Qt.DisplayRole)
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.canFetchMore"></a>

#### canFetchMore

```python
def canFetchMore(parent: QModelIndex) -> bool
```

Check if this parent has more children that can be loaded.

<a id="activity_browser.ui.core.tree_model.ABTreeModel.fetchMore"></a>

#### fetchMore

```python
def fetchMore(parent: QModelIndex) -> None
```

Load the next chunk of children when user scrolls.

<a id="activity_browser.ui.core.tree_model.ABTreeModel.set_dataframe"></a>

#### set\_dataframe

```python
def set_dataframe(df: pd.DataFrame, group: list[str] = None) -> None
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.update_dataframe"></a>

#### update\_dataframe

```python
def update_dataframe(df: pd.DataFrame, group: list[str] = None) -> None
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.group"></a>

#### group

```python
def group(columns: list[str] = None) -> None
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.ungroup"></a>

#### ungroup

```python
def ungroup() -> None
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.sort"></a>

#### sort

```python
def sort(column: int | str,
         order: Qt.SortOrder = Qt.SortOrder.AscendingOrder) -> None
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.filter"></a>

#### filter

```python
def filter(key: str = None, query: str = None) -> None
```

Filter the DataFrame based on a simple substring match across all columns.

<a id="activity_browser.ui.core.tree_model.ABTreeModel.build_df_index"></a>

#### build\_df\_index

```python
def build_df_index()
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.reset_hierarchy"></a>

#### reset\_hierarchy

```python
def reset_hierarchy(df: pd.DataFrame = None) -> None
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.build_node_hierarchy"></a>

#### build\_node\_hierarchy

```python
def build_node_hierarchy(pandas_index: pd.Index) -> None
```

Build the unified TreeNode hierarchy with all information combined:
- children relationships
- row indices
- loaded counts
- DataFrame positions

<a id="activity_browser.ui.core.tree_model.ABTreeModel.apply_filter"></a>

#### apply\_filter

```python
def apply_filter()
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.apply_sort"></a>

#### apply\_sort

```python
def apply_sort()
```

<a id="activity_browser.ui.core.tree_model.ABTreeModel.values_from_indices"></a>

#### values\_from\_indices

```python
def values_from_indices(key: str, indices: list[QModelIndex])
```

Returns the values from the given indices.

**Arguments**:

- `key` _str_ - The key to get the values for.
- `indices` _list[QtCore.QModelIndex]_ - The indices to get the values for.
  

**Returns**:

- `list` - The list of values.
