---
title: ecoinvent impact assessment methods
type: database
summary: "The LCIA methods implemented in ecoinvent, by name, and where the implementation report and the flow mappings are published."
audience: [P1, P2]
updated: 2026-09-21
sources: [ecoinvent-kb-impact-assessment, ecoinvent-kb-activities-products, ecoinvent-kb-system-models]
related: [system-models.md, schemas-and-nomenclature.md]
---

# ecoinvent impact assessment methods

Names only. The characterisation factors, the implemented values and the LCIA scores for
any dataset are licensed content and appear nowhere on this branch. What is public, and
what this page records, is which methods ecoinvent implements, where the implementation
is documented, and the two conditions attached to using them.

## How LCIA sits in the database

ecoinvent describes itself as a background database whose focus is the unit processes and
the cumulative inventories built from them, with LCIA scores provided as well (source:
ecoinvent-kb-activities-products). A score is the cumulative list of elementary exchanges
multiplied by a method's characterisation factors, and the glossary counts them per
indicator and per dataset: one indicator for one dataset is one LCIA score (source:
ecoinvent-kb-impact-assessment).

Implementing a method is not only arithmetic. It requires mapping the method's elementary
flows onto ecoinvent's own flow names, and ecoinvent publishes those mappings on GitHub
so that method developers, software developers and scientists can review them (source:
ecoinvent-kb-impact-assessment). A method developer who wants their method implemented
can submit it through the ecoinvent LCIA method input format (source:
ecoinvent-kb-impact-assessment).

## The methods implemented

As listed by the Knowledge Base (source: ecoinvent-kb-impact-assessment):

- **IPCC**, the climate methods based on the Intergovernmental Panel on Climate Change
  assessment reports, carrying global warming and global temperature change potentials.
  The Knowledge Base keeps a separate guidance page on which IPCC method to use.
- **CML**, the midpoint method of the Institute of Environmental Sciences at Leiden,
  first published in 1992 and updated in 2016.
- **Crustal Scarcity Indicator**, developed in 2020 at Chalmers University, assessing
  mineral resource use from crustal concentrations.
- **Cumulative Energy Demand (CED)**, based on the method ecoinvent published for version
  1.01 in 1997, assessing primary energy use.
- **Cumulative Exergy Demand (CExD)**, assessing the quality of energy demand, including
  the exergy of non-energetic materials.
- **Ecological Footprint**, assessing direct land occupation together with the land
  needed to absorb fossil and nuclear waste.
- **Ecological Scarcity**, the Swiss distance-to-target method developed by the Federal
  Office for the Environment in 1990 and updated in 2021. The same method is the one
  published with the BAFU database; see
  [../../bafu/knowledge/methods.md](../../bafu/knowledge/methods.md).
- **Ecosystem Damage Potential**, developed at ETH in 1997, assessing land occupation and
  transformation.
- **EF**, the Environmental Footprint method maintained by the European Commission, with
  versions 3.0 and 3.1 implemented.
- **EF EN15804**, the EPD-oriented pairing of EF characterisation factors with the
  EN15804 and ISO21930 inventory indicators.
- **EPS**, Environmental Priority Strategies, first released in 1990.
- **IMPACT World+ v2.1, footprint version**, developed by CIRAIG, the University of
  Michigan, Quantis, DTU and their partners.
- **Inventory results and indicators**, the successor of the version 2 "selected LCI
  results" sets; inventory quantities rather than impacts.
- **ReCiPe**, from RIVM, Radboud University and Leiden, with midpoint and endpoint
  levels.
- **TRACI**, published by the United States Environmental Protection Agency.
- **USEtox**, developed under UNEP and SETAC for toxicity and ecotoxicity.

Which methods and which versions of them are in a given database version is stated in the
database overview file for that version (source: ecoinvent-kb-impact-assessment).

## The two conditions

**The EN15804 methods go with the EN15804 system model, and only with it.** The
Knowledge Base states this as an important note (source: ecoinvent-kb-impact-assessment).
The reason is structural rather than editorial: the EN15804 system model moves the
cut-off point between the primary and the secondary system, and the indicators are
calculated against that point (source: ecoinvent-kb-system-models).

**A score is meaningless without its system model and its version.** The database is
published per system model, so the same activity has a different cumulative inventory and
therefore a different score under cut-off, APOS and consequential. The citation ecoinvent
prescribes for a dataset includes both; see
[versions-and-provenance.md](versions-and-provenance.md).

## Where the documentation is

The LCIA implementation report is the document describing how each method is implemented.
It is downloadable per database version from the files section of ecoQuery, under the
supporting documents for that version, and requires a licence to reach (source:
ecoinvent-kb-impact-assessment). This wiki names it and does not reproduce it.

## Related pages

- [system-models.md](system-models.md): why a score depends on the model.
- [schemas-and-nomenclature.md](schemas-and-nomenclature.md): the flow names the factors are mapped onto.
- [access-and-licence.md](access-and-licence.md): why no numbers appear here.
