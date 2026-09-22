**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.export.excel` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2io==0.9.17'
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
  -I "$SP" -m bw2io.export.excel cfg.yml > bw2io.export.excel.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.export.excel"></a>

# bw2io.export.excel

<a id="bw2io.export.excel.create_valid_worksheet_name"></a>

#### create\_valid\_worksheet\_name

```python
def create_valid_worksheet_name(string)
```

Exclude invalid characters and names.

Parameters
----------
string : str
    String to convert to a valid worksheet name.

Returns
-------
string : str
    Valid worksheet name.

Notes
-----
Data from http://www.accountingweb.com/technology/excel/seven-characters-you-cant-use-in-worksheet-names.

<a id="bw2io.export.excel.lci_matrices_to_excel"></a>

#### lci\_matrices\_to\_excel

```python
def lci_matrices_to_excel(database_name, include_descendants=True)
```

Export LCI matrices to Excel.

Parameters
----------
database_name : str
    Name of database to export.
include_descendants : bool
    Include databases which are linked from ``database_name``. (default True)

Returns
-------
filepath : str
    Path to created Excel file.

Examples
--------
>>> lci_matrices_to_excel(database_name='example_db', include_descendants=True)
'/path/to/example_db.xlsx'

<a id="bw2io.export.excel.write_lci_excel"></a>

#### write\_lci\_excel

```python
def write_lci_excel(database_name, objs=None, sections=None, dirpath=None)
```

Export database `database_name` to an Excel spreadsheet.

Notes
-----
Not all data can be exported. The following constraints apply:

* Nested data, e.g. `{'foo': {'bar': 'baz'}}` are excluded.
* Spreadsheets are not a great format for nested data. However, *tuples* are exported, and the characters `::` are used to join elements of the tuple.
* The only well-supported data types are strings, numbers, and booleans.

Default directory is ``projects.output_dir``, set ``dirpath`` to have save the file somewhere else.

Parameters
----------
database_name : str
    Name of the database to export.
objs : list, optional
    List of objects to export. If not provided, all objects in the database will be exported.
sections : list, optional
    List of sections to export. If not provided, all sections will be exported.
dirpath : str, optional
    Directory to save the file to. Default is ``projects.output_dir``.

Returns
-------
str
    Filepath of the exported file.

<a id="bw2io.export.excel.write_lci_matching"></a>

#### write\_lci\_matching

```python
def write_lci_matching(db: List[dict],
                       database_name: str,
                       only_unlinked: bool = False,
                       only_activity_names: bool = False,
                       output_dir: Optional[Path] = None)
```

Write matched and unmatched exchanges to Excel file

Parameters
----------
db : :class:`bw2data.Database`
    Database to write.
database_name : str
    Name of the database to write.
only_unlinked : bool, optional
    Only write unlinked exchanges. Default is ``False``.
only_activity_names : bool, optional
    Only write activity names. Default is ``False``.

Returns
-------
str
    Filepath of the exported file.

<a id="bw2io.export.excel.write_lcia_matching"></a>

#### write\_lcia\_matching

```python
def write_lcia_matching(db, name)
```

Write matched and unmatched CFs to Excel file

Parameters
----------
db : :class:`bw2data.Database`
    Database to write.
name : str
    Name of the database to write.

Returns
-------
str
    Filepath of the exported file.
