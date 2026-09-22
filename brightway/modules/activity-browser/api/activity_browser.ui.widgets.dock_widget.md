**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.dock_widget` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.dock_widget cfg.yml > activity_browser.ui.widgets.dock_widget.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.dock_widget"></a>

# activity\_browser.ui.widgets.dock\_widget

<a id="activity_browser.ui.widgets.dock_widget.HideMode"></a>

## HideMode Objects

```python
class HideMode()
```

<a id="activity_browser.ui.widgets.dock_widget.HideMode.Close"></a>

#### Close

<a id="activity_browser.ui.widgets.dock_widget.HideMode.Hide"></a>

#### Hide

<a id="activity_browser.ui.widgets.dock_widget.ABDockWidget"></a>

## ABDockWidget Objects

```python
class ABDockWidget(QtWidgets.QDockWidget)
```

<a id="activity_browser.ui.widgets.dock_widget.ABDockWidget.updatingTabBar"></a>

#### updatingTabBar

<a id="activity_browser.ui.widgets.dock_widget.ABDockWidget.HideMode"></a>

#### HideMode

<a id="activity_browser.ui.widgets.dock_widget.ABDockWidget.__init__"></a>

#### \_\_init\_\_

```python
def __init__(title: str,
             parent: QtWidgets.QMainWindow,
             mode=HideMode.Close) -> None
```

<a id="activity_browser.ui.widgets.dock_widget.ABDockWidget.setWidget"></a>

#### setWidget

```python
def setWidget(widget)
```

<a id="activity_browser.ui.widgets.dock_widget.ABDockWidget.button"></a>

#### button

```python
def button()
```

<a id="activity_browser.ui.widgets.dock_widget.TitleBar"></a>

## TitleBar Objects

```python
class TitleBar(QtWidgets.QWidget)
```

<a id="activity_browser.ui.widgets.dock_widget.TitleBar.__init__"></a>

#### \_\_init\_\_

```python
def __init__(title: str, button, parent=None)
```

<a id="activity_browser.ui.widgets.dock_widget.TitleBar.set_button"></a>

#### set\_button

```python
def set_button(button)
```
