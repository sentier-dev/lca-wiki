**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.settings.base` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.settings.base cfg.yml > activity_browser.app.pages.settings.base.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.settings.base"></a>

# activity\_browser.app.pages.settings.base

<a id="activity_browser.app.pages.settings.base.BaseSettingsChapter"></a>

## BaseSettingsChapter Objects

```python
class BaseSettingsChapter(QtWidgets.QWidget)
```

Base class for settings chapters.

<a id="activity_browser.app.pages.settings.base.BaseSettingsChapter.changed"></a>

#### changed

<a id="activity_browser.app.pages.settings.base.BaseSettingsChapter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.settings.base.BaseSettingsChapter.get_current_state"></a>

#### get\_current\_state

```python
def get_current_state()
```

Override this to return the current state of the chapter.
Should return a dictionary or tuple representing current values.

<a id="activity_browser.app.pages.settings.base.BaseSettingsChapter.has_changes"></a>

#### has\_changes

```python
def has_changes()
```

Check if the chapter has unsaved changes.

<a id="activity_browser.app.pages.settings.base.BaseSettingsChapter.save_settings"></a>

#### save\_settings

```python
def save_settings()
```

Override this to save chapter-specific settings.

<a id="activity_browser.app.pages.settings.base.BaseSettingsChapter.reset"></a>

#### reset

```python
def reset()
```

Override this to reset chapter to initial values.

<a id="activity_browser.app.pages.settings.base.BaseSettingsChapter.restore_defaults"></a>

#### restore\_defaults

```python
def restore_defaults()
```

Override this to restore default values.
