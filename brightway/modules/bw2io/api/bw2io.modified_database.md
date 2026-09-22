**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.modified_database` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.modified_database cfg.yml > bw2io.modified_database.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.modified_database"></a>

# bw2io.modified\_database

<a id="bw2io.modified_database.ModifiedDatabase"></a>

## ModifiedDatabase Objects

```python
class ModifiedDatabase(object)
```

Find relationships between foreground data ``data`` and background database named ``ref_database_name``.

Each activity and exchange is summarized in a *hash*, a small set of letters that summarizes all relevant attributes.

Attributes
----------
foreground_activities_mapping : dict
    hash: dataset
foreground_exchanges_mapping : dict
    hash: exchange
foreground_activities : dict
    activity hash: set of (exchange hash, amount) exchange tuples.
background_activities_mapping : dict
    hash: Activity
background_exchanges_mapping : dict
    hash: Exchange
background_activities : dict
    activity hash: set of (Exchange hash, amount) exchange tuples

Methods
-------
assert_data_fully_linked()
    Assert that all exchanges in ``data`` have an ``input`` key.
iterate_unmatched()
    Return data on activities in ``data`` which can't be found in ``ref_database_name``.
get_reason(exc_tuple, data)
    Get reason why exc_tuple not in data. Reasons are: 1) Changed amount 2) Missing
iterate_modified()
    Return data on modified activities
load_datasets()
    Determine which datasets are modified by comparing the exchanges values.
add_to_background_exchanges_mapping(exc)
    Add exchange to ``background_exchanges_mapping``.
hash_background_exchanges(activity)
    Hash exchanges in ``activity`` and add to ``background_exchanges_mapping``.
hash_foreground_exchanges(activity)
    Hash exchanges in ``activity`` and add to ``foreground_exchanges_mapping``.
prune()
    Remove activities from ``data`` that are not in ``ref_database_name``.

<a id="bw2io.modified_database.ModifiedDatabase.__init__"></a>

#### \_\_init\_\_

```python
def __init__(data, ref_database_name, from_simapro=False)
```

<a id="bw2io.modified_database.ModifiedDatabase.assert_data_fully_linked"></a>

#### assert\_data\_fully\_linked

```python
def assert_data_fully_linked()
```

<a id="bw2io.modified_database.ModifiedDatabase.iterate_unmatched"></a>

#### iterate\_unmatched

```python
def iterate_unmatched()
```

Return data on activities in ``data`` which can't be found in ``ref_database_name``.

Returns
-------
tuple
    (key, value)

<a id="bw2io.modified_database.ModifiedDatabase.get_reason"></a>

#### get\_reason

```python
def get_reason(exc_tuple, data)
```

Get reason why exc_tuple not in data. Reasons are:
1) Changed amount
2) Missing

Parameters
----------
exc_tuple : tuple
    (exchange hash, amount)
data : set
    set of (exchange hash, amount) exchange tuples

Returns
-------
str
    Reason why exc_tuple not in data

<a id="bw2io.modified_database.ModifiedDatabase.iterate_modified"></a>

#### iterate\_modified

```python
def iterate_modified()
```

Return data on modified activities

Returns
-------
tuple
    (key, value)

<a id="bw2io.modified_database.ModifiedDatabase.load_datasets"></a>

#### load\_datasets

```python
def load_datasets()
```

Determine which datasets are modified by comparing the exchanges values.

Specifically, compare the set of ``(input activity hashes, amount_as_string)`` values.

If the name or other important attributes changed, then there won't be a correspondence at all, so the dataset is treated as modified in any case.

<a id="bw2io.modified_database.ModifiedDatabase.add_to_background_exchanges_mapping"></a>

#### add\_to\_background\_exchanges\_mapping

```python
def add_to_background_exchanges_mapping(exc)
```

<a id="bw2io.modified_database.ModifiedDatabase.hash_background_exchanges"></a>

#### hash\_background\_exchanges

```python
def hash_background_exchanges(activity)
```

<a id="bw2io.modified_database.ModifiedDatabase.hash_foreground_exchanges"></a>

#### hash\_foreground\_exchanges

```python
def hash_foreground_exchanges(activity)
```

<a id="bw2io.modified_database.ModifiedDatabase.prune"></a>

#### prune

```python
def prune()
```
