**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.exporters` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.exporters cfg.yml > activity_browser.bwutils.exporters.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.exporters"></a>

# activity\_browser.bwutils.exporters

<a id="activity_browser.bwutils.exporters.ab_reformat"></a>

#### ab\_reformat

```python
def ab_reformat(value)
```

<a id="activity_browser.bwutils.exporters.ABCSVFormatter"></a>

## ABCSVFormatter Objects

```python
class ABCSVFormatter(CSVFormatter)
```

<a id="activity_browser.bwutils.exporters.ABCSVFormatter.get_activity_metadata"></a>

#### get\_activity\_metadata

```python
def get_activity_metadata(act)
```

<a id="activity_browser.bwutils.exporters.ABCSVFormatter.exchange_as_dict"></a>

#### exchange\_as\_dict

```python
def exchange_as_dict(exc)
```

Same as CSVFormatter, but explicitly pull the database from the
input activity.

This ensures that the database value is always included, even when
it is not stored in the exchange _data.

<a id="activity_browser.bwutils.exporters.format_pedigree"></a>

#### format\_pedigree

```python
def format_pedigree(data: dict) -> str
```

Converts pedigree dict to tuple.

<a id="activity_browser.bwutils.exporters.frmt_str"></a>

#### frmt\_str

```python
def frmt_str(data: Union[str, dict]) -> str
```

Format non-numerical data (like tuples) to string format.

<a id="activity_browser.bwutils.exporters.write_lci_excel"></a>

#### write\_lci\_excel

```python
def write_lci_excel(db_name: str, path: str, objs=None, sections=None) -> Path
```

Export database `database_name` to an Excel spreadsheet.

Not all data can be exported. The following constraints apply:

* Nested data, e.g. `{'foo': {'bar': 'baz'}}` are excluded. Spreadsheets are not a great format for nested data.
  However, *tuples* are exported, and the characters `::` are used to join elements of the tuple.
* The only well-supported data types are strings, numbers, and booleans.

Returns the filepath of the exported file.

<a id="activity_browser.bwutils.exporters.database_has_parameters"></a>

#### database\_has\_parameters

```python
def database_has_parameters(db_name: str) -> bool
```

True if the database has database- or activity-level parameters.

<a id="activity_browser.bwutils.exporters.databases_with_parameters"></a>

#### databases\_with\_parameters

```python
def databases_with_parameters(db_names: list[str]) -> list[str]
```

<a id="activity_browser.bwutils.exporters.store_database_as_package"></a>

#### store\_database\_as\_package

```python
def store_database_as_package(db_name: str, directory: str = None) -> bool
```

Attempt to use `bw.BW2Package` to save the given database as an
isolated package that can be shared with others.
Returns a boolean signifying success or failure.
