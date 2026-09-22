**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.impact_category_details.impact_category_header` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.impact_category_details.impact_category_header cfg.yml > activity_browser.app.pages.impact_category_details.impact_category_header.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.impact_category_details.impact_category_header"></a>

# activity\_browser.app.pages.impact\_category\_details.impact\_category\_header

<a id="activity_browser.app.pages.impact_category_details.impact_category_header.ImpactCategoryHeader"></a>

## ImpactCategoryHeader Objects

```python
class ImpactCategoryHeader(QtWidgets.QWidget)
```

<a id="activity_browser.app.pages.impact_category_details.impact_category_header.ImpactCategoryHeader.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: QtWidgets.QWidget)
```

Initializes the ImpactCategoryHeader widget with a stack layout
that switches between editable and view-only headers.

**Arguments**:

- `parent` _QtWidgets.QWidget_ - The parent widget.

<a id="activity_browser.app.pages.impact_category_details.impact_category_header.ImpactCategoryHeader.sync"></a>

#### sync

```python
def sync()
```

Synchronizes the widget with the current state of the impact category.
Switches between editable and view-only headers based on edit mode.

<a id="activity_browser.app.pages.impact_category_details.impact_category_header.ImpactCategoryHeader.on_editable_changed"></a>

#### on\_editable\_changed

```python
def on_editable_changed()
```

Called when the edit button is clicked.
Notifies the parent page to update the view accordingly.

<a id="activity_browser.app.pages.impact_category_details.impact_category_header.ViewOnlyHeader"></a>

## ViewOnlyHeader Objects

```python
class ViewOnlyHeader(QtWidgets.QWidget)
```

A read-only header widget that displays impact category information.

<a id="activity_browser.app.pages.impact_category_details.impact_category_header.ViewOnlyHeader.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: ImpactCategoryHeader)
```

Initializes the view-only header.

**Arguments**:

- `parent` _ImpactCategoryHeader_ - The parent header widget.

<a id="activity_browser.app.pages.impact_category_details.impact_category_header.ViewOnlyHeader.sync"></a>

#### sync

```python
def sync()
```

Updates the displayed information from the current impact category.

<a id="activity_browser.app.pages.impact_category_details.impact_category_header.EditableHeader"></a>

## EditableHeader Objects

```python
class EditableHeader(QtWidgets.QWidget)
```

An editable header widget that allows modifying impact category information.

<a id="activity_browser.app.pages.impact_category_details.impact_category_header.EditableHeader.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: ImpactCategoryHeader)
```

Initializes the editable header.

**Arguments**:

- `parent` _ImpactCategoryHeader_ - The parent header widget.

<a id="activity_browser.app.pages.impact_category_details.impact_category_header.EditableHeader.sync"></a>

#### sync

```python
def sync()
```

Updates the displayed information from the current impact category.

<a id="activity_browser.app.pages.impact_category_details.impact_category_header.ImpactCategoryUnit"></a>

## ImpactCategoryUnit Objects

```python
class ImpactCategoryUnit(QtWidgets.QLineEdit)
```

A line edit widget for editing the impact category unit.

<a id="activity_browser.app.pages.impact_category_details.impact_category_header.ImpactCategoryUnit.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: EditableHeader)
```

Initializes the unit edit widget.

**Arguments**:

- `parent` _EditableHeader_ - The parent editable header widget.

<a id="activity_browser.app.pages.impact_category_details.impact_category_header.ImpactCategoryUnit.change_unit"></a>

#### change\_unit

```python
def change_unit()
```

Updates the impact category unit when editing is finished.
