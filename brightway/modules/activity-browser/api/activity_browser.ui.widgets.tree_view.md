**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.tree_view` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.tree_view cfg.yml > activity_browser.ui.widgets.tree_view.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.tree_view"></a>

# activity\_browser.ui.widgets.tree\_view

<a id="activity_browser.ui.widgets.tree_view.ABTreeView"></a>

## ABTreeView Objects

```python
class ABTreeView(QtWidgets.QTreeView)
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.filtered"></a>

#### filtered

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.HeaderMenu"></a>

## HeaderMenu Objects

```python
class HeaderMenu(QtWidgets.QMenu)
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.HeaderMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(pos: QtCore.QPoint, view: "ABTreeView")
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.ContextMenu"></a>

## ContextMenu Objects

```python
class ContextMenu(QtWidgets.QMenu)
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.ContextMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(pos, view)
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.setModel"></a>

#### setModel

```python
def setModel(model)
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.model"></a>

#### model

```python
def model() -> core.ABTreeModel
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.showContextMenu"></a>

#### showContextMenu

```python
def showContextMenu(pos)
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.showHeaderMenu"></a>

#### showHeaderMenu

```python
def showHeaderMenu(pos)
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.setColumnFilter"></a>

#### setColumnFilter

```python
def setColumnFilter(column_name: str, query: str)
```

Set a filter for a specific column using a string query. If the query is empty remove the filter from the column

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.setAllFilter"></a>

#### setAllFilter

```python
def setAllFilter(query: str)
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.buildQuery"></a>

#### buildQuery

```python
def buildQuery() -> str
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.applyFilter"></a>

#### applyFilter

```python
def applyFilter()
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.format_query"></a>

#### format\_query

```python
@staticmethod
def format_query(query: str) -> str
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.clearColumnDelegates"></a>

#### clearColumnDelegates

```python
def clearColumnDelegates()
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.setDefaultColumnDelegates"></a>

#### setDefaultColumnDelegates

```python
def setDefaultColumnDelegates()
```

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.updateIndexColumnVisibility"></a>

#### updateIndexColumnVisibility

```python
def updateIndexColumnVisibility()
```

Hide the index column (column 0) if the dataframe index is only one level deep.

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.updateBranchSpanning"></a>

#### updateBranchSpanning

```python
def updateBranchSpanning()
```

Enable spanning for branch nodes so they span across all columns.

<a id="activity_browser.ui.widgets.tree_view.ABTreeView.updateBranchSpanningForInsertedRows"></a>

#### updateBranchSpanningForInsertedRows

```python
def updateBranchSpanningForInsertedRows(parent: QtCore.QModelIndex, first: int,
                                        last: int)
```

Update spanning for newly inserted rows during lazy loading.
