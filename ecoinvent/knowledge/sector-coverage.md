---
title: ecoinvent sector coverage
type: database
summary: "What ecoinvent covers, in its own fifteen sectors, in ISIC and CPC terms, and read against the eleven GICS sectors."
audience: [P1, P2]
updated: 2026-09-21
sources: [ecoinvent-kb-sectors, ecoinvent-website, ecoinvent-kb, ecoinvent-kb-glossary, ecoinvent-v3.12-release-notes, gics-2023, unsd-isic-rev4]
related: [../../core/sectors/crosswalk.md, schemas-and-nomenclature.md]
---

# ecoinvent sector coverage

No counts per sector appear on this page. ecoinvent publishes one total, more than 26,000
datasets across a range of industrial sectors (source: ecoinvent-website,
ecoinvent-kb-sectors), and a per-sector breakdown would be an inventory of a licensed
database rather than a description of it. Everything below is qualitative or is the
publisher's own published total.

## In ecoinvent's own words

"The ecoinvent database is a global library of human activities, representing thousands
of processes that supply goods and services across all industrial sectors" (source:
ecoinvent-kb-sectors). The sectors the overview names are agriculture and animal
husbandry, building and construction, chemicals and plastics, energy, forestry and wood,
metals, textiles, transport, tourist accommodation and waste treatment, among others
(source: ecoinvent-kb-sectors).

## The database's own grouping

The Knowledge Base organises its sector documentation into fifteen sectors, each with its
own page (source: ecoinvent-kb):

Accommodation services; Agriculture, fishery and animal husbandry; Batteries and
electronics; Building and construction; Chemicals and plastics; Energy; Forestry and
wood; Fuels; Infrastructures; Metals; Pulp and paper; Textiles; Transport; Waste
management and recycling; Water supply.

That grouping is documentation structure, not a field on a dataset. The classification a
dataset actually carries is ISIC for the activity and CPC for the product, described
below.

## The classifications a dataset carries

- **ISIC**, the United Nations International Standard Industrial Classification, is the
  system for classifying economic data that ecoinvent adopted for version 3, and an
  activity class is a group of activities filed under one heading of such a
  classification (source: ecoinvent-kb-glossary).
- **CPC**, the Central Product Classification, is a comprehensive classification of goods
  and services based on the physical characteristics of the goods or the nature of the
  service, defined so that each type is normally produced by only one ISIC activity;
  ecoinvent uses it to classify products, that is, intermediate exchanges (source:
  ecoinvent-kb-glossary).

So the pairing is deliberate: ISIC classifies the activity, CPC classifies what comes out
of it, and the two classifications are designed to line up. The ISIC sections and what
they stand for are listed in
[../../core/sectors/crosswalk.md](../../core/sectors/crosswalk.md) (source:
unsd-isic-rev4).

## Read against GICS

The eleven GICS sectors (source: gics-2023), with the ecoinvent documentation sectors
that most often serve a study in each. Read a row as "a study here usually draws on
these", never as an exclusive partition.

| GICS sector | ecoinvent sectors it mainly draws on |
|---|---|
| Energy | Fuels, Energy, Infrastructures |
| Materials | Chemicals and plastics, Metals, Forestry and wood, Pulp and paper, Building and construction |
| Industrials | Transport, Infrastructures, Metals, Waste management and recycling |
| Consumer Discretionary | Textiles, Batteries and electronics, Transport, Accommodation services |
| Consumer Staples | Agriculture, fishery and animal husbandry, Chemicals and plastics |
| Health Care | Chemicals and plastics, Batteries and electronics, Waste management and recycling |
| Financials | none; the sector has no inventory counterpart |
| Information Technology | Batteries and electronics, Energy, Chemicals and plastics |
| Communication Services | Batteries and electronics, Energy, Infrastructures |
| Utilities | Energy, Water supply, Waste management and recycling, Infrastructures |
| Real Estate | Building and construction, Infrastructures, Energy |

The comparison worth making is with
[../../bafu/knowledge/sector-coverage.md](../../bafu/knowledge/sector-coverage.md): both
databases are background databases with no counterpart for Financials, but ecoinvent is
global and covers consumer-facing and service sectors that BAFU does not, while BAFU is
Swiss-specific and deeper in the built environment and in national energy supply.

## Geography

Geography is a first-class part of a dataset's identity, not a label: "the term geography
refers to a geographic region in the context of ecoinvent", which can be the whole world
(GLO), a region of several countries (for example RER for Europe), a single country, or a
smaller area such as a province, and activities are always valid for a certain geography
(source: ecoinvent-kb-glossary). ecoinvent publishes the list of geographies present in
version 3, with name, short name, id and coordinates (source: ecoinvent-kb-glossary).

Rest of the World (RoW) fills the gap between a global dataset and the specific ones: it
is generated during linking wherever both exist for the same activity, time period and
scenario, and it is activity-specific rather than a fixed region (source:
ecoinvent-kb-glossary).

Geographical expansion is a large part of what a yearly release does; version 3.12 for
example broadened the regional coverage of several polymer chains and added a national
forestry dataset set (source: ecoinvent-v3.12-release-notes). See
[versions-and-provenance.md](versions-and-provenance.md).

## Related pages

- [../../core/sectors/crosswalk.md](../../core/sectors/crosswalk.md): GICS against ISIC and the other taxonomies in this wiki.
- [schemas-and-nomenclature.md](schemas-and-nomenclature.md): where a classification is stored on a dataset.
- [methodology.md](methodology.md): what a dataset is, before it is classified.
