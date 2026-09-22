**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.abstract_pane` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.abstract_pane cfg.yml > activity_browser.ui.widgets.abstract_pane.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.abstract_pane"></a>

# activity\_browser.ui.widgets.abstract\_pane

<a id="activity_browser.ui.widgets.abstract_pane.ABAbstractPane"></a>

## ABAbstractPane Objects

```python
class ABAbstractPane(QtWidgets.QWidget)
```

<a id="activity_browser.ui.widgets.abstract_pane.ABAbstractPane.title"></a>

#### title

<a id="activity_browser.ui.widgets.abstract_pane.ABAbstractPane.name"></a>

#### name

<a id="activity_browser.ui.widgets.abstract_pane.ABAbstractPane.unique"></a>

#### unique

whether the pane is unique in the application

<a id="activity_browser.ui.widgets.abstract_pane.ABAbstractPane.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: ABMainWindow)
```

<a id="activity_browser.ui.widgets.abstract_pane.ABAbstractPane.parent"></a>

#### parent

```python
def parent() -> ABMainWindow
```

<a id="activity_browser.ui.widgets.abstract_pane.ABAbstractPane.hide"></a>

#### hide

```python
def hide()
```

Hide the pane's dock widget.

<a id="activity_browser.ui.widgets.abstract_pane.ABAbstractPane.getDockWidget"></a>

#### getDockWidget

```python
def getDockWidget()
```

<a id="activity_browser.ui.widgets.abstract_pane.ABAbstractPane.toggleViewAction"></a>

#### toggleViewAction

```python
def toggleViewAction()
```

Create a toggle view action for this pane.

**Returns**:

- `QtWidgets.QAction` - The toggle view action for this pane.

<a id="activity_browser.ui.widgets.abstract_pane.ABAbstractPane.sync"></a>

#### sync

```python
def sync()
```

Synchronize the pane with the current state of Brightway.
