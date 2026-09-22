**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.dialogs.import_preview_dialog.import_preview_dialog` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.dialogs.import_preview_dialog.import_preview_dialog cfg.yml > activity_browser.app.dialogs.import_preview_dialog.import_preview_dialog.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.dialogs.import_preview_dialog.import_preview_dialog"></a>

# activity\_browser.app.dialogs.import\_preview\_dialog.import\_preview\_dialog

<a id="activity_browser.app.dialogs.import_preview_dialog.import_preview_dialog.ImportPreviewDialog"></a>

## ImportPreviewDialog Objects

```python
class ImportPreviewDialog(QtWidgets.QDialog)
```

<a id="activity_browser.app.dialogs.import_preview_dialog.import_preview_dialog.ImportPreviewDialog.__init__"></a>

#### \_\_init\_\_

```python
def __init__(importer: LCIImporter, parent=None)
```
