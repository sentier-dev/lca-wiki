---
title: matrix_utils commands
type: module-page
summary: Building a matrix from datapackages, from Python.
audience: [P1]
updated: 2026-09-21
sources: [pypi-matrix-utils, matrix-utils-docs]
related: [classes.md, gotchas.md, ../../commands.md]
---

# matrix_utils commands

`matrix_utils` 0.9 installs no shell command: its distribution declares an empty
entry-point list, checked with `importlib.metadata` on 2026-09-21.

## Command line

| Command | What it does | Key options |
|---|---|---|
| none | `matrix_utils` has no console script. | n/a |

## Notebook entry points

### One matrix

```python
from matrix_utils import MappedMatrix

mm = MappedMatrix(packages=[some_datapackage], matrix="technosphere_matrix")
mm.matrix
```

The README shows exactly this, down to the sparse matrix repr that comes back
(source: matrix-utils-docs).

| Call | What it does |
|---|---|
| `MappedMatrix(packages=[...], matrix="<label>")` | Build the matrix. |
| `mm.matrix` | The scipy sparse matrix. |
| `mm.rebuild_matrix()` | Rebuild it from the current samples. |
| `next(mm)` | New samples from every stochastic group, then rebuild. |
| `mm.reset_indexers()` | Start the sampling sequence again. |
| `mm.n_elements_dropped` | How many entries fell outside the mapping. |

### Several matrices that must line up

```python
from matrix_utils import ArrayMapper, MappedMatrix

rows = ArrayMapper(array=product_ids)
technosphere = MappedMatrix(packages=[dp], matrix="technosphere_matrix", row_mapper=rows)
biosphere = MappedMatrix(packages=[dp], matrix="biosphere_matrix", col_mapper=technosphere.col_mapper)
```

| Call | What it does |
|---|---|
| `ArrayMapper(array=ids)` | Build a mapping from ids to dense indices. |
| `mapper.map_array(other_ids)` | Apply it to another array. |
| `MappedMatrix(..., row_mapper=..., col_mapper=...)` | Reuse a mapping so dimensions agree. |
| `MappedMatrixDict(packages={label: [dp]}, matrix=..., row_mapper=..., col_mapper=...)` | Build several labelled matrices at once. |

### Uncertainty and scenarios

| Call | What it does |
|---|---|
| `MappedMatrix(..., use_distributions=True)` | Sample from the uncertainty parameters. |
| `MappedMatrix(..., use_arrays=True)` | Use the presampled columns in array resources. |
| `MappedMatrix(..., use_vectors=False)` | Ignore vector resources entirely. |
| `MappedMatrix(..., seed_override=42)` | Fix the random seed, except for combinatorial packages. |

### Inspecting what went in

| Call | What it does |
|---|---|
| `mm.groups` | The resource groups that contributed. |
| `mm.input_data_vector`, `mm.input_row_col_indices`, `mm.input_flip_vector` | The concatenated inputs, useful when a matrix is not what you expected. |
| `mm.input_provenance` | Which group each element came from. |
