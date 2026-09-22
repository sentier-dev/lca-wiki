**Generated API reference** · package `matrix_utils` 0.9 · module `matrix_utils.mapped_matrix` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matrix_utils.mapped_matrix cfg.yml > matrix_utils.mapped_matrix.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matrix_utils.mapped_matrix"></a>

# matrix\_utils.mapped\_matrix

<a id="matrix_utils.mapped_matrix.MappedMatrix"></a>

## MappedMatrix Objects

```python
class MappedMatrix()
```

<a id="matrix_utils.mapped_matrix.MappedMatrix.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*,
             packages: Sequence[Datapackage],
             matrix: str,
             identifier: Optional[str] = None,
             use_vectors: bool = True,
             use_arrays: bool = True,
             use_distributions: bool = False,
             row_mapper: Optional[ArrayMapper] = None,
             col_mapper: Optional[ArrayMapper] = None,
             seed_override: Optional[int] = None,
             indexer_override: Any = None,
             diagonal: bool = False,
             transpose: bool = False,
             custom_filter: Optional[Callable] = None,
             empty_ok: bool = False)
```

A scipy sparse matrix handler which takes in ``bw_processing`` data
packages. Row and column ids are mapped to matrix indices, and a matrix is
constructed.

`indexer_override` allows for custom indexer behaviour. Indexers should follow
a simple API: they must support `.__next__()`, and have the attribute `.index`,
 which returns an integer.

`custom_filter` allows you to remove some data based on their indices. It is
applied to all resource groups. If you need more fine-grained control, process
the matrix after construction/iteration. `custom_filter` should take the
indices array as an input, and return a Numpy boolean array with the same
length as the indices array.

Parameters
----------
packages : list[Datapackage]
    A list of Datapackage objects.
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

<a id="matrix_utils.mapped_matrix.MappedMatrix.add_mappers"></a>

#### add\_mappers

```python
def add_mappers(axis: int, mapper: ArrayMapper)
```

<a id="matrix_utils.mapped_matrix.MappedMatrix.map_indices"></a>

#### map\_indices

```python
def map_indices()
```

<a id="matrix_utils.mapped_matrix.MappedMatrix.iterate_indexers"></a>

#### iterate\_indexers

```python
def iterate_indexers() -> None
```

<a id="matrix_utils.mapped_matrix.MappedMatrix.reset_indexers"></a>

#### reset\_indexers

```python
def reset_indexers(rebuild=False) -> None
```

<a id="matrix_utils.mapped_matrix.MappedMatrix.rebuild_matrix"></a>

#### rebuild\_matrix

```python
def rebuild_matrix() -> None
```

<a id="matrix_utils.mapped_matrix.MappedMatrix.__next__"></a>

#### \_\_next\_\_

```python
def __next__() -> None
```

<a id="matrix_utils.mapped_matrix.MappedMatrix.add_indexers"></a>

#### add\_indexers

```python
def add_indexers(indexer_override: Any, seed_override: Optional[int]) -> None
```

Add indexers

<a id="matrix_utils.mapped_matrix.MappedMatrix.indexers"></a>

#### indexers

```python
@property
def indexers() -> dict
```

Return package-level indexers keyed by datapackage name.

By design each datapackage has one indexer shared across all its resource groups,
but this constraint is not enforced — individual groups can be given different
indexers after construction. Use ``local_indexers`` to inspect what each group
is actually using.

<a id="matrix_utils.mapped_matrix.MappedMatrix.local_indexers"></a>

#### local\_indexers

```python
@property
def local_indexers() -> dict
```

Return the indexer actually used by each resource group, keyed by group label.

Normally all groups within a package share the same indexer (or a ``Proxy``
wrapping it for combinatorial packages), but users can assign a different indexer
to any group after construction, so this may differ from ``indexers``.

<a id="matrix_utils.mapped_matrix.MappedMatrix.indexers_by_type"></a>

#### indexers\_by\_type

```python
def indexers_by_type(indexer_type: type) -> list
```

Return all package-level indexers that are instances of ``indexer_type``.

<a id="matrix_utils.mapped_matrix.MappedMatrix.indexers_are_unique"></a>

#### indexers\_are\_unique

```python
@property
def indexers_are_unique() -> bool
```

True if no two packages share the same indexer instance.

<a id="matrix_utils.mapped_matrix.MappedMatrix.group"></a>

#### group

```python
def group(label: str) -> "ResourceGroup"
```

Return the ResourceGroup with the given label.

Raises ``KeyError`` if no group with that label exists.

<a id="matrix_utils.mapped_matrix.MappedMatrix.n_elements_dropped"></a>

#### n\_elements\_dropped

```python
@property
def n_elements_dropped() -> int
```

Total number of datapackage elements dropped across all resource groups.

An element is dropped when it is excluded by the custom filter or when its
row/column id could not be mapped to a matrix index.

<a id="matrix_utils.mapped_matrix.MappedMatrix.input_data_vector"></a>

#### input\_data\_vector

```python
def input_data_vector() -> np.ndarray
```

<a id="matrix_utils.mapped_matrix.MappedMatrix.input_row_col_indices"></a>

#### input\_row\_col\_indices

```python
def input_row_col_indices() -> np.ndarray
```

<a id="matrix_utils.mapped_matrix.MappedMatrix.input_raw_indices"></a>

#### input\_raw\_indices

```python
def input_raw_indices() -> np.ndarray
```

Return original datapackage indices (before mapping), with masks applied.

The result has the same length and order as ``input_data_vector`` and
``input_row_col_indices``, but contains the raw source ids from the datapackage
rather than the translated matrix row/column positions. Useful for tracing which
original ids contributed to each matrix element.

<a id="matrix_utils.mapped_matrix.MappedMatrix.input_rescale_vector"></a>

#### input\_rescale\_vector

```python
def input_rescale_vector() -> np.ndarray
```

Return rescale factors for each element, aligned with ``input_data_vector``.

Groups without a rescale array contribute all-ones values.

<a id="matrix_utils.mapped_matrix.MappedMatrix.input_flip_vector"></a>

#### input\_flip\_vector

```python
def input_flip_vector() -> np.ndarray
```

Return a boolean array indicating which elements were negated before matrix insertion.

Groups without a flip array contribute all-``False`` values. The result aligns
element-wise with ``input_data_vector`` and ``input_row_col_indices``.

<a id="matrix_utils.mapped_matrix.MappedMatrix.input_provenance"></a>

#### input\_provenance

```python
def input_provenance() -> List[tuple]
```

Describe where the data in the other ``input_X`` comes from. Returns a list
of ``(datapackage, group_label, (start_index, end_index))`` tuples.

Note that the ``end_index`` is exclusive, following the Python slicing
convention, i.e. ``(7, 9)`` means start from the 8th element (indices start
from 0), and go up to but don't include the 10th element (i.e. (7, 9) has two
elements).

<a id="matrix_utils.mapped_matrix.MappedMatrix.input_params"></a>

#### input\_params

```python
def input_params() -> dict
```

Return current parameter values keyed by ``(package, group_label)``.

Only groups that carry a params array are included; groups without
params are omitted entirely (not present vs. ``None``-valued).
Keying by ``(package, group_label)`` avoids silent collisions when
two packages contribute groups with the same label.

For vector groups the full 1-D params array is returned (parameters
are fixed and do not vary by iteration). For array groups the column
matching the current indexer position is returned, so the result
stays in sync with ``input_data_vector`` across Monte Carlo
iterations.

<a id="matrix_utils.mapped_matrix.MappedMatrix.input_indexer_vector"></a>

#### input\_indexer\_vector

```python
def input_indexer_vector() -> np.ndarray
```

<a id="matrix_utils.mapped_matrix.MappedMatrix.input_uncertainties"></a>

#### input\_uncertainties

```python
def input_uncertainties(number_samples: Optional[int] = None) -> np.ndarray
```

Return the stacked uncertainty arrays of all resources groups.

Note that this data is masked with both the custom filter (if present) and the
mapping mask!

If the resource group has a distributions array, then this is returned.
Otherwise, if the data is static, a distributions array with uncertainty type
0 (undefined uncertainty) is constructed. If the data is an array, an estimate
of the mean and standard deviation are given in the ``loc`` and ``scale``
columns. This estimate uses ``number_samples`` columns, or all columns if
``number_samples`` is ``None``.

If the data comes from an interface, a distributions array with uncertainty
type 0 will be created. Regardless if whether it is a vector or an array
interface, the current data vector is used, and no estimate of uncertainty is
made. Therefore, this data will never consume new data from an interface.

Raises a ``TypeError`` if distributions arrays are present but don't follow the
dtype of ``bw_processing.UNCERTAINTY_DTYPE``.

As both population samples (arrays) and interfaces don't fit into the
traditional ``stat_arrays`` framework, we mark these with custom
``uncertainty_types``:

* ``98`` for arrays
* ``99`` for interfaces
