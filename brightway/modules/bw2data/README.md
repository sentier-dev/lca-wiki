---
title: bw2data
type: module
summary: "Brightway's data layer: projects, databases, nodes, edges and their metadata."
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-bw2data, bw2data-docs, brightway-glossary, brightway-cheatsheet, brightway-faq-versions, pypi-bw2io]
related: [layout.md, classes.md, commands.md, datasets.md, gotchas.md, status.md]
---

# bw2data

`bw2data` is where a Brightway study lives. It owns the project, the databases inside it,
the nodes and edges of the inventory graph, the impact categories, the parameters and the
search index, and it writes all of that out as datapackages for the calculation layer to
read. Its own summary is "tools for the management of inventory databases and impact
assessment methods" (source: pypi-bw2data).

It is the package you import first and the one whose vocabulary the rest of the framework
inherits: project, database, node, edge, method (source: brightway-glossary).

**Version documented:** 4.7 · **obtained from:** the PyPI JSON API for the newest release,
and `importlib.metadata` plus `bw2data.__version__` in a local virtual environment that
has 4.7 installed · **as of:** 2026-09-21

Version 4.0 and higher are the Brightway 2.5 line and are not compatible with Brightway 2
(source: bw2data-docs, brightway-faq-versions).

## Install

```bash
pip install bw2data==4.7
```

Usually you get it as a dependency of `brightway25` or `bw2io` rather than on its own
(source: pypi-bw2io).

## What it does

- **Keeps projects apart.** `bd.projects` switches, copies, renames and deletes them; each
  is a directory with its own SQLite file and datapackages. See [commands.md](commands.md).
- **Stores the graph.** `Database`, `Node`, `Edge` and the backends behind them are in
  [classes.md](classes.md).
- **Stores impact assessment data.** `Method`, `Normalization`, `Weighting` and their
  registries, also in [classes.md](classes.md).
- **Processes data for calculation.** `.process()` on any store writes the datapackage the
  matrix layer reads; `prepare_lca_inputs` and `get_multilca_data_objs` collect the
  datapackages a calculation needs.
- **Parameterises amounts**, through `bw2parameters`; see
  [../bw2parameters/](../bw2parameters/).

## Datasets

`bw2data` ships no inventory data, no elementary flow list and no impact assessment
method. Installing it gives you an empty data directory and nothing else; the starter data
comes from `bw2io`, which downloads prepared project archives, and from whatever database
you import (source: brightway-cheatsheet). What `bw2data` does create on disk is the
project directory itself: a SQLite database, a directory of datapackages and a logs
directory, in a platform-specific location. See [datasets.md](datasets.md).

## Pages

- [layout.md](layout.md): the package tree, one line per module
- [classes.md](classes.md): public classes and functions, and what invokes them
- [commands.md](commands.md): the calls you actually type
- [datasets.md](datasets.md): what it writes to disk, and what it does not ship
- [gotchas.md](gotchas.md): what surprises people
- [status.md](status.md): release cadence, maintainers, what is missing
- [api/](api/README.md): the generated API reference, one file per submodule, stamped
  with version and date
- [use-cases/](use-cases/): end-to-end things a practitioner does with it

## API reference

[api/README.md](api/README.md) indexes a generated API reference for `bw2data` 4.7: 41
markdown files, one per public submodule, each stamped with the package version, the
date and the command that produced it. It was produced by running pydoc-markdown 4.8.2
by hand on 2026-09-22 in a throwaway environment, and nothing in the repository
regenerates it. Signatures and docstrings live there; the names worth knowing first are
in [classes.md](classes.md).
