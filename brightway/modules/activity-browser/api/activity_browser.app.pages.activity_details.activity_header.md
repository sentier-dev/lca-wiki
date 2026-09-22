**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.activity_details.activity_header` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.activity_details.activity_header cfg.yml > activity_browser.app.pages.activity_details.activity_header.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.activity_details.activity_header"></a>

# activity\_browser.app.pages.activity\_details.activity\_header

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityHeader"></a>

## ActivityHeader Objects

```python
class ActivityHeader(QtWidgets.QWidget)
```

A widget that displays the header information of a specific activity.

**Attributes**:

- `DATABASE_DEFINED_ALLOCATION` _str_ - Constant for database default allocation.
- `CUSTOM_ALLOCATION` _str_ - Constant for custom allocation.
- `activity` _bd.Node_ - The activity to display the header for.

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityHeader.DATABASE_DEFINED_ALLOCATION"></a>

#### DATABASE\_DEFINED\_ALLOCATION

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityHeader.CUSTOM_ALLOCATION"></a>

#### CUSTOM\_ALLOCATION

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityHeader.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: QtWidgets.QWidget)
```

Initializes the ActivityHeader widget.

**Arguments**:

- `parent` _QtWidgets.QWidget_ - The parent widget.

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityHeader.sync"></a>

#### sync

```python
def sync()
```

Synchronizes the widget with the current state of the activity.

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityHeader.clear_layout"></a>

#### clear\_layout

```python
def clear_layout(layout: QtWidgets.QLayout = None)
```

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityHeader.build_grid"></a>

#### build\_grid

```python
def build_grid() -> QtWidgets.QGridLayout
```

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityHeader.activity_name"></a>

#### activity\_name

```python
def activity_name() -> str
```

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityName"></a>

## ActivityName Objects

```python
class ActivityName(QtWidgets.QLineEdit)
```

A widget that displays and edits the name of the activity.

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityName.__init__"></a>

#### \_\_init\_\_

```python
def __init__(header: ActivityHeader)
```

Initializes the ActivityName widget.

**Arguments**:

- `header` _ActivityHeader_ - Header owning the activity (Qt parent may be a row widget).

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityName.change_name"></a>

#### change\_name

```python
def change_name()
```

Changes the name of the activity if it has been modified.

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityNameReadOnly"></a>

## ActivityNameReadOnly Objects

```python
class ActivityNameReadOnly(QtWidgets.QLabel)
```

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityNameReadOnly.__init__"></a>

#### \_\_init\_\_

```python
def __init__(header: ActivityHeader)
```

<a id="activity_browser.app.pages.activity_details.activity_header.DatabaseLockIconLabel"></a>

## DatabaseLockIconLabel Objects

```python
class DatabaseLockIconLabel(QtWidgets.QLabel)
```

Lock pixmap that unlocks the activity's database on double-click.

<a id="activity_browser.app.pages.activity_details.activity_header.DatabaseLockIconLabel.__init__"></a>

#### \_\_init\_\_

```python
def __init__(header: ActivityHeader, parent: QtWidgets.QWidget | None = None)
```

<a id="activity_browser.app.pages.activity_details.activity_header.DatabaseLockIconLabel.mouseDoubleClickEvent"></a>

#### mouseDoubleClickEvent

```python
def mouseDoubleClickEvent(event: QtGui.QMouseEvent) -> None
```

<a id="activity_browser.app.pages.activity_details.activity_header.UnlockedProcessTitleRow"></a>

## UnlockedProcessTitleRow Objects

```python
class UnlockedProcessTitleRow(QtWidgets.QWidget)
```

Editable process title row (width follows text); vertically aligns with the process icon.

<a id="activity_browser.app.pages.activity_details.activity_header.UnlockedProcessTitleRow.__init__"></a>

#### \_\_init\_\_

```python
def __init__(header: ActivityHeader)
```

<a id="activity_browser.app.pages.activity_details.activity_header.LockedProcessTitleRow"></a>

## LockedProcessTitleRow Objects

```python
class LockedProcessTitleRow(QtWidgets.QWidget)
```

Read-only process title with lock affordance when the database is read-only.

<a id="activity_browser.app.pages.activity_details.activity_header.LockedProcessTitleRow.__init__"></a>

#### \_\_init\_\_

```python
def __init__(header: ActivityHeader)
```

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityLocation"></a>

## ActivityLocation Objects

```python
class ActivityLocation(QtWidgets.QLineEdit)
```

A widget that displays and edits the location of the activity.

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityLocation.__init__"></a>

#### \_\_init\_\_

```python
def __init__(header: ActivityHeader)
```

Initializes the ActivityLocation widget.

**Arguments**:

- `header` _ActivityHeader_ - Header owning the activity (Qt parent may be a row widget).

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityLocation.focusInEvent"></a>

#### focusInEvent

```python
def focusInEvent(event: QtGui.QFocusEvent) -> None
```

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityLocation.focusOutEvent"></a>

#### focusOutEvent

```python
def focusOutEvent(event: QtGui.QFocusEvent) -> None
```

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityLocation.change_location"></a>

#### change\_location

```python
def change_location()
```

Changes the location of the activity if it has been modified.

<a id="activity_browser.app.pages.activity_details.activity_header.LocationDatabaseRowWidget"></a>

## LocationDatabaseRowWidget Objects

```python
class LocationDatabaseRowWidget(QtWidgets.QWidget)
```

A widget that puts location and database widgets into one row

<a id="activity_browser.app.pages.activity_details.activity_header.LocationDatabaseRowWidget.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: ActivityHeader, disabled: bool = False)
```

<a id="activity_browser.app.pages.activity_details.activity_header.AllocationAndPropertiesRow"></a>

## AllocationAndPropertiesRow Objects

```python
class AllocationAndPropertiesRow(QtWidgets.QWidget)
```

A widget that puts Allocation and Properties widgets into one row.
Used only for multifunctional processes.
The allocation icon is the grid's leading cell — not repeated here.

<a id="activity_browser.app.pages.activity_details.activity_header.AllocationAndPropertiesRow.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: ActivityHeader, disabled: bool = False)
```

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityProperties"></a>

## ActivityProperties Objects

```python
class ActivityProperties(QtWidgets.QWidget)
```

A widget that displays and edits the properties of the activity.

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityProperties.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: ActivityHeader, disabled: bool = False)
```

Initializes the ActivityProperties widget.

**Arguments**:

- `parent` _ActivityHeader_ - The parent widget.

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityProperty"></a>

## ActivityProperty Objects

```python
class ActivityProperty(QtWidgets.QPushButton)
```

A widget that represents a single property of the activity.

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityProperty.__init__"></a>

#### \_\_init\_\_

```python
def __init__(activity, property_name)
```

Initializes the ActivityProperty widget.

**Arguments**:

- `activity` _bd.Node_ - The activity to which the property belongs.
- `property_name` _str_ - The name of the property.

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityProperty.mouseReleaseEvent"></a>

#### mouseReleaseEvent

```python
def mouseReleaseEvent(e)
```

Handles the mouse release event to show the context menu.

**Arguments**:

- `e` - The mouse release event.

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityAllocation"></a>

## ActivityAllocation Objects

```python
class ActivityAllocation(QtWidgets.QComboBox)
```

A widget that displays and edits the allocation strategy of the activity.

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityAllocation.__init__"></a>

#### \_\_init\_\_

```python
def __init__(header: ActivityHeader)
```

Initializes the ActivityAllocation widget.

**Arguments**:

- `header` _ActivityHeader_ - Header owning the activity (Qt parent may be a row widget).

<a id="activity_browser.app.pages.activity_details.activity_header.ActivityAllocation.change_allocation"></a>

#### change\_allocation

```python
def change_allocation(allocation: str)
```

Changes the allocation strategy of the activity if it has been modified.

**Arguments**:

- `allocation` _str_ - The new allocation strategy.
