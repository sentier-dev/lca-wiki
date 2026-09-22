---
title: bw_processing classes and functions
type: module-page
summary: The datapackage API of bw_processing 1.6.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-bw-processing, bw-processing-docs]
related: [README.md, commands.md, gotchas.md]
---

# bw_processing classes and functions

The names below are the public namespace of the installed version 1.6, read with
`dir(bw_processing)` on 2026-09-21.

## Making and loading

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `create_datapackage(fs=None, name=None, ...)` | function | A new, empty datapackage. Without a filesystem it lives in memory. | `dp = bp.create_datapackage()` |
| `create_datapackage_from_entries(data, fs=None, **metadata)` | function | The recommended high-level route: a dictionary of `MatrixEntry` lists becomes a datapackage. | `bp.create_datapackage_from_entries({...})` |
| `load_datapackage(fs_or_obj, mmap_mode=None, proxy=False)` | function | Reads one back; `proxy=True` defers reading the arrays. | `bp.load_datapackage(fs)` |
| `generic_directory_filesystem(dirpath=...)` | function | A filesystem rooted at a directory, created if needed. | passed as `fs` |
| `generic_zipfile_filesystem(dirpath=..., filename=..., write=True)` | function | The same for a zip file. | passed as `fs` |

## The objects

| Name | Kind | What it is for |
|---|---|---|
| `Datapackage` | class | A writable datapackage. Do not instantiate it directly; use the two creation functions. |
| `DatapackageBase` | class | The shared read API of both writable and filtered packages. |
| `FilteredDatapackage` | class | A read-only subset, produced by filtering; what matrix building consumes. |
| `MatrixEntry` | dataclass | One matrix cell: row, col, amount, flip, and optional uncertainty fields. Entries with the same coordinates are summed. |
| `ArrayEntry` | dataclass | The index, flip, rescale and reference metadata of one persistent-array resource group. |
| `UndefinedInterface` | class | A placeholder for a dynamic source that is not available in this process. |
| `MatrixName` | str enum | The standard matrix labels: `technosphere_matrix`, `biosphere_matrix`, `characterization_matrix`. |
| `MatrixSerializeFormat` | str enum | `numpy` or `parquet`. |
| `StringLabelSchema`, `ParamLabelSchema`, `ParamLabelField` | dataclasses | Schemas for the labels attached to parameter arrays. |

## Constants

| Name | What it is |
|---|---|
| `INDICES_DTYPE` | `[('row', int64), ('col', int64)]`, read from the installed 1.6. |
| `UNCERTAINTY_DTYPE` | The `stats_arrays` record: `uncertainty_type`, `loc`, `scale`, `shape`, `minimum`, `maximum`, `negative`. |
| `DEFAULT_LICENSES` | One entry, the Open Data Commons Public Domain Dedication and Licence 1.0. This is the default written into a new datapackage's metadata, not a statement about your data. |
| `examples_dir` | The path of the bundled example datapackages. |

## What a Datapackage gives you

Methods, read from the installed 1.6: `add_persistent_vector`, `add_persistent_array`,
`add_persistent_vector_from_iterator`, `add_dynamic_vector`, `add_dynamic_array`,
`add_entries`, `add_array_entries`, `add_csv_metadata`, `add_json_metadata`,
`get_resource`, `resources`, `groups`, `filter_by_attribute`, `exclude`, `del_resource`,
`del_resource_group`, `get_max_index_value`, `rehydrate_interface`,
`dehydrated_interfaces`, `finalize_serialization`, `write_modified`.

## Utilities

| Name | What it is for |
|---|---|
| `reindex(datapackage, metadata_name, data_iterable, fields)` | Map the arbitrary integer ids in a package onto the ids of your own database. |
| `reset_index(datapackage, metadata_name)` | Renumber the indices to a dense range starting at zero. |
| `merge_datapackages_with_mask(...)` | Combine two resource groups through a boolean mask, taking elements from the first where the mask is true. |
| `as_unique_attributes(data, ...)` | The smallest set of fields that identifies every record uniquely; also available for dataframes. |
| `clean_datapackage_name(name)`, `safe_filename(string)` | Names that survive every filesystem. |
| `md5(filepath)` | Checksum of a written file. |
| `create_array`, `create_structured_array` | The lower-level numpy constructors. |
| `schema_from_json_schema(data)` | Rebuild a stored parameter label schema. |
| `simple_graph(data, fs=None, **metadata)` | Deprecated shortcut for persistent-vector-only packages. |

## Notes

- A datapackage is not one array. It is a set of resource groups, each contributing to one
  named matrix, and a matrix is built by adding or overwriting values group by group. The
  consuming side of that is [../matrix_utils/](../matrix_utils/).
- `flip` is a boolean vector, not a sign convention in the data: values are stored
  positive and flipped on insertion where the vector says so
  (source: bw-processing-docs).
- `scale` is a separate float vector applied before insertion, used for allocation factors
  and unit conversions; `1.0` leaves the value alone (source: bw-processing-docs).
