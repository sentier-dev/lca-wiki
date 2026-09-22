---
title: The Sentier platform architecture
type: concept
summary: How the Sentier platform is arranged in two layers, which parts exist today and which are still a design hypothesis.
audience: [P1, P2, P3]
updated: 2026-09-21
sources: [sentier-dev-repo, sentier-dev-adr-1, sentier-brightway-repo, sentier-importers-repo]
related: [README.md, commands.md, modules/README.md]
---

# The Sentier platform architecture

Sentier is planned in the open: the platform's shape is written down in the planning
repository, and the code that implements part of that shape lives in one repository per
component. This page separates the two. Everything under "As built" was read in a public
repository on 2026-09-21; everything under "Hypothesis" is a design the planning
repository states as a premise, not as something that runs today.

## The two layers

The platform is organised along domain-driven design lines into an **Application Layer**,
holding the models, the calculation platform and the importers, and a **Data Layer**,
holding the vocabulary, the inventory and the methods. Third-party data sources feed into
the application layer, and the mappings sit underneath both, linking one nomenclature to
another. (source: sentier-dev-repo)

The planning repository's own overview of the flow is: raw data is normalised against a
glossary, the result lands in a data warehouse, an orchestration layer drives linked
models over that warehouse, and the models produce results. (source: sentier-dev-repo)

| Layer | What it holds | Modules in this wiki |
|---|---|---|
| Application | importers, models, calculation | [modules/sentier-importers/](modules/sentier-importers/), [modules/sentier-brightway/](modules/sentier-brightway/), [modules/sentier-agribalyse/](modules/sentier-agribalyse/) |
| Data | vocabulary, inventory, methods | [modules/sentier-vocab/](modules/sentier-vocab/), [modules/sentier-inventory/](modules/sentier-inventory/), [modules/sentier-methods/](modules/sentier-methods/) |
| Cross-cutting | mappings between nomenclatures | [modules/sentier-mappings/](modules/sentier-mappings/) |

## One repository per component

The platform is deliberately multi-repository: one repository per component, service or
bounded context, including separate repositories for the data management flow, for
contract specifications and for model and interface definitions. The reasons recorded in
the decision are maintainability of smaller repositories, freedom to pick a technology
per component, focused onboarding and documentation, faster local testing, simpler git
history and merges, contract-driven development between components, and letting outside
contributors own a repository rather than a folder. The consequences recorded are more
repositories to manage and more coordination between them, mitigated by automated
pipelines, a named owner per repository, contract tests and semantic versioning of the
contracts. (source: sentier-dev-adr-1)

That decision is visible in this branch: every module folder is a separate public
repository, and the data repositories carry no loader code at all.

## As built, on 2026-09-21

```
external data  ->  sentier-importers  ->  data repositories  ->  sentier-brightway  ->  an LCA tool
```

- **Import.** sentier-importers runs one staged pipeline per source, validates the result
  against the target repository's schema, and delivers it as a pull request. It never
  writes to a target directly. (source: sentier-importers-repo)
- **Data.** The vocabulary, inventory, methods and mappings repositories hold artifacts
  only: parquet, YAML, JSON and the schemas that describe them, with a validator in
  continuous integration and no fetch, parse or calculate code.
  (source: sentier-importers-repo)
- **Delivery.** sentier-brightway fetches pinned commits of four data repositories,
  checks every file against a recorded hash, relinks the inventory flows onto the method
  nomenclature, and writes either a Brightway project or a folder of plain files that
  stock `bw2calc` reads. (source: sentier-brightway-repo)
- **Calculation.** Today the calculation is done by the Brightway stack, not by a Sentier
  service: the platform's job ends when the data is in a project or in a datapackage.
  (source: sentier-brightway-repo)

The contract that holds this together is a pinned reference plus a schema. The importers
validate against a target's schema at a pinned reference; the loader pins a commit and a
hash per file. Neither side trusts the other's main branch.
(source: sentier-importers-repo, sentier-brightway-repo)

## Hypothesis, not yet built

The sequence diagrams in the planning repository are drawn on an explicit set of
premises, stated as premises: (source: sentier-dev-repo)

- an orchestration service launches containerised objects;
- models are serialised on a filesystem in a standard structure, one folder per model
  identifier, holding extract, transform, prepare and load steps;
- the orchestrator keeps the graph of models it has called, and is responsible for
  calling them;
- calling a model returns the other models it needs, and its emissions.

On those premises the diagrams show a frontend turning a natural-language question into
glossary terms for the user to choose from; then an orchestrator asking the glossary
which model produces a product, asking a runner to apply the demand, logging the
emissions and the context, decomposing the result and iterating along the supply chain
until it can read the graph back out of the log and return a report; and a queue variant
where the orchestrator pushes the demands of each result and pops the most important one
for the next runner. (source: sentier-dev-repo)

None of that orchestration exists in the repositories this branch documents. Treat the
diagrams as the intended shape of the calculation layer, and this wiki's module pages as
the record of what is actually runnable.

## What the glossary is for

The data layer's vocabulary is not a convenience: it is the platform's answer to string
matching. The product vision states the target plainly. Every term has an IRI, and the
IRI is the only way to refer to the term; the IRI resolves both to a human-readable page
and to an API endpoint; terms are defined hierarchically and taken from existing
standards wherever one exists; the glossary is append-only, so any historical state can
be read back; and changes go through an open review process before they reach the main
glossary. (source: sentier-dev-repo)

Two consequences show up all over this branch. Identifiers are minted deterministically
from stable keys, so a re-import produces the same identifiers rather than duplicates;
and a mapping between two nomenclatures is data in its own repository, reviewable and
versioned, rather than a lookup table hidden in a loader.
(source: sentier-importers-repo, sentier-brightway-repo)

## How to read further

- [README.md](README.md) for the branch and its module list.
- [commands.md](commands.md) for everything that is runnable across the packages.
- [modules/sentier-importers/](modules/sentier-importers/) for the import side and
  [modules/sentier-brightway/](modules/sentier-brightway/) for the delivery side.
- [../brightway/README.md](../brightway/README.md) for the calculation stack the platform
  currently delivers into.
