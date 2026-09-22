**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.delegates.json` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.delegates.json cfg.yml > activity_browser.ui.delegates.json.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.delegates.json"></a>

# activity\_browser.ui.delegates.json

<a id="activity_browser.ui.delegates.json.JSONDelegate"></a>

## JSONDelegate Objects

```python
class JSONDelegate(QtWidgets.QStyledItemDelegate)
```

JSON Editor that supports multiple types (int, float, string, date (string))
Assumes that the

<a id="activity_browser.ui.delegates.json.JSONDelegate.__init__"></a>

#### \_\_init\_\_

```python
def __init__(type_column: Optional[int] = None, parent=None)
```

**Arguments**:

- `type_column`: column index of the type column

<a id="activity_browser.ui.delegates.json.JSONDelegate.createEditor"></a>

#### createEditor

```python
def createEditor(parent, option, index)
```

<a id="activity_browser.ui.delegates.json.JSONDelegate.setEditorData"></a>

#### setEditorData

```python
def setEditorData(editor, index)
```

<a id="activity_browser.ui.delegates.json.JSONDelegate.setModelData"></a>

#### setModelData

```python
def setModelData(editor: QtWidgets.QLineEdit, model: QtCore.QAbstractItemModel,
                 index: QtCore.QModelIndex)
```

Take the editor, read the given value and set it in the model
