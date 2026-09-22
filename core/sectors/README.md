---
title: core/sectors
type: readme
summary: The 11 GICS sector pages and the crosswalk to the other sector taxonomies in use.
audience: [P1, P2]
updated: 2026-09-21
sources: []
---

# core/sectors

What an LCA in a given sector typically needs: the flows that dominate, the data
usually missing, the sector regulation that applies, and which use cases and datasets
in this wiki serve it.

## What belongs here

Eleven pages, one per sector of the Global Industry Classification Standard (GICS):
energy, materials, industrials, consumer discretionary, consumer staples, health care,
financials, information technology, communication services, utilities, real estate.
Plus `crosswalk.md`, which maps each GICS sector onto the sector folders of the Sentier
inventory, the BAFU groups and the ISIC divisions ecoinvent uses. Industry-group pages
are added only when a use case needs one.

## The pages

| Page | GICS code | What it covers |
|---|---|---|
| [energy.md](energy.md) | 10 | fuel chains from extraction to combustion |
| [materials.md](materials.md) | 15 | chemicals, construction materials, packaging, metals, paper |
| [industrials.md](industrials.md) | 20 | capital goods, commercial services, transport |
| [consumer-discretionary.md](consumer-discretionary.md) | 25 | vehicles, durables, apparel, consumer services, retail |
| [consumer-staples.md](consumer-staples.md) | 30 | food, beverage, tobacco, household and personal products |
| [health-care.md](health-care.md) | 35 | devices, care delivery, pharmaceuticals and life sciences |
| [financials.md](financials.md) | 40 | banks, financial services, insurance |
| [information-technology.md](information-technology.md) | 45 | software and services, hardware, semiconductors |
| [communication-services.md](communication-services.md) | 50 | telecommunication, media and entertainment |
| [utilities.md](utilities.md) | 55 | electricity, gas, water, heat, independent power |
| [real-estate.md](real-estate.md) | 60 | REITs, real estate management and development |
| [crosswalk.md](crosswalk.md) | n/a | GICS to Sentier folders, BAFU categories and ISIC sections |

## What does not belong here

Datasets (they are described on module pages) and step-by-step instructions (they are
use cases). A sector page points at both.

## Naming rule

The GICS sector name, lower case, hyphenated: `information-technology.md`,
`consumer-staples.md`. The crosswalk keeps its own name, `crosswalk.md`.

## How to add here

1. Copy [../../templates/pages/sector.md](../../templates/pages/sector.md).
2. Use the GICS name exactly; if you need a finer split, add an industry-group page and
   link it from the sector page rather than renaming the sector.
3. Add the sector to `crosswalk.md` in the same change.
4. Add the page to `index.md` and check by hand that every link and anchor resolves.
