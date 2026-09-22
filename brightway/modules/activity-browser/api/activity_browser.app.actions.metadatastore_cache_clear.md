**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.actions.metadatastore_cache_clear` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.actions.metadatastore_cache_clear cfg.yml > activity_browser.app.actions.metadatastore_cache_clear.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.actions.metadatastore_cache_clear"></a>

# activity\_browser.app.actions.metadatastore\_cache\_clear

<a id="activity_browser.app.actions.metadatastore_cache_clear.MetaDataStoreCacheClear"></a>

## MetaDataStoreCacheClear Objects

```python
class MetaDataStoreCacheClear(ABAction)
```

<a id="activity_browser.app.actions.metadatastore_cache_clear.MetaDataStoreCacheClear.icon"></a>

#### icon

<a id="activity_browser.app.actions.metadatastore_cache_clear.MetaDataStoreCacheClear.text"></a>

#### text

<a id="activity_browser.app.actions.metadatastore_cache_clear.MetaDataStoreCacheClear.tool_tip"></a>

#### tool\_tip

<a id="activity_browser.app.actions.metadatastore_cache_clear.MetaDataStoreCacheClear.run"></a>

#### run

```python
@staticmethod
@exception_dialogs
def run()
```
