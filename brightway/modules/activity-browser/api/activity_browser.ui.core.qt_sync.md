**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.core.qt_sync` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.core.qt_sync cfg.yml > activity_browser.ui.core.qt_sync.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.core.qt_sync"></a>

# activity\_browser.ui.core.qt\_sync

Helpers for deferred Qt widget sync without touching deleted C++ objects.

<a id="activity_browser.ui.core.qt_sync.qt_is_valid"></a>

#### qt\_is\_valid

```python
def qt_is_valid(obj) -> bool
```

Return whether *obj* is still backed by a live Qt C++ object.

<a id="activity_browser.ui.core.qt_sync.schedule_awake_sync"></a>

#### schedule\_awake\_sync

```python
def schedule_awake_sync(owner: QtCore.QObject,
                        sync: Callable[[], None],
                        *,
                        flag_attr: str = "_populate_later_flag") -> None
```

Run *sync* on the next GUI-thread awake event (coalesced per *owner*).
