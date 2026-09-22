**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.combobox` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.combobox cfg.yml > activity_browser.ui.widgets.combobox.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.combobox"></a>

# activity\_browser.ui.widgets.combobox

<a id="activity_browser.ui.widgets.combobox.apply_lca_combo_width"></a>

#### apply\_lca\_combo\_width

```python
def apply_lca_combo_width(combo: QComboBox) -> None
```

Cap combo width for compact LCA Results selectors.

<a id="activity_browser.ui.widgets.combobox.CheckableComboBox"></a>

## CheckableComboBox Objects

```python
class CheckableComboBox(QComboBox)
```

<a id="activity_browser.ui.widgets.combobox.CheckableComboBox.onHidePopup"></a>

#### onHidePopup

<a id="activity_browser.ui.widgets.combobox.CheckableComboBox.Delegate"></a>

## Delegate Objects

```python
class Delegate(QStyledItemDelegate)
```

<a id="activity_browser.ui.widgets.combobox.CheckableComboBox.Delegate.sizeHint"></a>

#### sizeHint

```python
def sizeHint(option, index)
```

<a id="activity_browser.ui.widgets.combobox.CheckableComboBox.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="activity_browser.ui.widgets.combobox.CheckableComboBox.resizeEvent"></a>

#### resizeEvent

```python
def resizeEvent(event)
```

<a id="activity_browser.ui.widgets.combobox.CheckableComboBox.eventFilter"></a>

#### eventFilter

```python
def eventFilter(object, event)
```

<a id="activity_browser.ui.widgets.combobox.CheckableComboBox.showPopup"></a>

#### showPopup

```python
def showPopup()
```

<a id="activity_browser.ui.widgets.combobox.CheckableComboBox.hidePopup"></a>

#### hidePopup

```python
def hidePopup()
```

<a id="activity_browser.ui.widgets.combobox.CheckableComboBox.timerEvent"></a>

#### timerEvent

```python
def timerEvent(event)
```

<a id="activity_browser.ui.widgets.combobox.CheckableComboBox.updateText"></a>

#### updateText

```python
def updateText()
```

<a id="activity_browser.ui.widgets.combobox.CheckableComboBox.addItem"></a>

#### addItem

```python
def addItem(text, data=None)
```

<a id="activity_browser.ui.widgets.combobox.CheckableComboBox.addItems"></a>

#### addItems

```python
def addItems(texts, datalist=None)
```

<a id="activity_browser.ui.widgets.combobox.CheckableComboBox.currentData"></a>

#### currentData

```python
def currentData()
```

<a id="activity_browser.ui.widgets.combobox.ABComboBox"></a>

## ABComboBox Objects

```python
class ABComboBox(QComboBox)
```

<a id="activity_browser.ui.widgets.combobox.ABComboBox.get_database_combobox"></a>

#### get\_database\_combobox

```python
@classmethod
def get_database_combobox(cls, parent=None)
```
