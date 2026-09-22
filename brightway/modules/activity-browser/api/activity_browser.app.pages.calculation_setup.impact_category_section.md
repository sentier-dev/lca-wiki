**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.calculation_setup.impact_category_section` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.calculation_setup.impact_category_section cfg.yml > activity_browser.app.pages.calculation_setup.impact_category_section.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.calculation_setup.impact_category_section"></a>

# activity\_browser.app.pages.calculation\_setup.impact\_category\_section

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategorySection"></a>

## ImpactCategorySection Objects

```python
class ImpactCategorySection(QtWidgets.QWidget)
```

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategorySection.__init__"></a>

#### \_\_init\_\_

```python
def __init__(calculation_setup_name: str, parent=None)
```

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategorySection.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategorySection.sync"></a>

#### sync

```python
def sync()
```

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategorySection.build_df"></a>

#### build\_df

```python
def build_df()
```

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategoryView"></a>

## ImpactCategoryView Objects

```python
class ImpactCategoryView(CSTableView)
```

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategoryView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategoryView.ContextMenu"></a>

## ContextMenu Objects

```python
class ContextMenu(widgets.ABMenu)
```

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategoryView.ContextMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategoryView.ContextMenu.selected_ics"></a>

#### selected\_ics

```python
@property
def selected_ics()
```

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategoryView.ContextMenu.cs_name"></a>

#### cs\_name

```python
@property
def cs_name()
```

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategoryView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategoryView.dragMoveEvent"></a>

#### dragMoveEvent

```python
def dragMoveEvent(event) -> None
```

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategoryView.dragEnterEvent"></a>

#### dragEnterEvent

```python
def dragEnterEvent(event)
```

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategoryView.dropEvent"></a>

#### dropEvent

```python
def dropEvent(event) -> None
```

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategoryModel"></a>

## ImpactCategoryModel Objects

```python
class ImpactCategoryModel(CSListModel)
```

<a id="activity_browser.app.pages.calculation_setup.impact_category_section.ImpactCategoryModel.list_key"></a>

#### list\_key
