**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.array_creation` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_processing.array_creation cfg.yml > bw_processing.array_creation.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.array_creation"></a>

# bw\_processing.array\_creation

<a id="bw_processing.array_creation.peek"></a>

#### peek

```python
def peek(iterator)
```

<a id="bw_processing.array_creation.get_ncols"></a>

#### get\_ncols

```python
def get_ncols(iterator)
```

<a id="bw_processing.array_creation.chunked"></a>

#### chunked

```python
def chunked(iterable, chunk_size)
```

<a id="bw_processing.array_creation.create_chunked"></a>

#### create\_chunked

```python
def create_chunked(iterable, dtype, ncols=None, bucket_size=500)
```

Create a numpy array from an iterable of indeterminate length.

Needed when we can't determine the length of the iterable ahead of time
(e.g. for a generator or a database cursor), so can't create the complete
array in memory in one step.

Creates a list of arrays with ``bucket_size`` rows until ``iterable`` is
exhausted, then concatenates them along axis 0.

Pass ``ncols`` for a plain 2D array; omit it for a 1D structured array.

**Arguments**:

- `iterable` - Iterable of data used to populate the array.
- `dtype` - Numpy dtype of the created array.
- `ncols` - Number of columns; if None, a 1D structured array is created.
- `bucket_size` - Number of rows in each intermediate array.
  

**Returns**:

  The created array. Returns a zero-length array if ``iterable`` has no data.

<a id="bw_processing.array_creation.create_structured_array"></a>

#### create\_structured\_array

```python
def create_structured_array(iterable,
                            dtype,
                            nrows=None,
                            sort=False,
                            sort_fields=None)
```

Create a numpy `structured array <https://docs.scipy.org/doc/numpy/user/basics.rec.html>`__ for data ``iterable``. Returns a filepath of a created file (if ``filepath`` is provided, or the array.

``iterable`` can be data already in memory, or a generator.

``nrows`` can be supplied, if known. If ``iterable`` has a length, it will be determined automatically. If ``nrows`` is not known, this function generates chunked arrays until ``iterable`` is exhausted, and concatenates them.

<a id="bw_processing.array_creation.create_array"></a>

#### create\_array

```python
def create_array(iterable, nrows=None, dtype=np.float32)
```

Create a numpy array data ``iterable``. Returns a filepath of a created file (if ``filepath`` is provided, or the array.

``iterable`` can be data already in memory, or a generator.

``nrows`` can be supplied, if known. If ``iterable`` has a length, it will be determined automatically. If ``nrows`` is not known, this function generates chunked arrays until ``iterable`` is exhausted, and concatenates them.

Either ``nrows`` or ``ncols`` must be specified.
