---
title: Run a MultiLCA over several demands
type: use-case
summary: Score two functional units against two impact categories in one pass, and read the results out of the scores dictionary.
audience: [P1]
updated: 2026-09-22
sources: [brightway-cheatsheet, bw2calc-docs, pypi-bw2calc, pypi-bw2data]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with bw2data 4.7, bw2calc 2.5.0 and bw2io 0.9.17, BRIGHTWAY2_DIR set to a temporary directory, Linux x86-64
related: [run-an-lca-and-read-the-score.md, ../classes.md, ../gotchas.md]
---

# Run a MultiLCA over several demands

**Persona:** P1 practitioner comparing products, or building a results table for a
report · **GICS sector:** any

## Goal

A table of scores: every functional unit you name, against every impact category you
name, computed in one pass instead of one `LCA` per cell.

## Prerequisites

- The toy bakery project from
  [../../bw2data/use-cases/create-a-project-and-a-database.md](../../bw2data/use-cases/create-a-project-and-a-database.md),
  extended with a second impact category so the comparison has two columns:

  ```python
  acid = bd.Method(("toy method", "acidification"))
  acid.write([(("toy-biosphere", "co2"), 0.002)])
  acid.metadata["unit"] = "mol H+-eq"
  ```

- `bw2data` 4.7 and `bw2calc` 2.5.0. No licence, no credentials, no network access.

## Steps

1. Name the functional units. The inner key is an **integer node id**, not a node object
   (source: brightway-cheatsheet).

   ```python
   import bw2data as bd
   import bw2calc as bc

   bread = bd.get_node(database="toy-bakery-db", name="bread production")
   flour = bd.get_node(database="toy-bakery-db", name="flour production")

   fus = {"one kg bread": {bread.id: 1}, "one kg flour": {flour.id: 1}}
   ```

2. Name the impact categories, in a method configuration dictionary.

   ```python
   config = {"impact_categories": [
       ("toy method", "climate change", "GWP100"),
       ("toy method", "acidification"),
   ]}
   ```

3. Collect the datapackages for that combination.

   ```python
   objs = bd.get_multilca_data_objs(functional_units=fus, method_config=config)
   ```

4. Build the calculation and run it.

   ```python
   mlca = bc.MultiLCA(demands=fus, method_config=config, data_objs=objs)
   mlca.lci()
   mlca.lcia()
   ```

5. Read the results. The attributes are plural, and `scores` is a dictionary keyed by
   `(impact category, functional unit label)` (source: brightway-cheatsheet).

   ```python
   for key, value in mlca.scores.items():
       print(key, "=>", value)
   ```

## Expected output

Four entries, one per cell of a two by two table:

| Functional unit | `climate change, GWP100` | `acidification` |
|---|---|---|
| one kg bread | about 0.4146 | about 0.000829 |
| one kg flour | about 0.4180 | about 0.000836 |

Flour scores slightly higher than bread per kilogram here, which is the toy model
speaking, not a claim about baking: bread dilutes 0.7 kg of flour with heat and a small
direct emission. The acidification column is exactly the climate column times the 0.002
factor, because the toy method characterises the same single flow.

`mlca.inventories` and `mlca.characterized_inventories` hold the matrices behind those
numbers, keyed the same way.

## Pitfalls

- **The inner key must be an id.** `{"label": {node: 1}}` fails; `{"label": {node.id: 1}}`
  works. The outer label may be a node object (source: brightway-cheatsheet). See
  [../gotchas.md](../gotchas.md).
- **The result keys grow as you add steps.** Once normalisation or weighting is
  configured, the key carries which normalisation and which weighting were applied, so
  code that unpacks a two-tuple breaks (source: brightway-cheatsheet).
- **`get_multilca_data_objs` takes the same `method_config`** you pass to `MultiLCA`.
  Building the datapackages from one configuration and calculating with another gives a
  key error, or worse, a silently smaller table.
- **This is not a comparative assertion.** Two scores side by side are two scores; the
  comparison rules live in the standards, not in the calculation. See
  [Comparative assertion](../../../../vocabulary.md#comparative-assertion).
- **One pass, one set of datapackages.** If the functional units live in different
  databases, all of them have to be processed and current.

## Related vocabulary

- [Functional unit](../../../../vocabulary.md#functional-unit)
- [Demand](../../../../vocabulary.md#demand)
- [Impact category](../../../../vocabulary.md#impact-category)
- [LCIA results](../../../../vocabulary.md#lcia-results)
- [Single overall score](../../../../vocabulary.md#single-overall-score)
- [Normalisation](../../../../vocabulary.md#normalisation)
- [Weighting](../../../../vocabulary.md#weighting)
- [Comparative life cycle assessment](../../../../vocabulary.md#comparative-life-cycle-assessment)
- [Datapackage](../../../../vocabulary.md#datapackage)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`bw2data` 4.7, `bw2calc` 2.5.0, `bw2io` 0.9.17, `BRIGHTWAY2_DIR` pointed at a fresh
temporary directory, Linux x86-64. The four scores printed were
`0.41460000140517933` and `0.41800000627338885` for climate change, and
`0.0008292000421952454` and `0.0008360000522546476` for acidification. Duration,
including building the toy project and both impact categories: about 3 seconds.
