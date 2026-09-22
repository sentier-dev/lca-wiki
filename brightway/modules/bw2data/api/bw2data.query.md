**Generated API reference** · package `bw2data` 4.7 · module `bw2data.query` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2data==4.7'
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
  -I "$SP" -m bw2data.query cfg.yml > bw2data.query.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.query"></a>

# bw2data.query

<a id="bw2data.query.operators"></a>

#### operators

<a id="bw2data.query.try_op"></a>

#### try\_op

```python
def try_op(f, x, y)
```

<a id="bw2data.query.Dictionaries"></a>

## Dictionaries Objects

```python
class Dictionaries()
```

Pretends to be a single dictionary when applying a ``Query`` to multiple databases.

Usage:
    first_database = Database(...).load()
    second_database = Database(...).load()
    my_joined_dataset = Dictionaries(first_database, second_database)
    search_results = Query(filter_1, filter_2)(my_joined_dataset)

<a id="bw2data.query.Dictionaries.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args)
```

<a id="bw2data.query.Dictionaries.items"></a>

#### items

```python
def items()
```

<a id="bw2data.query.Result"></a>

## Result Objects

```python
class Result()
```

A container that wraps a filtered dataset. Returned by a calling a ``Query`` object. A result object functions like a read-only dictionary; you can call ``Result[some_key]``, or ``some_key in Result``, or ``len(Result)``.

The dataset can also be sorted, using ``sort(field)``; the underlying data is then a ``collections.OrderedDict``.

**Arguments**:

  * *result* (dict): The filtered dataset.

<a id="bw2data.query.Result.__init__"></a>

#### \_\_init\_\_

```python
def __init__(result)
```

<a id="bw2data.query.Result.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```

<a id="bw2data.query.Result.__repr__"></a>

#### \_\_repr\_\_

```python
def __repr__()
```

<a id="bw2data.query.Result.sort"></a>

#### sort

```python
def sort(field, reverse=False)
```

Sort the filtered dataset. Operates in place; does not return anything.

**Arguments**:

  * *field* (str): The key used for sorting.
  * *reverse* (bool, optional): Reverse normal sorting order.

<a id="bw2data.query.Result.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```

<a id="bw2data.query.Result.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

<a id="bw2data.query.Result.keys"></a>

#### keys

```python
def keys()
```

<a id="bw2data.query.Result.items"></a>

#### items

```python
def items()
```

<a id="bw2data.query.Result.items"></a>

#### items

```python
def items()
```

<a id="bw2data.query.Result.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(key)
```

<a id="bw2data.query.Result.__contains__"></a>

#### \_\_contains\_\_

```python
def __contains__(key)
```

<a id="bw2data.query.Query"></a>

## Query Objects

```python
class Query()
```

A container for a set of filters applied to a dataset.

Filters are applied by calling the ``Query`` object, and passing the dataset to filter as the argument. Calling a ``Query`` with some data returns a ``Result`` object with the filtered dataset.

**Arguments**:

  * *filters* (filters): One or more ``Filter`` objects.

<a id="bw2data.query.Query.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*filters)
```

<a id="bw2data.query.Query.add"></a>

#### add

```python
def add(filter_)
```

Add another filter.

**Arguments**:

- `*filter_*` _``Filter``_ - A Filter object.

<a id="bw2data.query.Query.__call__"></a>

#### \_\_call\_\_

```python
def __call__(data)
```

<a id="bw2data.query.Filter"></a>

## Filter Objects

```python
class Filter()
```

A filter on a dataset.

The following functions are supported:

* "<", "<=", "==", ">", ">=": Mathematical relations
* "is", "not": Identity relations. Work on any Python object.
* "in", "notin": List or string relations.
* "iin", "iis", "inot": Case-insensitive string relations.
* "len": Length relation.

In addition, any function which defines a relationship between an input and an output can also be used.

**Examples**:

  
  * All ``name`` values are *"foo"*: ``Filter("name", "is", "foo")``
  * All ``name`` values include the string *"foo"*: ``Filter("name", "has", "foo")``
  * Category (a list of categories and subcategories) includes *"foo"*: ``Filter("category", "has", "foo")``
  

**Arguments**:

  * *key* (str): The field to filter on.
  * *function* (str or object): One of the pre-defined filters, or a callable object.
  * *value* (object): The value to test against.
  

**Returns**:

  A ``Result`` object which wraps a new data dictionary.

<a id="bw2data.query.Filter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(key, function, value)
```

<a id="bw2data.query.Filter.__call__"></a>

#### \_\_call\_\_

```python
def __call__(data)
```

<a id="bw2data.query.NF"></a>

#### NF

```python
def NF(value)
```

Shortcut for a name filter

<a id="bw2data.query.PF"></a>

#### PF

```python
def PF(value)
```

Shortcut for a reference product filter
