**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.main_window` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.main_window cfg.yml > activity_browser.ui.widgets.main_window.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.main_window"></a>

# activity\_browser.ui.widgets.main\_window

<a id="activity_browser.ui.widgets.main_window.ABMainWindow"></a>

## ABMainWindow Objects

```python
class ABMainWindow(QtWidgets.QMainWindow)
```

<a id="activity_browser.ui.widgets.main_window.ABMainWindow.__new__"></a>

#### \_\_new\_\_

```python
def __new__(cls)
```

<a id="activity_browser.ui.widgets.main_window.ABMainWindow.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.ui.widgets.main_window.ABMainWindow.clearPanes"></a>

#### clearPanes

```python
def clearPanes()
```

<a id="activity_browser.ui.widgets.main_window.ABMainWindow.addPane"></a>

#### addPane

```python
def addPane(pane: "ABAbstractPane",
            area=QtCore.Qt.DockWidgetArea.LeftDockWidgetArea)
```

Add a pane to the main window as a dock widget.

<a id="activity_browser.ui.widgets.main_window.ABMainWindow.panes"></a>

#### panes

```python
def panes()
```

Return a list of all panes in the main window.
