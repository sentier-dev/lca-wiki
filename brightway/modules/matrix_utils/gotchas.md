---
title: matrix_utils gotchas
type: module-page
summary: What surprises people about matrix_utils 0.9, and what to do instead.
audience: [P1, P3]
updated: 2026-09-21
sources: [matrix-utils-docs, pypi-matrix-utils]
related: [classes.md, commands.md, ../bw_processing/gotchas.md]
---

# matrix_utils gotchas

- **Every argument is keyword only.** `MappedMatrix([dp], "technosphere_matrix")` fails;
  `MappedMatrix(packages=[dp], matrix="technosphere_matrix")` works
  (source: matrix-utils-docs).

- **`packages` must hold instantiated datapackages.** Not paths, not filesystems. Load
  them with `bw_processing.load_datapackage` first (source: matrix-utils-docs).

- **The `matrix` label must match exactly.** It is used to filter resource groups, so a
  typo gives you an empty or undersized matrix rather than an error.

- **Elements outside the mapping are dropped silently.** Check `n_elements_dropped` when a
  matrix is smaller than expected. This is the usual symptom of two datapackages built
  against different id spaces.

- **A matrix can come from several resource groups.** They can add to existing values or
  replace them, so one array is not the matrix and summing the input data vector is not
  the sum of the matrix (source: matrix-utils-docs).

- **A resource group is vector or array, never both.** If you need static and presampled
  values for the same exchanges, that is two groups
  (source: matrix-utils-docs).

- **`seed_override` is ignored for combinatorial packages.** Documented, and easy to miss
  when a run will not reproduce (source: matrix-utils-docs).

- **Sharing mappers is how dimensions line up.** Two matrices built with independent
  mappers will have rows in different orders. `bw2calc` handles this for you; hand-built
  matrices do not.

- **The API is deliberately unlike the old `bw2calc` functions.** Code written for
  Brightway 2 matrix building has no counterpart here (source: matrix-utils-docs).

- **Version pinning is tight.** 0.9 requires `bw_processing >= 1.6`, and `bw2calc` 2.5.0
  requires `matrix_utils >= 0.6`. Upgrading one usually means upgrading all three
  (source: pypi-matrix-utils).
