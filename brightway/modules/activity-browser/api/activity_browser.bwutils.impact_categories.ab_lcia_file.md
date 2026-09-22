**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.impact_categories.ab_lcia_file` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.impact_categories.ab_lcia_file cfg.yml > activity_browser.bwutils.impact_categories.ab_lcia_file.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file"></a>

# activity\_browser.bwutils.impact\_categories.ab\_lcia\_file

AB impact-category file load/export and shared prepared-dataset importer.

``ABLCIAImporter`` links and writes prepared LCIA datasets (AB-shaped
``list[dict]``). AB and bw2io LCIA file loaders both feed it.

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.CFS_SHEET"></a>

#### CFS\_SHEET

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.IMPACT_CATEGORIES_SHEET"></a>

#### IMPACT\_CATEGORIES\_SHEET

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.CFS_COLUMNS"></a>

#### CFS\_COLUMNS

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.IC_COLUMNS"></a>

#### IC\_COLUMNS

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.CFS_SUFFIX"></a>

#### CFS\_SUFFIX

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.META_SUFFIX"></a>

#### META\_SUFFIX

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.methods_to_ab_records"></a>

#### methods\_to\_ab\_records

```python
def methods_to_ab_records(
        method_names: Iterable[tuple],
        *,
        cancel_check=None) -> tuple[pd.DataFrame, pd.DataFrame]
```

Build CFs and Impact categories dataframes for the given method keys.

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.export_methods_ab_xlsx"></a>

#### export\_methods\_ab\_xlsx

```python
def export_methods_ab_xlsx(method_names: Sequence[tuple],
                           path: str | Path,
                           *,
                           cancel_check=None) -> Path
```

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.ab_csv_sibling_path"></a>

#### ab\_csv\_sibling\_path

```python
def ab_csv_sibling_path(path: str | Path) -> Path | None
```

Return the expected sibling path for an AB CSV pair member, or None.

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.resolve_ab_csv_pair"></a>

#### resolve\_ab\_csv\_pair

```python
def resolve_ab_csv_pair(
        path: str | Path,
        *,
        other_path: str | Path | None = None) -> tuple[Path, Path]
```

Return (cfs_path, metadata_path) for an AB CSV import.

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.export_methods_ab_csv_pair"></a>

#### export\_methods\_ab\_csv\_pair

```python
def export_methods_ab_csv_pair(method_names: Sequence[tuple],
                               base_path: str | Path,
                               *,
                               cancel_check=None) -> tuple[Path, Path]
```

Write AB CSV pair. ``base_path`` is a directory + stem (no required suffix).

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.load_ab_xlsx"></a>

#### load\_ab\_xlsx

```python
def load_ab_xlsx(path: str | Path) -> list[dict]
```

Parse an AB impact-category workbook into LCIAImporter-shaped datasets.

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.load_ab_csv_pair"></a>

#### load\_ab\_csv\_pair

```python
def load_ab_csv_pair(path: str | Path,
                     *,
                     other_path: str | Path | None = None) -> list[dict]
```

Parse an AB CSV sibling pair into LCIAImporter-shaped datasets.

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.ABLCIAImporter"></a>

## ABLCIAImporter Objects

```python
class ABLCIAImporter(LCIAImporter)
```

Shared write/link path for prepared LCIA datasets (bw2io ``LCIAImporter``).

Accepts AB-shaped ``list[dict]`` from AB or bw2io LCIA file loaders.
Preserves CF uncertainty on write.

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.ABLCIAImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(data: list[dict], biosphere: str | None = None)
```

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.ABLCIAImporter.apply_strategies"></a>

#### apply\_strategies

```python
def apply_strategies(strategies=None, verbose=False, cancel_check=None)
```

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.ABLCIAImporter.write_methods"></a>

#### write\_methods

```python
def write_methods(overwrite=False, verbose=True, cancel_check=None)
```

<a id="activity_browser.bwutils.impact_categories.ab_lcia_file.import_ab_methods"></a>

#### import\_ab\_methods

```python
def import_ab_methods(data: list[dict],
                      *,
                      biosphere_name: str,
                      conflict_mode: ConflictMode = ConflictMode.SKIP,
                      prefix: str | None = None,
                      renames: dict[tuple, tuple] | None = None,
                      drop_unlinked: bool = False) -> ImportStats
```

Link and write prepared method datasets into the current project.
