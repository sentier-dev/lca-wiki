**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.settings.plugins` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.settings.plugins cfg.yml > activity_browser.app.pages.settings.plugins.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.settings.plugins"></a>

# activity\_browser.app.pages.settings.plugins

<a id="activity_browser.app.pages.settings.plugins.PluginsSettingsChapter"></a>

## PluginsSettingsChapter Objects

```python
class PluginsSettingsChapter(BaseSettingsChapter)
```

Chapter for plugin-related settings.

<a id="activity_browser.app.pages.settings.plugins.PluginsSettingsChapter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.settings.plugins.PluginsSettingsChapter.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

Connect signals and slots.

<a id="activity_browser.app.pages.settings.plugins.PluginsSettingsChapter.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Build the chapter layout.

<a id="activity_browser.app.pages.settings.plugins.PluginsSettingsChapter.on_selection_changed"></a>

#### on\_selection\_changed

```python
def on_selection_changed()
```

Enable/disable remove button based on selection.

<a id="activity_browser.app.pages.settings.plugins.PluginsSettingsChapter.module_exists"></a>

#### module\_exists

```python
def module_exists(module_name)
```

Check if a module can be found/imported.

<a id="activity_browser.app.pages.settings.plugins.PluginsSettingsChapter.add_plugin_to_list"></a>

#### add\_plugin\_to\_list

```python
def add_plugin_to_list(plugin_name)
```

Add a plugin to the list widget with appropriate icon.

<a id="activity_browser.app.pages.settings.plugins.PluginsSettingsChapter.add_plugin"></a>

#### add\_plugin

```python
def add_plugin()
```

Add a plugin to the list.

<a id="activity_browser.app.pages.settings.plugins.PluginsSettingsChapter.remove_plugin"></a>

#### remove\_plugin

```python
def remove_plugin()
```

Remove selected plugin from the list.

<a id="activity_browser.app.pages.settings.plugins.PluginsSettingsChapter.reset"></a>

#### reset

```python
def reset()
```

(Re)set to initial values.

<a id="activity_browser.app.pages.settings.plugins.PluginsSettingsChapter.has_changes"></a>

#### has\_changes

```python
def has_changes()
```

Check if there are unsaved changes.

<a id="activity_browser.app.pages.settings.plugins.PluginsSettingsChapter.set_settings"></a>

#### set\_settings

```python
def set_settings()
```

Save plugin settings.
