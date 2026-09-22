**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.mod.pyprind.progbar` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.mod.pyprind.progbar cfg.yml > activity_browser.mod.pyprind.progbar.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.mod.pyprind.progbar"></a>

# activity\_browser.mod.pyprind.progbar

<a id="activity_browser.mod.pyprind.progbar.Progbar"></a>

## Progbar Objects

```python
@patch_superclass
class Progbar(ProgBar)
```

<a id="activity_browser.mod.pyprind.progbar.QtPyprind"></a>

## QtPyprind Objects

```python
class QtPyprind(QObject)
```

<a id="activity_browser.mod.pyprind.progbar.QtPyprind.updated"></a>

#### updated

<a id="activity_browser.mod.pyprind.progbar.qt_pyprind"></a>

#### qt\_pyprind
