**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.settings.appearance` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.settings.appearance cfg.yml > activity_browser.app.pages.settings.appearance.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.settings.appearance"></a>

# activity\_browser.app.pages.settings.appearance

<a id="activity_browser.app.pages.settings.appearance.AppearanceSettingsChapter"></a>

## AppearanceSettingsChapter Objects

```python
class AppearanceSettingsChapter(BaseSettingsChapter)
```

Chapter for appearance-related settings.

<a id="activity_browser.app.pages.settings.appearance.AppearanceSettingsChapter.theme_map"></a>

#### theme\_map

<a id="activity_browser.app.pages.settings.appearance.AppearanceSettingsChapter.pane_tab_position_map"></a>

#### pane\_tab\_position\_map

<a id="activity_browser.app.pages.settings.appearance.AppearanceSettingsChapter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.settings.appearance.AppearanceSettingsChapter.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

<a id="activity_browser.app.pages.settings.appearance.AppearanceSettingsChapter.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

<a id="activity_browser.app.pages.settings.appearance.AppearanceSettingsChapter.reset"></a>

#### reset

```python
def reset()
```

<a id="activity_browser.app.pages.settings.appearance.AppearanceSettingsChapter.has_changes"></a>

#### has\_changes

```python
def has_changes()
```

<a id="activity_browser.app.pages.settings.appearance.AppearanceSettingsChapter.set_settings"></a>

#### set\_settings

```python
def set_settings()
```
