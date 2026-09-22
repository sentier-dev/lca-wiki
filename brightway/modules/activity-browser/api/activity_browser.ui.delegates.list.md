**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.delegates.list` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.delegates.list cfg.yml > activity_browser.ui.delegates.list.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.delegates.list"></a>

# activity\_browser.ui.delegates.list

<a id="activity_browser.ui.delegates.list.OrderedListInputDialog"></a>

## OrderedListInputDialog Objects

```python
class OrderedListInputDialog(QtWidgets.QDialog)
```

Mostly cobbled together from: https://stackoverflow.com/a/41310284
and https://stackoverflow.com/q/26936585

<a id="activity_browser.ui.delegates.list.OrderedListInputDialog.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None, flags=QtCore.Qt.Window)
```

<a id="activity_browser.ui.delegates.list.OrderedListInputDialog.add_items_value"></a>

#### add\_items\_value

```python
@staticmethod
def add_items_value(items, value: bool = False) -> List[tuple]
```

Helper method, takes a list of items and adds given bool value,
returning a list of tuples.

<a id="activity_browser.ui.delegates.list.OrderedListInputDialog.set_items"></a>

#### set\_items

```python
def set_items(items: List[tuple])
```

<a id="activity_browser.ui.delegates.list.OrderedListInputDialog.items_selected"></a>

#### items\_selected

```python
def items_selected() -> list
```

<a id="activity_browser.ui.delegates.list.ListDelegate"></a>

## ListDelegate Objects

```python
class ListDelegate(QtWidgets.QStyledItemDelegate)
```

For managing and validating entered string values
https://stackoverflow.com/a/40275439

<a id="activity_browser.ui.delegates.list.ListDelegate.displayText"></a>

#### displayText

```python
def displayText(value, locale)
```

<a id="activity_browser.ui.delegates.list.ListDelegate.createEditor"></a>

#### createEditor

```python
def createEditor(parent, option, index)
```

<a id="activity_browser.ui.delegates.list.ListDelegate.setEditorData"></a>

#### setEditorData

```python
def setEditorData(editor: QtWidgets.QWidget, index: QtCore.QModelIndex)
```

Populate the editor with data if editing an existing field.

<a id="activity_browser.ui.delegates.list.ListDelegate.setModelData"></a>

#### setModelData

```python
def setModelData(editor: QtWidgets.QWidget, model: QtCore.QAbstractItemModel,
                 index: QtCore.QModelIndex)
```

Take the editor, read the given value and set it in the model
