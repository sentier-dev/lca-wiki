---
title: brightway roadmap
type: roadmap
summary: What is missing in the Brightway branch and where a contributor can help.
audience: [P2, P3]
updated: 2026-09-22
sources: [brightway-lca-org]
related: [README.md, packages.md, commands.md, modules/README.md]
---

# brightway roadmap

Where this branch stands and where help is welcome. Items move off this list by being
written, not by being ticked: when the page exists and its links and sources check out,
delete the item.

## Status

The branch pages are written: [README.md](README.md), [packages.md](packages.md),
[commands.md](commands.md), this branch's contexts in
[../vocabulary.md](../vocabulary.md), and [modules/README.md](modules/README.md). All
fifteen module folders of [packages.md](packages.md) are filled against the versions
pinned there and checked on 2026-09-21, each with a layout, classes, commands, datasets,
gotchas and status page, a generated `api/` folder and at least one use case.

## Done: API references

Every module has an `api/` folder: an API reference generated with pydoc-markdown 4.8.2
on 2026-09-22, one file per submodule, stamped with the package version, the date and the
command used. Regenerate a folder after a package release by rerunning the command in its
`api/README.md`.

## Done: use cases

Every module has at least one use case: 22 pages in all, 16 of them `verified: yes` from
a run recorded with its environment and its duration. The six that stay `verified: no`
say why on the page, and each of those reasons is an open item:

- **A licensed ecoinvent copy.** Three pages need one and none was available:
  [modules/bw2io/use-cases/import-ecospold2.md](modules/bw2io/use-cases/import-ecospold2.md),
  [modules/bw_timex/use-cases/run-the-electric-vehicle-example.md](modules/bw_timex/use-cases/run-the-electric-vehicle-example.md),
  whose example looks up four specific ecoinvent market activities and has no licence-free
  substitute, and
  [modules/ecoinvent_interface/use-cases/list-releases-and-download.md](modules/ecoinvent_interface/use-cases/list-releases-and-download.md).
- **A desktop session.** The two Activity Browser pages need a display, not a terminal.
- **A Brightway 2 project to migrate.**
  [modules/bw2data/use-cases/migrate-a-brightway-2-4-project.md](modules/bw2data/use-cases/migrate-a-brightway-2-4-project.md)
  needs a real 2.4 project, which this wiki does not have.

A contributor with any of the three can turn a page from `no` to `yes` without writing
anything new.

## Owed: gaps inside the written pages

- **Datapackage policies.** `bw_processing` documents policies that decide how two
  resource groups writing to one matrix interact. Neither the wiki nor upstream explains
  them properly.
- **The revision layer in `bw2data`.** `revisions.py` and `signals.py` are the newest part
  of the 4.x line and are documented nowhere; describing them means reading the source.
- **`bw2io` exporters.** Documented upstream far less than the importers, and this wiki
  reflects that imbalance.
- **A comparison of `bw2analyzer` and `bw_graph_tools`.** Traversal moved between them and
  no page says which to use when.
- **The `strategies/sentier/` subpackage of `bw2io`**, which connects to
  [../sentier/](../sentier/) and is not described on either side.
- **No module page for `premise`.** It is absent from [packages.md](packages.md) and has
  no folder under [modules/](modules/), yet three `bw_timex` pages already depend on it:
  [modules/bw_timex/commands.md](modules/bw_timex/commands.md) installs it as the
  `bw_timex[premise]` extra to build prospective databases,
  [modules/bw_timex/classes.md](modules/bw_timex/classes.md) carries its `premise_key`
  argument, and [modules/bw_timex/gotchas.md](modules/bw_timex/gotchas.md) records that
  the extra pins numpy below 2 and drags a working environment back to the 1.x line. A
  reader following the time-explicit route meets three things this wiki does not explain:
  what a database vintage is, where the decryption key comes from, and why the numpy
  constraint exists. A module folder written like the others would close all three.

## Where a contributor can help upstream

Open issue counts on the `brightway-lca` GitHub organisation, read on 2026-09-21
(source: brightway-lca-org):

| Repository | Open issues | Last push |
|---|---|---|
| [brightway2-io](https://github.com/brightway-lca/brightway2-io/issues) | 97 | 2026-07-20 |
| [brightway2-data](https://github.com/brightway-lca/brightway2-data/issues) | 37 | 2026-06-27 |
| [brightway2-analyzer](https://github.com/brightway-lca/brightway2-analyzer/issues) | 19 | 2023-12-15 |
| [bw_processing](https://github.com/brightway-lca/bw_processing/issues) | 14 | 2026-08-08 |
| [brightway2-calc](https://github.com/brightway-lca/brightway2-calc/issues) | 12 | 2026-08-05 |
| [brightway-documentation](https://github.com/brightway-lca/brightway-documentation/issues) | 15 | 2026-08-05 |
| [brightway2-parameters](https://github.com/brightway-lca/brightway2-parameters/issues) | 4 | 2025-02-19 |
| [matrix_utils](https://github.com/brightway-lca/matrix_utils/issues) | 3 | 2026-08-08 |

Contained pieces of upstream work that this wiki found while writing these pages:

- the PyPI summary of `bw2parameters` is boilerplate left from a project template, and its
  repository still carries a `brightwaylca.org` link;
- `bw2analyzer` docstrings point at `bw2calc.GraphTraversal`, which the 2.5 line moved to
  `bw_graph_tools`, and its packaging metadata still names a Bitbucket home page;
- `flowmapper` 0.4 ships a command line that cannot run: `flowmapper map` exits with
  `TypeError: flowmapper() missing 5 required positional arguments`, so the library is
  the only working entry point. See
  [modules/flowmapper/commands.md](modules/flowmapper/commands.md) and
  [modules/flowmapper/use-cases/map-two-flow-lists.md](modules/flowmapper/use-cases/map-two-flow-lists.md);
- `pypardiso` 0.4.7 cannot be loaded in an ephemeral `uv run --with` environment on
  Linux: MKL is not where it looks and the import raises
  `ImportError: Shared library mkl_rt not found`, so `bw2calc` silently falls back to
  SciPy. A packaging fix, or a documented `PYPARDISO_MKL_RT`, would close it. See
  [modules/pypardiso/use-cases/solve-with-pardiso-in-bw2calc.md](modules/pypardiso/use-cases/solve-with-pardiso-in-bw2calc.md);
- `bw2io` ships no SimaPro fixture, so the SimaPro importer cannot be exercised from the
  distribution alone. A small licence-free CSV in the test data would make the path
  testable. See
  [modules/bw2io/use-cases/import-a-simapro-csv.md](modules/bw2io/use-cases/import-a-simapro-csv.md);
- `randonneur` 0.7.2 defaults `edges_label` to `edges`, while most Brightway and SimaPro
  data calls them `exchanges`, so a migration silently changes nothing until the argument
  is set. A default that follows the data, or a warning on zero matches, would help. See
  [modules/randonneur/gotchas.md](modules/randonneur/gotchas.md);
- `ecoinvent_interface` 3.1 has no call that returns release metadata without logging in,
  so even listing which releases exist needs a licence. A public catalogue endpoint would
  let an unlicensed reader check compatibility. See
  [modules/ecoinvent_interface/use-cases/list-releases-and-download.md](modules/ecoinvent_interface/use-cases/list-releases-and-download.md).

Documentation is the best place for a newcomer: the documentation repository takes pull
requests for the glossary, the cheat sheet and the ecosystem list, which are the three
pages this branch leans on hardest.

## How to pick something up

Read [../CONTRIBUTING.md](../CONTRIBUTING.md), claim the item in a pull request
description so two people do not write the same page, and keep the change small: one
page, its sources and its line in `index.md` make a good pull request.
