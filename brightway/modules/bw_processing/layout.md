---
title: bw_processing layout
type: module-page
summary: How the bw_processing package is organised, module by module.
audience: [P2, P3]
updated: 2026-09-21
sources: [pypi-bw-processing, bw-processing-docs]
related: [README.md, classes.md]
---

# bw_processing layout

The tree below is the installed package of version 1.6, walked on disk on 2026-09-21.

```
bw_processing/
├── __init__.py              re-exports create_datapackage, load_datapackage, the dtypes and the enums
├── datapackage.py           DatapackageBase, Datapackage and FilteredDatapackage: the whole API surface
├── array_creation.py        create_array and create_structured_array, the numpy side
├── matrix_entry.py          MatrixEntry and ArrayEntry, the per-cell and per-group record types
├── constants.py             INDICES_DTYPE, UNCERTAINTY_DTYPE, DEFAULT_LICENSES, the serialisation formats
├── param_labels.py          StringLabelSchema, ParamLabelSchema and ParamLabelField for parameter arrays
├── indexing.py              reindex and reset_index, the portability machinery
├── merging.py               merge_datapackages_with_mask
├── unique_fields.py         as_unique_attributes, the greedy search for a minimal identifying key set
├── io_helpers.py            reading and writing resources through fsspec
├── io_parquet_helpers.py    the parquet serialisation path
├── io_pyarrow_helpers.py    numpy to Arrow table conversion used by that path
├── filesystem.py            safe filenames, directory and zip filesystems
├── proxies.py               lazy access to arrays that have not been read yet
├── utils.py                 md5, clean_datapackage_name, schema helpers
├── errors.py                the exception types
└── examples/                interfaces.py, parquet_files.py and three small example datapackages
```

## Key files

- `datapackage.py`: read this one. Everything a caller does goes through `Datapackage`:
  adding persistent vectors and arrays, adding dynamic ones, attaching CSV or JSON
  metadata, filtering, and finalising the serialisation.
- `constants.py`: the two dtypes that define the format. `INDICES_DTYPE` is
  `(row, int64)` and `(col, int64)`; `UNCERTAINTY_DTYPE` is the `stats_arrays` seven-field
  record, read from the installed 1.6.
- `indexing.py`: why a datapackage can move between machines at all.
- `io_parquet_helpers.py`: the alternative to numpy files on disk; the serialisation
  format is chosen through `MatrixSerializeFormat`.
