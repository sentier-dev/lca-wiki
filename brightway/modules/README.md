---
title: brightway/modules
type: readme
summary: One folder per Brightway package, each following the codebase template.
audience: [P1, P2, P3]
updated: 2026-09-22
sources: []
---

# brightway/modules

A module is one thing a practitioner installs, reads or connects to. Each folder here
documents one Brightway package. Fifteen packages have a folder; the landscape table with
versions and licences is [../packages.md](../packages.md).

## The modules

### Core libraries

| Folder | What the package is for |
|---|---|
| [bw2data/](bw2data/) | projects, databases, nodes, edges, impact categories, parameters, search |
| [bw2calc/](bw2calc/) | matrices and the linear solve: inventory, score, Monte Carlo |
| [bw2io/](bw2io/) | importing foreign formats, linking them, writing databases |
| [bw2analyzer/](bw2analyzer/) | reading a finished result: contributions, hotspots, comparisons |

### Supporting libraries

| Folder | What the package is for |
|---|---|
| [bw_processing/](bw_processing/) | the datapackage format calculations read |
| [matrix_utils/](matrix_utils/) | building and rebuilding sparse matrices from datapackages |
| [bw2parameters/](bw2parameters/) | formulas, parameter sets and their evaluation order |
| [bw_graph_tools/](bw_graph_tools/) | graph traversal over a solved system |
| [randonneur/](randonneur/) | reusable, declarative data migrations |
| [flowmapper/](flowmapper/) | matching elementary flow lists between nomenclatures |
| [ecoinvent_interface/](ecoinvent_interface/) | authenticated access to ecoinvent for licensed users |

### Community projects

| Folder | What the package is for |
|---|---|
| [bw_timex/](bw_timex/) | time-explicit LCA across databases of different vintages |
| [bw_temporalis/](bw_temporalis/) | temporal distributions and dynamic characterisation |
| [activity-browser/](activity-browser/) | the desktop interface onto a Brightway project |
| [pypardiso/](pypardiso/) | the fast sparse solver Brightway uses when it is installed |

## What belongs here

One folder per public Brightway package. A filled module folder holds `README.md`
(purpose, install, the version documented and how it was obtained, a Datasets section),
`layout.md`, `classes.md`, `commands.md`, `datasets.md`, `gotchas.md`, `status.md`, the
generated `api/` folder and `use-cases/`.

Every folder here has its `api/` folder, generated with pydoc-markdown 4.8.2 on
2026-09-22. Each one carries the exact command that produced it, so a folder is
regenerated after a package release by rerunning that command; see
[../roadmap.md](../roadmap.md).

## What does not belong here

The databases a Brightway project is filled with: those belong to the branch of the
database they came from. Forks and private wrappers are out of scope.

## Naming rule

The upstream package name, unchanged: `bw2data`, `bw_processing`, `activity-browser`. No
version in the folder name; the version lives in the module README, together with how it
was obtained.

## How to add here

1. Copy [../../templates/pages/module-codebase/](../../templates/pages/module-codebase/)
   to `<name>/`.
2. Record the version you documented and how you obtained it, at the top of `README.md`.
3. If the module owes an API reference, run pydoc-markdown by hand into
   `brightway/modules/<name>/api/`, one file per submodule, each stamped with the package,
   the version, the date and the command that produced it. Copy the command from a
   sibling module's `api/README.md` and change the module name. No script does this.
4. Add every page you created to `index.md`, check by hand that your links resolve, and append one line to [../../log.md](../../log.md).
