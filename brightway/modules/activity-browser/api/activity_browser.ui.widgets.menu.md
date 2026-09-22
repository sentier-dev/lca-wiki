**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.menu` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.menu cfg.yml > activity_browser.ui.widgets.menu.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.menu"></a>

# activity\_browser.ui.widgets.menu

<a id="activity_browser.ui.widgets.menu.ABMenu"></a>

## ABMenu Objects

```python
class ABMenu(QtWidgets.QMenu)
```

<a id="activity_browser.ui.widgets.menu.ABMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.ui.widgets.menu.ABMenu.title"></a>

#### title

<a id="activity_browser.ui.widgets.menu.ABMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(pos=None, parent=None, title: str = None)
```

<a id="activity_browser.ui.widgets.menu.ABMenu.add"></a>

#### add

```python
def add(action, *args, enable=True, text=None, **kwargs)
```

<a id="activity_browser.ui.widgets.menu.ABMenu.callback"></a>

#### callback

```python
def callback(text: str,
             func: Callable,
             args: list = None,
             kwargs: dict = None)
```
