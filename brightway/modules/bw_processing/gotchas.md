---
title: bw_processing gotchas
type: module-page
summary: What surprises people about bw_processing 1.6, and what to do instead.
audience: [P1, P3]
updated: 2026-09-21
sources: [bw-processing-docs, pypi-bw-processing, brightway-faq-versions]
related: [classes.md, commands.md, ../matrix_utils/gotchas.md]
---

# bw_processing gotchas

- **Do not call `Datapackage()`.** The class docstring says so: use `create_datapackage()`
  or `load_datapackage()`. A bare instance is not initialised.

- **The distribution name and the import name differ.** `pip install bw-processing`,
  `import bw_processing`.

- **A datapackage is not one array per matrix.** It is a set of resource groups, and two
  groups can both write to the same matrix, adding to or replacing each other's values.
  Counting the rows of one array tells you nothing about the size of the matrix. See
  [../matrix_utils/gotchas.md](../matrix_utils/gotchas.md).

- **Signs live in the `flip` vector, not in the data.** Values are stored positive and
  flipped on insertion. Writing a negative amount and also setting `flip` gives you a
  positive matrix entry (source: bw-processing-docs).

- **`scale` is applied before insertion and defaults to nothing.** A group with a scale
  vector of `1.0` behaves as if there were none; a group without one is not scaled. Do not
  expect allocation factors to be visible in the data array
  (source: bw-processing-docs).

- **Integer ids are local.** The indices in a package come from the machine that wrote it.
  Moving a package without reindexing gives you a matrix built from the wrong nodes, not
  an error. `add_csv_metadata` at write time is what makes `reindex` possible later.

- **`DEFAULT_LICENSES` is a default, not a claim.** A new package records the Open Data
  Commons PDDL. If your numbers are licensed, set the metadata yourself.

- **Dynamic resources may not survive a round trip.** An interface that generates data at
  calculation time cannot be serialised; what is written is a placeholder, and
  `rehydrate_interface` has to put the live object back after loading.

- **`proxy=True` and `mmap_mode` change when errors appear.** With lazy loading, a corrupt
  or missing array surfaces at first use rather than at load.

- **`simple_graph` is deprecated** in 1.6; use `create_datapackage_from_entries`.

- **The format moves.** `bw_processing` went from 1.1.1 in April 2026 to 1.6 in July 2026
  (source: pypi-bw-processing), and `matrix_utils` 0.9 requires `bw_processing >= 1.6`
  exactly. Pin both together, and remember that packages written by an older `bw2data` may
  need reprocessing (source: brightway-faq-versions).
