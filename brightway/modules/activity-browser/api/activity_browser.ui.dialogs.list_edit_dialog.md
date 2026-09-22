**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.dialogs.list_edit_dialog` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.dialogs.list_edit_dialog cfg.yml > activity_browser.ui.dialogs.list_edit_dialog.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.dialogs.list_edit_dialog"></a>

# activity\_browser.ui.dialogs.list\_edit\_dialog

<a id="activity_browser.ui.dialogs.list_edit_dialog.DragHandleDelegate"></a>

## DragHandleDelegate Objects

```python
class DragHandleDelegate(QtWidgets.QStyledItemDelegate)
```

Custom delegate that paints a drag handle icon on the left of each row.

This delegate adds a visual affordance (grip icon) to indicate that rows
can be reordered via drag-and-drop. The icon is painted in the left margin
of each list item.

<a id="activity_browser.ui.dialogs.list_edit_dialog.DragHandleDelegate.paint"></a>

#### paint

```python
def paint(painter, option, index)
```

Paint the item with a drag handle icon on the left side.

Parameters
----------
painter : QtGui.QPainter
    The painter to use for rendering.
option : QtWidgets.QStyleOptionViewItem
    Style options for the item.
index : QtCore.QModelIndex
    The model index of the item to paint.

<a id="activity_browser.ui.dialogs.list_edit_dialog.ABListEditDialog"></a>

## ABListEditDialog Objects

```python
class ABListEditDialog(QtWidgets.QDialog)
```

A dialog for editing a list or tuple of strings with drag-and-drop reordering.

Parameters
----------
data : iterable of str
    Initial values to populate the list.
title : str, optional
    Window title for the dialog. Default is "Edit List/Tuple".
parent : QtWidgets.QWidget, optional
    Parent widget for the dialog.

Examples
--------
>>> dialog = ABListEditDialog(["item1", "item2"], title="Edit Items")
>>> if dialog.exec_() == QtWidgets.QDialog.Accepted:
...     updated_items = dialog.get_data()

<a id="activity_browser.ui.dialogs.list_edit_dialog.ABListEditDialog.__init__"></a>

#### \_\_init\_\_

```python
def __init__(data, title="Edit List/Tuple", parent=None)
```

<a id="activity_browser.ui.dialogs.list_edit_dialog.ABListEditDialog.load_data"></a>

#### load\_data

```python
def load_data(data)
```

Load data into the list widget.

Populates the list with the provided values. If no data is provided,
adds a single empty row to guide the user.

Parameters
----------
data : iterable of str
    Values to populate the list with.

<a id="activity_browser.ui.dialogs.list_edit_dialog.ABListEditDialog.get_data"></a>

#### get\_data

```python
def get_data(as_tuple=False)
```

Retrieve the current list data, excluding empty rows.

Parameters
----------
as_tuple : bool, optional
    If True, return data as a tuple instead of a list. Default is False.

Returns
-------
list or tuple of str
    Non-empty string values from the list, in current display order.

<a id="activity_browser.ui.dialogs.list_edit_dialog.ABListEditDialog.add_item"></a>

#### add\_item

```python
def add_item()
```

Add a new empty item and immediately start editing it.

This method is connected to the inline add button. It creates a new row,
selects it, and opens it for editing, then repositions the floating buttons.

<a id="activity_browser.ui.dialogs.list_edit_dialog.ABListEditDialog.remove_selected"></a>

#### remove\_selected

```python
def remove_selected()
```

Remove the currently selected item from the list.

This method is connected to the inline remove button. After removal,
it ensures at least one empty row remains and adjusts the selection
to the next appropriate row.

<a id="activity_browser.ui.dialogs.list_edit_dialog.ABListEditDialog.on_item_changed"></a>

#### on\_item\_changed

```python
def on_item_changed(item: QtWidgets.QListWidgetItem)
```

Handle item text changes by normalizing whitespace.

Connected to the list widget's itemChanged signal. Collapses multiple
consecutive spaces into a single space to maintain clean data.

Parameters
----------
item : QtWidgets.QListWidgetItem
    The item that was changed.

<a id="activity_browser.ui.dialogs.list_edit_dialog.ABListEditDialog.eventFilter"></a>

#### eventFilter

```python
def eventFilter(obj, event)
```

Monitor viewport events to reposition floating buttons when needed.

Watches for resize, update, and paint events on the list viewport,
deferring button repositioning until after layout updates complete.

Parameters
----------
obj : QtCore.QObject
    The object being monitored (should be self.list.viewport()).
event : QtCore.QEvent
    The event that occurred.

Returns
-------
bool
    Result from the parent event filter.
