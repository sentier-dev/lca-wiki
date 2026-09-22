**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.calculation_setup.cs_table` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.calculation_setup.cs_table cfg.yml > activity_browser.app.pages.calculation_setup.cs_table.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.calculation_setup.cs_table"></a>

# activity\_browser.app.pages.calculation\_setup.cs\_table

Reorder + include checkboxes for calculation setup tables.

<a id="activity_browser.app.pages.calculation_setup.cs_table.try_reorder_drop"></a>

#### try\_reorder\_drop

```python
def try_reorder_drop(view, event) -> bool
```

<a id="activity_browser.app.pages.calculation_setup.cs_table.CSListModel"></a>

## CSListModel Objects

```python
class CSListModel(core.ABTreeModel)
```

<a id="activity_browser.app.pages.calculation_setup.cs_table.CSListModel.list_key"></a>

#### list\_key

<a id="activity_browser.app.pages.calculation_setup.cs_table.CSListModel.data"></a>

#### data

```python
def data(index, role=QtCore.Qt.ItemDataRole.DisplayRole)
```

<a id="activity_browser.app.pages.calculation_setup.cs_table.CSListModel.setData"></a>

#### setData

```python
def setData(index, value, role=QtCore.Qt.ItemDataRole.EditRole)
```

<a id="activity_browser.app.pages.calculation_setup.cs_table.CSListModel.indexUserCheckable"></a>

#### indexUserCheckable

```python
def indexUserCheckable(index)
```

<a id="activity_browser.app.pages.calculation_setup.cs_table.CSListModel.indexDragEnabled"></a>

#### indexDragEnabled

```python
def indexDragEnabled(index)
```

<a id="activity_browser.app.pages.calculation_setup.cs_table.CSListModel.indexDropEnabled"></a>

#### indexDropEnabled

```python
def indexDropEnabled(index)
```

<a id="activity_browser.app.pages.calculation_setup.cs_table.CSTableView"></a>

## CSTableView Objects

```python
class CSTableView(widgets.ABTreeView)
```

<a id="activity_browser.app.pages.calculation_setup.cs_table.CSTableView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.calculation_setup.cs_table.CSTableView.updateIndexColumnVisibility"></a>

#### updateIndexColumnVisibility

```python
def updateIndexColumnVisibility()
```

<a id="activity_browser.app.pages.calculation_setup.cs_table.CSTableView.setDefaultColumnDelegates"></a>

#### setDefaultColumnDelegates

```python
def setDefaultColumnDelegates()
```

<a id="activity_browser.app.pages.calculation_setup.cs_table.CSTableView.dragEnterEvent"></a>

#### dragEnterEvent

```python
def dragEnterEvent(event)
```

<a id="activity_browser.app.pages.calculation_setup.cs_table.CSTableView.dragMoveEvent"></a>

#### dragMoveEvent

```python
def dragMoveEvent(event)
```

<a id="activity_browser.app.pages.calculation_setup.cs_table.CSTableView.dropEvent"></a>

#### dropEvent

```python
def dropEvent(event)
```
