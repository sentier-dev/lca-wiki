---
title: ecoinvent/knowledge
type: readme
summary: "What the ecoinvent database is: methodology, system models, format, versions, licence."
audience: [P1, P2]
updated: 2026-09-21
sources: []
---

# ecoinvent/knowledge

The description of the database itself, one subject per page, structure only.

## What belongs here

Methodology and modelling principles, the system models and what distinguishes them,
the data formats releases ship in, the version history, the licence and what it allows,
the access route, the classification systems used, and the vocabulary, with glossary
definitions quoted with attribution.

## What does not belong here

Amounts, factors, extracts, and anything that would let a reader reconstruct licensed
content. Descriptions and counts are fine; tables of numbers are not.

## The pages

| Page | Subject |
|---|---|
| [methodology.md](methodology.md) | activities, products, exchanges, and the three levels of data |
| [system-models.md](system-models.md) | the four system models and how to choose one |
| [format.md](format.md) | ecoSpold2, its supporting files, and the release types |
| [versions-and-provenance.md](versions-and-provenance.md) | the release line, what an update changes, where the data comes from |
| [access-and-licence.md](access-and-licence.md) | licence types, the EULA, and what may never be published |
| [sector-coverage.md](sector-coverage.md) | ecoinvent's own sectors, ISIC and CPC, and a GICS reading |
| [schemas-and-nomenclature.md](schemas-and-nomenclature.md) | flow kinds, classifications, properties, identifiers, naming |
| [methods.md](methods.md) | the LCIA methods implemented, by name |
| [vocabulary.md](vocabulary.md) | what the ecoinvent glossary covers and where each term is defined |

## Naming rule

`lower-case-with-hyphens.md` naming the subject.

## How to add here

1. Cite the ecoinvent documentation page you took each claim from.
2. Keep quotations short, attributed and linked.
3. Check by hand before committing: every link resolves, every `sources:` id is a row of
   `sources.md`, and `index.md` lists the page.
