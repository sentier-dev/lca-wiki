**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.delegates.viewonly` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.delegates.viewonly cfg.yml > activity_browser.ui.delegates.viewonly.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.delegates.viewonly"></a>

# activity\_browser.ui.delegates.viewonly

<a id="activity_browser.ui.delegates.viewonly.ViewOnlyDelegate"></a>

## ViewOnlyDelegate Objects

```python
class ViewOnlyDelegate(QStyledItemDelegate)
```

Disable the editor functionality to allow specific columns of an
editable table to be view-only.

<a id="activity_browser.ui.delegates.viewonly.ViewOnlyDelegate.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.ui.delegates.viewonly.ViewOnlyDelegate.displayText"></a>

#### displayText

```python
def displayText(value, locale)
```

<a id="activity_browser.ui.delegates.viewonly.ViewOnlyDelegate.createEditor"></a>

#### createEditor

```python
def createEditor(parent, option, index)
```

<a id="activity_browser.ui.delegates.viewonly.ViewOnlyFloatDelegate"></a>

## ViewOnlyFloatDelegate Objects

```python
class ViewOnlyFloatDelegate(FloatDelegate)
```

Correctly display float values without allowing modification.

<a id="activity_browser.ui.delegates.viewonly.ViewOnlyFloatDelegate.createEditor"></a>

#### createEditor

```python
def createEditor(parent, option, index)
```

<a id="activity_browser.ui.delegates.viewonly.ViewOnlyUncertaintyDelegate"></a>

## ViewOnlyUncertaintyDelegate Objects

```python
class ViewOnlyUncertaintyDelegate(UncertaintyDelegate)
```

Correctly display uncertainty type without allowing modification.

<a id="activity_browser.ui.delegates.viewonly.ViewOnlyUncertaintyDelegate.createEditor"></a>

#### createEditor

```python
def createEditor(parent, option, index)
```
