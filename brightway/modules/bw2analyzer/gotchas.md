---
title: bw2analyzer gotchas
type: module-page
summary: What surprises people about bw2analyzer 0.11.8, starting with its age.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-bw2analyzer, bw2analyzer-docs, brightway-lca-org, brightway-ecosystem]
related: [classes.md, commands.md, status.md]
---

# bw2analyzer gotchas

- **The release is from 2023 and the repository has been quiet since.** 0.11.8 was
  published on 2023-09-15 and the repository was last pushed to on 2023-12-15
  (source: pypi-bw2analyzer, brightway-lca-org). It still works against the 2.5 stack, but
  it is the least maintained of the four core packages.

- **`__version__` is a tuple.** `(0, 11, 8)` in the installed release, checked on
  2026-09-21, not a string.

- **Its metadata still points at Bitbucket.** The PyPI home page field is a Bitbucket URL
  from before the move to GitHub (source: pypi-bw2analyzer). The live repository is
  `brightway-lca/brightway2-analyzer`.

- **Graph traversal moved.** `print_recursive_supply_chain` points at
  `bw2calc.GraphTraversal` for better performance, which no longer exists there: in the
  2.5 line traversal is [../bw_graph_tools/](../bw_graph_tools/)
  (source: brightway-ecosystem).

- **The cutoff hides branches by default.** `print_recursive_calculation` defaults to
  `max_level=3` and `cutoff=0.01`, so a long supply chain looks shorter than it is. Raise
  both before concluding that nothing deep matters.

- **The `lca` argument must already be solved.** Passing a fresh `LCA` object gives an
  attribute error, not an empty ranking: call `lci()` and `lcia()` first.

- **Annotation needs the project that produced the calculation.** The `annotated_*`
  methods look names up through `bw2data`, so switching project between calculating and
  analysing produces wrong or missing names.

- **`traverse_tagged_databases` traverses the foreground only.** It follows the
  foreground databases, or the ones you list in `fg_databases`; everything else is
  summarised at the boundary. A tag on a background process will not be found.

- **`matplotlib` comes along.** The package depends on it for the Hinton plot, which makes
  it heavier than the rest of the stack in a headless environment
  (source: pypi-bw2analyzer).

- **19 issues are open and nobody is closing them quickly.** Check the tracker before
  assuming a behaviour is intended (source: brightway-lca-org).
