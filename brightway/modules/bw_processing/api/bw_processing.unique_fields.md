**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.unique_fields` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_processing==1.6'
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
  -I "$SP" -m bw_processing.unique_fields cfg.yml > bw_processing.unique_fields.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.unique_fields"></a>

# bw\_processing.unique\_fields

<a id="bw_processing.unique_fields.greedy_set_cover"></a>

#### greedy\_set\_cover

```python
def greedy_set_cover(data, exclude=None, raise_error=True)
```

Find unique set of attributes that uniquely identifies each element in ``data``.

Feature selection is a well known problem, and is analogous to the `set cover problem <https://en.wikipedia.org/wiki/Set_cover_problem>`__, for which there is a `well known heuristic <https://en.wikipedia.org/wiki/Set_cover_problem#Greedy_algorithm>`__.

Example::

data = [
{'a': 1, 'b': 2, 'c': 3},
{'a': 2, 'b': 2, 'c': 3},
{'a': 1, 'b': 2, 'c': 4},
]
greedy_set_cover(data)
>>> {'a', 'c'}

**Arguments**:

- `data` _iterable_ - List of dictionaries with the same fields.
- `exclude` _iterable_ - Fields to exclude during search for uniqueness. ``id`` is Always excluded.
  

**Returns**:

  Set of attributes (strings)
  

**Raises**:

- `NonUnique` - The given fields are not enough to ensure uniqueness.
  
  Note that ``NonUnique`` is not raised if ``raise_error`` is false.

<a id="bw_processing.unique_fields.as_unique_attributes_dataframe"></a>

#### as\_unique\_attributes\_dataframe

```python
def as_unique_attributes_dataframe(df,
                                   exclude=None,
                                   include=None,
                                   raise_error=False)
```

Return a copy of ``df`` keeping only the columns needed to uniquely identify each row.

Columns are selected using the greedy set-cover heuristic (see
:func:`greedy_set_cover`). Columns listed in ``include`` are always kept,
even if they are not required for uniqueness.

**Arguments**:

- `df` - Input pandas DataFrame.
- `exclude` - Column names to skip during the uniqueness search.
- `include` - Column names to always retain in the output.
- `raise_error` - If ``True``, raise ``NonUnique`` when no unique set can be
  found; otherwise, all columns are kept silently.
  

**Returns**:

  A DataFrame with only the uniqueness-covering (and always-included)
  columns.

<a id="bw_processing.unique_fields.as_unique_attributes"></a>

#### as\_unique\_attributes

```python
def as_unique_attributes(data, exclude=None, include=None, raise_error=False)
```

Format ``data`` as unique set of attributes and values for use in ``create_processed_datapackage``.

Each element in ``data`` must have the attribute ``id``, and it must be unique. However, the field "id" is not used in selecting the unique set of attributes.

If no set of attributes is found that uniquely identifies all features is found, all fields are used. To have this case raise an error, pass ``raise_error=True``.::

data = [
{},
]

**Arguments**:

- `data` _iterable_ - List of dictionaries with the same fields.
- `exclude` _iterable_ - Fields to exclude during search for uniqueness. ``id`` is Always excluded.
- `include` _iterable_ - Fields to include when returning, even if not unique
  

**Returns**:

  (list of field names as strings, dictionary of data ids to values for given field names)
  

**Raises**:

- `InconsistentFields` - Not all features provides all fields.
