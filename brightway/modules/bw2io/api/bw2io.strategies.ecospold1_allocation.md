**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.strategies.ecospold1_allocation` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.strategies.ecospold1_allocation cfg.yml > bw2io.strategies.ecospold1_allocation.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.strategies.ecospold1_allocation"></a>

# bw2io.strategies.ecospold1\_allocation

<a id="bw2io.strategies.ecospold1_allocation.delete_integer_codes"></a>

#### delete\_integer\_codes

```python
def delete_integer_codes(data)
```

Delete integer codes from the input data dictionary.

Parameters
----------
data : list[dict]
    A list of dictionaries, where each dictionary represents a row of data.
    Each dictionary should have a `name` key, and optionally a `code` and or `exchanges` key.

Returns
-------
list[dict]
    The updated list of dictionaries with any integer `code` keys removed from
    the dictionaries and their `exchanges` keys

Examples
--------
>>> data = [{'name': 'test', 'code': 1}, {'name': 'test2', 'exchanges': [{'code': 2}]}]
>>> delete_integer_codes(data)
>>> data == [{'name': 'test'}, {'name': 'test2', 'exchanges': [{}]}]

<a id="bw2io.strategies.ecospold1_allocation.clean_integer_codes"></a>

#### clean\_integer\_codes

```python
def clean_integer_codes(data)
```

Convert integer activity codes to strings and delete integer codes from exchanges.

Parameters
----------
data : list of dict
    List of datasets, where each dataset is a dictionary containing information about the dataset, such as its name,
    description, and exchanges.

Returns
-------
list of dict
    The cleaned list of datasets, where integer activity codes have been converted to strings and integer codes
    have been deleted from exchanges.

Examples
--------
>>> data = [{'name': 'Dataset A', 'description': '...', 'code': 123},
...         {'name': 'Dataset B', 'description': '...', 'exchanges': [{'code': 456, 'amount': 1.0}]}]
>>> clean_integer_codes(data)
[{'name': 'Dataset A', 'description': '...', 'code': '123'},
 {'name': 'Dataset B', 'description': '...', 'exchanges': [{'amount': 1.0}]}]

<a id="bw2io.strategies.ecospold1_allocation.es1_allocate_multioutput"></a>

#### es1\_allocate\_multioutput

```python
def es1_allocate_multioutput(data)
```

This strategy allocates multioutput datasets to new datasets.

This deletes the multioutput dataset, breaking any existing linking. This shouldn't be a concern, as you shouldn't link to a multioutput dataset in any case.

Note that multiple allocations for the same product and input will result in undefined behavior.

Parameters
----------
data : list of dict
    List of datasets, where each dataset is a dictionary containing information about the dataset, such as its name,
    description, and exchanges.

Returns
-------
list of dict
    The new list of datasets, where multioutput datasets have been allocated to new datasets.

Examples
-------
>>> data = [{'name': 'Dataset A', 'exchanges': [{'name': 'Output 1', 'amount': 1.0},
...                                             {'name': 'Output 2', 'amount': 2.0}],
...          'allocations': [{'name': 'Activity 1', 'product': 'Output 1', 'input': 'Input 1'},
...                           {'name': 'Activity 2', 'product': 'Output 2', 'input': 'Input 2'}]},
...         {'name': 'Dataset B', 'exchanges': [{'name': 'Output 1', 'amount': 1.0}],
...          'allocations': [{'name': 'Activity 3', 'product': 'Output 1', 'input': 'Input 3'}]}]
>>> es1_allocate_multioutput(data)
[{'name': 'Dataset A: Output 1', 'exchanges': [{'name': 'Output 1', 'amount': 1.0}],
  'allocations': [{'name': 'Activity 1', 'product': 'Output 1', 'input': 'Input 1'}]},
 {'name': 'Dataset A: Output 2', 'exchanges': [{'name': 'Output 2', 'amount': 2.0}],
  'allocations': [{'name': 'Activity 2', 'product': 'Output 2', 'input': 'Input 2'}]},
 {'name': 'Dataset B', 'exchanges': [{'name': 'Output 1', 'amount': 1.0}],
  'allocations': [{'name': 'Activity 3', 'product': 'Output 1', 'input': 'Input 3'}]}]

<a id="bw2io.strategies.ecospold1_allocation.allocate_exchanges"></a>

#### allocate\_exchanges

```python
def allocate_exchanges(ds)
```

Take a dataset, which has multiple outputs, and return a list of allocated datasets.

The allocation data structure looks like:

.. code-block:: python

    {
        'exchanges': [integer codes for biosphere flows, ...],
        'fraction': out of 100,
        'reference': integer codes
    }

We assume that the allocation factor for each coproduct is always 100 percent.

Parameters
----------
ds : dict
    A dataset that has multiple outputs.

Returns
-------
list of dict
    A list of allocated datasets.

Examples
--------
>>> ds = {'name': 'Dataset A', 'exchanges': [{'name': 'Output 1', 'code': 1, 'type': 'production'},
...                                          {'name': 'Output 2', 'code': 2},
...                                          {'name': 'Output 3', 'code': 3}],
...       'allocations': [{'exchanges': [2], 'fraction': 50.0, 'reference': 1},
...                        {'exchanges': [3], 'fraction': 50.0, 'reference': 1}]}
>>> allocate_exchanges(ds)
[{'name': 'Dataset A', 'exchanges': [{'name': 'Output 1', 'code': 1, 'type': 'production'},
                                     {'name': 'Output 2', 'code': 2, 'type': 'from'},
                                     {'name': 'Output 3', 'code': 3, 'type': 'from'}]},
 {'name': 'Dataset A: Output 2', 'exchanges': [{'name': 'Output 2', 'code': 2, 'type': 'production'}],
  'allocations': [{'exchanges': [2], 'fraction': 100.0, 'reference': 2}]},
 {'name': 'Dataset A: Output 3', 'exchanges': [{'name': 'Output 3', 'code': 3, 'type': 'production'}],
  'allocations': [{'exchanges': [3], 'fraction': 100.0, 'reference': 3}]}]
