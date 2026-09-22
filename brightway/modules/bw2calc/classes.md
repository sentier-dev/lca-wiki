---
title: bw2calc classes and functions
type: module-page
summary: The LCA classes of bw2calc 2.5.0 and what each one is for.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-bw2calc, brightway-cheatsheet, bw2calc-docs]
related: [README.md, commands.md, gotchas.md]
---

# bw2calc classes and functions

The names below are the public namespace of the installed version 2.5.0, read with
`dir(bw2calc)` on 2026-09-21; the one-liners come from the classes' own docstrings and
from the cheat sheet (source: brightway-cheatsheet).

## The two you will use

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `LCA` | class | One functional unit, optionally one impact category, normalisation and weighting. | `bc.LCA(demand=fu, data_objs=objs)` |
| `MultiLCA` | class | Many labelled functional units against a structure of impact categories, sharing one technosphere and biosphere matrix. | `bc.MultiLCA(demands=fus, method_config=cfg, data_objs=objs)` |
| `MethodConfig` | pydantic model | Says which impact categories exist and how normalisations and weightings apply to them. | `bc.MethodConfig(impact_categories=[...])` |

## Solver variants

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `DenseLCA` | class | Converts the technosphere matrix to a dense array and solves with numpy. | small or badly conditioned systems |
| `LeastSquaresLCA` | class | Least-squares solution when there are more products than activities. | overdetermined systems |
| `IterativeLCA` | class | Iterative solvers instead of LU factorisation. | very large systems |
| `JacobiGMRESLCA` | class | GMRES with the inverse technosphere diagonal as preconditioner. | large systems where GMRES converges |
| `CachingLCA` | class | Caches supply vectors; the cache resets on iteration. | repeated similar calculations |
| `FastScoresOnlyMultiLCA` | class | Chunked `MultiLCA` that precomputes as much as possible when only scores are wanted. | large screening runs |
| `PartitionedMonteCarloLCA` | class | Solves a static background once and only resamples the stochastic foreground. | Monte Carlo with a fixed background |

## Functions and flags

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `spsolve` | function | Sparse solve, routed to PARDISO when available. | internal, and usable directly |
| `factorized` | function | Returns a reusable factorisation of a matrix. | internal, and usable directly |
| `PYPARDISO`, `UMFPACK` | booleans | Whether each fast solver was importable. | `bc.PYPARDISO` |
| `PYPARDISO_WARNING`, `UMFPACK_WARNING` | strings | The warning texts printed at import on x64 without a fast solver. | shown automatically |

## What an LCA object gives you

Methods, read from the installed 2.5.0: `lci`, `lcia`, `normalize`, `weight`,
`lci_calculation`, `lcia_calculation`, `normalization_calculation`,
`weighting_calculation`, `load_lci_data`, `load_lcia_data`, `load_normalization_data`,
`load_weighting_data`, `build_demand_array`, `check_demand`, `solve_linear_system`,
`decompose_technosphere`, `invert_technosphere_matrix`, `redo_lci`, `redo_lcia`,
`switch_method`, `switch_normalization`, `switch_weighting`, `remap_inventory_dicts`,
`to_dataframe`, `keep_first_iteration`, `reverse_dict`, `has`, `matrix_labels`.

Attributes worth knowing: `technosphere_matrix`, `biosphere_matrix`,
`characterization_matrix`, `supply_array`, `demand_array`, `inventory`,
`characterized_inventory`, `normalized_inventory`, `weighted_inventory`, `score`, and
`dicts`, whose `activity`, `product` and `biosphere` members map node ids to matrix
indices and back through `.reversed` (source: brightway-cheatsheet).

`MultiLCA` has the same methods with plural results: `inventories`,
`characterized_inventories`, `normalized_inventories`, `weighted_inventories`,
`supply_arrays`, `scores` (source: brightway-cheatsheet).

## Notes

- Nothing happens on construction. `lci()` builds and solves the inventory, `lcia()`
  characterises it, `normalize()` and `weight()` follow if their data was configured.
  `score` is a property of the last of those steps.
- The classes are iterators. `next(lca)` draws new samples from every stochastic resource,
  rebuilds all matrices and solves again, which is what makes Monte Carlo a `for` loop.
- `to_dataframe(matrix_label=...)` is the quickest way to see the largest entries of a
  result matrix without indexing by hand.
- `switch_method` and `redo_lcia` avoid rebuilding the technosphere when only the impact
  category changed.
