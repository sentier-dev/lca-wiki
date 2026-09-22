**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.io_pyarrow_helpers` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_processing.io_pyarrow_helpers cfg.yml > bw_processing.io_pyarrow_helpers.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.io_pyarrow_helpers"></a>

# bw\_processing.io\_pyarrow\_helpers

This module contains some helpers to convert `nympy.ndarrays` to/from Apache `Arrow` `Table`.

We use `pyarrow.Table` objects to save/retrieve data into/from `parquet` format files.
We use a `metadata` section in the `pyarrow.Table` (and the `parquet` files) to be able
to recognize what type of data was serialized. Specific and generic codes exist.

The metadata object is a `dict` object that looks like this:

`{"object": "vector", "type": "generic"}`. `object` can be `vector` (`ndim == 1`) or `matrix` (`ndim == 2`),
`type` can be:

- `indices` (`dtype` is `INDICES_DTYPE`);
- `distributions` (`dtype` is `UNCERTAINTY_DTYPE`);
- `generic` (`dtype` is a common type);

<a id="bw_processing.io_pyarrow_helpers.numpy_generic_vector_to_pyarrow_generic_vector_table"></a>

#### numpy\_generic\_vector\_to\_pyarrow\_generic\_vector\_table

```python
def numpy_generic_vector_to_pyarrow_generic_vector_table(
        arr: np.ndarray) -> pa.Table
```

Convert a generic (numpy) vector to a (arrow) table.

**Arguments**:

- `arr` _ndarray_ - A numpy array that corresponds to a vector, i.e. its dimension is 1.
  
  See:
  `pyarrow_generic_vector_table_to_numpy_generic_vector`.
  

**Returns**:

  The corresponding `pyarrow.Table` object.

<a id="bw_processing.io_pyarrow_helpers.pyarrow_generic_vector_table_to_numpy_generic_vector"></a>

#### pyarrow\_generic\_vector\_table\_to\_numpy\_generic\_vector

```python
def pyarrow_generic_vector_table_to_numpy_generic_vector(
        table: pa.Table) -> np.ndarray
```

Convert a generic (arrow) vector table to a (numpy) array.

**Arguments**:

- `table` _pa.Table_ - A `pyarrow` table that corresponds to a vector.
  
  See:
  `numpy_generic_vector_to_pyarrow_generic_vector_table`.
  

**Returns**:

  The corresponding `np.ndarray` object.

<a id="bw_processing.io_pyarrow_helpers.INDICES_SCHEMA"></a>

#### INDICES\_SCHEMA

<a id="bw_processing.io_pyarrow_helpers.numpy_indices_vector_to_pyarrow_indices_vector_table"></a>

#### numpy\_indices\_vector\_to\_pyarrow\_indices\_vector\_table

```python
def numpy_indices_vector_to_pyarrow_indices_vector_table(
        arr: np.ndarray) -> pa.Table
```

Convert a specific indices (numpy) vector to a (arrow) table.

**Arguments**:

- `arr` _ndarray_ - A numpy array that corresponds to an indices vector, i.e. its dimension is 1 and its
  `dtype` is `INDICES_DTYPE`.
  
  See:
  `pyarrow_indices_vector_table_to_numpy_indices_vector`.
  

**Returns**:

  The corresponding `pyarrow.Table` object.

<a id="bw_processing.io_pyarrow_helpers.pyarrow_indices_vector_table_to_numpy_indices_vector"></a>

#### pyarrow\_indices\_vector\_table\_to\_numpy\_indices\_vector

```python
def pyarrow_indices_vector_table_to_numpy_indices_vector(
        table: pa.Table) -> np.ndarray
```

Convert a specific indices (arrow) vector table to a (numpy) array.

**Arguments**:

- `table` _pa.Table_ - A `pyarrow` table that corresponds to an indices vector.
  
  See:
  `numpy_indices_vector_to_pyarrow_indices_vector_table`.
  

**Returns**:

  The corresponding `np.ndarray` object.

<a id="bw_processing.io_pyarrow_helpers.NBR_UNCERTAINTY_FIELDS"></a>

#### NBR\_UNCERTAINTY\_FIELDS

<a id="bw_processing.io_pyarrow_helpers.PA_UNCERTAINTY_FIELDS"></a>

#### PA\_UNCERTAINTY\_FIELDS

<a id="bw_processing.io_pyarrow_helpers.UNCERTAINTY_SCHEMA"></a>

#### UNCERTAINTY\_SCHEMA

<a id="bw_processing.io_pyarrow_helpers.UNCERTAINTY_FIELDS_NAMES"></a>

#### UNCERTAINTY\_FIELDS\_NAMES

<a id="bw_processing.io_pyarrow_helpers.numpy_distributions_vector_to_pyarrow_distributions_vector_table"></a>

#### numpy\_distributions\_vector\_to\_pyarrow\_distributions\_vector\_table

```python
def numpy_distributions_vector_to_pyarrow_distributions_vector_table(
        arr: np.ndarray) -> pa.Table
```

Convert a specific distributions (numpy) vector to a (arrow) table.

**Arguments**:

- `arr` _np.ndarray_ - A numpy array that corresponds to a distributions vector, i.e. its dimension is 1 and its
  `dtype` is `UNCERTAINTY_DTYPE`.
  
  See:
  `pyarrow_distributions_vector_table_to_numpy_distributions_vector`
  

**Returns**:

  The corresponding `pyarrow.Table` object.

<a id="bw_processing.io_pyarrow_helpers.pyarrow_distributions_vector_table_to_numpy_distributions_vector"></a>

#### pyarrow\_distributions\_vector\_table\_to\_numpy\_distributions\_vector

```python
def pyarrow_distributions_vector_table_to_numpy_distributions_vector(
        table: pa.Table) -> np.ndarray
```

Convert a specific distributions (arrow) vector table to a (numpy) array.

**Arguments**:

- `table` _pa.Table_ - A `pyarrow` table that corresponds to a distributions vector.
  
  See:
  `numpy_distributions_vector_to_pyarrow_distributions_vector_table`.
  

**Returns**:

  The corresponding `np.ndarray` object.

<a id="bw_processing.io_pyarrow_helpers.numpy_generic_matrix_to_pyarrow_generic_matrix_table"></a>

#### numpy\_generic\_matrix\_to\_pyarrow\_generic\_matrix\_table

```python
def numpy_generic_matrix_to_pyarrow_generic_matrix_table(
        arr: np.ndarray) -> pa.Table
```

Convert a generic (numpy) matrix to a (arrow) table.

**Arguments**:

- `arr` _ndarray_ - A numpy array that corresponds to a generic matrix, i.e. its dimension is 2.
  
  See:
  `pyarrow_generic_matrix_table_to_numpy_generic_matrix`.
  

**Returns**:

  The corresponding `pyarrow.Table` object.

<a id="bw_processing.io_pyarrow_helpers.pyarrow_generic_matrix_table_to_numpy_generic_matrix"></a>

#### pyarrow\_generic\_matrix\_table\_to\_numpy\_generic\_matrix

```python
def pyarrow_generic_matrix_table_to_numpy_generic_matrix(
        table: pa.Table) -> np.ndarray
```

Convert a generic (arrow) matrix table to a (numpy) array.

**Arguments**:

- `table` _pa.Table_ - A `pyarrow` table that corresponds to a generic matrix.
  
  See:
  `numpy_generic_matrix_to_pyarrow_generic_matrix_table`.
  

**Returns**:

  The corresponding `np.ndarray` object.
