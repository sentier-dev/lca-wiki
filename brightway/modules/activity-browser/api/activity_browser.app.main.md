**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.main` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.main cfg.yml > activity_browser.app.main.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.main"></a>

# activity\_browser.app.main

<a id="activity_browser.app.main.MainWindow"></a>

## MainWindow Objects

```python
class MainWindow(widgets.ABMainWindow)
```

<a id="activity_browser.app.main.MainWindow.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.main.MainWindow.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

<a id="activity_browser.app.main.MainWindow.sync"></a>

#### sync

```python
def sync()
```

<a id="activity_browser.app.main.MainWindow.sync_panes"></a>

#### sync\_panes

```python
def sync_panes()
```

<a id="activity_browser.app.main.MainWindow.sync_pages"></a>

#### sync\_pages

```python
def sync_pages()
```

Synchronizes the central widget pages with the shown_pages setting.

This method shows only those pages that are configured to be shown at startup.
Pages are pre-initialized and just added/removed from tabs.

<a id="activity_browser.app.main.MainWindow.apply_settings"></a>

#### apply\_settings

```python
def apply_settings(load=False)
```

<a id="activity_browser.app.main.MainWindow.dialog_on_exception"></a>

#### dialog\_on\_exception

```python
def dialog_on_exception(exception: Exception)
```
