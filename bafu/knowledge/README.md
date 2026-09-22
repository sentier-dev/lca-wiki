---
title: bafu/knowledge
type: readme
summary: "What the BAFU database is: methodology, format, versions, licence, coverage, schemas."
audience: [P1, P2]
updated: 2026-09-21
sources: []
---

# bafu/knowledge

The description of the database itself, one subject per page.

## What belongs here

Methodology and modelling principles, the file format it is published in, the version
history, the licence and what it allows, the access route, the sector coverage stated
both in GICS terms and in the publisher's own groups, the provenance of the inventory,
the schemas, the impact assessment methods shipped with it, and the vocabulary it uses.

## What does not belong here

Download instructions (they are [../data/](../data/)), step-by-step practitioner
instructions (they are [../use-cases/](../use-cases/)), and the data itself.

## The pages

| Page | Subject |
|---|---|
| [methodology.md](methodology.md) | how the inventories are modelled, and what is not published |
| [format.md](format.md) | the three machine-readable components of a release |
| [versions-and-provenance.md](versions-and-provenance.md) | release naming, what changed, where the data comes from |
| [access-and-licence.md](access-and-licence.md) | the download route and the terms of use |
| [sector-coverage.md](sector-coverage.md) | coverage in BAFU categories and in GICS terms |
| [schemas-and-nomenclature.md](schemas-and-nomenclature.md) | flows, compartments, units, identifiers |
| [methods.md](methods.md) | the impact assessment methods published with a release |
| [vocabulary.md](vocabulary.md) | the words a release uses, and where each is defined |

## Naming rule

`lower-case-with-hyphens.md` naming the subject.

## How to add here

1. Cite the publisher's own documentation for every claim; a page here without a
   resolving `sources:` id is not accepted.
2. State the version your description applies to, and the date you checked it.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
