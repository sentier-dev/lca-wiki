**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.tab_widget` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.tab_widget cfg.yml > activity_browser.ui.widgets.tab_widget.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.tab_widget"></a>

# activity\_browser.ui.widgets.tab\_widget

<a id="activity_browser.ui.widgets.tab_widget.ABTabBar"></a>

## ABTabBar Objects

```python
class ABTabBar(QtWidgets.QTabBar)
```

<a id="activity_browser.ui.widgets.tab_widget.ABTabBar.minimumTabSizeHint"></a>

#### minimumTabSizeHint

```python
def minimumTabSizeHint(index)
```

<a id="activity_browser.ui.widgets.tab_widget.ABTabWidget"></a>

## ABTabWidget Objects

```python
class ABTabWidget(QtWidgets.QTabWidget)
```

<a id="activity_browser.ui.widgets.tab_widget.ABTabWidget.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

Initialize the GroupTabWidget.

**Arguments**:

- `name` _str_ - The name of the group, used as the object name for the widget.
- `*args` - Additional positional arguments passed to the parent QTabWidget.

<a id="activity_browser.ui.widgets.tab_widget.ABTabWidget.addTab"></a>

#### addTab

```python
def addTab(widget, label, show_minimize=False)
```

Override addTab to add custom buttons to each tab.

**Arguments**:

- `widget` - The widget to add as a tab
- `label` - The label for the tab
- `show_minimize` - If True, show minimize button; if False, show close button

<a id="activity_browser.ui.widgets.tab_widget.ABTabWidget.insertTab"></a>

#### insertTab

```python
def insertTab(index, widget, label, show_minimize=False)
```

Override insertTab to add custom buttons to each tab.

**Arguments**:

- `index` - The index at which to insert the tab
- `widget` - The widget to add as a tab
- `label` - The label for the tab
- `show_minimize` - If True, show minimize button; if False, show close button

<a id="activity_browser.ui.widgets.tab_widget.ABTabWidget.closeTabByWidget"></a>

#### closeTabByWidget

```python
def closeTabByWidget(widget)
```

Handle close button click using the widget reference.
