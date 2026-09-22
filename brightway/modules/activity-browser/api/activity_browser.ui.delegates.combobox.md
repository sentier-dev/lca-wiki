**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.delegates.combobox` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.delegates.combobox cfg.yml > activity_browser.ui.delegates.combobox.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.delegates.combobox"></a>

# activity\_browser.ui.delegates.combobox

<a id="activity_browser.ui.delegates.combobox.ComboBoxItem"></a>

#### ComboBoxItem

<a id="activity_browser.ui.delegates.combobox.ComboBoxDelegate"></a>

## ComboBoxDelegate Objects

```python
class ComboBoxDelegate(QtWidgets.QStyledItemDelegate)
```

A combobox delegate for use where items are scoped to a list of items

<a id="activity_browser.ui.delegates.combobox.ComboBoxDelegate.__init__"></a>

#### \_\_init\_\_

```python
def __init__(item_source: Union[List[ComboBoxItem],
                                Callable[[], list[ComboBoxItem]]],
             parent=None)
```

**Arguments**:

- `item_source`: List of items to be shown in the combo box or a callable
returning the items, to allow the delegate to update the
list of items in the combobox.
An item can be:
    - a string
    - a display string - value string pair
    - a display string, value string and text color (QBrush) triple

<a id="activity_browser.ui.delegates.combobox.ComboBoxDelegate.set_early_commit_item"></a>

#### set\_early\_commit\_item

```python
def set_early_commit_item(item_text: str)
```

Set the early commit trigger.

<a id="activity_browser.ui.delegates.combobox.ComboBoxDelegate.createEditor"></a>

#### createEditor

```python
def createEditor(parent, option, index)
```

<a id="activity_browser.ui.delegates.combobox.ComboBoxDelegate.setEditorData"></a>

#### setEditorData

```python
def setEditorData(editor, index)
```

<a id="activity_browser.ui.delegates.combobox.ComboBoxDelegate.setModelData"></a>

#### setModelData

```python
def setModelData(editor, model, index)
```
