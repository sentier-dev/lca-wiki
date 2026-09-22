---
title: ecoinvent roadmap
type: roadmap
summary: What is missing in the ecoinvent branch and where a contributor can help.
audience: [P2, P3]
updated: 2026-09-22
sources: []
---

# ecoinvent roadmap

Where this branch stands and where help is welcome. Items move off this list by being
written, not by being ticked: when the page exists and its links and sources check out,
delete the item.

## Status

The nine `knowledge/` pages, the `data/` access notes and this branch's contexts in
[../vocabulary.md](../vocabulary.md) are written and sourced, entirely from public documentation: the ecoinvent website, the
Knowledge Base including its glossary and its system models, activities and products,
releases, impact assessment, sectors and citation pages, the ecoSpold2 format page, and
the `ecoinvent_interface` repository. Four use cases are written and all four are
`verified: no`, because every one of them needs a licence this wiki does not hold; see
[use-cases/README.md](use-cases/README.md). Nothing on this branch was written from a
licensed copy of the database.

## Open work

### Unsourced today, and worth sourcing

- **The EULA itself.** [knowledge/access-and-licence.md](knowledge/access-and-licence.md)
  names the agreement and links the page it is published on, but this wiki has not read
  the document, so the page says what the public pages say and no more. Someone who reads
  it can write a properly sourced section on what a licensee may publish, what
  sub-licensing covers, and how derived data is treated. That section is the one most
  readers of this branch actually need.
- **Compartments and sub-compartments.** The glossary carries no entry for either, so
  [../vocabulary.md](../vocabulary.md) carries no ecoinvent bullet beside the ILCD
  ones. The ecoSpold2 schema and the published master data files almost certainly settle
  it; read them and add the bullets with a real source.
- **The Data Quality Guidelines.** The glossary calls them "the cornerstone document of
  ecoinvent version 3 database providing a complete documentation and explanation of the
  principles and rules for ecoinvent version 3", and several pages defer to them for the
  detail of linking and market behaviour. This branch cites none of it. Register the
  document and give it its own page.
- **Uncertainty.** The Knowledge Base has a page on it and this branch says nothing about
  it. Uncertainty information is metadata rather than amounts, so it can be described
  here in full.
- **Per-version release notes.** [knowledge/versions-and-provenance.md](knowledge/versions-and-provenance.md)
  covers version 3.12 as the worked example and lists the other versions by name only. A
  short page per version, or a single page of what each release changed, would make
  version upgrades far less painful.
- **The ecoinvent API.** Named as a Developer licence add-on and nothing more. What it
  serves, and how it relates to `ecoinvent_interface`, is not documented here.
- **A metadata route without a login.** `ecoinvent_interface` 3.1 exposes no call that
  returns release metadata unauthenticated, so even the question "which versions and
  system models exist today" cannot be answered from the client without a licence. This
  branch therefore lists versions from the public website rather than from the service.
  See
  [../brightway/modules/ecoinvent_interface/use-cases/list-releases-and-download.md](../brightway/modules/ecoinvent_interface/use-cases/list-releases-and-download.md).
- **Markets.** [knowledge/methodology.md](knowledge/methodology.md) summarises market
  activities from the glossary; the Knowledge Base has a dedicated page with more, and a
  market is the single most misunderstood object in the database.

### Use cases, written but unverified

[use-cases/](use-cases/) holds four pages: getting access and credentials, downloading a
release with `ecoinvent_interface`, importing ecoSpold2 into Brightway with `bw2io`, and
mapping ecoinvent flows onto EF 3.1. All four are `verified: no` and say so on the page:
each needs an ecoinvent licence, and none was available or sought. A licensed reader who
follows one and records the environment, the duration and the counts, without pasting a
single amount, turns it to `verified: yes`.

Still owed:

- **Choose a system model for a study**, and record the choice so the result can be
  cited. This is a decision procedure, not a command sequence.
- **Compare two system models for one activity**, describing how the result changes and
  why, without publishing either number.
- **Upgrade a project from one version to the next**, using
  [../brightway/modules/randonneur/](../brightway/modules/randonneur/) for the migrations
  and the release notes for what to expect.

Every one of them has to be written so that a reader without a licence can still follow
what happens, and so that a reader with one pastes nothing back.

### Smaller items

- A page on ecoQuery: what a guest sees, what a licensee sees, and where the files
  section keeps which document.
- The relationship between ecoinvent and the standards it supports, beyond the list on
  the Relevant Standards page: which clause of EN15804 the EN15804 system model actually
  implements.
- Whether, and for how long, older versions stay downloadable. Reproducibility depends on
  it.

## How to pick something up

Read [../CONTRIBUTING.md](../CONTRIBUTING.md), claim the item in a pull request
description so two people do not write the same page, and keep the change small: one
page, its sources and its line in `index.md` make a good pull request.

The hard constraint on this branch overrides everything else on this list. Structure
only: activity names, units, versions, classifications, field names, licence mechanics
and glossary text quoted with attribution. No inventory amounts, no characterisation
factors, no exchange tables, no numeric tables at all. Reread every table you wrote
before you commit, and if it could be read as a column of amounts, it is one.
