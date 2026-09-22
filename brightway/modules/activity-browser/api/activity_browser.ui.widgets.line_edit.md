**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.line_edit` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.line_edit cfg.yml > activity_browser.ui.widgets.line_edit.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.line_edit"></a>

# activity\_browser.ui.widgets.line\_edit

<a id="activity_browser.ui.widgets.line_edit.ABLineEdit"></a>

## ABLineEdit Objects

```python
class ABLineEdit(QtWidgets.QLineEdit)
```

<a id="activity_browser.ui.widgets.line_edit.ABLineEdit.textChangedDebounce"></a>

#### textChangedDebounce

<a id="activity_browser.ui.widgets.line_edit.ABLineEdit.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="activity_browser.ui.widgets.line_edit.ABLineEdit.debounce"></a>

#### debounce

```python
def debounce()
```

<a id="activity_browser.ui.widgets.line_edit.ABLineEdit.setDebounce"></a>

#### setDebounce

```python
def setDebounce(ms: int)
```

<a id="activity_browser.ui.widgets.line_edit.SignalledLineEdit"></a>

## SignalledLineEdit Objects

```python
class SignalledLineEdit(QtWidgets.QLineEdit)
```

Adapted from http://stackoverflow.com/questions/12182133/PyQt5-combine-textchanged-and-editingfinished-for-qlineedit

<a id="activity_browser.ui.widgets.line_edit.SignalledLineEdit.__init__"></a>

#### \_\_init\_\_

```python
def __init__(key, field, contents="", parent=None)
```

<a id="activity_browser.ui.widgets.line_edit.SignalledPlainTextEdit"></a>

## SignalledPlainTextEdit Objects

```python
class SignalledPlainTextEdit(QtWidgets.QPlainTextEdit)
```

Adapted from https://john.nachtimwald.com/2009/08/19/better-qplaintextedit-with-line-numbers/

<a id="activity_browser.ui.widgets.line_edit.SignalledPlainTextEdit.__init__"></a>

#### \_\_init\_\_

```python
def __init__(key: tuple, field: str, contents: str = "", parent=None)
```

<a id="activity_browser.ui.widgets.line_edit.SignalledPlainTextEdit.highlight"></a>

#### highlight

```python
@Slot(name="highlight")
def highlight()
```

<a id="activity_browser.ui.widgets.line_edit.SignalledPlainTextEdit.focusOutEvent"></a>

#### focusOutEvent

```python
def focusOutEvent(event)
```

<a id="activity_browser.ui.widgets.line_edit.SignalledPlainTextEdit.refresh_text"></a>

#### refresh\_text

```python
def refresh_text(text: str) -> None
```

<a id="activity_browser.ui.widgets.line_edit.SignalledComboEdit"></a>

## SignalledComboEdit Objects

```python
class SignalledComboEdit(QtWidgets.QComboBox)
```

Based on SignalledPlainTextEdit.

Could be moved to new file. Or better: this file renamed to be more inclusive
needed to effectively implement the location dropdown list

<a id="activity_browser.ui.widgets.line_edit.SignalledComboEdit.__init__"></a>

#### \_\_init\_\_

```python
def __init__(key, field, contents="", parent=None)
```

<a id="activity_browser.ui.widgets.line_edit.SignalledComboEdit.focusOutEvent"></a>

#### focusOutEvent

```python
def focusOutEvent(event)
```
