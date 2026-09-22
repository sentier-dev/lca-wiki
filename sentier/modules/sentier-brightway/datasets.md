---
title: sentier-brightway datasets
type: module-page
summary: The four pinned datasets sentier-brightway fetches, and the two shapes it writes them in.
audience: [P1, P2]
updated: 2026-09-21
sources: [sentier-brightway-repo]
related: [../../../bafu/README.md, ../sentier-methods/README.md]
---

# sentier-brightway datasets

Nothing ships in the package. Every dataset below is fetched from a pinned commit of its
own repository on first use, or read from a local checkout. Descriptors stay broad: no
amounts and no characterisation factor values appear on this page.
(source: sentier-brightway-repo)

## BAFU-2026 life cycle inventory

- **Version:** v1, 11,947 processes, pinned by commit in `sources.toml`
- **Sectors:** eleven folders, ranked and numbered: agriculture, electricity, chemicals,
  transport, energy, waste, construction, materials, electronics, building services, and
  an obsolete folder kept for completeness
- **Provenance:** published by the Swiss federal administration and delivered into the
  platform by the importers; distributed through the sentier-inventory repository
- **Schema:** two parquet tables per sector folder, processes and exchanges, plus a
  metadata file; the columns are contracted in the inventory repository
- **Methods:** none; this is inventory only
- **Vocabulary:** process and flow terms are IRIs in the Sentier vocabulary
- **Source branch:** [../../../bafu/](../../../bafu/) for the database itself,
  [../sentier-inventory/](../sentier-inventory/) for the repository that carries it

## EF 3.1 elementary flows

- **Version:** the EF 3.1 rows of the vocabulary's elementary-flow shards
- **Sectors:** not sector specific; compartments and sub-compartments instead
- **Provenance:** the European Commission's Environmental Footprint reference package,
  imported into the vocabulary by the importers
- **Schema:** parquet shards with an IRI, a preferred label, the upstream source, the
  compartment, the sub-compartment and a CAS number where one exists
- **Vocabulary:** this dataset *is* the flow vocabulary of the build
- **Source branch:** [../sentier-vocab/](../sentier-vocab/)

## EF 3.1 impact assessment methods

- **Version:** EF 3.1, 25 impact categories, global factors only
- **Provenance:** the European Commission's Environmental Footprint method package,
  delivered into sentier-methods by the importers
- **Schema:** a methods table keyed by a method id of the form `<datasource>:<category>`
  and a characterisation-factor table keyed by that method id and a flow
- **Methods:** installed under a two-part Sentier method prefix, one key per category
- **Source branch:** [../sentier-methods/](../sentier-methods/)

## BAFU to EF 3.1 flow bridge

- **Version:** the `bafu-2026-v1__ef-3.1` pair, four ordered mapping packages
- **Provenance:** curated, inferred, matched and nomenclature packages authored through
  the importers and by contributors, in randonneur package format
- **Schema:** randonneur JSON; only `replace` entries relink a flow, `update` entries
  edit fields on the same flow and are ignored by the loader
- **Coverage:** 2,566 of 2,679 inventory flows, 95.8 per cent, and 96.8 per cent of the
  biosphere exchange rows link to an EF 3.1 flow at the pinned commits; the 113 flows
  that do not link keep their exchanges in the residual database
- **Source branch:** [../sentier-mappings/](../sentier-mappings/)

## What the module writes

### A Brightway project (`db`)

| Object | Content |
|---|---|
| inventory database | the 11,947 processes |
| biosphere database | the EF 3.1 elementary flows, with inventory emissions relinked onto them |
| residual database | the inventory flows with no EF 3.1 counterpart, exchanges intact, no factor |
| methods | the 25 EF 3.1 impact categories, under the Sentier method prefix |

### A folder of plain files (`files`)

| Path | Content |
|---|---|
| `registry/` | processes, biosphere, exchanges, methods and characterisation factors, as parquet |
| `mappings/` | the mapping packages of the bridge folder, copied verbatim |
| `bw_package/` | `bw_processing` datapackages: one inventory package and one per method |
| `manifest.json` | the data pins, the citation, the coverage and the row counts |

Every registry table shares an integer id column, which is also the matrix index of the
datapackages, so `bw_processing.load_datapackage` plus `bw2calc.LCA` reads the export
with no further translation. The export is static: uncertainty columns are present in the
registry but are not written into the datapackages in 0.1.0.

## Citation

Work derived from the installed inventory must carry
"Source: Life Cycle Inventory database of the Swiss Federal Administration, BAFU:2026."
The coverage report and the export manifest both print it. (source: sentier-brightway-repo)
