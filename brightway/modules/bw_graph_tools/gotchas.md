---
title: bw_graph_tools gotchas
type: module-page
summary: "What surprises people about bw_graph_tools: repeated nodes, cutoffs and caps."
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-bw-graph-tools, bw-graph-tools-repo, bw-graph-tools-docs, pypi-bw-timex]
---

# bw_graph_tools gotchas

- **The same activity appears many times, on purpose.** The default class is
  `NewNodeEachVisitGraphTraversal`: each visit is its own `Node` record with its own
  `unique_id`. Summing a column over `nodes` and expecting one row per activity gives
  the wrong answer. Use the same-node variant when you want one record per activity
  (source: pypi-bw-graph-tools).
- **`unique_id` is not a database id.** `Node` carries both: `unique_id` identifies the
  visit, `activity_datapackage_id` identifies the activity. `Edge` records join
  `unique_id` values, so joining on the database id mixes visits together
  (source: pypi-bw-graph-tools).
- **A result is meaningless without its settings.** `cutoff`, `biosphere_cutoff`,
  `max_calc`, `max_depth` and `min_coverage_fraction` all change what the traversal
  saw. Record the settings object beside the result.
- **`max_calc` is a hard cap and silence is not success.** The traversal stops when the
  cap is reached; `exceeded_calculation_count` is how you find out. An unchecked run
  that hit the cap looks like a complete result with a suspiciously small tail
  (source: pypi-bw-graph-tools).
- **Traversal is slow compared with solving.** The matrix solution answers everything at
  once and handles cycles; traversal exists for the things it cannot express, such as
  distinguishing paths and convolving temporal distributions
  (source: bw-graph-tools-repo).
- **The graph is cyclic even though the result looks like a tree.** Each visit is
  treated as a new node, which is what makes a cyclic graph presentable as a tree; it
  does not mean the underlying system is acyclic (source: pypi-bw-graph-tools).
- **`guess_production_exchanges` is a guess.** Six numbered heuristics are tried in
  order against the datapackage. Check the result on a database you know before
  trusting it on one you do not (source: pypi-bw-graph-tools).
- **`separate_biosphere_flows` changes where the score sits.** With it on, flows above
  the biosphere cutoff are recorded separately and the node fields ending in
  `outside_specific_flows` hold the remainder. Adding the two together twice is the
  easy mistake (source: pypi-bw-graph-tools).
- **The documentation URL redirects.** The README badge points at a Read the Docs
  address which redirects to the Brightway documentation site under the project name
  `graphtools`, one word (source: bw-graph-tools-docs).
- **Pin it with its dependants.** `bw_temporalis` and `bw_timex` subclass the traversal
  machinery, so a bw_graph_tools upgrade can change their behaviour. bw_timex 1.4.0
  requires bw_graph_tools 0.9 or newer (source: pypi-bw-timex).
