---
title: bw_graph_tools datasets
type: module-page
summary: bw_graph_tools ships no data; it reads matrices and returns records.
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-bw-graph-tools, bw-graph-tools-repo]
---

# bw_graph_tools datasets

## None shipped

bw_graph_tools 0.10 ships no data files. The installed wheel contains Python modules
only, checked by listing the installed package
(source: pypi-bw-graph-tools). There is no bundled database, no flow list, no
nomenclature and no impact assessment method.

## What it reads

| Input | Where it comes from | What the package does with it |
|---|---|---|
| a solved `LCA` object | `bw2calc`, after `lci()` and `lcia()` | the traversal classes take it as their starting point |
| a mapped technosphere matrix | `matrix_utils`, built from datapackages | `guess_production_exchanges` inspects it |
| a sparse technosphere matrix | `bw2calc` or `scipy` | `get_path_from_matrix` and `to_normalized_adjacency_matrix` work on it |
| activity and exchange objects | `bw2data` | `path_as_brightway_objects` returns exchanges from the project |

The datapackage format those matrices are built from is documented in
[../bw_processing/README.md](../bw_processing/README.md), and the assembly step in
[../matrix_utils/README.md](../matrix_utils/README.md).

## What it produces

Nothing on disk. Traversal returns three lists of dataclasses in memory:

- **`nodes`**: one record per visit, carrying indices, depth, supply amount and the
  cumulative and direct emission scores.
- **`edges`**: one record per edge between two visits, carrying the amount of product
  demanded.
- **`flows`**: one record per characterised biosphere flow attached to a visit, when
  `separate_biosphere_flows` is on.

These are described field by field in [classes.md](classes.md). Writing them anywhere
is the caller's decision, which is why this package has no file format of its own and
no schema to version.

- **Provenance of the numbers:** they come from whatever database the solved `LCA`
  was built on. If that is a licensed database, the results carry that licence, and
  this wiki does not reproduce them.
- **Methods:** none shipped. The characterisation comes from the method the `LCA`
  object was constructed with.
- **Source branch:** not applicable; there is no bundled source database.
