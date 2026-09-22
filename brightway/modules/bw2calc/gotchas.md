---
title: bw2calc gotchas
type: module-page
summary: What surprises people about bw2calc 2.5.0, and what to do instead.
audience: [P1, P3]
updated: 2026-09-21
sources: [brightway-cheatsheet, brightway-faq-versions, brightway-installation, pypi-bw2calc, brightway-docs]
related: [classes.md, commands.md, ../bw2data/gotchas.md]
---

# bw2calc gotchas

- **Version 2 of `bw2calc` is the 2.5 generation.** `bw2calc < 1.8.1` belongs to
  Brightway 2 and `>= 2.0` to Brightway 2.5 (source: brightway-faq-versions). A tutorial
  that writes `LCA({activity: 1}, method)` with a key tuple is the old line; the 2.5 form
  takes a demand dictionary and `data_objs`.

- **Constructing an `LCA` calculates nothing.** You get an object with no matrices until
  `lci()` runs. Reading `lca.score` before `lcia()` is an error, not a zero.

- **The engine never reads your project.** It reads the datapackages you hand it. If you
  edited a database and did not reprocess it, the calculation uses the state at the last
  `.process()`. See [../bw2data/gotchas.md](../bw2data/gotchas.md).

- **`MultiLCA` functional units are keyed by integer id.** `{"label": {node.id: 1}}`, not
  `{"label": {node: 1}}`. The label may be a `Node` object; the inner key may not
  (source: brightway-cheatsheet).

- **Results of a `MultiLCA` are dictionaries, and the attributes are plural.**
  `inventories`, `characterized_inventories`, `scores`. Keys carry the impact category,
  the normalisation and the weighting that were applied, so they grow as you add steps
  (source: brightway-cheatsheet).

- **Rows and columns are not what you expect in every matrix.** In the technosphere matrix
  rows are products and columns are processes; in the biosphere matrix rows are
  elementary flows. Use `lca.dicts.product`, `lca.dicts.activity` and
  `lca.dicts.biosphere` rather than guessing, and `.reversed` to go back
  (source: brightway-cheatsheet).

- **Without `pypardiso` on x64 you get a warning and a slower solver.** Importing
  `bw2calc` 2.5.0 in an environment without it prints the text in `PYPARDISO_WARNING`
  (observed on 2026-09-21). On Apple Silicon `pypardiso` does not run at all and
  `scikit-umfpack` is the documented substitute (source: brightway-installation).

- **`use_distributions=True` changes nothing until you iterate.** The first solve is the
  static one; `next(lca)` draws the first sample.

- **Iteration resets caches.** `CachingLCA` documents that its cache resets on iteration,
  so mixing caching with Monte Carlo needs care.

- **A negative or absurd score is usually a model problem, not a solver problem.** The
  upstream FAQ has a page on negative results; check the sign conventions of your edges
  before blaming the engine (source: brightway-docs).
