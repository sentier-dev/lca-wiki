**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.formula_edit` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.formula_edit cfg.yml > activity_browser.ui.widgets.formula_edit.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.formula_edit"></a>

# activity\_browser.ui.widgets.formula\_edit

<a id="activity_browser.ui.widgets.formula_edit.operators"></a>

#### operators

<a id="activity_browser.ui.widgets.formula_edit.pattern"></a>

#### pattern

<a id="activity_browser.ui.widgets.formula_edit.TOKEN_REGEX"></a>

#### TOKEN\_REGEX

<a id="activity_browser.ui.widgets.formula_edit.tokenize"></a>

#### tokenize

```python
def tokenize(expression: str)
```

<a id="activity_browser.ui.widgets.formula_edit.table"></a>

#### table

<a id="activity_browser.ui.widgets.formula_edit.parameters"></a>

#### parameters

<a id="activity_browser.ui.widgets.formula_edit.Colors"></a>

## Colors Objects

```python
class Colors()
```

<a id="activity_browser.ui.widgets.formula_edit.Colors.builtin"></a>

#### builtin

<a id="activity_browser.ui.widgets.formula_edit.Colors.number"></a>

#### number

<a id="activity_browser.ui.widgets.formula_edit.Colors.variable"></a>

#### variable

<a id="activity_browser.ui.widgets.formula_edit.Colors.string"></a>

#### string

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit"></a>

## ABFormulaEdit Objects

```python
class ABFormulaEdit(QWidget)
```

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None, scope=None, text=None, simple=False)
```

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.text"></a>

#### text

```python
@property
def text()
```

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.text"></a>

#### text

```python
@text.setter
def text(value)
```

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.pos_to_token_index"></a>

#### pos\_to\_token\_index

```python
def pos_to_token_index(pos: int) -> int
```

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.token_at_cursor"></a>

#### token\_at\_cursor

```python
def token_at_cursor()
```

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.update_completer"></a>

#### update\_completer

```python
def update_completer()
```

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.insert_completion"></a>

#### insert\_completion

```python
def insert_completion(completion)
```

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.toggle_cursor"></a>

#### toggle\_cursor

```python
def toggle_cursor()
```

Toggles cursor visibility for blinking effect.

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.keyPressEvent"></a>

#### keyPressEvent

```python
def keyPressEvent(event)
```

Handles key press events for text input, cursor movement, and selection.

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.copy_to_clipboard"></a>

#### copy\_to\_clipboard

```python
def copy_to_clipboard()
```

Copies selected text to the clipboard.

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.paste_from_clipboard"></a>

#### paste\_from\_clipboard

```python
def paste_from_clipboard()
```

Pastes text from the clipboard at the cursor position.

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.select_all"></a>

#### select\_all

```python
def select_all()
```

Selects all text.

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.move_cursor"></a>

#### move\_cursor

```python
def move_cursor(step)
```

Moves the cursor without selection.

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.adjust_selection"></a>

#### adjust\_selection

```python
def adjust_selection(step)
```

Adjusts selection range while moving the cursor.

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.delete_selected_text"></a>

#### delete\_selected\_text

```python
def delete_selected_text()
```

Deletes selected text.

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.adjust_scroll"></a>

#### adjust\_scroll

```python
def adjust_scroll()
```

Adjusts the scroll position to keep the cursor visible.

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.get_cursor_position_from_x"></a>

#### get\_cursor\_position\_from\_x

```python
def get_cursor_position_from_x(x)
```

Gets the cursor index based on the mouse click position.

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.mousePressEvent"></a>

#### mousePressEvent

```python
def mousePressEvent(event)
```

Handles mouse click events to set cursor position and start selection.

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.mouseMoveEvent"></a>

#### mouseMoveEvent

```python
def mouseMoveEvent(event)
```

Handles mouse dragging for text selection.

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.mouseReleaseEvent"></a>

#### mouseReleaseEvent

```python
def mouseReleaseEvent(event)
```

Stops selection when the mouse is released.

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.resizeEvent"></a>

#### resizeEvent

```python
def resizeEvent(event)
```

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.paintEvent"></a>

#### paintEvent

```python
def paintEvent(event)
```

Handles drawing the text input field, cursor, and selection.

<a id="activity_browser.ui.widgets.formula_edit.ABFormulaEdit.paint_text"></a>

#### paint\_text

```python
def paint_text(painter: QPainter)
```

<a id="activity_browser.ui.widgets.formula_edit.CompleterModel"></a>

## CompleterModel Objects

```python
class CompleterModel(QAbstractTableModel)
```

<a id="activity_browser.ui.widgets.formula_edit.CompleterModel.__init__"></a>

#### \_\_init\_\_

```python
def __init__(data: dict, font: QFont, parent=None)
```

<a id="activity_browser.ui.widgets.formula_edit.CompleterModel.rowCount"></a>

#### rowCount

```python
def rowCount(parent=QModelIndex())
```

<a id="activity_browser.ui.widgets.formula_edit.CompleterModel.columnCount"></a>

#### columnCount

```python
def columnCount(parent=QModelIndex())
```

<a id="activity_browser.ui.widgets.formula_edit.CompleterModel.data"></a>

#### data

```python
def data(index, role=Qt.DisplayRole)
```

<a id="activity_browser.ui.widgets.formula_edit.CompleterModel.headerData"></a>

#### headerData

```python
def headerData(section, orientation, role=Qt.DisplayRole)
```

<a id="activity_browser.ui.widgets.formula_edit.CompleterView"></a>

## CompleterView Objects

```python
class CompleterView(QTableView)
```

<a id="activity_browser.ui.widgets.formula_edit.CompleterView.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="activity_browser.ui.widgets.formula_edit.CompleterView.setModel"></a>

#### setModel

```python
def setModel(model)
```

<a id="activity_browser.ui.widgets.formula_edit.CompleterView.resize_on_reset"></a>

#### resize\_on\_reset

```python
def resize_on_reset()
```

<a id="activity_browser.ui.widgets.formula_edit.draw_error_line"></a>

#### draw\_error\_line

```python
def draw_error_line(painter, x, y, w)
```

<a id="activity_browser.ui.widgets.formula_edit.text_index_to_x"></a>

#### text\_index\_to\_x

```python
def text_index_to_x(text, index, fm: QFontMetrics)
```

<a id="activity_browser.ui.widgets.formula_edit.is_valid_number"></a>

#### is\_valid\_number

```python
def is_valid_number(string)
```
