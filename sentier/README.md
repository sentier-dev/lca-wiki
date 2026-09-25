---
title: sentier
type: branch
summary: "The Sentier platform branch: what it is, its modules, and how its data reaches Brightway."
audience: [P1, P2, P3]
updated: 2026-09-21
sources: [sentier-dev-repo, sentier-dev-adr-1, sentier-brightway-repo, sentier-importers-repo]
related: [platform.md, commands.md, modules/README.md]
---

# sentier

Sentier is the open data platform built by [Départ de Sentier](https://d-d-s.ch/), a
non-profit association: open life cycle inventory data, an open vocabulary, open mappings
between nomenclatures, and the loaders that put all of it into an LCA tool. The premise
written into the planning repository is that quantitative sustainability assessment needs
broad participation, so the code is free software and the product and project management
happen in the open as well. (source: sentier-dev-repo)

This branch documents the platform and each of its public modules. What runs today is
one import side, four data repositories and one loader; the calculation layer sketched in
the planning repository is a design, not a running service. The separation is drawn on
[platform.md](platform.md).

## The two layers

The platform is arranged along domain-driven design lines into an **Application Layer**
(importers, models, calculation) and a **Data Layer** (vocabulary, inventory, methods),
with third-party data sources feeding in and the **mappings** sitting underneath both.
(source: sentier-dev-repo)

```
external data  ->  importers  ->  vocabulary + inventory + methods  ->  loader  ->  an LCA tool
                                         mappings underneath
```

Each component is its own repository. That was decided explicitly: smaller repositories
are easier to maintain, let each component pick its own technology, keep onboarding and
documentation focused, and let an outside contributor own a repository rather than a
folder, at the price of more coordination between them. (source: sentier-dev-adr-1)

Two contracts hold the pieces together. The importers validate what they deliver against
the target repository's schema at a pinned reference, and the loader pins a commit and a
file hash for every piece of data it fetches. Neither side trusts the other's main
branch. (source: sentier-importers-repo, sentier-brightway-repo)

## The modules

| Module | Layer | One line |
|---|---|---|
| [modules/sentier-importers/](modules/sentier-importers/) | Application | The plugin framework that reads external data and delivers it into the data repositories by pull request. |
| [modules/sentier-brightway/](modules/sentier-brightway/) | Application | The loader that installs the platform data into a Brightway project, or writes it as plain files. |
| [modules/sentier-agribalyse/](modules/sentier-agribalyse/) | Application | The public Agribalyse-facing work of the platform. |
| [modules/sentier-vocab/](modules/sentier-vocab/) | Data | The controlled vocabulary: one IRI per term, with the schemas that define each term type. |
| [modules/sentier-inventory/](modules/sentier-inventory/) | Data | The life cycle inventory, processes and exchanges as parquet, organised per sector. |
| [modules/sentier-methods/](modules/sentier-methods/) | Data | The impact assessment methods and their characterisation factor tables. |
| [modules/sentier-mappings/](modules/sentier-mappings/) | Cross-cutting | The bridge packages that map one nomenclature onto another, as reviewable data. |

Every runnable command across those packages is collected in [commands.md](commands.md).

## Read paths

**P1, a practitioner who wants the data in a tool.** Start at
[modules/sentier-brightway/README.md](modules/sentier-brightway/README.md), then its
[commands.md](modules/sentier-brightway/commands.md) and
[gotchas.md](modules/sentier-brightway/gotchas.md). For what the data actually is, follow
[modules/sentier-brightway/datasets.md](modules/sentier-brightway/datasets.md) to
[../bafu/](../bafu/) and to the data module folders. For the calculation itself, cross to
[../brightway/](../brightway/).

**P2, a contributor.** Start at [platform.md](platform.md) for the shape of the system,
then [modules/sentier-importers/README.md](modules/sentier-importers/README.md): adding a
source is the smallest useful contribution. [roadmap.md](roadmap.md) lists what this
branch still owes, and each module's `status.md` lists the gaps in that package.

**P3, a wiki developer.** Read [../AGENTS.md](../AGENTS.md) first, then
[modules/README.md](modules/README.md) for the module folder layout,
[../vocabulary.md](../vocabulary.md) for the terms this branch contributes, and
[../CONTRIBUTING.md](../CONTRIBUTING.md) for how a page gets added.

## What belongs here

| Path | What it holds |
|---|---|
| [modules/](modules/) | one folder per Sentier package or data repository |
| [platform.md](platform.md) | the architecture, as built and as designed |
| [commands.md](commands.md) | one table of every runnable command across the packages |
| [../vocabulary.md](../vocabulary.md) | Sentier terms, the terms whose Sentier meaning differs from ILCD, and the sector-regulation terms |
| [roadmap.md](roadmap.md) | what is missing in this branch and where a contributor can help |

## What does not belong here

The databases Sentier imports. They are external sources with their own root branch: see
[../bafu/](../bafu/) and [../ecoinvent/](../ecoinvent/). A Sentier module page describes
what Sentier does with the data and links to the source branch for the database itself.

Non-public work is out of scope entirely: this wiki documents public repositories only.
Where a page would need private content to be true, the gap is left and put on the
roadmap.

## Naming rule

One folder per module under [modules/](modules/), named exactly as the package or
repository is named upstream, so a reader can paste it into an install command or a URL.

## How to add here

1. Register the module's sources (its README, its documentation, its registry entry) in
   [../sources.md](../sources.md).
2. Copy [../templates/pages/module-codebase/](../templates/pages/module-codebase/) into
   `modules/<name>/` and fill it, Datasets section included.
3. Add the terms the module introduces to [../vocabulary.md](../vocabulary.md).
4. Add every page you created to `index.md`, add your terms to `vocabulary.md`, check
   by hand that your links resolve, and append one line to
   [../log.md](../log.md).
