---
title: core/standards
type: readme
summary: One page per LCA standard, guidance document or data format, with what it requires.
audience: [P1, P2, P3]
updated: 2026-09-21
sources: []
---

# core/standards

One page per normative document: what it covers, who it binds, which version is
current, and what it actually requires of a study or a dataset.

## What belongs here

ISO 14040 and 14044, the ILCD Handbook (general guide and the detailed guidance
documents), the ILCD data format 1.1 and eILCD, the Environmental Footprint method
and its PEFCR/OEFSR rules, EN 15804 for construction products, and the sector
regulations a use case has to satisfy.

## What is here now

| Page | Document |
|---|---|
| [iso-14040-14044.md](iso-14040-14044.md) | ISO 14040:2006 and ISO 14044:2006, with the 2020 amendments |
| [ilcd-handbook.md](ilcd-handbook.md) | ILCD Handbook, General guide, Detailed guidance, 2010 |
| [ilcd-format.md](ilcd-format.md) | ILCD data format 1.1 and the eILCD life cycle model |
| [ef-pef.md](ef-pef.md) | Recommendation (EU) 2021/2279, PEFCR/OEFSR, EF reference packages |
| [en-15804.md](en-15804.md) | EN 15804:2012+A2:2019, construction product EPDs |
| [glad-and-nomenclatures.md](glad-and-nomenclatures.md) | GLAD, the EF flow list, ecoinvent naming, ISIC and CPC |

What is still missing is listed in [../roadmap.md](../roadmap.md).

## What does not belong here

The full text of a standard: it is cited, never mirrored. Database-specific
implementations of a format belong to that database's branch.

## Naming rule

`lower-case-with-hyphens.md` naming the document as practitioners say it:
`iso-14040-14044.md`, `ilcd-handbook.md`, `ilcd-format-1-1.md`, `ef-pef.md`,
`en-15804.md`.

## How to add here

1. Copy [../../templates/pages/standard.md](../../templates/pages/standard.md).
2. Record the exact edition and year in the page and in
   [../../sources.md](../../sources.md); a standard without an edition is not a source.
3. State plainly what the document requires, and link the concepts it constrains.
4. Add the page to `index.md` and check by hand that every link and anchor resolves.
