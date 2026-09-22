**Generated API reference** · package `bw2data` 4.7 · module `bw2data.data_store` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.data_store cfg.yml > bw2data.data_store.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.data_store"></a>

# bw2data.data\_store

<a id="bw2data.data_store.DataStore"></a>

## DataStore Objects

```python
class DataStore()
```

Base class for all Brightway2 data stores. Subclasses should define:

    * **metadata**: A :ref:`serialized-dict` instance, e.g. ``databases`` or ``methods``. The custom is that each type of data store has a new metadata store, so the data store ``Foo`` would have a metadata store ``foos``.
    * **validator**: A data validator. Optional. See bw2data.validate.

<a id="bw2data.data_store.DataStore.validator"></a>

#### validator

<a id="bw2data.data_store.DataStore.__init__"></a>

#### \_\_init\_\_

```python
def __init__(name)
```

<a id="bw2data.data_store.DataStore.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```

<a id="bw2data.data_store.DataStore.__repr__"></a>

#### \_\_repr\_\_

<a id="bw2data.data_store.DataStore.metadata"></a>

#### metadata

<a id="bw2data.data_store.DataStore.filename"></a>

#### filename

```python
@property
def filename()
```

Remove filesystem-unsafe characters and perform unicode normalization on ``self.name`` using :func:`.filesystem.safe_filename`.

<a id="bw2data.data_store.DataStore.registered"></a>

#### registered

```python
@property
def registered()
```

<a id="bw2data.data_store.DataStore.register"></a>

#### register

```python
def register(**kwargs)
```

Register an object with the metadata store. Takes any number of keyword arguments.

<a id="bw2data.data_store.DataStore.deregister"></a>

#### deregister

```python
def deregister()
```

Remove an object from the metadata store. Does not delete any files.

<a id="bw2data.data_store.DataStore.load"></a>

#### load

```python
def load()
```

Load the intermediate data for this object.

**Returns**:

  The intermediate data.

<a id="bw2data.data_store.DataStore.copy"></a>

#### copy

```python
def copy(name)
```

Make a copy of this object with a new ``name``.

This method only changes the name, but not any of the data or metadata.

**Arguments**:

  * *name* (object): Name of the new object.
  

**Returns**:

  The new object.

<a id="bw2data.data_store.DataStore.backup"></a>

#### backup

```python
def backup()
```

Save a backup to ``backups`` folder.

**Returns**:

  File path of backup.

<a id="bw2data.data_store.DataStore.write"></a>

#### write

```python
def write(data)
```

Serialize intermediate data to disk.

**Arguments**:

  * *data* (object): The data

<a id="bw2data.data_store.DataStore.validate"></a>

#### validate

```python
def validate(data)
```

Validate data. Must be called manually.

<a id="bw2data.data_store.ProcessedDataStore"></a>

## ProcessedDataStore Objects

```python
class ProcessedDataStore(DataStore)
```

Brightway2 data stores that can be processed to NumPy arrays.

In addition to ``metadata`` and (optionally) ``validator``, subclasses should override ``add_geomappings``. This method takes the entire dataset, and loads objects to :ref:`geomapping` as needed.

<a id="bw2data.data_store.ProcessedDataStore.matrix"></a>

#### matrix

<a id="bw2data.data_store.ProcessedDataStore.make_searchable"></a>

#### make\_searchable

```python
@abstractmethod
def make_searchable(reset: bool = False, signal: bool = True) -> bool
```

<a id="bw2data.data_store.ProcessedDataStore.make_unsearchable"></a>

#### make\_unsearchable

```python
@abstractmethod
def make_unsearchable(signal: bool = False) -> bool
```

<a id="bw2data.data_store.ProcessedDataStore.delete"></a>

#### delete

```python
@abstractmethod
def delete(keep_params: bool = False,
           warn: bool = True,
           vacuum: bool = True,
           signal: bool = True)
```

<a id="bw2data.data_store.ProcessedDataStore.dirpath_processed"></a>

#### dirpath\_processed

```python
def dirpath_processed()
```

<a id="bw2data.data_store.ProcessedDataStore.filename_processed"></a>

#### filename\_processed

```python
def filename_processed()
```

<a id="bw2data.data_store.ProcessedDataStore.filepath_processed"></a>

#### filepath\_processed

```python
def filepath_processed()
```

<a id="bw2data.data_store.ProcessedDataStore.datapackage"></a>

#### datapackage

```python
def datapackage()
```

<a id="bw2data.data_store.ProcessedDataStore.write"></a>

#### write

```python
def write(data, process=True)
```

Serialize intermediate data to disk.

**Arguments**:

  * *data* (object): The data

<a id="bw2data.data_store.ProcessedDataStore.process_row"></a>

#### process\_row

```python
def process_row(row)
```

Translate data into a dictionary suitable for array inputs.

See `bw_processing documentation <https://github.com/brightway-lca/bw_processing>`__.

<a id="bw2data.data_store.ProcessedDataStore.process"></a>

#### process

```python
def process(**extra_metadata)
```

Process intermediate data from a Python dictionary to a `stats_arrays <https://pypi.python.org/pypi/stats_arrays/>`_ array, which is a `NumPy <http://numpy.scipy.org/>`_ `Structured <http://docs.scipy.org/doc/numpy/reference/generated/numpy.recarray.html#numpy.recarray>`_ `Array <http://docs.scipy.org/doc/numpy/user/basics.rec.html>`_. A structured array (also called record array) is a heterogeneous array, where each column has a different label and data type.

Processed arrays are saved in the ``processed`` directory.

If the uncertainty type is no uncertainty, undefined, or not specified, then the 'amount' value is used for 'loc' as well. This is needed for the random number generator.

Doesn't return anything, but writes a file to disk.

<a id="bw2data.data_store.ProcessedDataStore.add_geomappings"></a>

#### add\_geomappings

```python
def add_geomappings(data)
```

Add objects to ``geomapping``, if necessary.

**Arguments**:

  * *data* (object): The data

<a id="bw2data.data_store.ProcessedDataStore.validate"></a>

#### validate

```python
def validate(data)
```

Validate data. Must be called manually.
