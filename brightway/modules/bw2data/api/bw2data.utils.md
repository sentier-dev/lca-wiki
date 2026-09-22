**Generated API reference** · package `bw2data` 4.7 · module `bw2data.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.utils cfg.yml > bw2data.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.utils"></a>

# bw2data.utils

<a id="bw2data.utils.DOWNLOAD_URL"></a>

#### DOWNLOAD\_URL

<a id="bw2data.utils.safe_filename"></a>

#### safe\_filename

```python
@deprecated(
    "`safe_filename` has been moved to `bw_processing`; will be removed in v5")
def safe_filename(*args, **kwargs)
```

<a id="bw2data.utils.maybe_path"></a>

#### maybe\_path

```python
def maybe_path(x)
```

<a id="bw2data.utils.natural_sort"></a>

#### natural\_sort

```python
def natural_sort(l)
```

Sort the given list in the way that humans expect, e.g. 9 before 10.

<a id="bw2data.utils.random_string"></a>

#### random\_string

```python
def random_string(length=8)
```

Generate a random string of letters and numbers.

**Arguments**:

  * *length* (int): Length of string, default is 8
  

**Returns**:

  A string (not unicode)

<a id="bw2data.utils.combine_methods"></a>

#### combine\_methods

```python
def combine_methods(name: tuple, *ms: List[tuple]) -> "bw2data.method.Method"
```

Combine LCIA methods by adding duplicate characterization factors.

**Arguments**:

  * *ms* (one or more method id tuples): Any number of method ids, e.g.
  ``("my method", "wow"), ("another method", "wheee")``.
  

**Returns**:

  The new Method instance.

<a id="bw2data.utils.clean_exchanges"></a>

#### clean\_exchanges

```python
def clean_exchanges(data)
```

Make sure all exchange inputs are tuples, not lists.

<a id="bw2data.utils.POSITIVE_DISTRIBUTIONS"></a>

#### POSITIVE\_DISTRIBUTIONS

<a id="bw2data.utils.as_uncertainty_dict"></a>

#### as\_uncertainty\_dict

```python
def as_uncertainty_dict(value)
```

Given either a number or a ``stats_arrays`` uncertainty dict, return an uncertainty dict

<a id="bw2data.utils.uncertainify"></a>

#### uncertainify

```python
def uncertainify(data, distribution=None, bounds_factor=0.1, sd_factor=0.1)
```

Add some rough uncertainty to exchanges.

.. warning:: This function only changes exchanges with no uncertainty type or uncertainty type ``UndefinedUncertainty``, and does not change production exchanges!

Can only apply normal or uniform uncertainty distributions; default is uniform. Distribution, if specified, must be a ``stats_array`` uncertainty object.

``data`` is a LCI data dictionary.

If using the normal distribution:

* ``sd_factor`` will be multiplied by the mean to calculate the standard deviation.
* If no bounds are desired, set ``bounds_factor`` to ``None``.
* Otherwise, the bounds will be ``[(1 - bounds_factor) * mean, (1 + bounds_factor) * mean]``.

If using the uniform distribution, then the bounds are ``[(1 - bounds_factor) * mean, (1 + bounds_factor) * mean]``.

Returns the modified data.

<a id="bw2data.utils.recursive_str_to_unicode"></a>

#### recursive\_str\_to\_unicode

```python
def recursive_str_to_unicode(data, encoding="utf8")
```

Convert the strings inside a (possibly nested) python data structure to unicode strings using `encoding`.

<a id="bw2data.utils.combine_databases"></a>

#### combine\_databases

```python
def combine_databases(name, *dbs)
```

Combine databases into new database called ``name``.

<a id="bw2data.utils.merge_databases"></a>

#### merge\_databases

```python
def merge_databases(parent_db, other)
```

Merge ``other`` into ``parent_db``, including updating exchanges.

All databases must be SQLite databases.

``parent_db`` and ``other`` should be the names of databases.

Doesn't return anything.

<a id="bw2data.utils.download_file"></a>

#### download\_file

```python
def download_file(filename, directory="downloads", url=None)
```

Download a file and write it to disk in ``downloads`` directory.

If ``url`` is None, uses the Brightway2 data base URL. ``url`` should everything up to the filename, such that ``url`` + ``filename`` is the valid complete URL to download from.

Streams download to reduce memory usage.

**Arguments**:

  * *filename* (str): The filename to download.
  * *directory* (str, optional): Directory to save the file. Created if it doesn't already exist.
  * *url* (str, optional): URL where the file is located, if not the default Brightway data URL.
  

**Returns**:

  The path of the created file.

<a id="bw2data.utils.set_data_dir"></a>

#### set\_data\_dir

```python
def set_data_dir(dirpath, permanent=True)
```

Set the Brightway2 data directory to ``dirpath``.

If ``permanent`` is ``True``, then set ``dirpath`` as the default data directory.

Creates ``dirpath`` if needed. Also creates basic directories, and resets metadata.

<a id="bw2data.utils.switch_data_directory"></a>

#### switch\_data\_directory

```python
def switch_data_directory(dirpath)
```

<a id="bw2data.utils.create_in_memory_zipfile_from_directory"></a>

#### create\_in\_memory\_zipfile\_from\_directory

```python
def create_in_memory_zipfile_from_directory(path)
```

<a id="bw2data.utils.get_node"></a>

#### get\_node

```python
def get_node(**kwargs)
```

<a id="bw2data.utils.get_activity"></a>

#### get\_activity

```python
def get_activity(key=None, **kwargs)
```

Support multiple ways to get exactly one activity node.

``key`` can be an integer or a key tuple.

<a id="bw2data.utils.get_geocollection"></a>

#### get\_geocollection

```python
def get_geocollection(location, default_global_location=False)
```

conservative approach to finding geocollections. Won't guess about ecoinvent or other dbs.

<a id="bw2data.utils.set_correct_process_type"></a>

#### set\_correct\_process\_type

```python
def set_correct_process_type(dataset: dict) -> dict
```

Change the `type` for an LCI process under certain conditions.

Only will make changes if the following conditions are met:

* `type` is `None` or missing -> set to either `process` or `processwithreferenceproduct`
* `type` is `process` but the dataset also includes an exchange which points to the same node
    -> `processwithreferenceproduct`
