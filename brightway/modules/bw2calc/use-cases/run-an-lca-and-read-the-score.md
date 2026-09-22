---
title: Run an LCA and read the score
type: use-case
summary: Solve a single functional unit against one impact category on a toy database, and read the score, the supply array and the characterised inventory.
audience: [P1]
updated: 2026-09-22
sources: [brightway-cheatsheet, bw2calc-docs, pypi-bw2calc, pypi-bw2data, brightway-faq-versions]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with bw2data 4.7, bw2calc 2.5.0 and bw2io 0.9.17, BRIGHTWAY2_DIR set to a temporary directory, Linux x86-64
related: [../commands.md, ../classes.md, ../gotchas.md]
---

# Run an LCA and read the score

**Persona:** P1 practitioner running their first 2.5 calculation, or checking that an
environment works · **GICS sector:** any

## Goal

One number, and the intermediate results behind it: the supply array, the inventory and
the characterised inventory, computed on a database small enough that you can verify the
answer with a pencil.

## Prerequisites

- The toy bakery project from
  [../../bw2data/use-cases/create-a-project-and-a-database.md](../../bw2data/use-cases/create-a-project-and-a-database.md).
  Build it in the same script; it takes about a second.
- `bw2data` 4.7 and `bw2calc` 2.5.0. No licence, no credentials, no network access.

## Steps

1. Build the toy project, then pick the node you want one kilogram of.

   ```python
   import bw2data as bd
   import bw2calc as bc
   import toy_bakery  # the script from the bw2data use case

   bread = bd.get_node(database="toy-bakery-db", name="bread production")
   ```

2. Collect the functional unit and the datapackages for it. `bw2data` does the
   translation from objects to integer ids and datapackages; `bw2calc` never reads your
   project (source: brightway-cheatsheet).

   ```python
   fu, objs, _ = bd.prepare_lca_inputs(
       {bread: 1}, method=("toy method", "climate change", "GWP100")
   )
   ```

3. Build the calculation object. Nothing is computed yet.

   ```python
   lca = bc.LCA(demand=fu, data_objs=objs)
   ```

4. Solve the inventory, then characterise it.

   ```python
   lca.lci()
   lca.lcia()
   ```

5. Read the results.

   ```python
   lca.score
   lca.supply_array
   lca.technosphere_matrix.shape, lca.biosphere_matrix.shape
   lca.characterized_inventory.toarray()
   ```

6. When you want the largest entries as a frame rather than a matrix
   (source: brightway-cheatsheet):

   ```python
   lca.to_dataframe(matrix_label="characterized_inventory")
   ```

## Expected output

- `lca.score` is `0.4146` kg CO2-eq per kilogram of bread, to floating point noise. The
  arithmetic is checkable by hand: 0.05 direct, plus 0.7 kg of flour at 0.4, plus 1.41
  MJ of heat at 0.06.
- `lca.supply_array` is `[1.0, 0.7, 1.41]`: one bread, 0.7 flour, and 1.41 heat, which
  is the 1.2 the bakery uses plus the 0.21 the mill uses.
- The technosphere matrix is 3 by 3 and the biosphere matrix is 1 by 3.
- `lca.characterized_inventory` is a 1 by 3 sparse matrix holding `0.05`, `0.28` and
  `0.0846`. It sums to the score.
- `to_dataframe` returns three rows and twenty columns, one row per non-zero entry, with
  the row and column indices, the amount and the labels of both ends.

## Pitfalls

- **Constructing an `LCA` calculates nothing.** Reading `lca.score` before `lcia()` is
  an error, not a zero. See [../gotchas.md](../gotchas.md).
- **The engine reads datapackages, not your project.** If you edited a database and did
  not reprocess it, you are solving the state at the last `.process()`.
- **A 2.5 `LCA` takes `demand` and `data_objs`.** A tutorial writing
  `LCA({activity: 1}, method)` with a key tuple belongs to the Brightway 2 line
  (source: brightway-faq-versions, brightway-cheatsheet).
- **Rows are products, columns are processes** in the technosphere matrix, and rows are
  elementary flows in the biosphere matrix. Use `lca.dicts.product`,
  `lca.dicts.activity` and `lca.dicts.biosphere` rather than guessing
  (source: brightway-cheatsheet).
- **On x64 hardware without `pypardiso` you get a warning on import** and a slower
  solver. The numbers are the same; see
  [../../pypardiso/use-cases/solve-with-pardiso-in-bw2calc.md](../../pypardiso/use-cases/solve-with-pardiso-in-bw2calc.md).
- **`supply_array` values come back as float32-derived floats,** so `0.7` prints as
  `0.69999999`. That is the datapackage's storage precision, not an error in the solve.

## Related vocabulary

- [Functional unit](../../../../vocabulary.md#functional-unit)
- [Demand](../../../../vocabulary.md#demand)
- [Inventory](../../../../vocabulary.md#inventory)
- [Technosphere](../../../../vocabulary.md#technosphere)
- [Biosphere](../../../../vocabulary.md#biosphere)
- [Datapackage](../../../../vocabulary.md#datapackage)
- [Method](../../../../vocabulary.md#method)
- [Impact category](../../../../vocabulary.md#impact-category)
- [LCIA results](../../../../vocabulary.md#lcia-results)
- [Characterization factors](../../../../vocabulary.md#characterization-factors)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`bw2data` 4.7, `bw2calc` 2.5.0, `bw2io` 0.9.17, `BRIGHTWAY2_DIR` pointed at a fresh
temporary directory, Linux x86-64, with no fast solver installed. The score was
`0.41460000140517933`, the supply array `[1.0, 0.69999999, 1.41000005]`, the
characterised inventory `[[0.05, 0.28, 0.0846]]`, and `to_dataframe` returned three rows
by twenty columns. Duration, including building the toy project: about 3 seconds.
