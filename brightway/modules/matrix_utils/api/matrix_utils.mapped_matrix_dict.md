**Generated API reference** · package `matrix_utils` 0.9 · module `matrix_utils.mapped_matrix_dict` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'matrix_utils==0.9'
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
  -I "$SP" -m matrix_utils.mapped_matrix_dict cfg.yml > matrix_utils.mapped_matrix_dict.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matrix_utils.mapped_matrix_dict"></a>

# matrix\_utils.mapped\_matrix\_dict

<a id="matrix_utils.mapped_matrix_dict.SparseMatrixDict"></a>

## SparseMatrixDict Objects

```python
class SparseMatrixDict(dict)
```

Instantiate with `SparseMatrixDict({"label": sparse_matrix})`

<a id="matrix_utils.mapped_matrix_dict.SparseMatrixDict.__matmul__"></a>

#### \_\_matmul\_\_

```python
def __matmul__(other)
```

Define logic for `@` matrix multiplication operator.

Note that the sparse matrix dict must come first, i.e. `SparseMatrixDict @ other`.

<a id="matrix_utils.mapped_matrix_dict.MappedMatrixDict"></a>

## MappedMatrixDict Objects

```python
class MappedMatrixDict(Mapping)
```

<a id="matrix_utils.mapped_matrix_dict.MappedMatrixDict.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*,
             packages: dict[Union[tuple, str], Sequence[Datapackage]],
             matrix: str,
             row_mapper: ArrayMapper,
             col_mapper: Optional[ArrayMapper] = None,
             use_vectors: bool = True,
             use_arrays: bool = True,
             use_distributions: bool = False,
             seed_override: Optional[int] = None,
             indexer_override: Any = None,
             diagonal: bool = False,
             transpose: bool = False,
             custom_filter: Optional[Callable] = None,
             empty_ok: bool = False,
             sequential: bool = False,
             matrix_class: Type[MappedMatrix] = MappedMatrix,
             **kwargs)
```

A thin wrapper around a dict of `MappedMatrix` objects. See its docstring
for details on `custom_filter` and `indexer_override`.

The matrices have the same dimensions, the same lookup dictionaries, and the
same indexer.

The number of possible configurations of resource groups and indexers is far
higher than any generic class can handle. This class supports either
sequential or random indexing, and the indexing is applied to **all resource
groups and datapackages**. If you need finer-grained control, you can access
set and access the individual resource group `indexer` attributes.

Because the same indexer is used for all datapackages, individual `seed` values
are ignored. Use `seed_override` to set a global RNG seed.

The `empty_ok` flag applies to **all matrices** - if any of the matrices have
a valid data value no error will be raised. In practice this flag should have
no effect for `MappedMatrixDict` unless the input data is very broken.

Parameters
----------
packages : dict[Union[tuple, str], Sequence[Datapackage]]
    A dictionary with identifiers as keys and a list of `bw_processing`
    datapackages as values.
matrix : str
    The string identifying the matrix to be built.
use_vectors : bool
    Flag to use vector data from datapackages
use_arrays : bool
    Flag to use array data from datapackages
use_distributions : bool
    Flag to use `stats_arrays` distribution data from datapackages
row_mapper : ArrayMapper
    Used when matrices must align to an existing mapping.
col_mapper :
    Used when matrices must align to an existing mapping.
seed_override : int
    Overrides the RNG seed given in the datapackage, if any.
indexer_override : Any
    Parameter for custom indexers. See above.
diagonal : bool
    If `True`, only use the `row` indices to build a diagonal matrix.
transpose : bool
    Transpose row and column indices. Happens before any processing, so filters
    and mappers should refer to the transposed dimensions.
custom_filter : Callable
    Callable for function to filter data based on `indices` values. See above.
empty_ok : bool
    If False, raise `AllArraysEmpty` if the matrix would be empty
sequential : bool
    Use the **same sequential indexer** across all resource groups in all
    datapackages
matrix_class : MappedMatrix
    `MappedMatrix` class to use. Can be a subclass of `MappedMatrix`.

<a id="matrix_utils.mapped_matrix_dict.MappedMatrixDict.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(key: Any) -> MappedMatrix
```

<a id="matrix_utils.mapped_matrix_dict.MappedMatrixDict.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

<a id="matrix_utils.mapped_matrix_dict.MappedMatrixDict.__len__"></a>

#### \_\_len\_\_

```python
def __len__() -> int
```

<a id="matrix_utils.mapped_matrix_dict.MappedMatrixDict.__next__"></a>

#### \_\_next\_\_

```python
def __next__() -> None
```

<a id="matrix_utils.mapped_matrix_dict.MappedMatrixDict.get_global_indexer"></a>

#### get\_global\_indexer

```python
def get_global_indexer(indexer_override: Any, sequential: bool,
                       seed_override: Optional[int]) -> Indexer
```

<a id="matrix_utils.mapped_matrix_dict.MappedMatrixDict.__matmul__"></a>

#### \_\_matmul\_\_

```python
def __matmul__(other)
```

Define logic for `@` matrix multiplication operator.

A `MappedMatrixDict` can only be multiplied by a sparse matrix; no other type is supported.

Note that the mapped matrix dict must come first, i.e. `MappedMatrixDict @ other`.
