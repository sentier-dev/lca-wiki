---
title: EF, PEF and OEF (Recommendation (EU) 2021/2279)
type: standard
summary: "The Environmental Footprint methods, their category rules, the 16 impact categories and what makes a data set EF compliant."
audience: [P1, P2]
updated: 2026-09-22
sources: [eu-recommendation-2021-2279, ef-methods-lca, sentier-methods-repo, ef-compliant-data-guide-2.0, ef-data-guide-3.1-addendum, eplca-developer-ef, ef-transitional-guidance-2026, ilcd-2010]
---

# EF, PEF and OEF (Recommendation (EU) 2021/2279)

Commission Recommendation (EU) 2021/2279 of 15 December 2021 "on the use of the
Environmental Footprint methods to measure and communicate the life cycle environmental
performance of products and organisations" is the current legal basis of the
Environmental Footprint (EF) family. It was published in OJ L 471 of 30 December 2021 and
replaces Commission Recommendation 2013/179/EU (eu-recommendation-2021-2279, recital 19).

The Recommendation defines the Product Environmental Footprint (PEF) method, laid down in
its Annex I, and the Organisation Environmental Footprint (OEF) method, laid down in its
Annex III (eu-recommendation-2021-2279, section 2). It is a recommendation, not a
regulation: it is addressed to Member States and to private and public organisations that
measure or communicate life cycle environmental performance, and it does not apply where
EU mandatory legislation prescribes a different calculation method, although EU
legislation may refer to it (eu-recommendation-2021-2279, section 1).

## Scope

**PEFCR and OEFSR.** Product Environmental Footprint Category Rules are
"product category specific, life cycle based rules that complement general methodological
guidance for PEF studies by providing further specification at the level of a specific
product category", and "if a PEFCR exists, this should be used". Organisation
Environmental Footprint Sector Rules do the same at sector level
(eu-recommendation-2021-2279, section 2). The 2013 to 2018 pilot phase finalised 19
PEFCRs and 2 OEFSRs (eu-recommendation-2021-2279, recital 5).

**What the pilot changed.** The Recommendation itself lists the technical updates it
incorporates: the materiality principle ("act where it matters"); benchmarks defined as
the EF profile of the average production on the market, the representative product or
organisation; agreed modelling of climate change, electricity, transport, infrastructure
and equipment, packaging, end of life and agriculture; the inclusion of normalisation and
weighting; guidelines on biodiversity as additional environmental information; improved
impact assessment methods for the toxicity-related categories, water use, land use,
resources and particulate matter; characterisation factors based on REACH data; and a
guide on Environmental Footprint compliant datasets
(eu-recommendation-2021-2279, recital 6).

**What it is based on.** The EF methods take LCA, standardised with ISO 14040/44, as
their basis and add a holistic framework for decision making (ef-methods-lca). Their data
layer is the ILCD format; see [ilcd-format.md](ilcd-format.md).

## What it requires

### The 16 EF impact categories

An EF study reports all of them (ef-methods-lca; ef-compliant-data-guide-2.0,
section 5.2.17):

| Impact category | Indicator unit |
|---|---|
| Climate change | kg CO2 eq |
| Ozone depletion | kg CFC-11 eq |
| Human toxicity, cancer | CTUh |
| Human toxicity, non-cancer | CTUh |
| Particulate matter | disease incidence |
| Ionising radiation | kBq U-235 eq |
| Photochemical ozone formation | kg NMVOC eq |
| Acidification | mol H+ eq |
| Eutrophication, terrestrial | mol N eq |
| Eutrophication, freshwater | kg P eq |
| Eutrophication, marine | kg N eq |
| Ecotoxicity, freshwater | CTUe |
| Land use | points |
| Water use | m3 related to local scarcity |
| Resource use, fossils | MJ |
| Resource use, minerals and metals | kg Sb eq |

**Sixteen categories, more than sixteen rows in an implementation.** A delivered EF 3.1
characterisation table usually carries more entries than this, because several categories
also ship their sub-indicators as rows of their own: climate change as biogenic, fossil,
and land use and land use change, and human toxicity cancer, human toxicity non-cancer
and freshwater ecotoxicity each as organics and inorganics. The EF 3.1 tables the Sentier
platform delivers hold 25 rows for that reason, sixteen headline categories and nine
sub-indicators, and summing all of them double counts; the table is in
[../../sentier/modules/sentier-methods/datasets.md](../../sentier/modules/sentier-methods/datasets.md)
and the trap is spelled out in
[../../sentier/modules/sentier-methods/gotchas.md](../../sentier/modules/sentier-methods/gotchas.md)
(sentier-methods-repo). The reportable set is the sixteen above.

### EF reference packages

The reference package is released by the Commission as a ZIP in ILCD format, with folders
for `contacts`, `external_docs`, `flowproperties`, `flows`, `lciamethods`, `processes`,
`sources` and `unitgroups`, plus `Schemas`, `Stylesheets`, a validation profile, a
Look@LCI configuration file and a converter from the previous version; each release comes
with a content spreadsheet and a change log
(ef-compliant-data-guide-2.0, chapter 2). EF 2.0 (June 2018) underpins the PEFCRs and
OEFSRs of the pilot phase; EF 3.0 (December 2018) underpins those developed in the
transition phase (ef-compliant-data-guide-2.0, chapter 2). EF 3.1 was released in July
2022 and updates characterisation factors for climate change (IPCC 2021), acidification,
freshwater ecotoxicity, photochemical ozone formation and human toxicity cancer and
non-cancer; the "metals" sub-indicators were merged into the corresponding "inorganics"
sub-indicators (ef-data-guide-3.1-addendum). Reference package 3.1 is the version offered
on the LCDN developer tools page (eplca-developer-ef).

### EF-compliant data sets

The *Guide for EF compliant data sets*, Version 2.0, EUR 30175 EN, is the operative
document (ef-compliant-data-guide-2.0). It requires, among other things:

- The ILCD process data set types and, for EF partly disaggregated at level-1, the
  "Partly terminated system" type (ef-compliant-data-guide-2.0, chapter 1).
- Declared metadata: type of process, geographical representativeness, reference year,
  default parameter values, regionalised and duplicated elementary flows, allocation,
  element content, Circular Footprint Formula parameters, modelling constants, the LCA
  methodology report, data sources, the supported impact assessment methods, compliance
  declarations, LCIA results, and data quality criteria and rating
  (ef-compliant-data-guide-2.0, section 5.2).
- Completeness: all 16 EF impact categories shall be covered in the data set
  (ef-compliant-data-guide-2.0, section 5.2.17).
- Update procedures distinguishing changes to the core content of a data set, changes that
  do not affect it, and updates forced by a new EF reference package, with the changes
  announced on the node's landing page (ef-compliant-data-guide-2.0, chapter 3).
- Reviewer eligibility, reviewer types and a review report template
  (ef-compliant-data-guide-2.0, chapter 8).

The compliance declaration and the reference package and nomenclature sections were
updated by the EF 3.1 addendum, which replaces sections 2 and 5.2.15 of the 2020 guide
(ef-data-guide-3.1-addendum).

### ILCD-EL and the LCDN

Two pieces of infrastructure sit under the EF. The ILCD Entry-Level (ILCD-EL) scheme
specifies, per field, whether it is mandatory, recommended or optional
(eplca-developer-ef). The Life Cycle Data Network (LCDN) was launched in 2014 to provide
a globally usable infrastructure for publishing quality-assured LCA data sets
(eplca-developer-ef); the guide's chapter 7 covers how to structure and document nodes
and data stocks (ef-compliant-data-guide-2.0, chapter 7).

### Transitional guidance, 2026

Because EF-compliant data sets remain scarce, the Commission issued transitional guidance
on 14 July 2026 for PEF and OEF studies carried out without a valid PEFCR or OEFSR: use
EF-compliant data sets where they exist, otherwise ILCD-EL compliant data sets, and only
otherwise omit the process. A study may still be considered EF compliant where
non-EF-compliant data sets exceed 10 % of the overall score, provided a disclaimer notes
the limits on comparability (ef-transitional-guidance-2026). Studies covered by an
existing PEFCR or OEFSR follow that rule instead.

## How it relates to other documents

- **ISO 14040/44.** EF builds on them and narrows them; see
  [iso-14040-14044.md](iso-14040-14044.md) and ef-methods-lca.
- **ILCD Handbook and format.** EF uses the ILCD format and the ILCD nomenclature and
  conventions document; the EF guide points at the handbook's nomenclature document and
  recommends the EF flow list even for ILCD-compliant data sets
  (ef-compliant-data-guide-2.0, chapter 1 footnotes; ilcd-2010, chapter 7.4.5). See
  [ilcd-handbook.md](ilcd-handbook.md) and [ilcd-format.md](ilcd-format.md).
- **EN 15804.** A separate, CEN-maintained rule set for construction products, not an EF
  category rule; see [en-15804.md](en-15804.md).

## What it means for this wiki

EF is the case where most of the method decisions a `core/concepts/` page describes have
already been made for the practitioner. The pages most affected are
[characterization-normalisation-weighting.md](../concepts/characterization-normalisation-weighting.md),
[data-quality.md](../concepts/data-quality.md),
[cut-off-criteria.md](../concepts/cut-off-criteria.md) and
[allocation-and-multifunctionality.md](../concepts/allocation-and-multifunctionality.md).
