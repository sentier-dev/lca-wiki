**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.settings.metadatastore` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.settings.metadatastore cfg.yml > activity_browser.app.pages.settings.metadatastore.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.settings.metadatastore"></a>

# activity\_browser.app.pages.settings.metadatastore

<a id="activity_browser.app.pages.settings.metadatastore.MetadataStoreSettingsChapter"></a>

## MetadataStoreSettingsChapter Objects

```python
class MetadataStoreSettingsChapter(BaseSettingsChapter)
```

Chapter for metadatastore-related settings.

<a id="activity_browser.app.pages.settings.metadatastore.MetadataStoreSettingsChapter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.settings.metadatastore.MetadataStoreSettingsChapter.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

Connect signals and slots.

<a id="activity_browser.app.pages.settings.metadatastore.MetadataStoreSettingsChapter.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Build the chapter layout.

<a id="activity_browser.app.pages.settings.metadatastore.MetadataStoreSettingsChapter.reset"></a>

#### reset

```python
def reset()
```

(Re)set to initial values.

<a id="activity_browser.app.pages.settings.metadatastore.MetadataStoreSettingsChapter.has_changes"></a>

#### has\_changes

```python
def has_changes()
```

Check if there are unsaved changes.

<a id="activity_browser.app.pages.settings.metadatastore.MetadataStoreSettingsChapter.set_settings"></a>

#### set\_settings

```python
def set_settings()
```

Save metadatastore settings.
