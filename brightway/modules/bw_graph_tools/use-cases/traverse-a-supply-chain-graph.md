---
title: Traverse a supply chain graph
type: use-case
summary: Walk the supply chain of a solved LCA with NewNodeEachVisitGraphTraversal, and read the nodes, edges and flows it records for each visit.
audience: [P1]
updated: 2026-09-22
sources: [pypi-bw-graph-tools, bw-graph-tools-repo, bw-graph-tools-docs, brightway-ecosystem]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with bw2data 4.7, bw2calc 2.5.0, bw2io 0.9.17 and bw_graph_tools 0.10, BRIGHTWAY2_DIR set to a temporary directory, Linux x86-64
related: [../commands.md, ../classes.md, ../gotchas.md, ../../bw2calc/use-cases/run-an-lca-and-read-the-score.md]
---

# Traverse a supply chain graph

**Persona:** P1 practitioner who needs the score as a tree rather than a ranking, for a
diagram or a hotspot story · **GICS sector:** any

## Goal

A record of every visit the traversal made to every process, with each visit's supply
amount, its cumulative score and the emissions it caused directly. The matrix solution
answers "how much"; traversal answers "along which path".

## Prerequisites

- A solved `LCA`, as in
  [../../bw2calc/use-cases/run-an-lca-and-read-the-score.md](../../bw2calc/use-cases/run-an-lca-and-read-the-score.md).
- `bw_graph_tools` 0.10.
- Nothing licensed and no network access.

## Steps

1. Solve the calculation first. The traversal reads a solved object.

   ```python
   import bw2data as bd
   import bw2calc as bc
   import bw_graph_tools as bgt
   import toy_bakery  # noqa

   bread = bd.get_node(database="toy-bakery-db", name="bread production")
   fu, objs, _ = bd.prepare_lca_inputs(
       {bread: 1}, method=("toy method", "climate change", "GWP100")
   )
   lca = bc.LCA(demand=fu, data_objs=objs)
   lca.lci()
   lca.lcia()
   ```

2. Say what the traversal is allowed to do. Record this object beside the result: a
   traversal result is meaningless without its settings.

   ```python
   settings = bgt.GraphTraversalSettings(cutoff=0.001, max_calc=100)
   ```

3. Traverse.

   ```python
   gt = bgt.NewNodeEachVisitGraphTraversal(lca=lca, settings=settings)
   gt.traverse()
   ```

4. Read the counts.

   ```python
   gt.calculation_count
   len(gt.nodes), len(gt.edges), len(gt.flows)
   ```

5. Put names on the visits. `activity_datapackage_id` is the database id;
   `unique_id` identifies the visit.

   ```python
   names = {n.id: n["name"] for n in bd.Database("toy-bakery-db")}
   for uid, node in gt.nodes.items():
       label = names.get(node.activity_datapackage_id, "functional unit")
       print(uid, node.depth, label, node.supply_amount,
             node.cumulative_score, node.direct_emissions_score)
   ```

## Expected output

- `calculation_count` is 3, one solve per distinct activity reached.
- Five node records, four edges, four flows. Five, not three, because heat is visited
  twice: once as an input to bread and once as an input to flour.
- Node `-1` is the functional unit itself, at depth 0, with the whole score, 0.4146, and
  no direct emissions.
- Node `0` is bread at depth 1: supply 1, cumulative 0.4146, direct 0.05.
- Node `1` is flour at depth 2: supply 0.7, cumulative 0.2926, direct 0.28.
- Node `2` is heat at depth 2 under bread: supply 1.2, cumulative and direct both 0.072,
  `terminal=True`.
- Node `3` is heat again at depth 3 under flour: supply 0.21, cumulative and direct both
  0.0126.
- The two heat visits share one `activity_datapackage_id` and have different
  `unique_id`s. Their supplies sum to 1.41, the single figure the supply array reports.
- `Edge` records join `unique_id` values, not database ids. `Flow` records carry the
  score of one elementary flow at one visit.

## Pitfalls

- **The same activity appears many times, on purpose.** Summing a column over `nodes`
  and expecting one row per activity gives the wrong answer. Use the same-node variant
  when you want one record per activity. See [../gotchas.md](../gotchas.md).
- **`unique_id` is not a database id.** Joining edges on the database id mixes visits.
- **`NewNodeEachVisitGraphTraversal.calculate(lca, ...)` is deprecated** in 0.10 and
  warns: `Use NewNodeEachVisitGraphTraversal(lca, settings) instead`. The deprecated form
  returns a dictionary with `nodes`, `edges`, `flows` and `calculation_count`; the
  current form puts the same things on the instance.
- **`max_calc` is a hard cap and silence is not success.** Check
  `exceeded_calculation_count`; an unchecked run that hit the cap looks like a complete
  result with a small tail.
- **A result is meaningless without its settings.** `cutoff`, `biosphere_cutoff`,
  `max_calc`, `max_depth` and `min_coverage_fraction` all change what was seen.
- **Traversal is slow compared with solving.** Use it for what the matrix cannot express,
  not as a faster way to get a score.
- **The graph is cyclic even though the result looks like a tree.** Treating each visit
  as a new node is what makes it presentable as one.

## Related vocabulary

- [Node](../../../../vocabulary.md#node)
- [Edge](../../../../vocabulary.md#edge)
- [Direct emissions](../../../../vocabulary.md#direct-emissions)
- [Foreground](../../../../vocabulary.md#foreground)
- [Background](../../../../vocabulary.md#background)
- [Inventory](../../../../vocabulary.md#inventory)
- [System boundary](../../../../vocabulary.md#system-boundary)
- [Cut-off](../../../../vocabulary.md#cut-off)
- [Datapackage](../../../../vocabulary.md#datapackage)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`bw2data` 4.7, `bw2calc` 2.5.0, `bw2io` 0.9.17, `bw_graph_tools` 0.10,
`BRIGHTWAY2_DIR` pointed at a fresh temporary directory, Linux x86-64. Both the current
and the deprecated call forms were run; the deprecation warning quoted above is the one
0.10 emits. Every count and number under **Expected output** is what the run printed.
Duration, including building the toy project: about 4 seconds.
