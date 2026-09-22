---
title: bw_processing commands
type: module-page
summary: Building, reading and inspecting a datapackage from Python.
audience: [P1]
updated: 2026-09-21
sources: [pypi-bw-processing, bw-processing-docs]
related: [classes.md, gotchas.md, ../../commands.md]
---

# bw_processing commands

`bw_processing` 1.6 installs no shell command: its distribution declares an empty
entry-point list, checked with `importlib.metadata` on 2026-09-21. The calls below assume
`import bw_processing as bp`.

## Command line

| Command | What it does | Key options |
|---|---|---|
| none | `bw_processing` has no console script. | n/a |

## Notebook entry points

### Building one

| Call | What it does |
|---|---|
| `dp = bp.create_datapackage()` | An in-memory datapackage. |
| `dp = bp.create_datapackage(fs=bp.generic_directory_filesystem(dirpath=path))` | One that will be written to a directory. |
| `dp = bp.create_datapackage(fs=bp.generic_zipfile_filesystem(dirpath=path, filename='x.zip'))` | One that will be written to a zip file. |
| `dp.add_persistent_vector(matrix='technosphere_matrix', data_array=..., indices_array=..., flip_array=..., name=...)` | The usual case: one value per matrix cell. |
| `dp.add_persistent_array(matrix=..., data_array=..., indices_array=...)` | Many values per cell, iterated column by column. |
| `dp.add_dynamic_vector(matrix=..., interface=..., indices_array=...)` | Values produced at calculation time by an interface object. |
| `dp.add_csv_metadata(dataframe=..., valid_for=...)` | The metadata that makes reindexing possible. |
| `dp.add_json_metadata(data=..., valid_for=...)` | Arbitrary metadata attached to a resource group. |
| `dp.finalize_serialization()` | Write everything out. |
| `bp.create_datapackage_from_entries({'technosphere_matrix': [bp.MatrixEntry(...), ...]})` | The shortest route from records to a finished package. |

### Reading one

| Call | What it does |
|---|---|
| `dp = bp.load_datapackage(fs)` | Load from a filesystem. |
| `bp.load_datapackage(fs, proxy=True)` | Load the metadata and defer the arrays. |
| `bp.load_datapackage(fs, mmap_mode='r')` | Memory-map the arrays instead of reading them. |
| `dp.resources` | Every resource and its metadata. |
| `dp.groups` | The resource groups, which is the unit a matrix is built from. |
| `dp.get_resource('<name>')` | One array plus its metadata. |
| `dp.filter_by_attribute('matrix', 'technosphere_matrix')` | A `FilteredDatapackage` with only what you need. |
| `dp.exclude({'group': '<label>'})` | The opposite. |
| `dp.get_max_index_value()` | The largest row or column index present. |

### Moving one between machines

| Call | What it does |
|---|---|
| `bp.reindex(dp, '<metadata name>', my_data, fields=[...])` | Rewrite the integer indices to match your database's ids. |
| `bp.reset_index(dp, '<metadata name>')` | Renumber densely from zero. |
| `bp.merge_datapackages_with_mask(first_dp, label, second_dp, label, mask_array=...)` | Combine two sources element by element. |

### The examples

```python
import bw_processing as bp
sorted(p.name for p in bp.examples_dir.iterdir())
```

gives the three bundled example packages, which are the quickest way to see the file
layout of the format without building one.
