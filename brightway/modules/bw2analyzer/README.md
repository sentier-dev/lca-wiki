---
title: bw2analyzer
type: module
summary: "Contribution and hotspot analysis over a finished calculation."
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-bw2analyzer, bw2analyzer-docs, brightway-ecosystem, brightway-cheatsheet]
related: [layout.md, classes.md, commands.md, datasets.md, gotchas.md, status.md]
---

# bw2analyzer

`bw2analyzer` answers the question that follows a score: where does it come from. Its
README calls it a set of tools to analyse the results of LCA calculations
(source: bw2analyzer-docs), and the ecosystem page files it under visualisation
(source: brightway-ecosystem). The cheat sheet imports it as `ba` alongside the other
three core libraries (source: brightway-cheatsheet).

In practice it does three things: it ranks the processes and elementary flows behind a
score, it walks and prints the supply chain, and it compares several activities to each
other.

**Version documented:** 0.11.8 · **obtained from:** the PyPI JSON API for the newest
release, and `bw2analyzer.__version__` after installing 0.11.8 into a throwaway
environment, where it is the tuple `(0, 11, 8)` rather than a string · **as of:**
2026-09-21

## Install

```bash
pip install bw2analyzer==0.11.8
```

It pulls in `matplotlib`, `pandas`, `tabulate`, `tqdm` and `requests` besides the
Brightway stack (source: pypi-bw2analyzer).

## What it does

- **Ranks contributions.** `ContributionAnalysis` gives the top processes and the top
  elementary flows of a solved `LCA`, annotated with names.
- **Prints a supply chain.** `print_recursive_calculation` walks the graph from an
  activity and prints each branch with its share of the total score;
  `print_recursive_supply_chain` does the same without scores.
- **Compares activities.** `compare_activities_by_lcia_score` says whether a set of
  activities differ substantially; `compare_activities_by_grouped_leaves` explains where
  their impacts come from, grouped by the classification of their inputs.
- **Groups by tag.** `traverse_tagged_databases` sums impact by a label you put on nodes,
  which is how a study reports by life cycle stage.
- **Checks a database.** `DatabaseHealthCheck` looks for aggregated processes,
  multi-output processes, missing self-production, duplicate exchanges and odd
  uncertainty.

## Datasets

`bw2analyzer` ships no data. Walking the installed 0.11.8 on 2026-09-21 found twelve
Python modules and nothing else. Everything it reads is a solved `LCA` object or a
database in the active project. See [datasets.md](datasets.md).

## Pages

- [layout.md](layout.md): the package tree, one line per module
- [classes.md](classes.md): the analysis classes and functions
- [commands.md](commands.md): the calls you actually type
- [datasets.md](datasets.md): why there is no data here
- [gotchas.md](gotchas.md): what surprises people, including its age
- [status.md](status.md): release cadence, maintainers, open work
- [api/](api/README.md): the generated API reference, one file per submodule, stamped
  with version and date
- [use-cases/](use-cases/): end-to-end things a practitioner does with it

## API reference

[api/README.md](api/README.md) indexes a generated API reference for `bw2analyzer`
0.11.8: 13 markdown files, one per public submodule, each stamped with the package
version, the date and the command that produced it. It was produced by running
pydoc-markdown 4.8.2 by hand on 2026-09-22 in a throwaway environment, and nothing in
the repository regenerates it. Signatures and docstrings live there; the names worth
knowing first are in [classes.md](classes.md).
