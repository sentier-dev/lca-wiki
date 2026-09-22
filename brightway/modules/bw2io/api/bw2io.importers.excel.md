**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.excel` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.excel cfg.yml > bw2io.importers.excel.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.excel"></a>

# bw2io.importers.excel

<a id="bw2io.importers.excel.is_empty_line"></a>

#### is\_empty\_line

<a id="bw2io.importers.excel.remove_empty"></a>

#### remove\_empty

<a id="bw2io.importers.excel.valid_first_cell"></a>

#### valid\_first\_cell

```python
def valid_first_cell(sheet, data)
```

Return boolean if first cell in worksheet is not ``skip``.

<a id="bw2io.importers.excel.ExcelImporter"></a>

## ExcelImporter Objects

```python
class ExcelImporter(LCIImporter)
```

Generic Excel importer.

Excel spreadsheet should follow the following format.
Note that this is an illustrative example, all sections (e.g., parameters) and fields (e.g., exchange columns) are not required.

+-------------------------+-------------------------+------------------------------+
| Database                | <name of database>      |                              |
+-------------------------+-------------------------+------------------------------+
| <database field name>   | <database field value>  |                              |
+-------------------------+-------------------------+------------------------------+
| Project parameters      |                         |                              |
+-------------------------+-------------------------+------------------------------+
| name                    | amount                  | <other parameter field name> |
+-------------------------+-------------------------+------------------------------+
| <value>                 | <value>                 | <parameter field value>      |
+-------------------------+-------------------------+------------------------------+
| Database parameters     |                         |                              |
+-------------------------+-------------------------+------------------------------+
| name                    | amount                  | <other parameter field name> |
+-------------------------+-------------------------+------------------------------+
| <parameter field value> | <parameter field value> | <parameter field value>      |
+-------------------------+-------------------------+------------------------------+
| Activity                | <name of activity>      |                              |
+-------------------------+-------------------------+------------------------------+
| <activity field name>   | <activity field value>  |                              |
+-------------------------+-------------------------+------------------------------+
| Parameters              | <parameter group>       |                              |
+-------------------------+-------------------------+------------------------------+
| name                    | amount                  | <other parameter field name> |
+-------------------------+-------------------------+------------------------------+
| <parameter field value> | <parameter field value> | <parameter field value>      |
+-------------------------+-------------------------+------------------------------+
| Exchanges               |                         |                              |
+-------------------------+-------------------------+------------------------------+
| name                    | amount                  | <other exchange field name>  |
+-------------------------+-------------------------+------------------------------+
| <exchange field value>  | <exchange field value>  | <exchange field value>       |
+-------------------------+-------------------------+------------------------------+

Neither project parameters, parameters, nor exchanges for each activity are required.

Blank lines are allowed anywhere, they won't have any effect. The end of the file is determined in the Excel file based on the content.

The very first cell of the worksheet must not be empty (A1), otherwise the worksheet won't be imported.

In general, data is imported without modification. However, the following transformations are applied:

* Numbers are translated from text into actual numbers.
* Tuples, separated in the cell by the ``::`` string, are reconstructed.
* ``True`` and ``False`` are transformed to boolean values.
* Fields with the value ``(Unknown)`` are dropped.

<a id="bw2io.importers.excel.ExcelImporter.format"></a>

#### format

<a id="bw2io.importers.excel.ExcelImporter.extractor"></a>

#### extractor

<a id="bw2io.importers.excel.ExcelImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(filepath, sheet_name=None)
```

<a id="bw2io.importers.excel.ExcelImporter.get_database"></a>

#### get\_database

```python
def get_database(data)
```

<a id="bw2io.importers.excel.ExcelImporter.get_database_parameters"></a>

#### get\_database\_parameters

```python
def get_database_parameters(data)
```

<a id="bw2io.importers.excel.ExcelImporter.get_project_parameters"></a>

#### get\_project\_parameters

```python
def get_project_parameters(data)
```

Extract project parameters (variables and formulas).

Project parameters are a section that starts with a line with the string "project parameters" (case-insensitive) in the first cell, and ends with a blank line. There can be multiple project parameter sections.

<a id="bw2io.importers.excel.ExcelImporter.get_labelled_section"></a>

#### get\_labelled\_section

```python
def get_labelled_section(sn, ws, index=0, transform=True)
```

Turn a list of rows into a list of dictionaries.

The first line of ``ws`` is the column labels. All subsequent rows are the data values. Missing columns are dropped.

``transform`` is a boolean: perform CSV transformation functions like ``csv_restore_tuples``.

<a id="bw2io.importers.excel.ExcelImporter.get_metadata_section"></a>

#### get\_metadata\_section

```python
def get_metadata_section(sn, ws, index=0, transform=True)
```

<a id="bw2io.importers.excel.ExcelImporter.process_activities"></a>

#### process\_activities

```python
def process_activities(data)
```

Take list of `(sheet names, raw data)` and process it.

<a id="bw2io.importers.excel.ExcelImporter.write_activity_parameters"></a>

#### write\_activity\_parameters

```python
def write_activity_parameters(data=None, delete_existing=True)
```

<a id="bw2io.importers.excel.ExcelImporter.write_database_parameters"></a>

#### write\_database\_parameters

```python
def write_database_parameters(activate_parameters=True, delete_existing=True)
```

Same as base ``write_database_parameters`` method, but ``activate_parameters`` is True by default.

<a id="bw2io.importers.excel.ExcelImporter.write_database"></a>

#### write\_database

```python
def write_database(**kwargs)
```

Same as base ``write_database`` method, but ``activate_parameters`` is True by default.

<a id="bw2io.importers.excel.ExcelImporter.get_activity"></a>

#### get\_activity

```python
def get_activity(sn, ws)
```

<a id="bw2io.importers.excel.CSVImporter"></a>

## CSVImporter Objects

```python
class CSVImporter(ExcelImporter)
```

Generic CSV importer

<a id="bw2io.importers.excel.CSVImporter.format"></a>

#### format

<a id="bw2io.importers.excel.CSVImporter.extractor"></a>

#### extractor
