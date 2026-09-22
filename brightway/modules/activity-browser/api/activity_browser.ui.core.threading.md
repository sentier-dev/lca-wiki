**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.core.threading` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.core.threading cfg.yml > activity_browser.ui.core.threading.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.core.threading"></a>

# activity\_browser.ui.core.threading

<a id="activity_browser.ui.core.threading.ABThread"></a>

## ABThread Objects

```python
class ABThread(QThread)
```

<a id="activity_browser.ui.core.threading.ABThread.status"></a>

#### status

<a id="activity_browser.ui.core.threading.ABThread.exception"></a>

#### exception

<a id="activity_browser.ui.core.threading.ABThread.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.ui.core.threading.ABThread.start"></a>

#### start

```python
def start(*args, priority=QThread.NormalPriority, **kwargs)
```

Reimplemented from QThread to set the priority of the thread.

<a id="activity_browser.ui.core.threading.ABThread.run"></a>

#### run

```python
def run()
```

Reimplemented from QThread to close any database connections before finishing.

<a id="activity_browser.ui.core.threading.ABThread.run_safely"></a>

#### run\_safely

```python
def run_safely(*args, **kwargs)
```

<a id="activity_browser.ui.core.threading.ABThread.request_ab_cancel"></a>

#### request\_ab\_cancel

```python
def request_ab_cancel()
```

Sticky cancel for long-running jobs (survives progress-dialog resets).

<a id="activity_browser.ui.core.threading.ABThread.ab_cancel_requested"></a>

#### ab\_cancel\_requested

```python
def ab_cancel_requested() -> bool
```

<a id="activity_browser.ui.core.threading.ABThread.connect_progress_dialog"></a>

#### connect\_progress\_dialog

```python
def connect_progress_dialog(progress_dialog: QtWidgets.QProgressDialog)
```

Connects the status signal to a progress dialog.

<a id="activity_browser.ui.core.threading.SafeBWConnection"></a>

## SafeBWConnection Objects

```python
class SafeBWConnection()
```

<a id="activity_browser.ui.core.threading.SafeBWConnection.__enter__"></a>

#### \_\_enter\_\_

```python
def __enter__()
```

<a id="activity_browser.ui.core.threading.SafeBWConnection.__exit__"></a>

#### \_\_exit\_\_

```python
def __exit__(*args)
```

Closes all connections for this thread

<a id="activity_browser.ui.core.threading.InfoToSlot"></a>

## InfoToSlot Objects

```python
class InfoToSlot()
```

<a id="activity_browser.ui.core.threading.InfoToSlot.__init__"></a>

#### \_\_init\_\_

```python
def __init__(progress_slot=lambda progress, message: None)
```

<a id="activity_browser.ui.core.threading.InfoToSlot.__enter__"></a>

#### \_\_enter\_\_

```python
def __enter__()
```

<a id="activity_browser.ui.core.threading.InfoToSlot.__exit__"></a>

#### \_\_exit\_\_

```python
def __exit__(*args)
```

<a id="activity_browser.ui.core.threading.LoggingProgressSink"></a>

## LoggingProgressSink Objects

```python
class LoggingProgressSink()
```

<a id="activity_browser.ui.core.threading.LoggingProgressSink.__init__"></a>

#### \_\_init\_\_

```python
def __init__(level="INFO")
```

<a id="activity_browser.ui.core.threading.LoggingProgressSink.__call__"></a>

#### \_\_call\_\_

```python
def __call__(message)
```

<a id="activity_browser.ui.core.threading.thread_local"></a>

#### thread\_local
