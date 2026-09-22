**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.filesystem` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.filesystem cfg.yml > activity_browser.bwutils.filesystem.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.filesystem"></a>

# activity\_browser.bwutils.filesystem

<a id="activity_browser.bwutils.filesystem.get_package_path"></a>

#### get\_package\_path

```python
def get_package_path() -> Path
```

<a id="activity_browser.bwutils.filesystem.get_appdata_path"></a>

#### get\_appdata\_path

```python
def get_appdata_path() -> Path
```

<a id="activity_browser.bwutils.filesystem.get_project_path"></a>

#### get\_project\_path

```python
def get_project_path() -> Path
```

<a id="activity_browser.bwutils.filesystem.get_project_ab_path"></a>

#### get\_project\_ab\_path

```python
def get_project_ab_path() -> Path
```
