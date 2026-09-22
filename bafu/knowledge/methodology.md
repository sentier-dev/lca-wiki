---
title: BAFU methodology
type: database
summary: "How the BAFU database is modelled: unit processes, one linked set, data quality requirements and critical review."
audience: [P1, P2]
updated: 2026-09-21
sources: [bafu-2026-release, esu-bafu-database, openlca-bafu-2026-notes, bafu-lca-methodology-2021, ecoinvent-kb-impact-assessment]
related: [format.md, versions-and-provenance.md, methods.md]
---

# BAFU methodology

What the publisher and the release itself say about how the inventories are modelled.
This page is deliberately thin in places: BAFU's own methodology reports travel inside
the documentation component of the release rather than on a public web page, so several
questions below are answered "not sourced yet" and are carried on
[../roadmap.md](../roadmap.md).

## The unit of the database

The database is a set of unit process datasets. In the ecoSpold v1 component of the
BAFU:2026 v1 release each dataset is one XML file holding one process, with its reference
function, its geography, its time period and its list of exchanges (source:
bafu-2026-release). The reference function carries the amount, the unit, the category and
the sub-category the process belongs to, a name, a local name in German and a flag saying
whether the dataset relates to a product or is an infrastructure process (source:
bafu-2026-release).

## One linked set, not a choice of system models

The release ships a single body of data. There is no version of the release per system
model and no unlinked variant to link yourself: the four components announced for
BAFU:2026 v1 are the pre-calculated LCIA results, the documentation, the ecoSpold v1
files and the openLCA package, and none of them is a system-model variant (source:
openlca-bafu-2026-notes). A practitioner coming from
[../../ecoinvent/knowledge/system-models.md](../../ecoinvent/knowledge/system-models.md)
should expect that difference: the modelling choices are made by the dataset authors and
are fixed in the published data.

## System boundaries and time

Every dataset states the period its data represents, as a start date and an end date in
the process information, and a geography as a location code (source: bafu-2026-release).
The release carries 583 location entries with codes ranging from single countries through
regional aggregates to electricity-specific and oversea cut-outs (source:
bafu-2026-release). Beyond that, the boundary conventions of an individual dataset are
stated in that dataset's own documentation and in the report it references, not in a
single database-wide statement this wiki could cite.

## Allocation and multifunctionality

Not sourced yet. The public release pages do not state a database-wide allocation rule,
and the per-dataset rules live in the expert reports that ship with the documentation
component. Reading those reports and writing this section is the first item on
[../roadmap.md](../roadmap.md).

## Data quality and review

Datasets in the database are stated to comply with the BAFU data quality requirements
document referred to as DQRv2:2023, and most of them are stated to have undergone a
critical review for compatibility with ISO 14040 (source: esu-bafu-database). The
ecoSpold v1 metadata of a dataset carries the review trail in its own fields: a data
entry person, a data generator and publication block, a validation block with the
validator, and a source block naming the first author, the additional authors, the
publisher, the year and the title of the report the dataset comes from (source:
bafu-2026-release).

## Naming conventions

Process names in the release follow the older Swiss and ecoinvent version 2 style: a
product or activity phrase, optional qualifiers, and a location suffix, for example a
chemical "at plant" with a region code appended (source: bafu-2026-release). Disposal
datasets are named with a leading "Disposal, " phrase (source: bafu-2026-release). This
matters when mapping the database onto a tool that expects version 3 style activity and
product names split apart; see
[../../ecoinvent/knowledge/schemas-and-nomenclature.md](../../ecoinvent/knowledge/schemas-and-nomenclature.md)
for the contrast.

## The method BAFU publishes alongside the data

BAFU is also the publisher of the Ecological Scarcity method, whose current edition is
"Swiss Eco-Factors 2021 according to the Ecological Scarcity Method: methodological
fundamentals and their application in Switzerland", issued by the Federal Office for the
Environment in 2021 (source: bafu-lca-methodology-2021). The method is a distance to
target method: it weights emissions and resource use against the current situation and
against political targets, and it was first developed for Switzerland by the same office
in 1990 (source: ecoinvent-kb-impact-assessment). The eco-points it produces are the UBP
indicators that the release's own LCIA results carry; which indicators those are is in
[methods.md](methods.md).

## Related pages

- [format.md](format.md): the two file formats the release ships in.
- [versions-and-provenance.md](versions-and-provenance.md): release history and where the inventory data comes from.
- [methods.md](methods.md): the impact assessment methods published with the release.
- [../roadmap.md](../roadmap.md): what this page still owes.
