**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.io_parquet_helpers` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_processing.io_parquet_helpers cfg.yml > bw_processing.io_parquet_helpers.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.io_parquet_helpers"></a>

# bw\_processing.io\_parquet\_helpers

This module contains some helpers to serialize/deserialize `numpy.ndarray` objects to/from Apache `parquet` files.
We convert the `nympy.ndarray` objects to `pyarrow.Table` objects to do so.

<a id="bw_processing.io_parquet_helpers.write_ndarray_to_parquet_file"></a>

#### write\_ndarray\_to\_parquet\_file

```python
def write_ndarray_to_parquet_file(file: BufferedWriter, arr: np.ndarray,
                                  meta_object: str, meta_type: str)
```

Serialize `ndarray` objects to `file`.

Parameters
    file (io.BufferedWriter): File to save to.
    arr (ndarray): Array to serialize.
    meta_object (str): "vector" or "matrix".
    meta_type (str): Type of object to serialize (see `io_pyarrow_helpers.py`).

<a id="bw_processing.io_parquet_helpers.read_parquet_file_to_ndarray"></a>

#### read\_parquet\_file\_to\_ndarray

```python
def read_parquet_file_to_ndarray(file: RawIOBase) -> numpy.ndarray
```

Read an `ndarray` from a `parquet` file.

**Arguments**:

- `file` _io.RawIOBase or fsspec file object_ - File to read from.
  

**Raises**:

  `WrongDatatype` if the correct metadata is not found in the `parquet` file.
  

**Returns**:

  The corresponding `numpy` `ndarray`.

<a id="bw_processing.io_parquet_helpers.save_arr_to_parquet"></a>

#### save\_arr\_to\_parquet

```python
def save_arr_to_parquet(file: RawIOBase, arr: np.ndarray, meta_object: str,
                        meta_type: str) -> None
```

Serialize a `numpy` `ndarray` to a `parquet` `file`.

Parameters
    file (RawIOBase): The file to save to.
    arr (ndarray): The array object to save.
    meta_object (str): "vector" or "matrix".
    meta_type (str): Type of object to serialize (see `io_pyarrow_helpers.py`).

<a id="bw_processing.io_parquet_helpers.load_ndarray_from_parquet"></a>

#### load\_ndarray\_from\_parquet

```python
def load_ndarray_from_parquet(file: RawIOBase) -> np.ndarray
```

Deserialize a `numpy` `ndarray` from a `parquet` `file`.

Parameters
    file (io.RawIOBase or fsspec file object): File to read from.

Returns
    The corresponding `numpy` `ndarray`.
