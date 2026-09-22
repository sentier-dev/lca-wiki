**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.merging` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_processing.merging cfg.yml > bw_processing.merging.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.merging"></a>

# bw\_processing.merging

<a id="bw_processing.merging.mask_resource"></a>

#### mask\_resource

```python
def mask_resource(obj: Any, mask: np.ndarray) -> Any
```

<a id="bw_processing.merging.update_nrows"></a>

#### update\_nrows

```python
def update_nrows(resource: dict, data: Any) -> dict
```

<a id="bw_processing.merging.add_resource_suffix"></a>

#### add\_resource\_suffix

```python
def add_resource_suffix(metadata: dict, suffix: str) -> dict
```

Update the ``name``, ``path``, and ``group`` values to include ``suffix``. The suffix comes after the basename but after the data type suffix (e.g. indices, data).

Given the suffix ``_foo`` and the metadata::

    {
        "name": "sa-data-vector-from-dict.indices",
        "path": "sa-data-vector-from-dict.indices.npy",
        "group": "sa-data-vector-from-dict",
    }

It will return::

    {
        "name": "sa-data-vector-from-dict_foo.indices",
        "path": "sa-data-vector-from-dict_foo.indices.npy",
        "group": "sa-data-vector-from-dict_foo",
    }

<a id="bw_processing.merging.write_data_to_fs"></a>

#### write\_data\_to\_fs

```python
def write_data_to_fs(resource: dict, data: Any,
                     fs: AbstractFileSystem) -> None
```

<a id="bw_processing.merging.merge_datapackages_with_mask"></a>

#### merge\_datapackages\_with\_mask

```python
def merge_datapackages_with_mask(
        first_dp: DatapackageBase,
        first_resource_group_label: str,
        second_dp: DatapackageBase,
        second_resource_group_label: str,
        mask_array: np.ndarray,
        output_fs: Optional[AbstractFileSystem] = None,
        metadata: Optional[dict] = None) -> DatapackageBase
```

Merge two resources using a Numpy boolean mask. Returns elements from ``first_dp`` where the mask is ``True``, otherwise ``second_dp``.

Both resource arrays, and the filter mask, must have the same length.

Both datapackages must be static, i.e. not interfaces. This is because we don't yet have the functionality to select only some of the values in a resource group in ``matrix_utils``.

This function currently **will not** mask or filter JSON or CSV metadata.

**Arguments**:

  
  * first_dp: The datapackage from whom values will be taken when ``mask_array`` is ``True``.
  * first_resource_group_label: Label of the resource group in ``first_dp`` to select values from.
  * second_dp: The datapackage from whom values will be taken when ``mask_array`` is ``False``.
  * second_resource_group_label: Label of the resource group in ``second_dp`` to select values from.
  * mask_array: Boolean numpy array
  * output_fs: Filesystem to write new datapackage to, if any.
  * metadata: Metadata for new datapackage, if any.
  

**Returns**:

  
  A `Datapackage` instance. Will write the resulting datapackage to ``output_fs`` if provided.
