**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.datapackage` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_processing.datapackage cfg.yml > bw_processing.datapackage.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.datapackage"></a>

# bw\_processing.datapackage

<a id="bw_processing.datapackage.DatapackageBase"></a>

## DatapackageBase Objects

```python
class DatapackageBase(ABC)
```

Base class for datapackages. Not for normal use - you should use either `Datapackage` or `FilteredDatapackage`.

<a id="bw_processing.datapackage.DatapackageBase.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="bw_processing.datapackage.DatapackageBase.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```

<a id="bw_processing.datapackage.DatapackageBase.__contains__"></a>

#### \_\_contains\_\_

```python
def __contains__(key)
```

<a id="bw_processing.datapackage.DatapackageBase.resources"></a>

#### resources

<a id="bw_processing.datapackage.DatapackageBase.groups"></a>

#### groups

```python
@property
def groups() -> dict
```

Return a dictionary of ``{group label: filtered datapackage}`` in the same order as the group labels are first encountered in the datapackage metadata.

Ignores resources which don't have group labels.

<a id="bw_processing.datapackage.DatapackageBase.del_resource"></a>

#### del\_resource

```python
def del_resource(name_or_index: Union[str, int]) -> None
```

Remove a resource, and delete its data file, if any.

<a id="bw_processing.datapackage.DatapackageBase.del_resource_group"></a>

#### del\_resource\_group

```python
def del_resource_group(name: str) -> None
```

Remove a resource group, and delete its data files, if any.

Use ``exclude_resource_group`` if you want to keep the underlying resource in the filesystem.

<a id="bw_processing.datapackage.DatapackageBase.get_resource"></a>

#### get\_resource

```python
def get_resource(name_or_index: Union[str, int]) -> (Any, dict)
```

Return data and metadata for ``name_or_index``.

**Arguments**:

  
  * name_or_index: Name (str) or index (int) of a resource in the existing metadata.
  

**Raises**:

  
  * IndexError: Integer index out of range of given metadata
  * ValueError: String name not present in metadata
  * NonUnique: String name present in two resource metadata sections
  

**Returns**:

  
  (data object, metadata dict)

<a id="bw_processing.datapackage.DatapackageBase.filter_by_attribute"></a>

#### filter\_by\_attribute

```python
def filter_by_attribute(key: str, value: Any) -> "FilteredDatapackage"
```

Create a new ``FilteredDatapackage`` which satisfies the filter ``resource[key] == value``.

All included objects are the same as in the original data package, i.e. no copies are made. No checks are made to ensure consistency with modifications to the original datapackage after the creation of this filtered datapackage.

This method was introduced to allow for the efficient construction of matrices; each datapackage can have data for multiple matrices, and we can then create filtered datapackages which exclusively have data for the matrix of interest. As such, they should be considered read-only, though this is not enforced.

<a id="bw_processing.datapackage.DatapackageBase.exclude"></a>

#### exclude

```python
def exclude(filters: Dict[str, str]) -> "FilteredDatapackage"
```

Filter a datapackage to exclude resources matching a filter.

Usage cases:

Filter out a given resource:

    exclude_generic({"matrix': "some_label"})

Filter out a resource group with a given kind:

    exclude_generic({"group': "some_group", "kind": "some_kind"})

<a id="bw_processing.datapackage.DatapackageBase.dehydrated_interfaces"></a>

#### dehydrated\_interfaces

```python
def dehydrated_interfaces() -> List[str]
```

Return a list of the resource groups which have dehydrated interfaces

<a id="bw_processing.datapackage.DatapackageBase.rehydrate_interface"></a>

#### rehydrate\_interface

```python
def rehydrate_interface(name_or_index: Union[str, int],
                        resource: Any,
                        initialize_with_config: bool = False) -> None
```

Substitute the undefined interface in this datapackage with the actual interface resource ``resource``. Loading a datapackage with an interface loads an instance of ``UndefinedInterface``, which should be substituted (rehydrated) with an actual interface instance.

If ``initialize_with_config`` is true, the ``resource`` is initialized (i.e. ``resource(**config_data)``) with the resource data under the key ``config``. If ``config`` is missing, a ``KeyError`` is raised.

``name_or_index`` should be the data source name. If this value is a string and doesn't end with ``.data``, ``.data`` is automatically added.

<a id="bw_processing.datapackage.DatapackageBase.get_max_index_value"></a>

#### get\_max\_index\_value

```python
def get_max_index_value() -> int
```

Get maximum index value (max signed 32 or 64 bit integer) for this datapackage

<a id="bw_processing.datapackage.FilteredDatapackage"></a>

## FilteredDatapackage Objects

```python
class FilteredDatapackage(DatapackageBase)
```

A subset of a datapackage. Used in matrix construction or other data manipulation operations.

Should be treated as read-only.

<a id="bw_processing.datapackage.Datapackage"></a>

## Datapackage Objects

```python
class Datapackage(DatapackageBase)
```

Interface for creating, loading, and using numerical datapackages for Brightway.

Note that there are two entry points to using this class, both separate functions: ``create_datapackage()`` and ``load_datapackage()``. Do not create an instance of the class with ``Datapackage()``, unless you like playing with danger :)

Data packages can be stored in memory, in a directory, or in a zip file. When creating data packages for use later, don't forget to call ``.finalize_serialization()``, or the metadata won't be written and the data package won't be usable.

Potential gotchas:

* There is currently no way to modify a zipped data package once it is finalized.
* Resources that are interfaces to external data sources (either in Python or other) can't be saved, but must be recreated each time a data package is used.

<a id="bw_processing.datapackage.Datapackage.__hash__"></a>

#### \_\_hash\_\_

```python
def __hash__()
```

<a id="bw_processing.datapackage.Datapackage.__eq__"></a>

#### \_\_eq\_\_

```python
def __eq__(other)
```

<a id="bw_processing.datapackage.Datapackage.finalize_serialization"></a>

#### finalize\_serialization

```python
def finalize_serialization() -> None
```

Write the metadata file and close the filesystem.

Must be called once after all resources have been added, before the
datapackage can be loaded again from disk. Dehydrates any interface
resources (replaces them with ``UndefinedInterface``) prior to writing.

**Raises**:

- `Closed` - Datapackage has already been finalized.
- `ValueError` - Datapackage uses an in-memory filesystem, which cannot
  be serialized.

<a id="bw_processing.datapackage.Datapackage.add_persistent_vector_from_iterator"></a>

#### add\_persistent\_vector\_from\_iterator

```python
def add_persistent_vector_from_iterator(
        *,
        matrix: str = None,
        name: Optional[str] = None,
        dict_iterator: Any = None,
        nrows: Optional[int] = None,
        matrix_serialize_format_type: Optional[MatrixSerializeFormat] = None,
        **kwargs) -> None
```

Create a persistant vector from an iterator. Uses the utility function ``resolve_dict_iterator``.

This is the **only array creation method which produces sorted arrays**.

<a id="bw_processing.datapackage.Datapackage.add_entries"></a>

#### add\_entries

```python
def add_entries(*,
                matrix: str,
                entries: list["MatrixEntry"],
                name: Optional[str] = None) -> None
```

Add matrix data from a list of :class:`MatrixEntry` objects.

High-level convenience method that does not require working directly
with NumPy arrays. If any entry has a ``rescale`` value other than
``1.0``, the rescale values are stored as a ``rescale_array`` resource.
If any entry has ``reference=True``, the reference flags are stored as
a ``reference_array`` resource (``kind="reference"``).

**Arguments**:

- `matrix` - Name of the target matrix (e.g. ``"technosphere"``).
- `entries` - List of :class:`.MatrixEntry` instances.
- `name` - Optional resource group name; auto-generated if omitted.

<a id="bw_processing.datapackage.Datapackage.add_array_entries"></a>

#### add\_array\_entries

```python
def add_array_entries(*, matrix: str, entries: list["ArrayEntry"]) -> None
```

Add matrix data from a list of :class:`.ArrayEntry` objects.

Each :class:`.ArrayEntry` becomes one persistent-array resource group.
Resource group names are auto-generated. If an entry has a ``rescale``
array it is stored as a ``rescale_array`` resource (``kind="rescale"``).
If an entry has a ``reference`` array with any ``True`` value it is
stored as a ``reference_array`` resource (``kind="reference"``).

**Arguments**:

- `matrix` - Name of the target matrix (e.g. ``"technosphere"``).
- `entries` - List of :class:`.ArrayEntry` instances.

<a id="bw_processing.datapackage.Datapackage.add_persistent_vector"></a>

#### add\_persistent\_vector

```python
def add_persistent_vector(
        *,
        matrix: str,
        indices_array: np.ndarray,
        name: Optional[str] = None,
        data_array: Optional[np.ndarray] = None,
        flip_array: Optional[np.ndarray] = None,
        distributions_array: Optional[np.ndarray] = None,
        rescale_array: Optional[np.ndarray] = None,
        reference_array: Optional[np.ndarray] = None,
        params_array: Optional[np.ndarray] = None,
        param_labels: Optional[list] = None,
        param_label_schema: Optional[AnyLabelSchema] = None,
        keep_proxy: bool = False,
        matrix_serialize_format_type: Optional[MatrixSerializeFormat] = None,
        **kwargs) -> None
```

Add a persistent vector resource group to the datapackage.

``rescale_array`` is an optional 1-D float array of the same length as
``indices_array``.  Each element is a multiplicative factor applied to
the corresponding data value — whether static or stochastic — before
the value is inserted into the matrix.  Typical uses are allocation
factors and unit conversions.  A value of ``1.0`` leaves the data
unchanged.

``reference_array`` is an optional 1-D boolean array of the same length
as ``indices_array``.  Where ``True``, that entry is the reference
(production) exchange for its column.  It is stored as a
``reference_array`` resource (``kind="reference"``) only when at least
one entry is flagged.

``params_array`` is an optional 1-D float array recording the values of
independent variables (e.g. model parameters) used to generate this
resource group.  ``param_labels`` is an optional list of label objects
(strings or dicts) of the same length as ``params_array``; if provided,
a ``name.param_labels.json`` file is written alongside the array.
``param_label_schema`` describes the structure of each label object and
triggers validation on write; it requires ``param_labels``.

<a id="bw_processing.datapackage.Datapackage.add_persistent_array"></a>

#### add\_persistent\_array

```python
def add_persistent_array(
        *,
        matrix: str,
        data_array: np.ndarray,
        indices_array: np.ndarray,
        name: Optional[str] = None,
        flip_array: Optional[np.ndarray] = None,
        rescale_array: Optional[np.ndarray] = None,
        reference_array: Optional[np.ndarray] = None,
        params_array: Optional[np.ndarray] = None,
        param_labels: Optional[list] = None,
        param_label_schema: Optional[AnyLabelSchema] = None,
        keep_proxy: bool = False,
        matrix_serialize_format_type: Optional[MatrixSerializeFormat] = None,
        **kwargs) -> None
```

Add a persistent array resource group to the datapackage.

``rescale_array`` is an optional 1-D float array of the same length as
``indices_array``.  Each element is a multiplicative factor applied to
the corresponding data value — whether static or stochastic — before
the value is inserted into the matrix.  Typical uses are allocation
factors and unit conversions.  A value of ``1.0`` leaves the data
unchanged.

``reference_array`` is an optional 1-D boolean array of the same length
as ``indices_array``.  Where ``True``, that entry is the reference
(production) exchange for its column.  It is stored as a
``reference_array`` resource (``kind="reference"``) only when at least
one entry is flagged.

``params_array`` is an optional 2-D float array of shape
``(n_params, n_scenarios)`` where ``n_scenarios`` must equal
``data_array.shape[1]``.  It records the independent variable values
that produced each scenario column.  See ``add_persistent_vector`` for
the ``param_labels`` and ``param_label_schema`` arguments.

<a id="bw_processing.datapackage.Datapackage.write_modified"></a>

#### write\_modified

```python
def write_modified()
```

Flush modified resources back to the filesystem.

After directly editing data arrays in ``self.data``, call this method
to persist the changes. Clears the internal ``_modified`` set on
completion. Does nothing if no resources have been marked as modified.

<a id="bw_processing.datapackage.Datapackage.add_dynamic_vector"></a>

#### add\_dynamic\_vector

```python
def add_dynamic_vector(
        *,
        matrix: str,
        interface: Any,
        indices_array: np.ndarray,
        name: Optional[str] = None,
        flip_array: Optional[np.ndarray] = None,
        rescale_array: Optional[np.ndarray] = None,
        reference_array: Optional[np.ndarray] = None,
        params_array: Optional[np.ndarray] = None,
        param_labels: Optional[list] = None,
        param_label_schema: Optional[AnyLabelSchema] = None,
        keep_proxy: bool = False,
        matrix_serialize_format_type: Optional[MatrixSerializeFormat] = None,
        **kwargs) -> None
```

Add a dynamic vector resource group to the datapackage.

The matrix values are provided at runtime by ``interface`` rather than
stored on disk. ``interface`` must implement ``__next__()`` and return a
1-D numpy array of length ``len(indices_array)`` each time it is called.

The ``indices_array``, optional ``flip_array``, optional ``rescale_array``,
optional ``reference_array``, and optional ``params_array`` are static and are stored as normal numpy
resources.  See ``add_persistent_vector`` for documentation of the
``params_array``, ``param_labels``, and ``param_label_schema`` arguments.

**Arguments**:

- `matrix` - Name of the target matrix.
- `interface` - Object implementing the dynamic-vector interface
  (``__next__()``).
- `indices_array` - Structured numpy array with dtype ``INDICES_DTYPE``
  mapping each data value to a matrix cell.
- `name` - Optional resource group name; auto-generated if omitted.
- `flip_array` - Optional boolean array; where ``True`` the value is
  multiplied by ``-1`` before insertion.
- `rescale_array` - Optional 1-D float array of multiplicative factors
  applied before matrix insertion.
- `reference_array` - Optional 1-D boolean array; where ``True`` the
  entry is the reference (production) exchange for its column.
- `keep_proxy` - If ``True``, store a proxy rather than the raw array
  for on-disk resources.
- `matrix_serialize_format_type` - Override the instance-level
  serialization format for static arrays in this group.

<a id="bw_processing.datapackage.Datapackage.add_dynamic_array"></a>

#### add\_dynamic\_array

```python
def add_dynamic_array(
        *,
        matrix: str,
        interface: Any,
        indices_array: np.ndarray,
        name: Optional[str] = None,
        flip_array: Optional[np.ndarray] = None,
        rescale_array: Optional[np.ndarray] = None,
        reference_array: Optional[np.ndarray] = None,
        params_array: Optional[np.ndarray] = None,
        param_labels: Optional[list] = None,
        param_label_schema: Optional[AnyLabelSchema] = None,
        keep_proxy: bool = False,
        matrix_serialize_format_type: Optional[MatrixSerializeFormat] = None,
        **kwargs) -> None
```

Add a dynamic array resource group to the datapackage.

The matrix values are provided at runtime by ``interface``, which must
implement the presamples array API: a ``.shape`` property returning
``(nrows, ncols)`` and ``.__getitem__(args)`` returning the 1-D column
array for ``args[1]``.  ``ncols`` may be ``None`` for an infinite
interface.

The ``indices_array``, optional ``flip_array``, optional ``rescale_array``,
optional ``reference_array``, and optional ``params_array`` are static and are stored as normal numpy
resources.  For dynamic arrays the column count of ``params_array`` is
not validated against the interface (whose column count may be unknown at
write time).  See ``add_persistent_vector`` for documentation of the
``params_array``, ``param_labels``, and ``param_label_schema`` arguments.

**Arguments**:

- `matrix` - Name of the target matrix.
- `interface` - Object implementing the dynamic-array interface
  (``.shape`` and ``.__getitem__``).
- `indices_array` - Structured numpy array with dtype ``INDICES_DTYPE``
  mapping each data value to a matrix cell.
- `name` - Optional resource group name; auto-generated if omitted.
- `flip_array` - Optional boolean array; where ``True`` the value is
  multiplied by ``-1`` before insertion.
- `rescale_array` - Optional 1-D float array of multiplicative factors
  applied before matrix insertion.
- `reference_array` - Optional 1-D boolean array; where ``True`` the
  entry is the reference (production) exchange for its column.
- `keep_proxy` - If ``True``, store a proxy rather than the raw array
  for on-disk resources.
- `matrix_serialize_format_type` - Override the instance-level
  serialization format for static arrays in this group.

<a id="bw_processing.datapackage.Datapackage.add_csv_metadata"></a>

#### add\_csv\_metadata

```python
def add_csv_metadata(*,
                     dataframe: pd.DataFrame,
                     valid_for: list,
                     name: str = None,
                     **kwargs) -> None
```

Add an iterable metadata object to be stored as a CSV file.

The purpose of storing metadata is to enable data exchange; therefore, this method assumes that data is written to disk.

The normal use case of this method is to link integer indices from either structured or presample arrays to a set of fields that uniquely identifies each object. This allows for matching based on object attributes from computer to computer, where database ids or other computer-generated codes might not be consistent.

Uses pandas to store and load data; therefore, metadata must already be a pandas dataframe.

In contrast with presamples arrays, ``iterable_data_source`` cannot be an infinite generator. We need a finite set of data to build a matrix.

In contrast to ``self.create_structured_array``, this always stores the dataframe in ``self.data``; no proxies are used.

**Arguments**:

  
  * dataframe: Dataframe to be persisted to disk.
  * valid_for: List of resource names that this metadata is valid for; must be either structured or presample indices arrays. Each item in ``valid_for`` has the form ``("resource_name", "rows" or "cols")``. ``resource_name`` should be either a structured or a presamples indices array.
  * name (optional): The name of this resource. Names must be unique in a given data package
  * extra (optional): Dict of extra metadata
  

**Returns**:

  
  Nothing, but appends objects to ``self.metadata['resources']`` and ``self.data``.
  

**Raises**:

  
  * AssertionError: If inputs are not in correct form
  * AssertionError: If ``valid_for`` refers to unavailable resources

<a id="bw_processing.datapackage.Datapackage.add_json_metadata"></a>

#### add\_json\_metadata

```python
def add_json_metadata(*,
                      data: Any,
                      valid_for: str,
                      name: str = None,
                      **kwargs) -> None
```

Add an iterable metadata object to be stored as a JSON file.

The purpose of storing metadata is to enable data exchange; therefore, this method assumes that data is written to disk.

The normal use case of this method is to provide names and other metadata for parameters whose values are stored as presamples arrays. The length of ``data`` should match the number of rows in the corresponding presamples array, and ``data`` is just a list of string labels for the parameters. However, this method can also be used to store other metadata, e.g. for external data resources.

In contrast to ``self.create_structured_array``, this always stores the dataframe in ``self.data``; no proxies are used.

**Arguments**:

  
  * data: Data to be persisted to disk.
  * valid_for: Name of structured data or presample array that this metadata is valid for.
  * name (optional): The name of this resource. Names must be unique in a given data package
  * extra (optional): Dict of extra metadata
  

**Returns**:

  
  Nothing, but appends objects to ``self.metadata['resources']`` and ``self.data``.
  

**Raises**:

  
  * AssertionError: If inputs are not in correct form
  * AssertionError: If ``valid_for`` refers to unavailable resources

<a id="bw_processing.datapackage.create_datapackage"></a>

#### create\_datapackage

```python
def create_datapackage(
    fs: Optional[AbstractFileSystem] = None,
    name: Optional[str] = None,
    id_: Optional[str] = None,
    metadata: Optional[dict] = None,
    combinatorial: bool = False,
    sequential: bool = False,
    seed: Optional[int] = None,
    sum_intra_duplicates: bool = True,
    sum_inter_duplicates: bool = False,
    matrix_serialize_format_type: MatrixSerializeFormat = MatrixSerializeFormat
    .NUMPY
) -> Datapackage
```

Create a new data package.

All arguments are optional; if a `fsspec <https://filesystem-spec.readthedocs.io/en/latest/>`__ filesystem is not provided, an in-memory `DictFS <https://github.com/iterative/morefs?tab=readme-ov-file#dictfs>`__ will be used.

All metadata elements should follow the `datapackage specification <https://frictionlessdata.io/specs/data-package/>`__.

Licenses are specified as a list in ``metadata``. The default license is the `Open Data Commons Public Domain Dedication and License v1.0 <http://opendatacommons.org/licenses/pddl/>`__.

**Arguments**:

  * fs: A ``Filesystem``, optional. A new ``DictFS`` is used if not provided.
  * name: ``str``, optional. A new uuid is used if not provided.
  * `id_`: ``str``, optional. A new uuid is used if not provided.
  * metadata: ``dict``, optional. Metadata dictionary following datapackage specification; see above.
  * combinatorial: ``bool``, default ``False`` .: Policy on how to sample columns across multiple data arrays; see readme.
  * sequential: ``bool``, default ``False`` .: Policy on how to sample columns in data arrays; see readme.
  * seed: ``int``, optional. Seed to use in random number generator.
  * sum_intra_duplicates: ``bool``, default ``True``. Should duplicate elements in a single data resource be summed together, or should the last value replace previous values.
  * sum_inter_duplicates: ``bool``, default ``False``. Should duplicate elements in across data resources be summed together, or should the last value replace previous values. Order of data resources is given by the order they are added to the data package.
  * matrix_serialize_format_type: ``MatrixSerializeFormat``, default ``MatrixSerializeFormat.NUMPY``. Matrix serialization format type.
  

**Returns**:

  
  A `Datapackage` instance.

<a id="bw_processing.datapackage.load_datapackage"></a>

#### load\_datapackage

```python
def load_datapackage(fs_or_obj: Union[DatapackageBase, AbstractFileSystem],
                     mmap_mode: Optional[str] = None,
                     proxy: bool = False) -> Datapackage
```

Load an existing datapackage.

Can load proxies to data instead of the data itself, which can be useful when interacting with large arrays or large packages where only a subset of the data will be accessed.

Proxies use something similar to `functools.partial` to create a callable class instead of returning the raw data (see https://github.com/brightway-lca/bw_processing/issues/9 for why we can't just use `partial`). datapackage access methods (i.e. `.get_resource`) will automatically resolve proxies when needed.

**Arguments**:

  
  * fs_or_obj: A `Filesystem` or an instance of `DatapackageBase`.
  * mmap_mode: `str`, optional. Define memory mapping mode to use when loading Numpy arrays.
  * proxy: bool, default `False`. Load proxies instead of complete Numpy arrays; see above.
  

**Returns**:

  
  A `Datapackage` instance.

<a id="bw_processing.datapackage.simple_graph"></a>

#### simple\_graph

```python
def simple_graph(data: dict,
                 fs: Optional[AbstractFileSystem] = None,
                 **metadata) -> Datapackage
```

Easy creation of simple datapackages with only persistent vectors.

.. deprecated::
Use :func:`bw_processing.matrix_entry.create_datapackage_from_entries` with
:class:`bw_processing.matrix_entry.MatrixEntry` objects instead.

**Arguments**:

  * data: is a dictionary.
  The data dictionary has the form::
  
  {
- `matrix_name` - [
  (row_id, col_id, value, flip)
  ]
  }
  
  
  Where `row_id` and `col_id are an `int` s, value is a `float` and flip is a `bool`  (False by default).
  
  * fs: is a filesystem.
  * metadata: are passed as kwargs to ``create_datapackage()``.
  

**Returns**:

  the datapackage.
