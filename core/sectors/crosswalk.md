---
title: Sector crosswalk
type: sector
summary: "Maps each GICS sector onto the Sentier inventory sector values, the BAFU:2026 process categories and the ISIC Rev.4 sections."
audience: [P1, P2]
updated: 2026-10-12
sources: [gics-2023, sentier-inventory-readme, bafu-2026-release, unsd-isic-rev4, sentier-inventory-pr-5]
related: [energy.md, materials.md, industrials.md, consumer-discretionary.md, consumer-staples.md, health-care.md, financials.md, information-technology.md, communication-services.md, utilities.md, real-estate.md]
---

# Sector crosswalk

Four taxonomies meet in this wiki and none of them nests inside another. This page says
how they line up, and where they do not.

| Taxonomy | What it classifies | Levels | Source |
|---|---|---|---|
| GICS | companies, by the business they earn from | 11 sectors, 25 industry groups, 74 industries, 163 sub-industries | gics-2023 |
| Sentier inventory sectors | inventory rows, by sector of the process | 11 values of the `sector` column, in one source folder today | sentier-inventory-readme |
| BAFU:2026 process categories | processes in the openLCA package, by subject | 59 top-level categories in the v1.1 package, nested further; see the note below on the count | bafu-2026-release |
| ISIC Rev.4 | economic activities, by kind of activity | 21 sections A to U, then divisions | unsd-isic-rev4 |

GICS classifies a company by where its revenue comes from; the other three classify a
process, a dataset or an activity. A single company therefore spreads across many rows
of the other three, and a single dataset serves many GICS sectors. Every mapping below
is many-to-many, and the tables say so rather than pretending otherwise.

## The taxonomies in one line each

**GICS.** Four tiers: sector, industry group, industry, sub-industry, with an eight
digit code. The structure in this wiki is the March 2023 one, after the review that
carved Real Estate out of Financials and turned Telecommunication Services into
Communication Services (gics-2023).

**Sentier inventory sectors.** The `sector` column of `processes.parquet`, eleven
enumerated values, inside one folder per published release of one datasource,
`data/<source>-<source_version>/` (today only `data/bafu-2026-v1/`), each folder holding
`processes.parquet`, `exchanges.parquet` and `metadata.json`. Inventory is organised by
source with the sector as a row attribute; there is no rank and no precedence between
folders, and background databases that exist only as link targets are not folders. Until
2026-10-12 the sector was a numbered folder, `data/<NN>-<sector>/`, whose rank prefix set
precedence; that layout was dropped because sector files from several sources did not
stack (sentier-inventory-readme, sentier-inventory-pr-5).

**BAFU:2026 process categories.** The openLCA package of the Swiss Federal
Administration LCI database carries a category tree; its process branch has 59 top-level
categories, read from the BAFU:2026 v1.1 openLCA package (bafu-2026-release). They are
subject groupings rather than an economic classification, so several of them are
materials, several are treatment routes, four are explicit legacy buckets ending in
`obsolete` and one, `Others`, is a residual bucket.

**Two counts of the same tree.** The third table below lists 59 categories, read from the
v1.1 openLCA package.
[../../bafu/knowledge/sector-coverage.md](../../bafu/knowledge/sector-coverage.md),
[../../bafu/README.md](../../bafu/README.md) and
[../use-cases/choose-a-background-database.md](../use-cases/choose-a-background-database.md)
state 60 distinct top-level categories over the 11,947 processes of BAFU:2026 v1
(bafu-2026-release). Both readings cite the same release and neither is demonstrably
wrong from a public source: the counts are taken from different components, the v1.1
openLCA category tree here and the v1 process listing there, and the components of one
BAFU release do not always share a version. A reader who needs an exact number should
re-read the component they are actually using and say which one it was. The discrepancy
is on [../../bafu/roadmap.md](../../bafu/roadmap.md).

**ISIC Rev.4.** The United Nations classification of economic activities, 21 sections
A to U (unsd-isic-rev4). It is the classification an economic account or an
input-output table is usually built on, which is why an LCA meets it at the boundary
with environmentally extended input-output work.

## GICS to the other three

Read a row as "a study in this GICS sector usually draws on these". A cell saying
"none" means no entry of that taxonomy corresponds, not that the sector is unimportant.

| GICS sector | Sentier inventory `sector` values | BAFU:2026 top-level process categories | ISIC Rev.4 sections |
|---|---|---|---|
| [Energy](energy.md) | `energy`, `chemicals`, `transport` | `fuels`, `oil`, `natural gas`, `pipeline`, `biomass`, `underground deposit` | B, C, D, H |
| [Materials](materials.md) | `materials`, `chemicals`, `construction` | `metals`, `minerals`, `chemicals`, `plastics`, `glass`, `ceramics`, `wood`, `paper+ board`, `cardboard`, `construction materials`, `insulation materials` | B, C |
| [Industrials](industrials.md) | `transport`, `construction`, `materials`, `electronics`, `building-services` | `transport systems`, `mechanical`, `building processes`, `construction processes`, `compressed air`, `recycling` | C, E, F, H, N |
| [Consumer Discretionary](consumer-discretionary.md) | `materials`, `electronics`, `transport`, `waste` | `textiles`, `private consumption`, `electronics`, `flooring`, `transport systems` | C, G, I, P, S |
| [Consumer Staples](consumer-staples.md) | `agriculture`, `chemicals`, `waste` | `agricultural`, `food industry`, `landfarming` | A, C, G |
| [Health Care](health-care.md) | `chemicals`, `electronics`, `waste` | `chemicals`, `incineration` | C, Q |
| [Financials](financials.md) | none | none | K |
| [Information Technology](information-technology.md) | `electronics`, `electricity`, `chemicals`, `waste` | `electronics`, `computers & network`, `electronics waste` | C, J |
| [Communication Services](communication-services.md) | `electricity`, `electronics`, `construction` | `computers & network`, `electricity` | J, R |
| [Utilities](utilities.md) | `electricity`, `energy`, `waste` | `electricity`, `electricity by fuel`, `power plants`, `photovoltaic`, `wind power`, `impoundment`, `heat`, `heating`, `heat pumps`, `water`, `wastewater treatment`, `nuclear waste`, `incineration`, `landfill`, `waste`, `waste management` | D, E |
| [Real Estate](real-estate.md) | `construction`, `building-services`, `materials`, `electricity` | `building components`, `building processes`, `construction`, `construction materials`, `construction processes`, `construction waste`, `flooring`, `insulation materials`, `ventilation` | F, L |

The ISIC section letters stand for: A agriculture, forestry and fishing; B mining and
quarrying; C manufacturing; D electricity, gas, steam and air conditioning supply;
E water supply, sewerage, waste management and remediation activities; F construction;
G wholesale and retail trade, repair of motor vehicles and motorcycles;
H transportation and storage; I accommodation and food service activities;
J information and communication; K financial and insurance activities; L real estate
activities; N administrative and support service activities; P education; Q human health
and social work activities; R arts, entertainment and recreation; S other service
activities (unsd-isic-rev4).

## Sentier inventory sectors to GICS

The reverse direction, which is what a reader holding a parquet file needs.

| `sector` value | GICS sectors it mainly serves |
|---|---|
| `agriculture` | Consumer Staples |
| `electricity` | Utilities, Information Technology, Communication Services, Real Estate |
| `chemicals` | Materials, Consumer Staples, Health Care, Energy, Information Technology |
| `transport` | Industrials, Consumer Discretionary, Energy |
| `energy` | Energy, Utilities |
| `waste` | Utilities, Consumer Discretionary, Health Care, Information Technology |
| `construction` | Real Estate, Industrials, Materials, Communication Services |
| `materials` | Materials, Consumer Discretionary, Industrials, Real Estate |
| `electronics` | Information Technology, Consumer Discretionary, Communication Services, Health Care |
| `building-services` | Real Estate, Industrials |
| `obsolete` | none; it marks legacy link targets rather than a sector (sentier-inventory-readme) |

No sector value corresponds to Financials, and none is exclusive to one GICS sector
except `agriculture`. A sector is a filter on the column, not a folder, so there is no
precedence to resolve between sectors (sentier-inventory-readme).

## BAFU:2026 top-level process categories to GICS

All 59 top-level categories of the process branch, with the GICS sector each one most
often serves (bafu-2026-release). Several serve more than one; the second column names
the first-choice sector page and the sector pages repeat the full lists.

| BAFU category | GICS sector |
|---|---|
| `agricultural` | Consumer Staples |
| `biomass` | Energy |
| `building components` | Real Estate |
| `building processes` | Real Estate, Industrials |
| `cardboard` | Materials |
| `ceramics` | Materials |
| `chemicals` | Materials, Health Care |
| `compressed air` | Industrials |
| `computers & network` | Information Technology, Communication Services |
| `construction` | Real Estate |
| `construction materials` | Materials, Real Estate |
| `construction processes` | Real Estate, Industrials |
| `construction waste` | Real Estate, Utilities |
| `electricity` | Utilities |
| `electricity by fuel` | Utilities |
| `electronics` | Information Technology, Consumer Discretionary |
| `electronics waste` | Information Technology, Utilities |
| `energy supply, kbob recommendation` | Utilities, Real Estate |
| `flooring` | Real Estate, Consumer Discretionary |
| `food industry` | Consumer Staples |
| `fuels` | Energy |
| `glass` | Materials |
| `heat` | Utilities |
| `heat pumps` | Real Estate, Utilities |
| `heating` | Utilities, Real Estate |
| `impoundment` | Utilities |
| `incineration` | Utilities, Health Care |
| `insulation materials` | Materials, Real Estate |
| `landfarming` | Consumer Staples, Utilities |
| `landfill` | Utilities |
| `mechanical` | Industrials |
| `metals` | Materials |
| `minerals` | Materials |
| `natural gas` | Energy |
| `nuclear waste` | Utilities |
| `oil` | Energy |
| `paper+ board` | Materials |
| `photovoltaic` | Utilities |
| `pipeline` | Energy |
| `plastics` | Materials |
| `power plants` | Utilities |
| `private consumption` | Consumer Discretionary |
| `recycling` | Industrials, Utilities |
| `textiles` | Consumer Discretionary |
| `transport systems` | Industrials, Consumer Discretionary |
| `transport waste` | Industrials, Utilities |
| `underground deposit` | Energy, Utilities |
| `ventilation` | Real Estate |
| `waste` | Utilities |
| `waste management` | Utilities |
| `wastewater treatment` | Utilities |
| `water` | Utilities |
| `wind power` | Utilities |
| `wood` | Materials |
| `Others` | none; a residual bucket |
| `energy, obsolete` | none; legacy, maps to `obsolete` |
| `material, obsolete` | none; legacy, maps to `obsolete` |
| `processing, obsolete` | none; legacy, maps to `obsolete` |
| `waste treatment, obsolete` | none; legacy, maps to `obsolete` |

## What does not map

- **Financials** has no counterpart in any inventory taxonomy here. The sector's material
  impact is a financed portfolio, which is an attribution of other sectors rather than an
  inventory; see [financials.md](financials.md).
- **Commercial and professional services** inside Industrials, and **media** inside
  Communication Services, have activities in ISIC but no dedicated inventory sector or
  BAFU category.
- **The `obsolete` sector value** and the four BAFU categories ending in `obsolete` are
  version artefacts, not sectors. They exist so that older references still resolve. `Others` is
  a residual bucket rather than a legacy one.
- **ISIC sections M, O, T and U** (professional and scientific activities, public
  administration, household activities, extraterritorial bodies) have no GICS sector at
  all, because GICS classifies listed companies and those sections are not that.

## How to extend this page

Add a sector page and its row here in the same change, as
[README.md](README.md) requires. When a new Sentier inventory `sector` value appears in
the schema enumeration, add it to the reverse table and to every GICS row it serves; when a BAFU release changes its
category tree, re-read the package and update the third table with a new access date on
the source row in [../../sources.md](../../sources.md). Keep "none" where it is true.
