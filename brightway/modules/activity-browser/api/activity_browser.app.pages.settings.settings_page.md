**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.settings.settings_page` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.settings.settings_page cfg.yml > activity_browser.app.pages.settings.settings_page.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.settings.settings_page"></a>

# activity\_browser.app.pages.settings.settings\_page

<a id="activity_browser.app.pages.settings.settings_page.SettingsPage"></a>

## SettingsPage Objects

```python
class SettingsPage(widgets.ABAbstractPage)
```

Settings page with a sidebar navigation for different settings chapters.

<a id="activity_browser.app.pages.settings.settings_page.SettingsPage.basePage"></a>

#### basePage

<a id="activity_browser.app.pages.settings.settings_page.SettingsPage.title"></a>

#### title

<a id="activity_browser.app.pages.settings.settings_page.SettingsPage.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.settings.settings_page.SettingsPage.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Build the main layout with sidebar and content area.

<a id="activity_browser.app.pages.settings.settings_page.SettingsPage.show_chapter"></a>

#### show\_chapter

```python
def show_chapter(name: str) -> None
```

Select a settings chapter by its sidebar label (e.g. ``Projects``).

<a id="activity_browser.app.pages.settings.settings_page.SettingsPage.open_chapter"></a>

#### open\_chapter

```python
@classmethod
def open_chapter(cls, name: str)
```

Show the Settings page and select the given chapter.

<a id="activity_browser.app.pages.settings.settings_page.SettingsPage.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

Connect signals and slots.

<a id="activity_browser.app.pages.settings.settings_page.SettingsPage.on_chapter_changed"></a>

#### on\_chapter\_changed

```python
def on_chapter_changed()
```

Called when any chapter's settings change.

<a id="activity_browser.app.pages.settings.settings_page.SettingsPage.has_changes"></a>

#### has\_changes

```python
def has_changes()
```

Check if any chapter has unsaved changes.

<a id="activity_browser.app.pages.settings.settings_page.SettingsPage.save_settings"></a>

#### save\_settings

```python
def save_settings()
```

Save all settings from all chapters.

<a id="activity_browser.app.pages.settings.settings_page.SettingsPage.cancel_settings"></a>

#### cancel\_settings

```python
def cancel_settings()
```

Cancel changes and revert to previous state.

<a id="activity_browser.app.pages.settings.settings_page.SettingsPage.restore_defaults"></a>

#### restore\_defaults

```python
def restore_defaults()
```

Restore default settings for the current chapter.

<a id="activity_browser.app.pages.settings.settings_page.SettingsPage.reset_all"></a>

#### reset\_all

```python
def reset_all()
```

Reset all chapters to their initial states.
