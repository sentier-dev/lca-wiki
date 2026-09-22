**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.strategies.lcia` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.strategies.lcia cfg.yml > bw2io.strategies.lcia.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.strategies.lcia"></a>

# bw2io.strategies.lcia

<a id="bw2io.strategies.lcia.add_activity_hash_code"></a>

#### add\_activity\_hash\_code

```python
def add_activity_hash_code(data)
```

Add 'code' field to characterization factors using 'activity_hash', if 'code' not already present.

Iterates over the LCIA methods in the given data and adds a 'code' field to each characterization
factor using the 'activity_hash' function, if the 'code' field is not already present.

Parameters
----------
data : list
    A list of dictionaries representing LCIA methods with characterization factors.

Returns
-------
list
    A list of dictionaries representing the updated LCIA methods with 'code' field added to characterization factors.

Examples
--------
>>> data = [
...     {
...         "exchanges": [
...             {
...                 "name": "Characterization Factor 1",
...                 # Other fields needed for activity_hash function
...             },
...             {
...                 "name": "Characterization Factor 2",
...                 "code": "existing_code",
...                 # Other fields needed for activity_hash function
...             },
...         ],
...     }
... ]
>>> add_activity_hash_code(data)
[
    {
        'exchanges': [
            {
                'name': 'Characterization Factor 1',
                'code': 'generated_code',
                # Other fields needed for activity_hash function
            },
            {
                'name': 'Characterization Factor 2',
                'code': 'existing_code',
                # Other fields needed for activity_hash function
            },
        ],
    }
]

<a id="bw2io.strategies.lcia.drop_unlinked_cfs"></a>

#### drop\_unlinked\_cfs

```python
def drop_unlinked_cfs(data)
```

Drop characterization factors (CFs) that don't have an 'input' attribute.

Iterates over the LCIA methods in the given data and removes any characterization factors that
don't have an 'input' attribute.

Parameters
----------
data : list
    A list of dictionaries representing LCIA methods with characterization factors.

Returns
-------
list
    A list of dictionaries representing the updated LCIA methods with unlinked characterization factors removed.

Examples
--------
>>> data = [
...     {
...         "exchanges": [
...             {"name": "Characterization Factor 1", "input": "input_1"},
...             {"name": "Characterization Factor 2"},
...         ],
...     }
... ]
>>> drop_unlinked_cfs(data)
[
    {
        'exchanges': [
            {
                'name': 'Characterization Factor 1',
                'input': 'input_1',
            },
        ],
    }
]

<a id="bw2io.strategies.lcia.set_biosphere_type"></a>

#### set\_biosphere\_type

```python
def set_biosphere_type(data)
```

Set characterization factor (CF) types to 'biosphere' for compatibility with LCI strategies.

Iterates over the LCIA methods in the given data and sets the 'type' attribute of each
characterization factor to 'biosphere'. This will overwrite existing 'type' values.

Parameters
----------
data : list
    A list of dictionaries representing LCIA methods with characterization factors.

Returns
-------
list
    A list of dictionaries representing the updated LCIA methods with 'biosphere' set as the 'type' of
    characterization factors.

Examples
--------
>>> data = [
...     {
...         "exchanges": [
...             {"name": "Characterization Factor 1", "type": "original_type"},
...             {"name": "Characterization Factor 2"},
...         ],
...     }
... ]
>>> set_biosphere_type(data)
[
    {
        'exchanges': [
            {
                'name': 'Characterization Factor 1',
                'type': 'biosphere',
            },
            {
                'name': 'Characterization Factor 2',
                'type': 'biosphere',
            },
        ],
    }
]

<a id="bw2io.strategies.lcia.rationalize_method_names"></a>

#### rationalize\_method\_names

```python
def rationalize_method_names(data)
```

Rationalize LCIA method names by removing redundant parts and unifying naming conventions.

Iterates over the LCIA methods in the given data and updates the 'name' attribute of each method
to remove unnecessary information and make the naming conventions more consistent.

Parameters
----------
data : list
    A list of dictionaries representing LCIA methods with method names.

Returns
-------
list
    A list of dictionaries representing the updated LCIA methods with rationalized method names.

Examples
--------
>>> data = [
...     {"name": ("Method 1 w/o LT", "Total")},
...     {"name": ("Method 2 no LT", "Total")},
...     {"name": ("Method 3", "Total")},
... ]
>>> rationalize_method_names(data)
[
    {'name': ('Method 1', 'without long-term')},
    {'name': ('Method 2', 'without long-term')},
    {'name': ('Method 3',)},
]

<a id="bw2io.strategies.lcia.match_subcategories"></a>

#### match\_subcategories

```python
def match_subcategories(data, biosphere_db_name, remove=True)
```

Add CFs for biosphere flows with the same top-level categories as a given characterization.

Given a characterization with a top-level category, e.g. ('air',), Finds all biosphere flows with
the same top-level categories and adds CFs for these flows as well. It doesn't replace CFs for existing flows
with multi-level categories. If `remove` is set to True, it also deletes the top-level CF, but only if it is
unlinked.

Parameters
----------
data : list
    A list of dictionaries representing LCIA methods with characterization factors.
biosphere_db_name : str
    The name of the biosphere database to look up flows.
remove : bool, optional
    If True, delete the top-level CF if it is unlinked. Default is True.

Returns
-------
list
    A list of dictionaries representing the updated LCIA methods with CFs added for biosphere flows with the
    same top-level categories.

Examples
--------
>>> data = [
...     {
...         "name": "Method 1",
...         "exchanges": [
...             {"categories": ("air",), "name": "Emission", "unit": "kg", "amount": 1.0},
...         ],
...     }
... ]
>>> biosphere_db_name = "example_biosphere"
>>> match_subcategories(data, biosphere_db_name)
[
    {
        'name': 'Method 1',
        'exchanges': [
            {'categories': ('air',), 'name': 'Emission', 'unit': 'kg', 'amount': 1.0},
            # Additional CFs for biosphere flows with the same top-level category ('air',)
        ],
    }
]

<a id="bw2io.strategies.lcia.fix_ecoinvent_38_lcia_implementation"></a>

#### fix\_ecoinvent\_38\_lcia\_implementation

```python
def fix_ecoinvent_38_lcia_implementation(data)
```

Update flow names in ecoinvent 3.8 LCIA implementation to correct inconsistencies.

Ecoinvent 3.8 LCIA implementation uses some flow names from 3.7. Updates these flow names when
possible and deletes them when not.

Parameters
----------
data : list
    A list of dictionaries representing LCIA methods with characterization factors.

Returns
-------
list
    A list of dictionaries representing the updated LCIA methods with corrected flow names.

Examples
--------
>>> data = [
...     {
...         "name": "Method 1",
...         "exchanges": [
...             {"name": "Cyfluthrin", "categories": ("soil", "agricultural")},
...         ],
...     }
... ]
>>> fix_ecoinvent_38_lcia_implementation(data)
[
    {
        "name": "Method 1",
        "exchanges": [
            {"name": "Beta-cyfluthrin", "categories": ("soil", "agricultural")},
        ],
    }
]

Notes
-----
The function includes a hardcoded mapping to fix known inconsistencies in flow names. This may not cover all
possible inconsistencies and might need to be updated in the future.
