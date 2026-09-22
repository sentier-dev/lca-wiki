**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.delegates.uncertainty` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.delegates.uncertainty cfg.yml > activity_browser.ui.delegates.uncertainty.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.delegates.uncertainty"></a>

# activity\_browser.ui.delegates.uncertainty

Uncertainty column: same flow as ``FloatDelegate`` — dialog widget, then ``model.setData``.

<a id="activity_browser.ui.delegates.uncertainty.UncertaintyDelegate"></a>

## UncertaintyDelegate Objects

```python
class UncertaintyDelegate(QtWidgets.QStyledItemDelegate)
```

Delegate for uncertainty-type cells.

<a id="activity_browser.ui.delegates.uncertainty.UncertaintyDelegate.displayText"></a>

#### displayText

```python
def displayText(value, locale)
```

<a id="activity_browser.ui.delegates.uncertainty.UncertaintyDelegate.createEditor"></a>

#### createEditor

```python
def createEditor(parent, option, index)
```

<a id="activity_browser.ui.delegates.uncertainty.UncertaintyDelegate.setEditorData"></a>

#### setEditorData

```python
def setEditorData(editor, index: QtCore.QModelIndex)
```

<a id="activity_browser.ui.delegates.uncertainty.UncertaintyDelegate.updateEditorGeometry"></a>

#### updateEditorGeometry

```python
def updateEditorGeometry(editor, option, index)
```

<a id="activity_browser.ui.delegates.uncertainty.UncertaintyDelegate.setModelData"></a>

#### setModelData

```python
def setModelData(editor: UncertaintyDialog, model: QtCore.QAbstractItemModel,
                 index: QtCore.QModelIndex)
```

Push accepted dialog values through the model like other delegates.
