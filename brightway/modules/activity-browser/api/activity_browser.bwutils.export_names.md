**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.export_names` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.export_names cfg.yml > activity_browser.bwutils.export_names.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.export_names"></a>

# activity\_browser.bwutils.export\_names

Shared basename construction for Activity Browser exports.

<a id="activity_browser.bwutils.export_names.export_name_slug"></a>

#### export\_name\_slug

```python
def export_name_slug(value: Any) -> str
```

Turn a label, enum, or tuple into a short filesystem-safe slug segment.

<a id="activity_browser.bwutils.export_names.relativity_export_slug"></a>

#### relativity\_export\_slug

```python
def relativity_export_slug(*, relative: bool, total_range: bool = True) -> str
```

Short slug for relative (_rel) or absolute (_abs) display.

<a id="activity_browser.bwutils.export_names.lcia_compare_export_slug"></a>

#### lcia\_compare\_export\_slug

```python
def lcia_compare_export_slug(mode) -> str
```

Short slug for LCA-scores compare modes.

<a id="activity_browser.bwutils.export_names.contribution_compare_export_slug"></a>

#### contribution\_compare\_export\_slug

```python
def contribution_compare_export_slug(switch_index: int, indexes) -> str
```

Short slug for the active contribution comparison axis.

<a id="activity_browser.bwutils.export_names.contribution_tab_slug"></a>

#### contribution\_tab\_slug

```python
def contribution_tab_slug(label: str) -> str
```

Short tab label for contribution exports.

<a id="activity_browser.bwutils.export_names.flip_export_slug"></a>

#### flip\_export\_slug

```python
def flip_export_slug(*, flipped: bool) -> str | None
```

Return flip suffix ``f`` when groups are flipped.

<a id="activity_browser.bwutils.export_names.activity_export_fields"></a>

#### activity\_export\_fields

```python
def activity_export_fields(act) -> list[str]
```

Product, process, location, and database slug segments for an activity.

<a id="activity_browser.bwutils.export_names.lca_export_basename"></a>

#### lca\_export\_basename

```python
def lca_export_basename(*fields) -> str
```

Join export name parts into a safe default basename.

Used across LCA Results tabs with the pattern
``{cs}_{tab label}_{functional unit}_{method}_{scenario}`` (omit empty parts).
Tuple fields (e.g. impact categories) are slugged automatically.
