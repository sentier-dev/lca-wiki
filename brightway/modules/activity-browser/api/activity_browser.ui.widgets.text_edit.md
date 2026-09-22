**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.text_edit` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.text_edit cfg.yml > activity_browser.ui.widgets.text_edit.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.text_edit"></a>

# activity\_browser.ui.widgets.text\_edit

<a id="activity_browser.ui.widgets.text_edit.UnknownWordHighlighter"></a>

## UnknownWordHighlighter Objects

```python
class UnknownWordHighlighter(QSyntaxHighlighter)
```

<a id="activity_browser.ui.widgets.text_edit.UnknownWordHighlighter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: QTextDocument, known_words: set)
```

<a id="activity_browser.ui.widgets.text_edit.UnknownWordHighlighter.highlightBlock"></a>

#### highlightBlock

```python
def highlightBlock(text: str)
```

<a id="activity_browser.ui.widgets.text_edit.AutoCompleteDelegate"></a>

## AutoCompleteDelegate Objects

```python
class AutoCompleteDelegate(QStyledItemDelegate)
```

<a id="activity_browser.ui.widgets.text_edit.AutoCompleteDelegate.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.ui.widgets.text_edit.AutoCompleteDelegate.paint"></a>

#### paint

```python
def paint(painter, option, index)
```

<a id="activity_browser.ui.widgets.text_edit.ABTextEdit"></a>

## ABTextEdit Objects

```python
class ABTextEdit(QtWidgets.QTextEdit)
```

<a id="activity_browser.ui.widgets.text_edit.ABTextEdit.textChangedDebounce"></a>

#### textChangedDebounce

<a id="activity_browser.ui.widgets.text_edit.ABTextEdit.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="activity_browser.ui.widgets.text_edit.ABTextEdit.debounce"></a>

#### debounce

```python
def debounce()
```

<a id="activity_browser.ui.widgets.text_edit.ABTextEdit.setDebounce"></a>

#### setDebounce

```python
def setDebounce(ms: int)
```

<a id="activity_browser.ui.widgets.text_edit.ABAutoCompleTextEdit"></a>

## ABAutoCompleTextEdit Objects

```python
class ABAutoCompleTextEdit(ABTextEdit)
```

<a id="activity_browser.ui.widgets.text_edit.ABAutoCompleTextEdit.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None, highlight_unknown=False)
```

<a id="activity_browser.ui.widgets.text_edit.ABAutoCompleTextEdit.keyPressEvent"></a>

#### keyPressEvent

```python
def keyPressEvent(event)
```

<a id="activity_browser.ui.widgets.text_edit.MetaDataAutoCompleteTextEdit"></a>

## MetaDataAutoCompleteTextEdit Objects

```python
class MetaDataAutoCompleteTextEdit(ABAutoCompleTextEdit)
```

TextEdit with MetaDataStore completer attached.

<a id="activity_browser.ui.widgets.text_edit.MetaDataAutoCompleteTextEdit.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```
