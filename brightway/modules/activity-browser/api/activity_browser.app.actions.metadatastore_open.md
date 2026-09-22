**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.actions.metadatastore_open` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.actions.metadatastore_open cfg.yml > activity_browser.app.actions.metadatastore_open.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.actions.metadatastore_open"></a>

# activity\_browser.app.actions.metadatastore\_open

<a id="activity_browser.app.actions.metadatastore_open.MetaDataStoreOpen"></a>

## MetaDataStoreOpen Objects

```python
class MetaDataStoreOpen(ABAction)
```

<a id="activity_browser.app.actions.metadatastore_open.MetaDataStoreOpen.icon"></a>

#### icon

<a id="activity_browser.app.actions.metadatastore_open.MetaDataStoreOpen.text"></a>

#### text

<a id="activity_browser.app.actions.metadatastore_open.MetaDataStoreOpen.run"></a>

#### run

```python
@staticmethod
@global_shortcut("Ctrl+Shift+M")
@exception_dialogs
def run()
```
