**Generated API reference** · package `bw2data` 4.7 · module `bw2data.ia_data_store` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.ia_data_store cfg.yml > bw2data.ia_data_store.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.ia_data_store"></a>

# bw2data.ia\_data\_store

<a id="bw2data.ia_data_store.abbreviate"></a>

#### abbreviate

```python
def abbreviate(names, length=8)
```

Take a tuple or list, and construct a string, doing the following:

First, apply :func:`.filesystem.safe_filename` to each element in ``names``.

Next, take the following, in order:
    - The first word of the first element in names, lower-cased, where word is defined as everything up to the first empty space character.
    - Join the rest of the first element (i.e. after the first word) with all other elements. Use the empty space character to join.
    - In this long string separated by spaces, take the lowercase first character of each word. Add the first word to this new string.
    - Finally, add a dash, and then the MD5 hash of the entire identifier, where each element is joined by a dash character.

``('ReCiPe Endpoint (E,A)', 'human health', 'ionising radiation')`` becomes ``'recipee(hhir-70eeef20a20deb6347ad428e3f6c5f3c'``.

The MD5 hash is needed because taking the first characters doesn't guarantee unique strings.

<a id="bw2data.ia_data_store.ImpactAssessmentDataStore"></a>

## ImpactAssessmentDataStore Objects

```python
class ImpactAssessmentDataStore(ProcessedDataStore)
```

A subclass of ``DataStore`` for impact assessment methods.

IA objects are hierarchically structured, and their identifier uses this structure, like ``('ecological scarcity 2006', 'total', 'natural resources')``. The identifier must be a ``tuple``, i.e. ``()``, not a ``list``, i.e. ``[]``. The identifier should only contain unicode strings, and can be of any length >= 1.

Because impact assessment methods are identified by a tuple of strings, e.g. ``('ReCiPe Endpoint (E,A)', 'human health', 'ionising radiation')``, we need to transform this identifier before it can be used e.g. as a filename. We do this using the :func:`.abbreviate` function, which returns a single unicode string.

**Arguments**:

  - *name* (tuple): Name of the IA object to manage. Must be a tuple of unicode strings.

<a id="bw2data.ia_data_store.ImpactAssessmentDataStore.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```

<a id="bw2data.ia_data_store.ImpactAssessmentDataStore.get_abbreviation"></a>

#### get\_abbreviation

```python
def get_abbreviation()
```

Retrieve the abbreviation of the method identifier from the metadata store. See class documentation.

<a id="bw2data.ia_data_store.ImpactAssessmentDataStore.copy"></a>

#### copy

```python
def copy(name=None)
```

Make a copy of the method, including its CFs and metadata.

If ``name`` is not provided, add "Copy of" to the last element of the original name, e.g. ``("foo", "bar")`` becomes ``("foo", "Copy of bar")``

**Arguments**:

  - *name* (tuple, optional): Name of the new method.
  

**Returns**:

  The new object.

<a id="bw2data.ia_data_store.ImpactAssessmentDataStore.register"></a>

#### register

```python
def register(**kwargs)
```

Register an object with the metadata store.

The metadata key ``abbreviation`` is set automatically.

Objects must be registered before data can be written. If this object is not yet registered in the metadata store, a warning is written to **stdout**.

Takes any number of keyword arguments.

<a id="bw2data.ia_data_store.ImpactAssessmentDataStore.filename"></a>

#### filename

```python
@property
def filename()
```

Returns the abbreviated identifier of the method, used as the filename.

Returns
-------
str
    The abbreviated identifier of the method.

<a id="bw2data.ia_data_store.ImpactAssessmentDataStore.process"></a>

#### process

```python
def process(**extra_metadata)
```

Processes the impact assessment method and updates the metadata, including
the identifier.

Parameters
----------
extra_metadata
    Additional metadata to be included during processing.

Notes
-----
The method updates the metadata with the list form of the method's identifier.
