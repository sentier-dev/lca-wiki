---
title: core roadmap
type: roadmap
summary: What is missing in the domain-neutral branch and where a contributor can help.
audience: [P2, P3]
updated: 2026-09-22
sources: []
---

# core roadmap

Where this branch stands and where help is welcome. Items move off this list by being
written, not by being ticked: when the page exists and its links and sources check out,
delete the item.

## Status

`concepts/`, `standards/`, `sectors/` and `use-cases/` are written and sourced, and the
`core` contexts of [../vocabulary.md](../vocabulary.md) are filled. Check
[../index.md](../index.md) for what exists before starting anything new here.

Written so far:

- Concepts: goal and scope, functional unit, system boundary, life cycle inventory, life
  cycle impact assessment, interpretation, allocation and multifunctionality, cut-off
  criteria, data quality, uncertainty, foreground and background, attributional and
  consequential, elementary and intermediate flows, characterisation, normalisation and
  weighting.
- Standards: ISO 14040/14044, ILCD Handbook, ILCD format 1.1 and eILCD, EF/PEF,
  EN 15804, GLAD and nomenclatures.
- Sectors: the eleven GICS sector pages and [sectors/crosswalk.md](sectors/crosswalk.md).
- Use cases: seven tool-agnostic study types and cross-cutting jobs, and six sector use
  cases. All thirteen are `verified: no` by design, since verifying a method means a
  reviewer following it on a real study rather than running a command.

## Open work

### Concepts not yet written

- `critical-review.md`: who may review what, reviewer independence, and the panel
  requirement for comparative assertions disclosed to the public
  (ILCD Handbook chapter 11, ISO 14044 clause 6).
- `reporting.md`: the three ILCD reporting levels and the reporting elements
  (ILCD Handbook chapter 10.3).
- `recycling-and-end-of-life.md`: closed and open loop, the recyclability substitution
  approach, and the Circular Footprint Formula, which
  `allocation-and-multifunctionality.md` currently covers only in outline
  (ILCD Handbook Annex C).
- `scenarios-and-temporal-aspects.md`: assumption scenarios, future processes, temporary
  carbon storage and long-term emissions beyond 100 years
  (ILCD Handbook chapters 7.4.3.7 and 16).
- `regionalisation.md`: geographical representativeness, regionalised elementary flows
  and spatially differentiated characterisation factors.

### Standards not yet written

- `iso-21930.md`: the international counterpart to EN 15804, referenced by construction
  programme rules but not described here.
- `iso-14067.md` and the carbon footprint family, which the ILCD Handbook treats as a
  limited-indicator case rather than a separate method.
- `iso-ts-14048.md`: the process description the ILCD process data set is built on.
- `ghg-protocol.md`: the corporate and product standards a practitioner is usually asked
  about in the same breath as PEF.

### Gaps inside written pages

- The 2020 amendments ISO 14040:2006/Amd 1:2020 and ISO 14044:2006/Amd 2:2020 are
  recorded in `standards/iso-14040-14044.md` by designation and date only. Their content
  is paywalled and was not read; someone with access should say what changed.
  ISO 14044:2006/Amd 1:2017 is not covered at all.
- `standards/glad-and-nomenclatures.md` does not describe the GLAD elementary flow
  harmonisation mapping tables or the per-version content of the EF flow list; neither
  could be read in full from a public page.
- `standards/ef-pef.md` describes the PEF and OEF methods from the Recommendation's
  operative text. Annexes I to IV of Recommendation (EU) 2021/2279, which contain the
  methods themselves, are not summarised page by page and deserve their own treatment.
- `standards/en-15804.md` is written from a programme operator's public PCR rather than
  from the standard, which is paywalled. Clause-level references are therefore indirect.
- No page yet records the ILCD Handbook's separate guidance documents on LCI data set
  development, LCIA model development and review, which are referenced but not described.

### Sector use cases not yet written

Six of the eleven GICS sectors have a use case in [use-cases/](use-cases/). The five that
do not are the ones whose impact is hardest to inventory, and their sector pages say so:

- Consumer Discretionary, from [sectors/consumer-discretionary.md](sectors/consumer-discretionary.md).
- Health Care, from [sectors/health-care.md](sectors/health-care.md); no PEFCR and no PCR
  covers pharmaceuticals, medical devices or care delivery, so the page would have to
  work from the general standards.
- Information Technology, from [sectors/information-technology.md](sectors/information-technology.md).
- Communication Services, from [sectors/communication-services.md](sectors/communication-services.md).
- Financials, from [sectors/financials.md](sectors/financials.md); this one is a
  different problem, since the sector's material impact is a financed portfolio rather
  than an inventory, and the page should say what that changes about the method.

Each follows the naming rule in [use-cases/README.md](use-cases/README.md): verb first,
ending in `-in-<sector>`.

## How to pick something up

Read [../CONTRIBUTING.md](../CONTRIBUTING.md), claim the item in a pull request
description so two people do not write the same page, and keep the change small: one
page, its sources and its line in `index.md` make a good pull request.
