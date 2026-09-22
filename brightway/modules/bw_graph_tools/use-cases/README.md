---
title: bw_graph_tools use cases
type: readme
summary: End-to-end things a practitioner does with bw_graph_tools.
audience: [P1]
updated: 2026-09-22
sources: []
---

# bw_graph_tools use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## What belongs here

Things a practitioner does end to end with bw_graph_tools: reading off where the impact
of a product sits along the supply chain, comparing two paths to the same activity, or
finding the route between a functional unit and something deep upstream.

## Pages here

- [Traverse a supply chain graph](traverse-a-supply-chain-graph.md) — Walk the supply chain of a solved LCA with NewNodeEachVisitGraphTraversal, and read the nodes, edges and flows it records for each visit. *(verified)*

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `find-where-the-impact-sits.md`, not `run-graph-traversal.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps in a clean environment and record `verified:` honestly, including the
   traversal settings used, since a result cannot be read without them.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
