**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.delegates.property` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.delegates.property cfg.yml > activity_browser.ui.delegates.property.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.delegates.property"></a>

# activity\_browser.ui.delegates.property

<a id="activity_browser.ui.delegates.property.PropertyDelegate"></a>

## PropertyDelegate Objects

```python
class PropertyDelegate(QtWidgets.QStyledItemDelegate)
```

A delegate for displaying and editing property values in the tree view.

<a id="activity_browser.ui.delegates.property.PropertyDelegate.displayText"></a>

#### displayText

```python
def displayText(value, locale)
```

Returns the display text for the given value.

**Arguments**:

- `value` - The value to display.
- `locale` - The locale to use for formatting.
  

**Returns**:

- `str` - The display text.

<a id="activity_browser.ui.delegates.property.PropertyDelegate.createEditor"></a>

#### createEditor

```python
def createEditor(parent, option, index)
```

Creates an editor for the given index.

**Arguments**:

- `parent` - The parent widget.
- `option` - The style options.
- `index` - The index to edit.
  

**Returns**:

- `QtWidgets.QLineEdit` - The editor widget.

<a id="activity_browser.ui.delegates.property.PropertyDelegate.setEditorData"></a>

#### setEditorData

```python
def setEditorData(editor: QtWidgets.QLineEdit, index: QtCore.QModelIndex)
```

Populates the editor with data if editing an existing field.

**Arguments**:

- `editor` _QtWidgets.QLineEdit_ - The editor widget.
- `index` _QtCore.QModelIndex_ - The index to edit.

<a id="activity_browser.ui.delegates.property.PropertyDelegate.setModelData"></a>

#### setModelData

```python
def setModelData(editor: QtWidgets.QLineEdit, model: QtCore.QAbstractItemModel,
                 index: QtCore.QModelIndex)
```

Takes the editor, reads the given value, and sets it in the model.

**Arguments**:

- `editor` _QtWidgets.QLineEdit_ - The editor widget.
- `model` _QtCore.QAbstractItemModel_ - The model to update.
- `index` _QtCore.QModelIndex_ - The index to update.
