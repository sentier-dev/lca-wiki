---
title: ecoinvent
type: branch
summary: The ecoinvent database as an external data source, documented structure only, with no amounts.
audience: [P1, P2]
updated: 2026-09-21
sources: [ecoinvent-website, ecoinvent-kb, ecoinvent-licences, ecoinvent-eula, ecoinvent-kb-releases, ecoinvent-kb-system-models, ecoinvent-v3.12-release-notes]
related: [../brightway/modules/ecoinvent_interface/README.md, ../core/sectors/crosswalk.md]
---

# ecoinvent

The ecoinvent database documented as an external data source: what it contains, how it is
structured, which versions and system models exist, what the licence allows, and how a
licensed user reaches it from an LCA tool.

**Structure only.** ecoinvent is a licensed database. This branch may carry activity
names, units, versions, classifications and glossary text quoted with attribution. It
may never carry inventory amounts, characterisation factors derived from licensed data,
or any table of numbers that amounts to redistributing the database.
A numeric data table anywhere under this branch is refused in review, by design.

## What it is and who publishes it

ecoinvent is a background life cycle inventory database published by the ecoinvent
association, a not-for-profit organisation based in Zurich. It started in the late 1990s
as a project to build a consistent, transparent LCI database, produced its first release
in 2003, and grew into the association that publishes it today (source:
ecoinvent-kb-releases). The database overview states that it contains more than 26,000
datasets modelling human activities and processes across a wide range of sectors (source:
ecoinvent-website). Its public documentation lives in the ecoinvent Knowledge Base
(source: ecoinvent-kb).

## Versions

Version 3 was released in 2013 and is updated roughly yearly, each version building on
all the previous ones and expanding sectorial and geographical coverage (source:
ecoinvent-kb-releases). The current version at the time this page was checked is 3.12,
released on 5 November 2025 (source: ecoinvent-v3.12-release-notes). Versions 1 and 2 are
historical and use a different data format and different naming conventions. See
[knowledge/versions-and-provenance.md](knowledge/versions-and-provenance.md).

## System models

The database is published as unlinked unit processes plus a set of linked system models,
and the choice among them is the user's. Four are offered: "Allocation, cut-off by
classification", "Allocation, cut-off, EN15804", "Allocation at the point of
substitution" (APOS) and "Substitution, consequential, long-term" (source:
ecoinvent-kb-system-models). Which one you pick changes the result, and it is the first
decision a study using ecoinvent has to record. See
[knowledge/system-models.md](knowledge/system-models.md).

## Licence, in one paragraph

Access to the database is acquired through an ecoinvent licence, sold as Single-User,
Enterprise, Developer and Educational types; a Developer licence is the one that carries
sub-licensing rights for software integration, and the other types carry none (source:
ecoinvent-licences). The binding document is the End User Licence Agreement, published
with the association's other legal documents and accepted before any download (source:
ecoinvent-eula). Cradle-to-gate data is stated to be accessible to licensees only
(source: ecoinvent-licences). What follows from that for this wiki is simple and absolute:
names, units, versions, classifications and short attributed quotations may be published
here; amounts, exchange lists and characterisation factors may not, in any form, for any
version. The longer reading is in
[knowledge/access-and-licence.md](knowledge/access-and-licence.md).

## How the tooling in this wiki reaches it

Programmatic access goes through `ecoinvent_interface`, an unofficial Python library that
authenticates as a licensed user and downloads releases, reports and individual process
documents. It is documented on its own module page,
[../brightway/modules/ecoinvent_interface/](../brightway/modules/ecoinvent_interface/);
the credential mechanics and what the library does not do are summarised in
[data/access.md](data/access.md). No data is committed anywhere in this repository, and
no credential is ever written into a page.

## Read paths

- **P1, the practitioner.** [knowledge/system-models.md](knowledge/system-models.md)
  first, because the choice shapes everything after it, then
  [knowledge/sector-coverage.md](knowledge/sector-coverage.md) to see whether your sector
  is covered, then [knowledge/methods.md](knowledge/methods.md) for the indicators, then
  [knowledge/access-and-licence.md](knowledge/access-and-licence.md) for what you may
  publish.
- **P2, the contributor.** [knowledge/methodology.md](knowledge/methodology.md) and
  [knowledge/versions-and-provenance.md](knowledge/versions-and-provenance.md) for how
  the database models the world and how it changes, then [roadmap.md](roadmap.md).
- **P3, the wiki developer.** [knowledge/format.md](knowledge/format.md) and
  [knowledge/schemas-and-nomenclature.md](knowledge/schemas-and-nomenclature.md) for
  ecoSpold2 and the classifications, then [data/access.md](data/access.md), then
  [../vocabulary.md](../vocabulary.md).

## What belongs here

| Path | What it holds |
|---|---|
| [knowledge/](knowledge/) | methodology, system models, format, versions and provenance, access and licence, sector coverage, schemas and nomenclature, methods, vocabulary |
| [data/](data/) | how a licensed user obtains a release; notes only, since there is no open route |
| [use-cases/](use-cases/) | what a licensed practitioner does with the database, end to end |
| [../vocabulary.md](../vocabulary.md) | the terms ecoinvent uses in its own sense, quoted with attribution |
| [roadmap.md](roadmap.md) | what is missing in this branch and where a contributor can help |

## What does not belong here

Amounts, exchange lists, characterisation factors, extracts of any kind, and
credentials. Tooling that talks to the ecoinvent API is documented on its own module
page under [../brightway/modules/](../brightway/modules/).

## Naming rule

`lower-case-with-hyphens.md`, one subject per file, versions written as ecoinvent
writes them: `3.12`, `3.9.1`.

## How to add here

1. Register the ecoinvent page you are citing in [../sources.md](../sources.md), and
   quote glossary text with attribution and a link.
2. Before committing, reread your tables: a column of amounts or factors under this
   branch is a redistribution, whatever it is labelled.
3. If you find yourself wanting to paste numbers, describe them instead: what they
   cover, in which unit, for which version.
4. Add every page you created to `index.md`, check by hand that your links resolve, and append one line to [../log.md](../log.md).
