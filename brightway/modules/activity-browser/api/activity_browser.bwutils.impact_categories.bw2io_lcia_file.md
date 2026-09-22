**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.impact_categories.bw2io_lcia_file` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.impact_categories.bw2io_lcia_file cfg.yml > activity_browser.bwutils.impact_categories.bw2io_lcia_file.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.impact_categories.bw2io_lcia_file"></a>

# activity\_browser.bwutils.impact\_categories.bw2io\_lcia\_file

bw2io impact-category file load/export (CF table + AB metadata helpers).

<a id="activity_browser.bwutils.impact_categories.bw2io_lcia_file.BW2IO_CF_COLUMNS"></a>

#### BW2IO\_CF\_COLUMNS

<a id="activity_browser.bwutils.impact_categories.bw2io_lcia_file.BW2IO_META_COLUMNS"></a>

#### BW2IO\_META\_COLUMNS

<a id="activity_browser.bwutils.impact_categories.bw2io_lcia_file.method_name_to_filename_stem"></a>

#### method\_name\_to\_filename\_stem

```python
def method_name_to_filename_stem(name: tuple) -> str
```

Build a cross-platform filename stem from a Brightway method key.

Tuple parts are joined with ``__`` (``::`` is illegal on Windows). Remaining
forbidden characters are replaced with ``-``.

<a id="activity_browser.bwutils.impact_categories.bw2io_lcia_file.export_method_bw2io_xlsx"></a>

#### export\_method\_bw2io\_xlsx

```python
def export_method_bw2io_xlsx(name: tuple, path: str | Path) -> Path
```

<a id="activity_browser.bwutils.impact_categories.bw2io_lcia_file.export_methods_bw2io_csv_batch"></a>

#### export\_methods\_bw2io\_csv\_batch

```python
def export_methods_bw2io_csv_batch(method_names: Sequence[tuple],
                                   directory: str | Path,
                                   *,
                                   metadata_name: str = "metadata.csv",
                                   cancel_check=None) -> list[Path]
```

<a id="activity_browser.bwutils.impact_categories.bw2io_lcia_file.read_bw2io_metadata_xlsx"></a>

#### read\_bw2io\_metadata\_xlsx

```python
def read_bw2io_metadata_xlsx(path: str | Path) -> dict[str, str] | None
```

<a id="activity_browser.bwutils.impact_categories.bw2io_lcia_file.read_bw2io_metadata_csv"></a>

#### read\_bw2io\_metadata\_csv

```python
def read_bw2io_metadata_csv(
        metadata_path: str | Path,
        *,
        cf_filename: str | None = None) -> dict[str, str] | None
```

Prefill metadata for a CF CSV.

Match ``filename`` to ``cf_filename`` when that column exists; if there is
exactly one row, use it; otherwise return ``None``.

<a id="activity_browser.bwutils.impact_categories.bw2io_lcia_file.load_bw2io_lcia_file"></a>

#### load\_bw2io\_lcia\_file

```python
def load_bw2io_lcia_file(path: str | Path, *, name: tuple, unit: str,
                         description: str) -> list[dict]
```

Parse one bw2io CF table into ABLCIAImporter-shaped data (first sheet only for xlsx).
