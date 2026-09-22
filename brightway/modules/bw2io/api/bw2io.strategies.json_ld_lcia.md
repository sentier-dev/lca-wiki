**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.strategies.json_ld_lcia` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.strategies.json_ld_lcia cfg.yml > bw2io.strategies.json_ld_lcia.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.strategies.json_ld_lcia"></a>

# bw2io.strategies.json\_ld\_lcia

<a id="bw2io.strategies.json_ld_lcia.json_ld_lcia_add_method_metadata"></a>

#### json\_ld\_lcia\_add\_method\_metadata

```python
def json_ld_lcia_add_method_metadata(data)
```

Add metadata of the Life Cycle Impact Assessment (LCIA) method to the corresponding impact categories.

Iterates over the LCIA methods and adds metadata from the method to each of its impact
categories. The metadata includes the method's name, description, version, and lastChange.

Parameters
----------
data : dict
    A dictionary containing LCIA methods and their impact categories.

Returns
-------
dict
    A dictionary with the updated LCIA impact categories containing the parent method metadata.

Examples
--------
 >>> data = {
...     "lcia_methods": {
...         "method_1": {
...             "name": "LCIA Method 1",
...             "description": "Sample LCIA Method 1",
...             "version": "1.0",
...             "lastChange": "2021-01-01",
...             "impactCategories": [
...                 {"@id": "category_1"},
...                 {"@id": "category_2"},
...             ],
...         },
...     },
...     "lcia_categories": {
...         "category_1": {},
...         "category_2": {},
...     },
... }
>>> json_ld_lcia_add_method_metadata(data)
{
    'lcia_methods': {
        'method_1': {
            'name': 'LCIA Method 1',
            'description': 'Sample LCIA Method 1',
            'version': '1.0',
            'lastChange': '2021-01-01',
            'impactCategories': [
                {'@id': 'category_1'},
                {'@id': 'category_2'},
            ],
        },
    },
    'lcia_categories': {
        'category_1': {
            'parent': {
                'name': 'LCIA Method 1',
                'description': 'Sample LCIA Method 1',
                'version': '1.0',
                'lastChange': '2021-01-01',
            },
        },
        'category_2': {
            'parent': {
                'name': 'LCIA Method 1',
                'description': 'Sample LCIA Method 1',
                'version': '1.0',
                'lastChange': '2021-01-01',
            },
        },
    },
}

<a id="bw2io.strategies.json_ld_lcia.json_ld_lcia_set_method_metadata"></a>

#### json\_ld\_lcia\_set\_method\_metadata

```python
def json_ld_lcia_set_method_metadata(data)
```

Update the metadata of Life Cycle Impact Assessment (LCIA) methods in the given data.

    Processes the metadata of the LCIA methods in the given data, removing unnecessary fields,
    renaming fields, setting units, and updating the name and description.

    Parameters
    ----------
    data : list
        A list of dictionaries representing LCIA methods with metadata.

    Returns
    -------
    list
        A list of dictionaries representing the updated LCIA methods with modified metadata.

    Examples
    --------
    >>> data = [
    ...     {
    ...         "@context": "http://www.example.com",
    ...         "@type": "LCIA",
    ...         "referenceUnitName": "kg",
    ...         "@id": "method_1",
    ...         "name": "LCIA Method 1",
    ...         "description": "Sample LCIA Method 1",
    ...         "parent": {
    ...             "name": "Parent Method",
    ...             "description": "Sample parent method",
    ...         },
    ...     }
    ... ]
    >>> json_ld_lcia_set_method_metadata(data)
    [
        {
            'unit': 'kg',
            'id': 'method_1',
            'name': ('Parent Method', 'LCIA Method 1'),
            'description': 'Sample LCIA Method 1
Sample parent method',
            'parent': {
                'name': 'Parent Method',
                'description': 'Sample parent method',
            },
        }
    ]

<a id="bw2io.strategies.json_ld_lcia.json_ld_lcia_convert_to_list"></a>

#### json\_ld\_lcia\_convert\_to\_list

```python
def json_ld_lcia_convert_to_list(data)
```

Convert the Life Cycle Impact Assessment (LCIA) categories in the given data to a list.

Takes the LCIA categories from the input data dictionary and returns them as a list.

Parameters
----------
data : dict
    A dictionary containing the LCIA categories with their respective keys.

Returns
-------
list
    A list of dictionaries representing the LCIA categories.

Examples
--------
>>> data = {
...     "lcia_categories": {
...         "category_1": {"name": "LCIA Category 1"},
...         "category_2": {"name": "LCIA Category 2"},
...     }
... }
>>> json_ld_lcia_convert_to_list(data)
[{'name': 'LCIA Category 1'}, {'name': 'LCIA Category 2'}]

<a id="bw2io.strategies.json_ld_lcia.json_ld_lcia_reformat_cfs_as_exchanges"></a>

#### json\_ld\_lcia\_reformat\_cfs\_as\_exchanges

```python
def json_ld_lcia_reformat_cfs_as_exchanges(data)
```

Reformat the impact factors of Life Cycle Impact Assessment (LCIA) methods as exchanges.

Modifies the given LCIA methods data by renaming the 'impactFactors' field to 'exchanges' and
updating the fields within each exchange.

Parameters
----------
data : list
    A list of dictionaries representing LCIA methods with impact factors.

Returns
-------
list
    A list of dictionaries representing the updated LCIA methods with reformatted exchanges.

Examples
--------
>>> data = [
...     {
...         "impactFactors": [
...             {
...                 "value": 1.0,
...                 "unit": {"name": "kg"},
...             }
...         ],
...     }
... ]
>>> json_ld_lcia_reformat_cfs_as_exchanges(data)
[
    {
        'exchanges': [
            {
                'amount': 1.0,
                'unit': 'kg',
            }
        ],
    }
]
