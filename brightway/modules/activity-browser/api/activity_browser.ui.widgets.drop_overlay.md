**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.drop_overlay` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.drop_overlay cfg.yml > activity_browser.ui.widgets.drop_overlay.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.drop_overlay"></a>

# activity\_browser.ui.widgets.drop\_overlay

<a id="activity_browser.ui.widgets.drop_overlay.ABDropOverlay"></a>

## ABDropOverlay Objects

```python
class ABDropOverlay(QtWidgets.QWidget)
```

<a id="activity_browser.ui.widgets.drop_overlay.ABDropOverlay.opacityMap"></a>

#### opacityMap

<a id="activity_browser.ui.widgets.drop_overlay.ABDropOverlay.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None, text="Drop here to create new exchanges")
```

<a id="activity_browser.ui.widgets.drop_overlay.ABDropOverlay.hovering"></a>

#### hovering

```python
def hovering() -> bool
```

<a id="activity_browser.ui.widgets.drop_overlay.ABDropOverlay.setOpacity"></a>

#### setOpacity

```python
def setOpacity(level: Literal["low", "medium", "high"])
```

<a id="activity_browser.ui.widgets.drop_overlay.ABDropOverlay.opacity"></a>

#### opacity

```python
def opacity()
```

<a id="activity_browser.ui.widgets.drop_overlay.ABDropOverlay.text"></a>

#### text

```python
def text()
```

<a id="activity_browser.ui.widgets.drop_overlay.ABDropOverlay.setText"></a>

#### setText

```python
def setText(text: str)
```

<a id="activity_browser.ui.widgets.drop_overlay.ABDropOverlay.showEvent"></a>

#### showEvent

```python
def showEvent(event)
```

<a id="activity_browser.ui.widgets.drop_overlay.ABDropOverlay.paintEvent"></a>

#### paintEvent

```python
def paintEvent(event)
```
