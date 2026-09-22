**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.utils cfg.yml > bw2io.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.utils"></a>

# bw2io.utils

<a id="bw2io.utils.DEFAULT_FIELDS"></a>

#### DEFAULT\_FIELDS

<a id="bw2io.utils.activity_hash"></a>

#### activity\_hash

```python
def activity_hash(data, fields=None, case_insensitive=True)
```

Hash an activity dataset.

Used to import data formats like ecospold 1 (ecoinvent v1-2) and SimaPro, where no unique attributes for datasets are given.

This is clearly an imperfect and brittle solution, but there is no other obvious approach at this time.

By default, uses the following, in order:
* name
* categories
* unit
* reference product
* location

Parameters
----------
data : dict
    The :ref:`activity dataset data <database-documents>`.


fields : list, optional
    Optional list of fields to hash together. Default is ``('name', 'categories', 'unit', 'reference product', 'location')``.

    An empty string is used if a field isn't present. All fields are cast to lower case.


case_insensitive : bool, optional
    Cast everything to lowercase before computing hash. Default is ``True``.

Returns
-------
str
    A MD5 hash string, hex-encoded.

<a id="bw2io.utils.es2_activity_hash"></a>

#### es2\_activity\_hash

```python
def es2_activity_hash(activity, flow)
```

Generate unique ID for ecoinvent3 dataset.

Despite using a million UUIDs, there is actually no unique ID in an ecospold2 dataset.

Datasets are uniquely identified by the combination of activity and flow UUIDs.

Parameters
----------
activity : str
    The activity UUID.
flow : str
    The flow UUID.

Returns
-------
str
    The unique ID.

<a id="bw2io.utils.load_json_data_file"></a>

#### load\_json\_data\_file

```python
def load_json_data_file(filename)
```

<a id="bw2io.utils.format_for_logging"></a>

#### format\_for\_logging

```python
def format_for_logging(obj)
```

<a id="bw2io.utils.rescale_exchange"></a>

#### rescale\_exchange

```python
def rescale_exchange(exc: dict, factor: float) -> dict
```

Rescale exchanges, including formulas and uncertainty values, by a constant factor.

Parameters
----------
exc : dict
    The exchange to rescale.
factor : float
    The factor to rescale by.

Returns
-------
dict
    The rescaled exchange.

Raises
------
ValueError
    If factor is not a number.

<a id="bw2io.utils.standardize_method_to_len_3"></a>

#### standardize\_method\_to\_len\_3

```python
def standardize_method_to_len_3(name, padding="--", joiner=",")
```

Standardize an LCIA method name to a length 3 tuple.

Parameters
----------
name : tuple
    The current name.
padding : str, optional
    The string to use for missing fields. The default is "--".
joiner : str, optional
    The string to use to join the fields. The default is ",".

Returns
-------
tuple
    The standardized name.
