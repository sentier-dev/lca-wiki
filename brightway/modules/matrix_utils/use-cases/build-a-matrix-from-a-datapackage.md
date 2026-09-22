---
title: Build a matrix from a datapackage
type: use-case
summary: Turn a bw_processing datapackage into a SciPy sparse matrix with MappedMatrix, read the id-to-index mappers, and solve the system by hand.
audience: [P1]
updated: 2026-09-22
sources: [matrix-utils-docs, pypi-matrix-utils, bw-processing-docs]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with bw_processing 1.6, matrix_utils 0.9 and scipy, Linux x86-64
related: [../commands.md, ../classes.md, ../gotchas.md, ../../bw_processing/use-cases/write-and-read-a-datapackage.md]
---

# Build a matrix from a datapackage

**Persona:** P1 practitioner who wants to see the matrix behind a score, or a P2
contributor writing a calculation that is not an LCA · **GICS sector:** any

## Goal

The technosphere matrix of the toy bakery, as an actual SciPy sparse matrix, with the
mapping from database ids to matrix positions in your hands, and the supply vector
solved without `bw2calc`.

## Prerequisites

- `bw_processing` 1.6, `matrix_utils` 0.9 and `scipy`. Version pinning here is tight:
  `matrix_utils` 0.9 requires `bw_processing >= 1.6` (source: pypi-matrix-utils).
- The datapackage from
  [../../bw_processing/use-cases/write-and-read-a-datapackage.md](../../bw_processing/use-cases/write-and-read-a-datapackage.md).
  Build it in the same script.

## Steps

1. Build the datapackage, as in the `bw_processing` use case.

   ```python
   import numpy as np
   import bw_processing as bwp

   indices = np.array([(101, 101), (102, 101), (103, 101),
                       (102, 102), (103, 102), (103, 103)], dtype=bwp.INDICES_DTYPE)
   data = np.array([1.0, 0.7, 1.2, 1.0, 0.3, 1.0])
   flip = np.array([False, True, True, False, True, False])

   dp = bwp.create_datapackage(name="toy-bakery-technosphere")
   dp.add_persistent_vector(
       matrix="technosphere_matrix", indices_array=indices,
       data_array=data, flip_array=flip, name="toy-technosphere",
   )
   ```

2. Map it into a matrix. Every argument is keyword only
   (source: matrix-utils-docs).

   ```python
   import matrix_utils as mu

   mm = mu.MappedMatrix(packages=[dp], matrix="technosphere_matrix")
   A = mm.matrix
   ```

3. Look at what you got.

   ```python
   type(A).__name__, A.shape, A.nnz
   A.toarray()
   ```

4. Read the mappers. These are what turn database ids into row and column positions, and
   what you need to interpret any result.

   ```python
   dict(mm.row_mapper.to_dict())
   dict(mm.col_mapper.to_dict())
   ```

5. Solve for one kilogram of bread, which is the first column.

   ```python
   import scipy.sparse.linalg as sla

   demand = np.array([1.0, 0.0, 0.0])
   sla.spsolve(A.tocsc(), demand)
   ```

## Expected output

- `A` is a `csr_matrix` of shape `(3, 3)` with 6 stored entries.
- Dense, it is lower triangular, with ones on the diagonal and the consumed amounts
  negative below it: `-0.7` for flour into bread, `-1.2` and `-0.3` for heat into bread
  and into flour. The negatives come from the flip vector, not from the data array.
- Both mappers are `{101: 0, 102: 1, 103: 2}`: the ids are sorted and mapped to
  consecutive positions. In this package rows and columns carry the same ids, so the two
  mappers agree; in a biosphere matrix they would not.
- The solve returns `[1.0, 0.7, 1.41]`, which is the same supply array
  [bw2calc reports](../../bw2calc/use-cases/run-an-lca-and-read-the-score.md) for the
  same system.

## Pitfalls

- **Every argument is keyword only.** `MappedMatrix([dp], "technosphere_matrix")` fails
  (source: matrix-utils-docs). See [../gotchas.md](../gotchas.md).
- **`packages` must hold instantiated datapackages,** not paths and not filesystems.
  Load them with `bw_processing.load_datapackage` first.
- **The `matrix` label must match exactly.** It filters resource groups, so a typo gives
  an empty or undersized matrix rather than an error.
- **Elements outside the mapping are dropped silently.** Check `n_elements_dropped` when
  a matrix is smaller than you expected; that is the usual symptom of two datapackages
  built against different id spaces.
- **A matrix can come from several resource groups,** which can add to or replace each
  other's values. Summing one input array is not summing the matrix.
- **Sharing mappers is how dimensions line up.** Two matrices built with independent
  mappers have rows in different orders. `bw2calc` handles this; hand-built matrices do
  not.
- **Solve with CSC, not CSR.** SciPy converts for you and warns; `.tocsc()` first keeps
  the output clean.

## Related vocabulary

- [Datapackage](../../../../vocabulary.md#datapackage)
- [Resource group](../../../../vocabulary.md#resource-group)
- [Processed arrays](../../../../vocabulary.md#processed-arrays)
- [Technosphere](../../../../vocabulary.md#technosphere)
- [Ordered pair](../../../../vocabulary.md#ordered-pair)
- [Inventory](../../../../vocabulary.md#inventory)
- [Demand](../../../../vocabulary.md#demand)
- [Node](../../../../vocabulary.md#node)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`bw_processing` 1.6, `matrix_utils` 0.9, `scipy`, Linux x86-64. The matrix was a
`csr_matrix` of shape `(3, 3)` with 6 non-zeros and dense form
`[[1, 0, 0], [-0.7, 1, 0], [-1.2, -0.3, 1]]`; both mappers were `{101: 0, 102: 1, 103: 2}`;
the solve returned `[1.0, 0.7, 1.41]`. Duration: under 2 seconds, including installing
the environment from a warm `uv` cache.
