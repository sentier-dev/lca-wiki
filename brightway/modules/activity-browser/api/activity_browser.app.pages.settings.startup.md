**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.settings.startup` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.settings.startup cfg.yml > activity_browser.app.pages.settings.startup.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.settings.startup"></a>

# activity\_browser.app.pages.settings.startup

<a id="activity_browser.app.pages.settings.startup.StartupSettingsChapter"></a>

## StartupSettingsChapter Objects

```python
class StartupSettingsChapter(BaseSettingsChapter)
```

Chapter for startup-related settings.

<a id="activity_browser.app.pages.settings.startup.StartupSettingsChapter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.settings.startup.StartupSettingsChapter.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Build the chapter layout.

<a id="activity_browser.app.pages.settings.startup.StartupSettingsChapter.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

Connect signals and slots.

<a id="activity_browser.app.pages.settings.startup.StartupSettingsChapter.reset"></a>

#### reset

```python
def reset()
```

(Re)set to initial values.

<a id="activity_browser.app.pages.settings.startup.StartupSettingsChapter.has_changes"></a>

#### has\_changes

```python
def has_changes()
```

Check if there are unsaved changes.

<a id="activity_browser.app.pages.settings.startup.StartupSettingsChapter.set_settings"></a>

#### set\_settings

```python
def set_settings()
```

Save startup settings.

<a id="activity_browser.app.pages.settings.startup.StartupSettingsChapter.browse_bwdir"></a>

#### browse\_bwdir

```python
def browse_bwdir()
```

Browse for a brightway directory.

<a id="activity_browser.app.pages.settings.startup.StartupSettingsChapter.remove_bwdir"></a>

#### remove\_bwdir

```python
def remove_bwdir()
```

Remove the selected brightway directory from the list.

<a id="activity_browser.app.pages.settings.startup.StartupSettingsChapter.show_virtual_projects"></a>

#### show\_virtual\_projects

```python
def show_virtual_projects()
```

Show projects from the virtual Brightway directory.

<a id="activity_browser.app.pages.settings.startup.StartupSettingsChapter.get_projects_from_path"></a>

#### get\_projects\_from\_path

```python
def get_projects_from_path(path: str)
```

Get project names from a brightway directory.
