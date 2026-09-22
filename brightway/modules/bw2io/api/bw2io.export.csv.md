**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.export.csv` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.export.csv cfg.yml > bw2io.export.csv.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.export.csv"></a>

# bw2io.export.csv

<a id="bw2io.export.csv.reformat"></a>

#### reformat

```python
def reformat(value)
```

<a id="bw2io.export.csv.EXCHANGE_COLUMNS"></a>

#### EXCHANGE\_COLUMNS

<a id="bw2io.export.csv.PARAMETER_COLUMNS"></a>

#### PARAMETER\_COLUMNS

<a id="bw2io.export.csv.MAPPING"></a>

#### MAPPING

<a id="bw2io.export.csv.CSVFormatter"></a>

## CSVFormatter Objects

```python
class CSVFormatter(object)
```

<a id="bw2io.export.csv.CSVFormatter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(database_name, objs=None)
```

<a id="bw2io.export.csv.CSVFormatter.get_project_parameters"></a>

#### get\_project\_parameters

```python
def get_project_parameters()
```

<a id="bw2io.export.csv.CSVFormatter.get_database_parameters"></a>

#### get\_database\_parameters

```python
def get_database_parameters()
```

<a id="bw2io.export.csv.CSVFormatter.get_activity_parameters"></a>

#### get\_activity\_parameters

```python
def get_activity_parameters(act)
```

<a id="bw2io.export.csv.CSVFormatter.get_database_metadata"></a>

#### get\_database\_metadata

```python
def get_database_metadata()
```

<a id="bw2io.export.csv.CSVFormatter.get_activity_metadata"></a>

#### get\_activity\_metadata

```python
def get_activity_metadata(act)
```

<a id="bw2io.export.csv.CSVFormatter.exchange_as_dict"></a>

#### exchange\_as\_dict

```python
def exchange_as_dict(exc)
```

<a id="bw2io.export.csv.CSVFormatter.order_dicts"></a>

#### order\_dicts

```python
def order_dicts(data, kind="exchange")
```

<a id="bw2io.export.csv.CSVFormatter.get_exchanges"></a>

#### get\_exchanges

```python
def get_exchanges(act)
```

<a id="bw2io.export.csv.CSVFormatter.get_activity"></a>

#### get\_activity

```python
def get_activity(act)
```

<a id="bw2io.export.csv.CSVFormatter.get_unformatted_data"></a>

#### get\_unformatted\_data

```python
def get_unformatted_data()
```

Return all database data as a nested dictionary:

Returns
-------
dict
    A nested python dictionary with the following structure:

    {
        'database': {
            'name': name,
            'metadata': [(key, value)],
            'parameters': {
                'columns': [column names],
                'data': [[column values for each row]]
            },
            'project parameters': {
                'columns': [column names],
                'data': [[column values for each row]]
            }
        },
        'activities': [{
            'name': name,
            'metadata': [(key, value)],
            'parameters': {
                'columns': [column names],
                'group': 'group name',
                'data': [[column values for each row]]
            },
            'exchanges': {
                'columns': [column names],
                'data': [[column values for each row]]
            }
        }]
    }

<a id="bw2io.export.csv.CSVFormatter.get_formatted_data"></a>

#### get\_formatted\_data

```python
def get_formatted_data(sections=None)
```

<a id="bw2io.export.csv.write_lci_csv"></a>

#### write\_lci\_csv

```python
def write_lci_csv(database_name, objs=None, sections=None, dirpath=None)
```

Export database `database_name` to a CSV file.

Notes
-----
Not all data can be exported. The following constraints apply:

* Nested data, e.g. `{'foo': {'bar': 'baz'}}` are excluded.
* CSV is not a great format for nested data. However, *tuples* are exported, and the characters `::` are used to join elements of the tuple.
* The only well-supported data types are strings, numbers, and booleans.

Default directory is ``projects.output_dir``, set ``dirpath`` to have save the file somewhere else.

Parameters
----------
database_name : str
    The name of the database to export.
objs : list, optional
    A list of objects to export. If not provided, all objects in the database will be exported.
sections : list, optional
    A list of sections to export. If not provided, all sections will be exported.
dirpath : str, optional
    The directory to save the file to. If not provided, the default directory is ``projects.output_dir``.

Returns
-------
str
    The filepath of the exported file.
