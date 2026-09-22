**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.central` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.central cfg.yml > activity_browser.ui.widgets.central.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.central"></a>

# activity\_browser.ui.widgets.central

<a id="activity_browser.ui.widgets.central.ABCentralPagesWidget"></a>

## ABCentralPagesWidget Objects

```python
class ABCentralPagesWidget(ABTabWidget)
```

A custom QTabWidget that manages groups of tabs and their associated pages.

This widget allows for organizing tabs into groups, dynamically adding pages to groups,
and ensuring that each page has a unique object name.

<a id="activity_browser.ui.widgets.central.ABCentralPagesWidget.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

Initialize the CentralTabWidget.

**Arguments**:

- `*args` - Additional positional arguments passed to the parent QTabWidget.
- `**kwargs` - Additional keyword arguments passed to the parent QTabWidget.

<a id="activity_browser.ui.widgets.central.ABCentralPagesWidget.groups"></a>

#### groups

```python
@property
def groups()
```

Retrieve all group widgets within the CentralTabWidget.

Groups are identified as instances of GroupTabWidget.

**Returns**:

- `dict` - A dictionary where keys are group object names and values are GroupTabWidget instances.

<a id="activity_browser.ui.widgets.central.ABCentralPagesWidget.addPage"></a>

#### addPage

```python
def addPage(page)
```

Add a page to the central tab widget.

**Arguments**:

- `page` _ABAbstractPage_ - The page to add to the central tab widget.
  

**Raises**:

- `ValueError` - If the page does not have an object name.

<a id="activity_browser.ui.widgets.central.ABCentralPagesWidget.addToGroup"></a>

#### addToGroup

```python
def addToGroup(group: str, page: ABAbstractPage)
```

Add a page to a specified group. If the group does not exist, it is created.

**Arguments**:

- `group` _str_ - The name of the group to which the page will be added.
- `page` _QtWidgets.QWidget_ - The page to add to the group.
  

**Raises**:

- `ValueError` - If the page does not have an object name.

<a id="activity_browser.ui.widgets.central.ABCentralPagesWidget.closeTab"></a>

#### closeTab

```python
def closeTab(index)
```

Handle the closing of a tab.

Deletes the widget associated with the tab and removes the tab from the widget.

**Arguments**:

- `index` _int_ - The index of the tab to be closed.

<a id="activity_browser.ui.widgets.central.ABCentralPagesWidget.onPageVisibilityChanged"></a>

#### onPageVisibilityChanged

```python
def onPageVisibilityChanged(visible: bool)
```

Handle changes in page visibility.

**Arguments**:

- `page` _ABAbstractPage_ - The page whose visibility has changed.
- `visible` _bool_ - True if the page is now visible, False otherwise.

<a id="activity_browser.ui.widgets.central.ABCentralPagesWidget.onPageWindowTitleChanged"></a>

#### onPageWindowTitleChanged

```python
def onPageWindowTitleChanged(title: str)
```

Handle changes in page window title.

**Arguments**:

- `title` _str_ - The new title of the page.

<a id="activity_browser.ui.widgets.central.GroupedPagesWidget"></a>

## GroupedPagesWidget Objects

```python
class GroupedPagesWidget(ABTabWidget)
```

A custom QTabWidget that represents a group of tabs.

This widget allows for managing tabs within a group, including making tabs movable,
closable, and handling their lifecycle when the project changes or tabs are closed.

<a id="activity_browser.ui.widgets.central.GroupedPagesWidget.__init__"></a>

#### \_\_init\_\_

```python
def __init__(name: str, *args)
```

Initialize the GroupTabWidget.

**Arguments**:

- `name` _str_ - The name of the group, used as the object name for the widget.
- `*args` - Additional positional arguments passed to the parent QTabWidget.

<a id="activity_browser.ui.widgets.central.GroupedPagesWidget.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

Connect signals to their respective handlers.

- Connects the `tabCloseRequested` signal to the `tabClosed` method.
- Connects the `project.changed` signal to the `deleteLater` method to clean up the widget.

<a id="activity_browser.ui.widgets.central.GroupedPagesWidget.addTab"></a>

#### addTab

```python
def addTab(widget, *args, **kwargs)
```

<a id="activity_browser.ui.widgets.central.GroupedPagesWidget.checkEmpty"></a>

#### checkEmpty

```python
def checkEmpty()
```

Check if the GroupTabWidget is empty (i.e., has no tabs).

If it is empty, delete the widget.

<a id="activity_browser.ui.widgets.central.GroupedPagesWidget.tabClosed"></a>

#### tabClosed

```python
def tabClosed(index)
```

Handle the closing of a tab.

Deletes the widget associated with the tab and removes the tab from the widget.
If no tabs remain, the entire GroupTabWidget is deleted.

**Arguments**:

- `index` _int_ - The index of the tab to be closed.
