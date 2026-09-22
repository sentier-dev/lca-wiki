**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.menu_bar` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.menu_bar cfg.yml > activity_browser.app.menu_bar.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.menu_bar"></a>

# activity\_browser.app.menu\_bar

<a id="activity_browser.app.menu_bar.MenuBar"></a>

## MenuBar Objects

```python
class MenuBar(QtWidgets.QMenuBar)
```

Main menu bar at the top of the Activity Browser window. Contains submenus for different user interaction categories

<a id="activity_browser.app.menu_bar.MenuBar.__init__"></a>

#### \_\_init\_\_

```python
def __init__(window)
```

<a id="activity_browser.app.menu_bar.ProjectMenu"></a>

## ProjectMenu Objects

```python
class ProjectMenu(QtWidgets.QMenu)
```

Project lifecycle: open, create, duplicate, export, delete, and manage projects.

<a id="activity_browser.app.menu_bar.ProjectMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None) -> None
```

<a id="activity_browser.app.menu_bar.DatabaseMenu"></a>

## DatabaseMenu Objects

```python
class DatabaseMenu(QtWidgets.QMenu)
```

Database create, import, and export.

<a id="activity_browser.app.menu_bar.DatabaseMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None) -> None
```

<a id="activity_browser.app.menu_bar.ImpactCategoriesMenu"></a>

## ImpactCategoriesMenu Objects

```python
class ImpactCategoriesMenu(QtWidgets.QMenu)
```

Impact category (LCIA method) import/export.

<a id="activity_browser.app.menu_bar.ImpactCategoriesMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None) -> None
```

<a id="activity_browser.app.menu_bar.ProjectNewMenu"></a>

## ProjectNewMenu Objects

```python
class ProjectNewMenu(QtWidgets.QMenu)
```

<a id="activity_browser.app.menu_bar.ProjectNewMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None) -> None
```

<a id="activity_browser.app.menu_bar.ProjectNewTemplateMenu"></a>

## ProjectNewTemplateMenu Objects

```python
class ProjectNewTemplateMenu(QtWidgets.QMenu)
```

<a id="activity_browser.app.menu_bar.ProjectNewTemplateMenu.remote_projects"></a>

#### remote\_projects

<a id="activity_browser.app.menu_bar.ProjectNewTemplateMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.menu_bar.ProjectNewTemplateMenu.get_projects"></a>

#### get\_projects

```python
def get_projects()
```

<a id="activity_browser.app.menu_bar.ViewMenu"></a>

## ViewMenu Objects

```python
class ViewMenu(QtWidgets.QMenu)
```

View menu: contains actions in regard to hiding and showing specific UI elements.

<a id="activity_browser.app.menu_bar.ViewMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None) -> None
```

<a id="activity_browser.app.menu_bar.CalculateMenu"></a>

## CalculateMenu Objects

```python
class CalculateMenu(QtWidgets.QMenu)
```

Calculate Menu: contains actions in regard to calculating the LCA results for the current project

<a id="activity_browser.app.menu_bar.CalculateMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None) -> None
```

<a id="activity_browser.app.menu_bar.CalculateMenu.sync"></a>

#### sync

```python
def sync()
```

<a id="activity_browser.app.menu_bar.HelpMenu"></a>

## HelpMenu Objects

```python
class HelpMenu(QtWidgets.QMenu)
```

Help Menu: contains actions that show info to the user or redirect them to online resources

<a id="activity_browser.app.menu_bar.HelpMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None) -> None
```

<a id="activity_browser.app.menu_bar.HelpMenu.about"></a>

#### about

```python
def about()
```

Displays an 'about' window to the user containing e.g. the version of the AB and copyright info

<a id="activity_browser.app.menu_bar.HelpMenu.open_wiki"></a>

#### open\_wiki

```python
def open_wiki()
```

Opens the AB github wiki in the users default browser

<a id="activity_browser.app.menu_bar.HelpMenu.raise_issue_github"></a>

#### raise\_issue\_github

```python
def raise_issue_github()
```

Opens the github create issue page in the users default browser

<a id="activity_browser.app.menu_bar.ProjectSelectionMenu"></a>

## ProjectSelectionMenu Objects

```python
class ProjectSelectionMenu(QtWidgets.QMenu)
```

Menu that lists all the projects available through bw2data.projects

<a id="activity_browser.app.menu_bar.ProjectSelectionMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.menu_bar.ProjectSelectionMenu.populate"></a>

#### populate

```python
def populate()
```

Populates the menu with the projects available in the database

<a id="activity_browser.app.menu_bar.ImportDatabaseMenu"></a>

## ImportDatabaseMenu Objects

```python
class ImportDatabaseMenu(QtWidgets.QMenu)
```

<a id="activity_browser.app.menu_bar.ImportDatabaseMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None) -> None
```

<a id="activity_browser.app.menu_bar.ExportDatabaseMenu"></a>

## ExportDatabaseMenu Objects

```python
class ExportDatabaseMenu(QtWidgets.QMenu)
```

<a id="activity_browser.app.menu_bar.ExportDatabaseMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None) -> None
```

<a id="activity_browser.app.menu_bar.ImportICMenu"></a>

## ImportICMenu Objects

```python
class ImportICMenu(QtWidgets.QMenu)
```

<a id="activity_browser.app.menu_bar.ImportICMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None) -> None
```

<a id="activity_browser.app.menu_bar.ExportICMenu"></a>

## ExportICMenu Objects

```python
class ExportICMenu(QtWidgets.QMenu)
```

<a id="activity_browser.app.menu_bar.ExportICMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None) -> None
```
