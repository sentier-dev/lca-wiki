---
title: bw2io
type: module
summary: "Importers, exporters and the strategies that link external data into Brightway."
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-bw2io, bw2io-docs, brightway-cheatsheet, brightway-ecosystem]
related: [layout.md, classes.md, commands.md, datasets.md, gotchas.md, status.md]
---

# bw2io

`bw2io` is the extract, transform and load library of the Brightway framework
(source: brightway-ecosystem). Its README describes the workflow it imposes: data is
first *extracted* into a common format, then a series of *strategies* identifies each
dataset and links it internally and to the biosphere, then further strategies link it to
background databases, and only at the end is the result written to a database
(source: bw2io-docs).

The benefit of doing it in that order is that the number of unlinked edges is visible at
every step, strategies can be applied one at a time, and intermediate results can be kept
(source: bw2io-docs). It is also the package that fetches starter projects, so in
practice it is the first thing a new user runs.

**Version documented:** 0.9.17 · **obtained from:** the PyPI JSON API for the newest
release, and `bw2io.__version__` after installing 0.9.17 into a throwaway environment ·
**as of:** 2026-09-21

## Install

```bash
pip install bw2io==0.9.17
```

Installing it pulls in most of the stack: `bw2data >= 4.6.2`, `bw2calc >= 2.0`,
`bw2parameters >= 1.1.0`, `bw_processing >= 1.0`, `bw_migrations >= 0.2`,
`randonneur >= 0.6`, `randonneur_data >= 0.5.4` and `pyecospold`, among others
(source: pypi-bw2io). The SimaPro block CSV importer needs the `multifunctional` extra;
without it, importing `bw2io` prints a warning saying that importer is unavailable
(observed on 0.9.17).

## What it does

- **Starts a project with usable data:** `bi.remote.install_project('<tag>', '<name>')`
  downloads a prepared archive of elementary flows and impact categories. See
  [datasets.md](datasets.md).
- **Imports foreign formats:** ecospold 1 and 2, SimaPro CSV, Excel and CSV, JSON-LD,
  EXIOBASE, US LCI. See [classes.md](classes.md).
- **Links what it imported:** 108 named strategies plus `randonneur` transformations. See
  [commands.md](commands.md).
- **Backs projects up and restores them:** `backup_project_directory`,
  `restore_project_directory`.
- **Exports:** Excel, CSV, ecospold 1, Gephi graphs, Matlab matrices.

## Datasets

`bw2io` is the only core package that ships data. Its `data/` directory holds migration
tables between ecoinvent and SimaPro nomenclatures, elementary flow lists, geography
tables, a bundled set of impact assessment methods (`lcia/lcia_39_ecoinvent.zip`) and two
small example workbooks. On top of that it fetches whole prepared projects from
`https://files.brightway.dev/`: in 0.9.17 the 2.5 catalogue is
`ecoinvent-3.8-biosphere`, `ecoinvent-3.9.1-biosphere`, `USEEIO-1.1` and `forwast`
(read from `bw2io.remote.PROJECTS_BW25` in the installed 0.9.17). Names, counts and file
sizes only are recorded in this wiki; see [datasets.md](datasets.md) and the licensing
note there.

## Pages

- [layout.md](layout.md): the package tree, one line per module
- [classes.md](classes.md): importers, exporters and the strategy families
- [commands.md](commands.md): the calls that make up an import
- [datasets.md](datasets.md): what it ships and what it downloads
- [gotchas.md](gotchas.md): what surprises people
- [status.md](status.md): release cadence, maintainers, open work
- [api/](api/README.md): the generated API reference, one file per submodule, stamped
  with version and date
- [use-cases/](use-cases/): end-to-end things a practitioner does with it

## API reference

[api/README.md](api/README.md) indexes a generated API reference for `bw2io` 0.9.17: 68
markdown files, one per public submodule, each stamped with the package version, the
date and the command that produced it. It was produced by running pydoc-markdown 4.8.2
by hand on 2026-09-22 in a throwaway environment, and nothing in the repository
regenerates it. Signatures and docstrings live there; the names worth knowing first are
in [classes.md](classes.md).
