**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.settings.project_manager` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.settings.project_manager cfg.yml > activity_browser.app.pages.settings.project_manager.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.settings.project_manager"></a>

# activity\_browser.app.pages.settings.project\_manager

<a id="activity_browser.app.pages.settings.project_manager.ProjectManagerSettingsChapter"></a>

## ProjectManagerSettingsChapter Objects

```python
class ProjectManagerSettingsChapter(BaseSettingsChapter)
```

Chapter for project and template management.

<a id="activity_browser.app.pages.settings.project_manager.ProjectManagerSettingsChapter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.settings.project_manager.ProjectManagerSettingsChapter.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Build the chapter layout.

<a id="activity_browser.app.pages.settings.project_manager.ProjectManagerSettingsChapter.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

Connect signals and slots.

<a id="activity_browser.app.pages.settings.project_manager.ProjectManagerSettingsChapter.sync"></a>

#### sync

```python
def sync()
```

Sync project and template data.

<a id="activity_browser.app.pages.settings.project_manager.ProjectManagerSettingsChapter.reset"></a>

#### reset

```python
def reset()
```

Reset to initial values.

<a id="activity_browser.app.pages.settings.project_manager.ProjectManagerSettingsChapter.has_changes"></a>

#### has\_changes

```python
def has_changes()
```

Project manager doesn't have editable settings.

<a id="activity_browser.app.pages.settings.project_manager.ProjectManagerSettingsChapter.set_settings"></a>

#### set\_settings

```python
def set_settings()
```

No settings to save for project manager.

<a id="activity_browser.app.pages.settings.project_manager.ProjectManagerSettingsChapter.build_project_df"></a>

#### build\_project\_df

```python
def build_project_df() -> pd.DataFrame
```

Build DataFrame for projects.

<a id="activity_browser.app.pages.settings.project_manager.ProjectManagerSettingsChapter.build_template_df"></a>

#### build\_template\_df

```python
def build_template_df() -> pd.DataFrame
```

Build DataFrame for templates.

<a id="activity_browser.app.pages.settings.project_manager.ProjectView"></a>

## ProjectView Objects

```python
class ProjectView(widgets.ABTreeView)
```

<a id="activity_browser.app.pages.settings.project_manager.ProjectView.ContextMenu"></a>

## ContextMenu Objects

```python
class ContextMenu(widgets.ABMenu)
```

<a id="activity_browser.app.pages.settings.project_manager.ProjectView.ContextMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.pages.settings.project_manager.ProjectView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent)
```

<a id="activity_browser.app.pages.settings.project_manager.ProjectView.get_project_new_menu"></a>

#### get\_project\_new\_menu

```python
def get_project_new_menu(parent)
```

Get the ProjectNewMenu.

<a id="activity_browser.app.pages.settings.project_manager.ProjectView.selected_projects"></a>

#### selected\_projects

```python
@property
def selected_projects() -> list
```

<a id="activity_browser.app.pages.settings.project_manager.ProjectView.selected_project"></a>

#### selected\_project

```python
@property
def selected_project()
```

<a id="activity_browser.app.pages.settings.project_manager.ProjectView.single_selection"></a>

#### single\_selection

```python
@property
def single_selection()
```

<a id="activity_browser.app.pages.settings.project_manager.ProjectView.has_selection"></a>

#### has\_selection

```python
@property
def has_selection()
```

<a id="activity_browser.app.pages.settings.project_manager.ProjectView.is_legacy"></a>

#### is\_legacy

```python
@property
def is_legacy()
```

<a id="activity_browser.app.pages.settings.project_manager.ProjectModel"></a>

## ProjectModel Objects

```python
class ProjectModel(core.ABTreeModel)
```

Model for project data.

<a id="activity_browser.app.pages.settings.project_manager.ProjectModel.fontData"></a>

#### fontData

```python
def fontData(index)
```

Provide font data for the model.

<a id="activity_browser.app.pages.settings.project_manager.ProjectModel.decorationData"></a>

#### decorationData

```python
def decorationData(index)
```

Provide icon decoration for the model.

<a id="activity_browser.app.pages.settings.project_manager.TemplateView"></a>

## TemplateView Objects

```python
class TemplateView(widgets.ABTreeView)
```

<a id="activity_browser.app.pages.settings.project_manager.TemplateView.ContextMenu"></a>

## ContextMenu Objects

```python
class ContextMenu(widgets.ABMenu)
```

<a id="activity_browser.app.pages.settings.project_manager.TemplateView.ContextMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.pages.settings.project_manager.TemplateView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent)
```

<a id="activity_browser.app.pages.settings.project_manager.TemplateModel"></a>

## TemplateModel Objects

```python
class TemplateModel(core.ABTreeModel)
```

Model for template data.

<a id="activity_browser.app.pages.settings.project_manager.TemplateModel.fontData"></a>

#### fontData

```python
def fontData(index)
```

Provide font data for the model.
