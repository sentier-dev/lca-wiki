---
title: sentier-methods datasets
type: module-page
summary: EF 3.1 as the platform ships it, plus the IPCC 2021 and ReCiPe 2016 scaffolds, described without a single factor value.
audience: [P1, P2]
updated: 2026-09-22
sources: [sentier-methods-repo, ef-methods-lca]
related: [../sentier-mappings/datasets.md, ../sentier-vocab/datasets.md]
---

# sentier-methods datasets

Three datasources, described broadly. No characterisation factor value appears on this
page, by rule: the descriptors say which categories exist, in which units, keyed by
what, and where the factors came from. Counts are as of commit `8d0f504`, 2026-09-17.
(source: sentier-methods-repo)

## Environmental Footprint 3.1

- **Version:** EF 3.1, ranked 01, schema version `0.1.0`.
- **Publisher:** the European Commission. The datasource metadata records the
  Commission's legal notice as the licence and the Joint Research Centre's Life Cycle
  Data Network page for EF as the source URL. The `source` column of every method row
  names the Joint Research Centre as the origin of the factors.
- **Scale:** 25 rows in the method table, 319,393 rows in the factor table, keyed by
  89,070 distinct elementary flows.
- **Schema:** the method table keyed by `method_id`, the factor table joined on it. See
  [classes.md](classes.md).
- **Flow keys:** each factor names a flow as a full IRI in the Sentier flows namespace,
  `https://vocab.sentier.dev/flows/<identifier>`, with the compartment path carried
  separately in `flow_context` in the publisher's own wording, for example an emission
  to a named sub-compartment of air. See [../sentier-vocab/](../sentier-vocab/) for the
  namespace itself.
- **Regionalisation:** about 42,700 factor rows carry a country or region code in
  `location`; the rest are global. Eleven of the 25 categories have regionalised rows,
  with land use by far the largest, followed by water use, acidification, particulate
  matter, eutrophication and the regionalised toxicity categories.
- **Normalisation and weighting:** not shipped. The optional table is defined in the
  schema and absent from the folder.

### The 25 impact categories

Category names and reference units as delivered. This is nomenclature, not data.

| Method identifier | Impact category | Unit |
|---|---|---|
| `ef-3.1:acidification` | Acidification | mol H+ eq |
| `ef-3.1:climate-change` | Climate change | kg CO2 eq |
| `ef-3.1:climate-change-biogenic` | Climate change, biogenic | kg CO2 eq |
| `ef-3.1:climate-change-fossil` | Climate change, fossil | kg CO2 eq |
| `ef-3.1:climate-change-land-use-and-land-use-change` | Climate change, land use and land use change | kg CO2 eq |
| `ef-3.1:ef-particulate-matter` | Particulate matter | disease incidence |
| `ef-3.1:eutrophication-marine` | Eutrophication, marine | kg N eq |
| `ef-3.1:eutrophication-freshwater` | Eutrophication, freshwater | kg P eq |
| `ef-3.1:eutrophication-terrestrial` | Eutrophication, terrestrial | mol N eq |
| `ef-3.1:human-toxicity-cancer` | Human toxicity, cancer | CTUh |
| `ef-3.1:human-toxicity-cancer-organics` | Human toxicity, cancer, organics | CTUh |
| `ef-3.1:human-toxicity-cancer-inorganics` | Human toxicity, cancer, inorganics | CTUh |
| `ef-3.1:human-toxicity-non-cancer` | Human toxicity, non-cancer | CTUh |
| `ef-3.1:human-toxicity-non-cancer-organics` | Human toxicity, non-cancer, organics | CTUh |
| `ef-3.1:human-toxicity-non-cancer-inorganics` | Human toxicity, non-cancer, inorganics | CTUh |
| `ef-3.1:ionising-radiation-human-health` | Ionising radiation, human health | kBq U-235 eq |
| `ef-3.1:land-use` | Land use | Pt |
| `ef-3.1:ozone-depletion` | Ozone depletion | kg CFC-11 eq |
| `ef-3.1:photochemical-ozone-formation-human-health` | Photochemical ozone formation, human health | kg NMVOC eq |
| `ef-3.1:resource-use-fossils` | Resource use, fossils | MJ |
| `ef-3.1:resource-use-minerals-and-metals` | Resource use, minerals and metals | kg Sb eq |
| `ef-3.1:water-use` | Water use | m3 world eq deprived |
| `ef-3.1:ecotoxicity-freshwater` | Ecotoxicity, freshwater | CTUe |
| `ef-3.1:ecotoxicity-freshwater-organics` | Ecotoxicity, freshwater, organics | CTUe |
| `ef-3.1:ecotoxicity-freshwater-inorganics` | Ecotoxicity, freshwater, inorganics | CTUe |

Nine of these are sub-indicators of a headline category: the three climate change splits
(biogenic, fossil, land use and land use change) and the organics and inorganics splits
of human toxicity cancer, human toxicity non-cancer and freshwater ecotoxicity. The
remaining sixteen are exactly the sixteen EF impact categories an EF study reports, as
[../../../core/standards/ef-pef.md](../../../core/standards/ef-pef.md) lists them
(ef-methods-lca). Summing every row in the table therefore double counts. Pick the set of
categories your study reports before you score.

## IPCC 2021

- **Version:** `ipcc-2021`, ranked 02, publisher IPCC.
- **State:** a scaffold. The folder carries `metadata.json` and nothing else: no method
  table, no factors, empty row counts, and no licence or source URL recorded yet.
- **Why it exists:** a declared datasource that validates on its own, so the folder and
  its rank are reserved before any delivery.

## ReCiPe 2016

- **Version:** `recipe-2016`, ranked 03, publisher RIVM.
- **State:** a scaffold, on the same terms as IPCC 2021.

## Rank and precedence

The numeric prefix orders the datasources and sets resolution precedence when records
overlap: lower wins. It is not part of the datasource identifier stored in the
`datasource` column or in a method identifier, so moving a folder's rank does not
rewrite the data.

## How these factors meet an inventory

Not directly. The factors are keyed by EF flow identifiers, and the inventory in
[../sentier-inventory/](../sentier-inventory/) uses its own deterministic flow
identifiers; the two sets do not overlap. The bridge is a pair folder in
[../sentier-mappings/](../sentier-mappings/), which relinks inventory flows onto these
keys first. A regionalised factor adds a second matching dimension, the location, which
a consumer has to decide how to use when the inventory exchange has no geography.

## Provenance and licence

The repository is MIT. A datasource's own terms are recorded in its `metadata.json`:
publisher, version, licence and source URL. For EF 3.1 that is the European Commission's
reuse terms. Factor values are published by their publishers and are reproduced in this
wiki only as counts and category names, never as numbers.
