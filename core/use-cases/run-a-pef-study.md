---
title: Run a PEF study
type: use-case
summary: "Carry out a Product Environmental Footprint study under Recommendation (EU) 2021/2279: PEFCR or transitional guidance, EF 3.1, all 16 categories and a single overall score."
audience: [P1]
updated: 2026-09-22
sources: [eu-recommendation-2021-2279, ef-methods-lca, ef-pef-method, ef-compliant-data-guide-2.0, ef-data-guide-3.1-addendum, ef-transitional-guidance-2026, eplca-developer-ef, ilcd-2010, lca-wiki-editorial]
verified: no
related: [../standards/ef-pef.md, ../concepts/characterization-normalisation-weighting.md, ../concepts/cut-off-criteria.md, choose-a-background-database.md, map-flows-between-nomenclatures.md]
---

# Run a PEF study

**Persona:** P1 practitioner producing a Product Environmental Footprint for a European
market claim · **GICS sector:** any; the PEFCR list is concentrated in Consumer Staples
and Consumer Discretionary, see [../sectors/](../sectors/)

## Goal

Produce a Product Environmental Footprint study that conforms to Commission
Recommendation (EU) 2021/2279: the PEF method of its Annex I, applied through the
[PEFCR](../../vocabulary.md#pefcr) for the product category where one exists, reported
across all 16 EF impact categories, with normalisation and weighting included as part of
the method rather than as an option
(eu-recommendation-2021-2279, sections 1 and 2; ef-methods-lca).

The Recommendation is a recommendation, not a regulation. It is addressed to Member
States and to private and public organisations that measure or communicate life cycle
environmental performance, and it does not apply where EU mandatory legislation
prescribes a different calculation method, although EU legislation may refer to it
(eu-recommendation-2021-2279, section 1). Standard page:
[../standards/ef-pef.md](../standards/ef-pef.md).

## Prerequisites

- **A decision on which rule set governs.** If a PEFCR exists for the product category,
  it should be used; the same holds for an OEFSR at sector level
  (eu-recommendation-2021-2279, section 2). If none exists, the study follows the PEF
  method plus the 2026 transitional guidance (ef-transitional-guidance-2026).
- **The EF reference package.** Reference package 3.1 is the version offered on the LCDN
  developer tools page (eplca-developer-ef). It ships as a ZIP in ILCD format with folders
  for `contacts`, `external_docs`, `flowproperties`, `flows`, `lciamethods`, `processes`,
  `sources` and `unitgroups`, plus `Schemas`, `Stylesheets`, a validation profile, a
  Look@LCI configuration file and a converter from the previous version, with a content
  spreadsheet and a change log (ef-compliant-data-guide-2.0, chapter 2).
- **Background data, preferably EF compliant.** See
  [choose-a-background-database.md](choose-a-background-database.md) for what "EF
  compliant" costs and what to do when it is unavailable.
- **A flow list that matches the method.** The EF flow list is recommended even for
  ILCD-compliant data sets (ef-compliant-data-guide-2.0, chapter 1, footnote 3), so an
  inventory written against another nomenclature has to be bridged:
  [map-flows-between-nomenclatures.md](map-flows-between-nomenclatures.md).
- **A verifier**, where the PEFCR or the intended communication requires one
  (ef-compliant-data-guide-2.0, chapter 8 sets out reviewer eligibility, reviewer types
  and a review report template).

## Steps

1. **Check the PEFCR list first.** Product Environmental Footprint Category Rules are
   "product category specific, life cycle based rules that complement general
   methodological guidance for PEF studies by providing further specification at the level
   of a specific product category", and "if a PEFCR exists, this should be used"
   (eu-recommendation-2021-2279, section 2). The 2013 to 2018 pilot phase finalised 19
   PEFCRs and 2 OEFSRs (eu-recommendation-2021-2279, recital 5); the Commission maintains
   the current list, which names new PEFCRs, PEFCRs in development and PEFCRs in revision
   (ef-pef-method). A rule outside that list is either outdated or a private initiative
   (ef-pef-method).

2. **If a PEFCR applies, read it as the scope.** It fixes the functional unit, the system
   boundary, the benchmark, the data quality requirements and the reporting template, so
   the practitioner spends far less time defining scope and far more time demonstrating
   conformity with a rule someone else wrote
   ([../concepts/goal-and-scope.md](../concepts/goal-and-scope.md);
   eu-recommendation-2021-2279, section 2).

3. **If no PEFCR applies, follow the transitional guidance for data.** Because
   EF-compliant data sets remain scarce, the Commission issued transitional guidance on
   14 July 2026 for PEF and OEF studies carried out without a valid PEFCR or OEFSR: use
   EF-compliant data sets where they exist, otherwise ILCD-EL compliant data sets, and
   only otherwise omit the process. A study may still be considered EF compliant where
   non-EF-compliant data sets exceed 10 % of the overall score, provided a disclaimer
   notes the limits on comparability (ef-transitional-guidance-2026). Studies covered by
   an existing PEFCR or OEFSR follow that rule instead. Concept page:
   [../concepts/cut-off-criteria.md](../concepts/cut-off-criteria.md).

4. **Apply the agreed modelling rules.** The Recommendation lists what the pilot phase
   settled: the materiality principle, "act where it matters"; benchmarks defined as the
   EF profile of the average production on the market, the representative product or
   organisation; and agreed modelling of climate change, electricity, transport,
   infrastructure and equipment, packaging, end of life and agriculture
   (eu-recommendation-2021-2279, recital 6). These are the places where a PEF model
   differs most visibly from a free-standing ISO study.

5. **Build the foreground against the EF flow list.** The reference package ships the flow
   list as ILCD XML in its `flows` folder, alongside `flowproperties` and `unitgroups`
   (ef-compliant-data-guide-2.0, chapter 2). EF data sets also declare regionalised and
   duplicated elementary flows explicitly
   (ef-compliant-data-guide-2.0, sections 5.2.6 and 5.2.7). Concept page:
   [../concepts/elementary-and-intermediate-flows.md](../concepts/elementary-and-intermediate-flows.md);
   standard page:
   [../standards/glad-and-nomenclatures.md](../standards/glad-and-nomenclatures.md).

6. **Link the background, and record each dataset's compliance class.** The three-step
   hierarchy of step 3 is only auditable if every background dataset carries a label: EF
   compliant, ILCD-EL compliant, or neither (ef-transitional-guidance-2026). Install and
   relink with
   [../../sentier/modules/sentier-brightway/use-cases/](../../sentier/modules/sentier-brightway/use-cases/),
   and bridge nomenclatures with
   [../../sentier/modules/sentier-mappings/use-cases/](../../sentier/modules/sentier-mappings/use-cases/).

7. **Characterise across all 16 EF impact categories.** An EF study reports all of them,
   and an EF-compliant data set must cover all 16
   (ef-methods-lca; ef-compliant-data-guide-2.0, section 5.2.17). The set and its
   indicator units are tabulated on
   [../standards/ef-pef.md](../standards/ef-pef.md). EF 3.1 was released in July 2022 and
   updates characterisation factors for climate change (IPCC 2021), acidification,
   freshwater ecotoxicity, photochemical ozone formation and human toxicity cancer and
   non-cancer, and merged the "metals" sub-indicators into the corresponding "inorganics"
   sub-indicators (ef-data-guide-3.1-addendum). Calculation module:
   [../../brightway/modules/bw2calc/use-cases/](../../brightway/modules/bw2calc/use-cases/).

8. **Normalise and weight from the package, not by choice.** The EF methods include
   normalisation and weighting as part of the method, a change introduced during the pilot
   phase (eu-recommendation-2021-2279, recital 6). The reference package ships the
   characterisation factors, with the normalisation and weighting configuration in the
   package's configuration file (ef-compliant-data-guide-2.0, chapter 2). Concept page:
   [../concepts/characterization-normalisation-weighting.md](../concepts/characterization-normalisation-weighting.md).

9. **Produce the single overall score and keep the 16 categories beside it.** The
   [single overall score](../../vocabulary.md#single-overall-score) is what the EF system
   is built to deliver, and it is also what makes the study unusable as an ISO
   comparative assertion disclosed to the public, where no numerical, value-based
   weighting may be published (ilcd-2010, chapter 8.4). The two systems are not
   interchangeable, and a study has to say which one it is reporting under
   (lca-wiki-editorial).

10. **Document the metadata the EF data guide requires.** For data sets the study itself
    publishes: type of process, geographical representativeness, reference year, default
    parameter values, regionalised and duplicated elementary flows, allocation, element
    content, Circular Footprint Formula parameters, modelling constants, the LCA
    methodology report, data sources, the supported impact assessment methods, compliance
    declarations, LCIA results, and data quality criteria and rating
    (ef-compliant-data-guide-2.0, section 5.2). See
    [document-data-quality-and-uncertainty.md](document-data-quality-and-uncertainty.md).

11. **Review, and say what was not EF compliant.** Chapter 8 of the guide covers reviewer
    eligibility, reviewer types and the review report template
    (ef-compliant-data-guide-2.0, chapter 8). Where non-EF-compliant data exceeds 10 % of
    the overall score, the disclaimer required by the transitional guidance goes in the
    report, not in a footnote (ef-transitional-guidance-2026).

## What EF fixes that ISO leaves open

EF is the case where most of the method decisions a `core/concepts/` page describes have
already been made for the practitioner
([../standards/ef-pef.md](../standards/ef-pef.md)).

| Decision | Under ISO and ILCD | Under EF |
|---|---|---|
| Impact categories | selected in the scope phase | the fixed set of 16 (ef-methods-lca) |
| Characterisation factors | from the chosen LCIA method | from the EF reference package (ef-compliant-data-guide-2.0, chapter 2) |
| Normalisation and weighting | optional, decided in scope (ilcd-2010, chapter 6.7.7) | part of the method (eu-recommendation-2021-2279, recital 6) |
| Data set requirements | data quality requirements per study (ilcd-2010, chapter 12.3) | a declared per-data-set rating and the metadata list of section 5.2 (ef-compliant-data-guide-2.0) |
| Missing data | cut off or estimated (ilcd-2010, chapter 6.6.3) | the three-step hierarchy, omission last (ef-transitional-guidance-2026) |
| Functional unit and boundary | defined by the practitioner | defined by the PEFCR where one exists (eu-recommendation-2021-2279, section 2) |

## Expected output

- **A PEF report** in the PEFCR's template where one exists, otherwise following the PEF
  method of Annex I, stating the reference package version, the PEFCR version and the
  compliance claim (eu-recommendation-2021-2279, section 2).
- **An inventory** written against the EF flow list, with regionalised and duplicated
  elementary flows declared explicitly
  (ef-compliant-data-guide-2.0, sections 5.2.6 and 5.2.7).
- **An impact profile of 16 characterised results**, each in the indicator unit the method
  declares, plus the normalised results and the weighted single overall score
  (ef-methods-lca; ef-compliant-data-guide-2.0, section 5.2.17).
- **A data compliance table**: per background dataset, whether it is EF compliant, ILCD-EL
  compliant or neither, and its share of the overall score, which is what the 10 %
  threshold is tested against (ef-transitional-guidance-2026).
- **A data quality rating** per data set, in the form the EF guide requires
  (ef-compliant-data-guide-2.0, sections 5.2.3, 5.2.4 and 4).
- **A review report** on the guide's template, where review applies
  (ef-compliant-data-guide-2.0, chapter 8).

## Pitfalls

- **Reporting a PEF single score as an ISO comparative assertion.** The two rule sets are
  incompatible on exactly this point (ilcd-2010, chapter 8.4;
  eu-recommendation-2021-2279, recital 6).
- **Treating the transitional data hierarchy as a licence to omit.** Omission is its third
  and last step (ef-transitional-guidance-2026).
- **Mixing reference package versions.** EF 2.0 underpins the pilot-phase PEFCRs and
  OEFSRs, EF 3.0 those developed in the transition phase
  (ef-compliant-data-guide-2.0, chapter 2), and EF 3.1 changed factors in six categories
  and merged sub-indicators (ef-data-guide-3.1-addendum). Results from two packages are
  not comparable.
- **Assuming a database is EF compliant because it reports EF categories.** Compliance is
  a documented property of a data set under the EF guide, not an output format
  (ef-compliant-data-guide-2.0, section 5.2).
- **Using a PEFCR that is not on the Commission's current list.** Rules outside it are
  either outdated or private initiatives (ef-pef-method).
- **Confusing EF with EN 15804.** EN 15804 is a separate, CEN-maintained rule set for
  construction products, not an EF category rule
  ([../standards/en-15804.md](../standards/en-15804.md)); the EPD route is
  [prepare-an-epd.md](prepare-an-epd.md).
- **Silently dropping a category because the background data has no factor for it.** All
  16 are reported, and a missing factor is declared and discussed in the interpretation
  (ef-compliant-data-guide-2.0, section 5.2.17; ilcd-2010, chapter 8.2).

## Related vocabulary

- [PEF and OEF](../../vocabulary.md#pef-and-oef)
- [PEFCR](../../vocabulary.md#pefcr)
- [EF 3.1](../../vocabulary.md#ef-31)
- [EF-compliant dataset](../../vocabulary.md#ef-compliant-dataset)
- [single overall score](../../vocabulary.md#single-overall-score)
- [normalisation](../../vocabulary.md#normalisation)
- [weighting](../../vocabulary.md#weighting)
- [impact category](../../vocabulary.md#impact-category)

## Related pages

- [../standards/ef-pef.md](../standards/ef-pef.md) - the Recommendation, the 16
  categories, the reference packages and the transitional guidance
- [choose-a-background-database.md](choose-a-background-database.md) - where EF-compliant
  data actually comes from
- [map-flows-between-nomenclatures.md](map-flows-between-nomenclatures.md) - getting an
  inventory onto the EF flow list
- [run-a-comparative-lca.md](run-a-comparative-lca.md) - the ISO route, and why its
  weighting rule differs

## Verification

`verified: no`. This is a methodological use case; verification means a reviewer
following the steps on a real study. A verifier would need a product in a category with a
current PEFCR, the EF 3.1 reference package downloaded from the LCDN developer tools page,
background data whose EF compliance status is documented, and an eligible reviewer under
chapter 8 of the EF data guide to say whether a study built this way would be accepted as
EF compliant. No command on this page was run; the commands live in the module use-case
folders it links to.
