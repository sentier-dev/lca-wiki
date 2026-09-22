**Generated API reference** · package `bw_timex` 1.4.0 · module `bw_timex.helper_classes` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_timex==1.4.0'
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
  -I "$SP" -m bw_timex.helper_classes cfg.yml > bw_timex.helper_classes.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_timex.helper_classes"></a>

# bw\_timex.helper\_classes

<a id="bw_timex.helper_classes.LazyActivity"></a>

## LazyActivity Objects

```python
class LazyActivity(Activity)
```

An `Activity` proxy that reads its pickled `data` blob only when needed.

`TimexLCA` keeps a proxy for every node of every database in
`database_dates`, which is hundreds of thousands of nodes for real
background databases, while only a handful of them are ever used for
anything but their metadata. Unpickling the `data` blob of all of them
dominates the setup time, so this proxy is built from the scalar columns of
`ActivityDataset` instead. Those cover the keys that are read in bulk
(`name`, `reference product`, `location`, `code`, `database`, `type`); any
other key, and anything that needs the full dataset (exchange iteration,
saving, ...), loads the row from the database on first use.

<a id="bw_timex.helper_classes.LazyActivity.COLUMN_NAMES"></a>

#### COLUMN\_NAMES

The columns to select, in the order `__init__` expects them.

<a id="bw_timex.helper_classes.LazyActivity.__init__"></a>

#### \_\_init\_\_

```python
def __init__(row: tuple)
```

`row` holds the columns named in `COLUMN_NAMES`, in that order.

<a id="bw_timex.helper_classes.LazyActivity.id"></a>

#### id

```python
@property
def id()
```

<a id="bw_timex.helper_classes.LazyActivity.key"></a>

#### key

```python
@property
def key()
```

<a id="bw_timex.helper_classes.LazyActivity.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(key)
```

<a id="bw_timex.helper_classes.SetList"></a>

## SetList Objects

```python
class SetList()
```

A helper class for the mapping of the same/mapped activity in different (temporal) databases, composed of a list of sets, that hold can hold the set of tuples of (act_id, database).
It is built by adding sets to the list, and returns the matching sets if one
calls the an item from a set.

Example: If the class instance is called my_setlist, my_setlist.add(set).

<a id="bw_timex.helper_classes.SetList.__init__"></a>

#### \_\_init\_\_

```python
def __init__() -> None
```

<a id="bw_timex.helper_classes.SetList.add"></a>

#### add

```python
def add(new_set: set) -> None
```

This method adds a set to the SetList instance.

Parameters
-----
new_set: a set to add to the SetList instance

Returns
-------
None

<a id="bw_timex.helper_classes.SetList.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(key: any) -> set
```

Returns all sets in the SetList instance containing the key

Parameters
----------
key: the key to look for in the sets of the SetList

Returns
-------
A list containing the set or all sets

<a id="bw_timex.helper_classes.SetList.__len__"></a>

#### \_\_len\_\_

```python
def __len__() -> int
```

<a id="bw_timex.helper_classes.SetList.__repr__"></a>

#### \_\_repr\_\_

```python
def __repr__()
```

<a id="bw_timex.helper_classes.TimeMappingDict"></a>

## TimeMappingDict Objects

```python
class TimeMappingDict(dict)
```

A dictionary mapping (flow, timestamp) tuples to unique integer IDs.

<a id="bw_timex.helper_classes.TimeMappingDict.__init__"></a>

#### \_\_init\_\_

```python
def __init__(start_id=2, *args, **kwargs) -> None
```

Initializes the dictionary with a starting ID.

<a id="bw_timex.helper_classes.TimeMappingDict.add"></a>

#### add

```python
def add(process_time_tuple, unique_id=None)
```

Adds a new process_time_tuple to the dictionary.

Parameters
----------
process_time_tuple : tuple
    A tuple of (flow and timestamp)
unique_id : int, optional
    A unique ID for the tuple (default: None).

Returns
-------
int
    The assigned unique ID.

<a id="bw_timex.helper_classes.TimeMappingDict.reversed"></a>

#### reversed

```python
@property
def reversed()
```

Returns a reversed version of the dictionary, updating it only if necessary.

Returns
-------
dict
    A reversed dictionary mapping unique IDs to (flow, timestamp) tuples.

<a id="bw_timex.helper_classes.InterDatabaseMapping"></a>

## InterDatabaseMapping Objects

```python
class InterDatabaseMapping(dict)
```

A dictionary of the form {id1:{database1: id1, database2: id2, ...}, id2: ...} that maps the
same activity in different databases.

<a id="bw_timex.helper_classes.InterDatabaseMapping.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs) -> None
```

<a id="bw_timex.helper_classes.InterDatabaseMapping.find_match"></a>

#### find\_match

```python
def find_match(id_, db_name) -> any
```

Returns the matching ID in the given database for the given ID.

<a id="bw_timex.helper_classes.InterDatabaseMapping.make_reciprocal"></a>

#### make\_reciprocal

```python
def make_reciprocal()
```

Internal method to make the mapping reciprocal.

<a id="bw_timex.helper_classes.InterDatabaseMapping.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(key)
```
