---
title: Run a contribution analysis
type: use-case
summary: "Find out where a score comes from: the processes and elementary flows that dominate it, and the supply chain printed with each branch's share."
audience: [P1]
updated: 2026-09-22
sources: [bw2analyzer-docs, pypi-bw2analyzer, brightway-cheatsheet]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with bw2data 4.7, bw2calc 2.5.0, bw2io 0.9.17 and bw2analyzer 0.11.8, BRIGHTWAY2_DIR set to a temporary directory, Linux x86-64
related: [../commands.md, ../classes.md, ../gotchas.md, ../../bw2calc/use-cases/run-an-lca-and-read-the-score.md]
---

# Run a contribution analysis

**Persona:** P1 practitioner explaining a result, or checking one that looks wrong ·
**GICS sector:** any

## Goal

The decomposition of a single score: which processes carry it, which elementary flows
carry it, and where in the supply chain it sits.

## Prerequisites

- A solved `LCA`. Build the toy bakery and run it as in
  [../../bw2calc/use-cases/run-an-lca-and-read-the-score.md](../../bw2calc/use-cases/run-an-lca-and-read-the-score.md).
- `bw2analyzer` 0.11.8, which pulls in `matplotlib`.
- The **same project** the calculation came from, still current: the annotated methods
  look names up through `bw2data`.

## Steps

1. Solve the calculation first. Passing a fresh `LCA` object raises rather than
   returning an empty ranking.

   ```python
   import bw2data as bd
   import bw2calc as bc
   import bw2analyzer as ba
   import toy_bakery  # noqa

   bread = bd.get_node(database="toy-bakery-db", name="bread production")
   method = ("toy method", "climate change", "GWP100")
   fu, objs, _ = bd.prepare_lca_inputs({bread: 1}, method=method)
   lca = bc.LCA(demand=fu, data_objs=objs)
   lca.lci()
   lca.lcia()
   ```

2. Rank the processes.

   ```python
   ca = ba.ContributionAnalysis()
   ca.annotated_top_processes(lca)
   ```

3. Rank the elementary flows.

   ```python
   ca.annotated_top_emissions(lca)
   ```

4. Print the supply chain with each branch's share of the score.

   ```python
   ba.print_recursive_calculation(bread, method)
   ```

5. Print it without scores, when you only want to see the structure.

   ```python
   ba.print_recursive_supply_chain(bread)
   ```

6. Compare two activities by where their impact comes from.

   ```python
   flour = bd.get_node(database="toy-bakery-db", name="flour production")
   ba.compare_activities_by_grouped_leaves([bread, flour], method)
   ```

## Expected output

- `annotated_top_processes` returns a list of `(score, supply amount, node)` tuples,
  largest first. On the toy bakery: flour production at 0.28 with a supply of 0.7, heat
  at 0.0846 with a supply of 1.41, bread itself at 0.05 with a supply of 1. They sum to
  the score, 0.4146.
- `annotated_top_emissions` returns `(score, inventory amount, flow)` tuples. With one
  elementary flow there is one row, carrying the whole score.
- `print_recursive_calculation` prints a header
  `Fraction of score | Absolute score | Amount | Activity` and then an indented tree:
  bread at 1.0 of the score, flour below it at 0.706, heat below flour at 0.0304, and
  heat directly under bread at 0.174.
- `print_recursive_supply_chain` prints the same tree with amounts only: `1:` bread,
  `0.7:` flour, `0.21:` heat under flour, `1.2:` heat under bread.
- `compare_activities_by_grouped_leaves` returns a two-tuple: a list of column labels
  (`activity`, `product`, `location`, `unit`, `total`, `direct emissions`, then one per
  group found) and a list of rows. In the toy system the last group label is `None`,
  because the toy nodes carry no classification to group by.

## Pitfalls

- **The cutoff hides branches by default.** `print_recursive_calculation` defaults to
  `max_level=3` and `cutoff=0.01`, so a long supply chain looks shorter than it is.
  Raise both before concluding nothing deep matters. See [../gotchas.md](../gotchas.md).
- **The `lca` must already be solved.** `lci()` and `lcia()` first.
- **Annotation needs the project that produced the calculation.** Switching project
  between calculating and analysing produces wrong or missing names.
- **`traverse_tagged_databases` traverses the foreground only.** A tag on a background
  process will not be found.
- **This is the least maintained core package.** 0.11.8 dates from 2023 and the
  repository has been quiet since (source: pypi-bw2analyzer). It works against the 2.5
  stack; do not expect fixes quickly.
- **Graph traversal moved.** The docstrings still point at `bw2calc.GraphTraversal`,
  which no longer exists; in the 2.5 line traversal is
  [../../bw_graph_tools/use-cases/traverse-a-supply-chain-graph.md](../../bw_graph_tools/use-cases/traverse-a-supply-chain-graph.md).
- **A contribution analysis is not an allocation.** It attributes a computed score to
  parts of a system; it does not decide how a multifunctional process should be split.

## Related vocabulary

- [Direct emissions](../../../../vocabulary.md#direct-emissions)
- [Foreground](../../../../vocabulary.md#foreground)
- [Background](../../../../vocabulary.md#background)
- [Inventory](../../../../vocabulary.md#inventory)
- [LCIA results](../../../../vocabulary.md#lcia-results)
- [Elementary flow](../../../../vocabulary.md#elementary-flow)
- [Relevant](../../../../vocabulary.md#relevant)
- [System boundary](../../../../vocabulary.md#system-boundary)
- [Impact category](../../../../vocabulary.md#impact-category)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`bw2data` 4.7, `bw2calc` 2.5.0, `bw2io` 0.9.17, `bw2analyzer` 0.11.8,
`BRIGHTWAY2_DIR` pointed at a fresh temporary directory, Linux x86-64. Every ranking,
tree and column label above is what the run printed. Duration, including building the
toy project and installing `matplotlib` as a dependency: about 10 seconds.
