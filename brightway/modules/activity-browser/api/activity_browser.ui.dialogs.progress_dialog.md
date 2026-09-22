**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.dialogs.progress_dialog` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.dialogs.progress_dialog cfg.yml > activity_browser.ui.dialogs.progress_dialog.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.dialogs.progress_dialog"></a>

# activity\_browser.ui.dialogs.progress\_dialog

<a id="activity_browser.ui.dialogs.progress_dialog.ABProgressDialog"></a>

## ABProgressDialog Objects

```python
class ABProgressDialog(QProgressDialog)
```

<a id="activity_browser.ui.dialogs.progress_dialog.ABProgressDialog.get_connected_dialog"></a>

#### get\_connected\_dialog

```python
@classmethod
def get_connected_dialog(cls,
                         title: str,
                         *,
                         cancellable: bool = False) -> "ABProgressDialog"
```

<a id="activity_browser.ui.dialogs.progress_dialog.ABProgressDialog.mark_cancelled"></a>

#### mark\_cancelled

```python
def mark_cancelled() -> None
```

Sticky cancel flag + stop progress updates (safe after dialog close).

<a id="activity_browser.ui.dialogs.progress_dialog.ABProgressDialog.disconnect_progress_updates"></a>

#### disconnect\_progress\_updates

```python
def disconnect_progress_updates()
```

Idempotent: safe to call more than once (close() may re-enter via canceled).

<a id="activity_browser.ui.dialogs.progress_dialog.ABProgressDialog.detach"></a>

#### detach

```python
def detach()
```

Disconnect all external slots before closing after a finished job.

<a id="activity_browser.ui.dialogs.progress_dialog.ABProgressDialog.ab_cancelled"></a>

#### ab\_cancelled

```python
@property
def ab_cancelled() -> bool
```
