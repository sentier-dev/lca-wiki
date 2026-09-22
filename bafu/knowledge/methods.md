---
title: BAFU impact assessment methods
type: database
summary: "The three methods published with a BAFU release: IPCC 2021, Ecological Scarcity 2021 (UBP) and EF 3.1."
audience: [P1, P2]
updated: 2026-09-22
sources: [bafu-2026-release, openlca-bafu-2026-notes, bafu-lca-methodology-2021, ecoinvent-kb-impact-assessment, ef-methods-lca, sentier-methods-repo, sentier-brightway-repo]
related: [methodology.md, schemas-and-nomenclature.md]
---

# BAFU impact assessment methods

A BAFU release ships pre-calculated LCIA results as one of its four components. For
BAFU:2026 v1 the methods covered are IPCC 2021, Ecological Scarcity 2021 (UBP2021) and
Environmental Footprint 3.1 (source: openlca-bafu-2026-notes). The Info sheet of the
results workbook repeats the same three (source: bafu-2026-release).

The workbook holds one row per process and one column per indicator, grouped under a
banner row naming the method. This page lists the indicator names and their units as the
workbook writes them. It lists no values: which indicators exist is a description of the
release, the numbers are the release.

## IPCC 2021

One indicator: `GWP 100`, in kg CO2-equivalent (source: bafu-2026-release).

## Ecological Scarcity 2021

Twenty-one columns, all in eco-points (UBP): twenty impact categories plus a `Total`
(source: bafu-2026-release). The categories are:

Biotic Resources; Carcinogenic substances into air; Energy resources; Global warming;
Heavy metals into air; Heavy metals into soil; Heavy metals into water; Land use; Main
air pollutants and PM; Mineral resources; Noise; Ozone layer depletion; Pesticides into
soil; POP into water; Radioactive substances into air; Radioactive substances into water;
Radioactive waste to deposit; Waste, non radioactive; Water pollutants; Water resources,
evaporated.

This is BAFU's own method. Its current edition is "Swiss Eco-Factors 2021 according to
the Ecological Scarcity Method: methodological fundamentals and their application in
Switzerland", published by the Federal Office for the Environment in 2021 (source:
bafu-lca-methodology-2021). It is a distance to target method: eco-factors weight
emissions and resource use against the current Swiss situation and against political
targets, and the method was first developed for Switzerland by the same office in 1990
(source: ecoinvent-kb-impact-assessment). Two consequences show up in the data:

- Some of its categories are not substance emissions at all. `Noise` and
  `Radioactive waste to deposit` are scored from the immaterial and waste compartments
  described in [schemas-and-nomenclature.md](schemas-and-nomenclature.md).
- A single weighted total in eco-points is part of the published output, which most
  other methods do not provide.

## Environmental Footprint 3.1

Twenty-five columns, the EF 3.1 indicator set as the workbook names them, with the units
in brackets (source: bafu-2026-release):

Acidification [mol H+ eq]; Climate change [kg CO2 eq]; Climate change, biogenic [kg CO2
eq]; Climate change, fossil [kg CO2 eq]; Climate change, land use [kg CO2 eq];
Ecotoxicity freshwater [CTUe]; Ecotoxicity freshwater, organics [CTUe]; Ecotoxicity
freshwater, inorganics [CTUe]; Eutrophication freshwater [kg P eq]; Eutrophication
marine [kg N eq]; Eutrophication terrestrial [mol N eq]; Human toxicity cancer [CTUh];
Human toxicity cancer, inorganics [CTUh]; Human toxicity cancer, organics [CTUh]; Human
toxicity non-cancer [CTUh]; Human toxicity non-cancer, inorganics [CTUh]; Human toxicity
non-cancer, organics [CTUh]; Ionising radiation, human health [kBq U235 eq]; Land use
[dimensionless, pt]; Ozone depletion [kg CFC11 eq]; Particulate matter [disease
incidence]; Photochemical ozone formation, human health [kg NMVOC eq]; Resource use
fossils [MJ net calorific]; Resource use minerals and metals [kg Sb eq]; Water use [m3
world eq].

That list is the EF impact categories as the European Commission defines them, with the
sub-indicators that split climate change, toxicity and ecotoxicity into their components
(source: ef-methods-lca). The EF method itself is documented in
[../../core/standards/](../../core/standards/); this page records only that a BAFU
release publishes results for it.

One caveat: the elementary flow names in the release are BAFU's own, not the EF reference
flow list (source: bafu-2026-release). The EF results in the workbook were produced by
BAFU's own mapping of its flows onto EF characterisation factors. If you characterise the
inventory yourself with an EF reference package, expect your numbers to differ from the
workbook wherever that mapping differs from yours.

## What ships inside the openLCA package

The openLCA package carries its own impact method and category entities rather than only
the workbook results: in BAFU:2026 v1 the top-level impact-category groups are
`Ecological Scarcity 2021` and `openLCA LCIA Categories 2.8.0 adapted`, under an impact
method named `openLCA LCIA Methods 2.8.0 adapted` (source: bafu-2026-release). So the
package gives a Swiss method plus a general-purpose adapted method pack, while the
workbook gives IPCC 2021, Ecological Scarcity 2021 and EF 3.1. The two are not the same
set, and a study should say which one it used.

## Only one of the three reaches Brightway

The three methods above are published as pre-calculated results. Recalculating with them
is a different matter, and only Environmental Footprint 3.1 can be done today: the Sentier
loader installs EF 3.1 and nothing else, because the characterisation factors it reads
come from
[../../sentier/modules/sentier-methods/](../../sentier/modules/sentier-methods/), where
EF 3.1 is delivered in full while IPCC 2021 and ReCiPe 2016 are declared folders holding a
metadata file and no factors (source: sentier-methods-repo). Ecological Scarcity 2021 is
not among the declared datasources at all, and its eco-factors are not redistributed here.

So a practitioner has two different things:

- **Published results**, for all three methods, read from the workbook. They apply to the
  processes as BAFU calculated them and cannot be recomputed for a new system.
- **Recalculated scores**, for EF 3.1 only, from an installed database. See
  [../use-cases/install-into-brightway.md](../use-cases/install-into-brightway.md) and
  the loader's own pages (source: sentier-brightway-repo).

Anyone who needs an eco-point total for a system BAFU did not publish has to obtain the
Ecological Scarcity 2021 eco-factors from their publisher and build the method themselves;
no route in this wiki does it for them.

## Related pages

- [format.md](format.md): where the results workbook sits in a release.
- [schemas-and-nomenclature.md](schemas-and-nomenclature.md): the flow list the factors apply to.
