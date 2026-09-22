**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.superstructure.excel` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.superstructure.excel cfg.yml > activity_browser.bwutils.superstructure.excel.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.superstructure.excel"></a>

# activity\_browser.bwutils.superstructure.excel

<a id="activity_browser.bwutils.superstructure.excel.convert_tuple_str"></a>

#### convert\_tuple\_str

```python
def convert_tuple_str(x)
```

<a id="activity_browser.bwutils.superstructure.excel.get_sheet_names"></a>

#### get\_sheet\_names

```python
def get_sheet_names(document_path: Union[str, Path]) -> List[str]
```

<a id="activity_browser.bwutils.superstructure.excel.valid_cols"></a>

#### valid\_cols

```python
def valid_cols(name: str) -> bool
```

True for data columns; names starting with '_' are SDF comment columns (not imported).

<a id="activity_browser.bwutils.superstructure.excel.import_from_excel"></a>

#### import\_from\_excel

```python
def import_from_excel(document_path: Union[str, Path],
                      import_sheet: int = 1) -> pd.DataFrame
```

Import scenario exchanges from an Excel sheet.

Comment rows (first cell starts with ``#``) and comment columns (name
starts with ``_``) are excluded via ``skiprows`` / ``usecols`` — not
pandas ``comment='#'``, which breaks Excel headers under openpyxl.
