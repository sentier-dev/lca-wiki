**Generated API reference** · package `matrix_utils` 0.9 · module `matrix_utils.resource_group` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matrix_utils.resource_group cfg.yml > matrix_utils.resource_group.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matrix_utils.resource_group"></a>

# matrix\_utils.resource\_group

<a id="matrix_utils.resource_group.FakeRNG"></a>

## FakeRNG Objects

```python
class FakeRNG()
```

<a id="matrix_utils.resource_group.FakeRNG.__init__"></a>

#### \_\_init\_\_

```python
def __init__(array)
```

<a id="matrix_utils.resource_group.FakeRNG.__next__"></a>

#### \_\_next\_\_

```python
def __next__()
```

<a id="matrix_utils.resource_group.mask_array"></a>

#### mask\_array

```python
def mask_array(array, mask=None)
```

<a id="matrix_utils.resource_group.ResourceGroup"></a>

## ResourceGroup Objects

```python
class ResourceGroup()
```

A class that handles a resource group - a collection of files in data package which define one matrix. A resource group can contain the following:

* data array or interface (required)
* indices structured array (required)
* flip array (optional)
* csv metadata (optional)
* json metadata (optional)

After instantiation, the ``MappedMatrix`` class will add an indexer (an instance of ``matrix_utils.indexers.Indexer``), using either ``add_indexer`` or ``add_combinatorial_indexer``. It will also add one or two array mappers, using ``add_mapper``. Only one mapper is needed if the matrix is diagonal.

One easy source of confusion is the difference between ``.row_mapped`` and ``.row``. Both of these are one-dimensional vectors which have matrix row indices (i.e. they have already been mapped). ``.row_mapped`` are the values as given in the data package, whereas ``.row`` are the values actually used in matrix data insertion (and the same for column indices).There are two possible modifications that can be applied from ``.row_mapped`` to ``.row``; first, we can have internal aggregation, which will shrink the size of the row or column indices, as duplicate elements are eliminated. Second, if the array mapper was already instantiated, we might need to delete some elements from the row or column indices, as these values are not used in this calculation. For example, in life cycle assessment, LCIA method implementations often contain characterization factors for flows not present in the biosphere (as they were not used by an of the activities). In this case, we would need to eliminate these factors, as our characterization matrix must match exactly to the biosphere matrix already built.

Here is an example for row indices:

.. code-block:: python

    row_input_indices = [0, 17, 99, 42, 17]
    row_mapped = [0, 1, -1, 2, 1]
    after_aggregation = [0, 1, -1, 2]  # -1 is missing data point
    after_masking = [0, 1, 2]
    row = [0, 1, 2]

Any data coming into this class, with through instantiation or via method calls such as ``.calculate``, should follow the length and order of the original datapackage data (use ``get_indices_data()`` to get the original indices.

The current data, as entered into the matrix, is given by ``.current_data``.

<a id="matrix_utils.resource_group.ResourceGroup.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*,
             package: DatapackageBase,
             group_label: str,
             use_distributions: bool = False,
             seed_override: Union[int, None] = None,
             custom_filter: Union[Callable, None] = None,
             transpose: bool = False)
```

<a id="matrix_utils.resource_group.ResourceGroup.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```

<a id="matrix_utils.resource_group.ResourceGroup.identifier"></a>

#### identifier

```python
@property
def identifier() -> Optional[str]
```

Shortcut to get a single `identifier` attribute for the group resources

<a id="matrix_utils.resource_group.ResourceGroup.has_distributions"></a>

#### has\_distributions

```python
@property
def has_distributions()
```

<a id="matrix_utils.resource_group.ResourceGroup.has_flip"></a>

#### has\_flip

```python
@property
def has_flip() -> bool
```

<a id="matrix_utils.resource_group.ResourceGroup.has_rescale"></a>

#### has\_rescale

```python
@property
def has_rescale() -> bool
```

<a id="matrix_utils.resource_group.ResourceGroup.has_reference"></a>

#### has\_reference

```python
@property
def has_reference() -> bool
```

<a id="matrix_utils.resource_group.ResourceGroup.has_params"></a>

#### has\_params

```python
@property
def has_params() -> bool
```

<a id="matrix_utils.resource_group.ResourceGroup.has_param_labels"></a>

#### has\_param\_labels

```python
@property
def has_param_labels() -> bool
```

<a id="matrix_utils.resource_group.ResourceGroup.params_current"></a>

#### params\_current

```python
@property
def params_current() -> np.ndarray
```

Current parameter values.

For vectors: returns the full 1-D params array (parameters are fixed
and do not vary by indexer position).
For arrays: returns the column at the current indexer position,
mirroring how ``calculate()`` picks the active data column.

Raises ``KeyError`` if no params array exists for this group.

<a id="matrix_utils.resource_group.ResourceGroup.param_labels"></a>

#### param\_labels

```python
@property
def param_labels() -> dict
```

Raw param-labels dict. Always has ``"values"``;
also has ``"schema"`` when a label schema was provided at write time.

Raises ``KeyError`` if no param_labels resource exists.

<a id="matrix_utils.resource_group.ResourceGroup.n_elements_dropped"></a>

#### n\_elements\_dropped

```python
@property
def n_elements_dropped() -> int
```

Number of original datapackage elements dropped by the custom filter and mapping mask.

<a id="matrix_utils.resource_group.ResourceGroup.data_original"></a>

#### data\_original

```python
@property
def data_original()
```

<a id="matrix_utils.resource_group.ResourceGroup.flip"></a>

#### flip

```python
@property
def flip()
```

The flip array, with all masks applied (if necessary).

<a id="matrix_utils.resource_group.ResourceGroup.rescale"></a>

#### rescale

```python
@property
def rescale()
```

The rescale array, with all masks applied (if necessary).

<a id="matrix_utils.resource_group.ResourceGroup.rescale_current"></a>

#### rescale\_current

```python
@property
def rescale_current() -> Optional[np.ndarray]
```

Current rescale values with masks applied, or ``None`` if no rescale array exists.

<a id="matrix_utils.resource_group.ResourceGroup.reference"></a>

#### reference

```python
@property
def reference()
```

The reference (production) exchange boolean array, with masks applied (if necessary).

<a id="matrix_utils.resource_group.ResourceGroup.reference_current"></a>

#### reference\_current

```python
@property
def reference_current() -> Optional[np.ndarray]
```

Current reference flags with masks applied, or ``None`` if no reference array exists.

<a id="matrix_utils.resource_group.ResourceGroup.get_indices_data"></a>

#### get\_indices\_data

```python
def get_indices_data()
```

The source data for the indices array.

<a id="matrix_utils.resource_group.ResourceGroup.get_resource_by_suffix"></a>

#### get\_resource\_by\_suffix

```python
def get_resource_by_suffix(suffix: str) -> Any
```

<a id="matrix_utils.resource_group.ResourceGroup.is_vector"></a>

#### is\_vector

```python
def is_vector() -> bool
```

Determine if this is a vector or array resource

<a id="matrix_utils.resource_group.ResourceGroup.is_array"></a>

#### is\_array

```python
def is_array() -> bool
```

Determine if this is a vector or array resource

<a id="matrix_utils.resource_group.ResourceGroup.is_interface"></a>

#### is\_interface

```python
def is_interface() -> bool
```

Determine if data is an interface

<a id="matrix_utils.resource_group.ResourceGroup.ncols"></a>

#### ncols

```python
@property
def ncols()
```

<a id="matrix_utils.resource_group.ResourceGroup.add_mapper"></a>

#### add\_mapper

```python
def add_mapper(axis: int, mapper: ArrayMapper)
```

<a id="matrix_utils.resource_group.ResourceGroup.build_mask"></a>

#### build\_mask

```python
def build_mask(row, col)
```

Build boolean array mask where ``False`` means that a data element is not present, and
should be ignored. See discussion above.

<a id="matrix_utils.resource_group.ResourceGroup.map_indices"></a>

#### map\_indices

```python
def map_indices(*, diagonal=False)
```

<a id="matrix_utils.resource_group.ResourceGroup.unique_row_indices_for_mapping"></a>

#### unique\_row\_indices\_for\_mapping

```python
def unique_row_indices_for_mapping()
```

Return array of unique indices that respect aggregation policy

<a id="matrix_utils.resource_group.ResourceGroup.unique_col_indices_for_mapping"></a>

#### unique\_col\_indices\_for\_mapping

```python
def unique_col_indices_for_mapping()
```

Return array of unique indices that respect aggregation policy

<a id="matrix_utils.resource_group.ResourceGroup.row_indices_for_mapping"></a>

#### row\_indices\_for\_mapping

```python
def row_indices_for_mapping()
```

Return raw row indices for mapping, with custom filter applied if present.

<a id="matrix_utils.resource_group.ResourceGroup.col_indices_for_mapping"></a>

#### col\_indices\_for\_mapping

```python
def col_indices_for_mapping()
```

Return raw column indices for mapping, with custom filter applied if present.

<a id="matrix_utils.resource_group.ResourceGroup.add_indexer"></a>

#### add\_indexer

```python
def add_indexer(indexer: Indexer)
```

<a id="matrix_utils.resource_group.ResourceGroup.add_combinatorial_indexer"></a>

#### add\_combinatorial\_indexer

```python
def add_combinatorial_indexer(indexer: Indexer, offset: int)
```

<a id="matrix_utils.resource_group.ResourceGroup.apply_masks"></a>

#### apply\_masks

```python
def apply_masks(array)
```

Apply both ``custom_filter_mask`` (if present) and ``unmapped_mask``.

<a id="matrix_utils.resource_group.ResourceGroup.calculate"></a>

#### calculate

```python
def calculate(vector: np.ndarray = None)
```

Generate row and column indices and a data vector. If ``.data`` is an iterator, draw the
next value. If ``.data`` is an array, use the column given by ``.indexer``.

``vector`` is an optional input that overrides the data. It must be in the same order and
have the same length as the data package indices (before possible aggregation and masking);
see discussion above.
