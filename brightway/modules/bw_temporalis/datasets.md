---
title: bw_temporalis datasets
type: module-page
summary: bw_temporalis ships no data files, only two characterisation functions.
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-bw-temporalis, bw-temporalis-repo]
---

# bw_temporalis datasets

## None shipped

bw_temporalis 1.2.0 ships no data files. The installed wheel contains Python modules
only, checked by listing the installed package (source: pypi-bw-temporalis). There is
no bundled database, no flow list, no nomenclature and no impact assessment method in
the Brightway sense.

## Characterisation functions, not factors

The `lcia` subpackage ships two callables rather than a table:

| Function | What it returns |
|---|---|
| `characterize_co2(series, period=100, cumulative=False)` | the marginal or cumulative radiative forcing from carbon dioxide, per year of the period |
| `characterize_methane(series, period=100, cumulative=False)` | the same for methane |

- **Version:** ships with bw_temporalis 1.2.0 (2025-07-14).
- **Provenance:** written by the package maintainers; the coefficients live in the
  source of `lcia/climate.py` rather than in a data file
  (source: pypi-bw-temporalis).
- **Licence:** the package licence, BSD 3-Clause (source: bw-temporalis-repo).
- **Sectors:** none. These are substance-level climate functions, not sector data.
- **Schema:** each takes a pandas series of dated amounts and returns a dataframe over
  the period, so a timeline can be characterised column by column.
- **Vocabulary:** the two substances are identified by the caller, not by a bundled
  flow list. Which biosphere flow counts as carbon dioxide is your decision, which is
  why a downstream package such as `bw_timex` keeps an explicit map from flows to
  characterisation functions. See [../bw_timex/datasets.md](../bw_timex/datasets.md).

Why functions and not factors: a factor is one number for a substance, a function is
the response over time after an emission at a given date. Two emissions of the same
substance at different dates give different answers, which is the entire point of a
temporal inventory.

## What it reads

| Input | Where it comes from |
|---|---|
| a solved `LCA` object | `bw2calc` |
| a graph traversal class | `bw_graph_tools`, defaulting to the new-node-each-visit traversal |
| temporal distributions on exchanges | your own database, stored as exchange attributes |

## What it writes

Nothing on disk. A run produces a `Timeline` in memory, which becomes a dataframe when
you ask for one.

Temporal distributions attached to exchanges are stored inside the Brightway database
like any other exchange attribute. `loader_registry` maps a serialised type name back
to the loader that rebuilds the object, which is what makes the round trip work.

- **Source branch:** not applicable; there is no bundled source database.
