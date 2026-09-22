---
title: brightway
type: branch
summary: "The Brightway branch: the open-source LCA framework and its ecosystem packages."
audience: [P1, P2, P3]
updated: 2026-09-21
sources: [brightway-docs, brightway-ecosystem, brightway-faq-versions, brightway-installation, brightway-glossary]
related: [packages.md, commands.md, modules/README.md, ../vocabulary.md, roadmap.md]
---

# brightway

Brightway is an open-source software package for life cycle assessment, written in
Python, published by the `brightway-lca` GitHub organisation. The documentation
describes it as designed to work with large datasets and to run LCA calculations
quickly, with the emphasis on flexibility and performance rather than on a fixed
workflow (source: brightway-docs).

Brightway is not one library. It is a set of small packages that each own one job, plus
an ecosystem of community packages built on top of them (source: brightway-ecosystem).
This branch documents one package per folder under [modules/](modules/).

## Generations: 2, 2.5, and what the version numbers mean

The Brightway documentation distinguishes three generations (source:
brightway-faq-versions):

- **Brightway 1**, the original code from Chris Mutel's doctoral research, no longer
  available for download.
- **Brightway 2** (`brightway2`), a complete rewrite and, for years, the most widely
  used version.
- **Brightway 2.5** (`brightway25`), the current stable generation. It adds a separate
  processed-data library (`bw_processing`) and splits matrix construction out of the
  calculation library into `matrix_utils`.

The two generations are meta-packages that pin different versions of the same package
names. The documentation gives the boundary as `bw2data < 3.99` against `>= 4.0`,
`bw2calc < 1.8.1` against `>= 2.0`, `bw2io < 0.8.9` against `>= 0.9`, and
`bw2analyzer < 0.10.99` against `>= 0.11.1` (source: brightway-faq-versions). Every page
in this branch documents the 2.5 line. Where a page says "bw2data 4.x" it is saying
"the 2.5 generation", not "a minor upgrade of the 3.x line".

Installing the 2.5 generation is `pip install brightway25 pypardiso` on x64, or
`pip install brightway25 scikit-umfpack` on Apple Silicon, inside a virtual environment;
`conda`/`mamba` recipes exist on the `conda-forge` and `cmutel` channels. The
meta-package `brightway25` provides no functionality of its own and should not be
imported (source: brightway-installation).

## How the packages fit together

Read the stack bottom-up; each layer only knows about the one below it.

| Layer | Package | What it owns |
|---|---|---|
| data | [bw2data](modules/bw2data/) | projects, databases, nodes, edges, impact categories, parameters, search |
| processing | [bw_processing](modules/bw_processing/) | the on-disk datapackage: numeric arrays plus metadata |
| matrices | [matrix_utils](modules/matrix_utils/) | turning datapackages into sparse matrices, and rebuilding them |
| calculation | [bw2calc](modules/bw2calc/) | solving the linear system, LCIA, normalisation, weighting, Monte Carlo |
| input/output | [bw2io](modules/bw2io/) | extracting foreign formats, linking them, writing databases |
| analysis | [bw2analyzer](modules/bw2analyzer/) | contribution analysis and supply-chain inspection of a result |
| parameters | [bw2parameters](modules/bw2parameters/) | formulas, parameter sets and their evaluation order |

The data layer writes datapackages; the matrix layer reads them; the calculation layer
asks the matrix layer for matrices and never touches SQLite. That separation is what the
2.5 generation is for (source: brightway-faq-versions). The split also means a
calculation can run from datapackages alone, with no project on disk.

Around this core sit the ecosystem packages, documented in the same way: data migration
([randonneur](modules/randonneur/)), elementary flow matching
([flowmapper](modules/flowmapper/)), licensed database access
([ecoinvent_interface](modules/ecoinvent_interface/)), graph traversal
([bw_graph_tools](modules/bw_graph_tools/)), time-explicit and dynamic LCA
([bw_timex](modules/bw_timex/), [bw_temporalis](modules/bw_temporalis/)), a desktop
interface ([activity-browser](modules/activity-browser/)) and a fast sparse solver
([pypardiso](modules/pypardiso/)). The full landscape, with versions and licences, is in
[packages.md](packages.md) (source: brightway-ecosystem).

## Read paths

**P1, a practitioner who wants a number out.** Start at [packages.md](packages.md) to see
which package does what, then [commands.md](commands.md) for the calls that create a
project, import data, run an LCA and read the result. From there go to
[modules/bw2data/](modules/bw2data/) for how data is stored and
[modules/bw2calc/](modules/bw2calc/) for what `lci()`, `lcia()` and `score` mean. When a
term reads oddly, check [../vocabulary.md](../vocabulary.md): Brightway uses
several ILCD words in its own sense.

**P2, a contributor.** Read [modules/README.md](modules/README.md) for the shape of a
module folder, then the `layout.md` and `classes.md` of the package you want to change,
then its `status.md` for release cadence and maintainers. [roadmap.md](roadmap.md) lists
what this branch still owes and where the upstream issue trackers want help.

**P3, a wiki developer.** [modules/README.md](modules/README.md) says how a module folder
is generated and named; each module `README.md` records the version documented and how it
was obtained, which is what a refresh pass has to re-check.

## What belongs here

| Path | What it holds |
|---|---|
| [modules/](modules/) | one folder per Brightway package |
| [packages.md](packages.md) | the landscape table: package, version, descriptor, base classes, licence |
| [commands.md](commands.md) | the runnable commands and one-line Python entry points |
| [../vocabulary.md](../vocabulary.md) | terms whose Brightway meaning differs from the ILCD one, and Brightway-only terms |
| [roadmap.md](roadmap.md) | what is missing in this branch and where a contributor can help |

## What does not belong here

LCA methodology, which belongs in [../core/](../core/), and the data a Brightway project
is filled with, which belongs to the branch of the database it came from:
[../ecoinvent/](../ecoinvent/), [../bafu/](../bafu/), [../sentier/](../sentier/).

## Naming rule

One folder per package under [modules/](modules/), named exactly as the package is
imported or installed upstream: `bw2data`, `bw_processing`, `activity-browser`.

## How to add here

1. Register the package's documentation and its PyPI entry in [../sources.md](../sources.md).
2. Copy [../templates/pages/module-codebase/](../templates/pages/module-codebase/) into
   `modules/<name>/` and fill it.
3. Add its terms to [../vocabulary.md](../vocabulary.md), one bullet per context.
4. Add every page you created to `index.md`, add your terms to `vocabulary.md`, check
   by hand that your links resolve, and append one line to
   [../log.md](../log.md).
