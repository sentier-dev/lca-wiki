---
title: BAFU sector coverage
type: database
summary: What BAFU:2026 v1 covers, counted in the database's own categories and read in GICS terms.
audience: [P1, P2]
updated: 2026-09-22
sources: [bafu-2026-release, esu-bafu-database, gics-2023]
related: [../../core/sectors/crosswalk.md, schemas-and-nomenclature.md]
---

# BAFU sector coverage

## In the publisher's words

The database is described as covering products and processes across construction,
mobility, energy, metals, chemicals, paper, agriculture, food, consumption and waste
management (source: esu-bafu-database). It is a cross-sectoral background database for
Swiss conditions rather than a single-sector one.

## The database's own grouping

Every process carries a category and a sub-category, and the openLCA package carries the
same grouping as a category tree. In BAFU:2026 v1 there are 60 distinct top-level
categories over the 11,947 processes, 516 distinct category and sub-category pairs, and a
process category tree that nests up to five levels deep (source: bafu-2026-release). A
small residual group exists: 44 processes sit in a category named `Others` and 111 rows
of the LCIA results workbook carry no category at all (source: bafu-2026-release).

[../../core/sectors/crosswalk.md](../../core/sectors/crosswalk.md) lists 59 top-level
categories instead, read from the v1.1 openLCA package's own category tree rather than
from the process listing of v1. Both readings cite this release, the components carry
different version labels, and nothing public says which of the two a reader should quote;
the crosswalk states both counts and the gap is on [../roadmap.md](../roadmap.md).

Four categories are explicitly legacy, ending in `obsolete`: `energy, obsolete`,
`material, obsolete`, `processing, obsolete` and `waste treatment, obsolete`. Together
they hold 772 processes, which is why a naive count of "how many energy datasets are
there" overcounts unless the legacy groups are excluded (source: bafu-2026-release).

The ten largest categories by process count are, in order: `transport systems`,
`electricity`, `natural gas`, `heat`, `fuels`, `electricity by fuel`, `waste management`,
`chemicals`, `wood` and `material, obsolete` (source: bafu-2026-release). The full list
of top-level categories is in the crosswalk, one row each.

## In GICS terms

Counts below follow the first-choice mapping from BAFU category to GICS sector kept in
[../../core/sectors/crosswalk.md](../../core/sectors/crosswalk.md); the sector names are
the eleven GICS sectors (source: gics-2023). Many categories serve more than one sector,
so read the counts as "where the mass of the data sits", not as an exclusive partition.

| GICS sector | Processes, first-choice mapping | What BAFU actually carries there |
|---|---|---|
| Energy | 2,041 | fuels, oil, natural gas, biomass, pipelines, underground deposits |
| Materials | 1,718 | chemicals, metals, minerals, construction materials, wood, paper and board, glass, plastics, ceramics, insulation |
| Industrials | 2,080 | transport systems, transport waste, mechanical, compressed air, recycling |
| Consumer Discretionary | 17 | textiles, private consumption |
| Consumer Staples | 217 | agricultural, food industry, landfarming |
| Health Care | 0 | nothing of its own; health-care chemicals sit under `chemicals` |
| Financials | 0 | nothing; the sector has no inventory counterpart |
| Information Technology | 329 | electronics, computers and network, electronics waste |
| Communication Services | 0 | nothing of its own; network hardware sits under `computers & network` |
| Utilities | 3,902 | electricity and electricity by fuel, heat and heating, water, wastewater, waste management, landfill, incineration, photovoltaic, wind, impoundment, power plants, nuclear waste |
| Real Estate | 716 | construction, construction processes and waste, building components and processes, ventilation, heat pumps, flooring |
| not mapped | 927 | `Others`, the four legacy `obsolete` categories, and rows with no category |

Read this as a background database with its centre of mass in energy carriers, the built
environment and transport, which is what a Swiss federal administration needs it for.
Anything consumer-facing is thin, and the two service sectors that GICS treats as
industries in their own right, Financials and Communication Services, have no
counterpart at all.

## What this means in practice

- A construction, energy or transport study is likely to find Swiss-specific background
  data here that no global database has.
- A consumer-goods, health-care or electronics-product study will find precursors but
  rarely the finished product; expect to model the foreground yourself and to reach for
  another background database for the rest.
- Geography: the release carries 583 location entries, from single countries through
  regional aggregates to electricity-specific and oversea cut-outs (source:
  bafu-2026-release). Swiss and European locations dominate the dataset names, but the
  location list itself is worldwide.

## Related pages

- [../../core/sectors/crosswalk.md](../../core/sectors/crosswalk.md): the category to sector mapping these counts follow.
- [schemas-and-nomenclature.md](schemas-and-nomenclature.md): how categories are stored in the release.
- [methods.md](methods.md): the indicators available for whatever sector you land in.
