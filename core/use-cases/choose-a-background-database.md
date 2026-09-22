---
title: Choose a background database
type: use-case
summary: "Pick the background for a study on licence, coverage, system model and format: BAFU, ecoinvent or EF-compliant data sets, and how the tooling in this wiki reaches each."
audience: [P1]
updated: 2026-09-22
sources: [ilcd-2010, bafu-2026-release, bafu-terms-of-use-2025, openlca-bafu-2026-notes, esu-bafu-database, ecoinvent-website, ecoinvent-licences, ecoinvent-kb-system-models, ecospold2-format, ef-compliant-data-guide-2.0, ef-data-guide-3.1-addendum, ef-transitional-guidance-2026, eplca-developer-ef, sentier-brightway-repo, sentier-methods-repo, sentier-inventory-readme, lca-wiki-editorial]
verified: no
related: [../concepts/foreground-and-background.md, ../concepts/data-quality.md, ../../bafu/README.md, ../../ecoinvent/README.md, map-flows-between-nomenclatures.md]
---

# Choose a background database

**Persona:** P1 practitioner starting a study, or a contributor deciding what to install ·
**GICS sector:** any

## Goal

Choose the background database a study rests on, and be able to defend the choice on four
grounds: what the licence permits for the study's intended use, whether the sectors and
regions you need are covered, which
[system model](../../vocabulary.md#system-model) the data is linked under, and which
[data format](../../vocabulary.md#data-format) and flow list it arrives in.

The background is the part of the system where specific data is not used and average or
generic data will do, or, on the second ILCD reading, the part outside the decision
maker's control (ilcd-2010, chapter 6.6). Almost all of a study's numbers come from it,
so this choice moves results more than most modelling decisions
([../concepts/foreground-and-background.md](../concepts/foreground-and-background.md)).

## Prerequisites

- **A goal and scope draft**, because the licence question is "may I use this for *that*",
  not "may I download this"
  ([../concepts/goal-and-scope.md](../concepts/goal-and-scope.md)).
- **The rule set the study is bound by**, if any: EN 15804
  ([prepare-an-epd.md](prepare-an-epd.md)), EF/PEF
  ([run-a-pef-study.md](run-a-pef-study.md)), or none.
- **The impact assessment method** you must report in, since not every background carries
  factors for every method
  ([../concepts/life-cycle-impact-assessment.md](../concepts/life-cycle-impact-assessment.md)).

## The three candidates in this wiki

### BAFU

The life cycle inventory database of the Swiss Federal Administration, published by the
Federal Office for the Environment under the name `BAFU:20XY` (bafu-2026-release).

- **Licence.** Free of charge, downloaded through the openLCA Nexus page after accepting
  the terms of use (bafu-2026-release). The terms let anyone use, process, analyse and
  reuse the data, including in commissioned studies and calculators, as long as the data
  is not sold, resold, distributed or marketed separately or as part of another database;
  any other use needs an explicit agreement with BAFU. Every use must credit the source in
  the prescribed wording, modifications must be documented in a standalone document that
  travels with the modified data, modified data must not be presented as the original, and
  it must be shared onward under substantially equivalent terms
  (bafu-terms-of-use-2025). Full reading:
  [../../bafu/knowledge/access-and-licence.md](../../bafu/knowledge/access-and-licence.md).
- **Coverage.** BAFU:2026 v1 carries 11,947 processes in 60 top-level categories and 516
  category and sub-category pairs (bafu-2026-release), cross-sectoral across
  construction, mobility and transport, energy, metals, chemicals, paper, agriculture,
  food, consumption and waste management (esu-bafu-database). It is built for the Swiss
  federal administration and tailored to Swiss needs (bafu-2026-release), which is the
  first thing to check for a non-Swiss study. GICS reading:
  [../../bafu/knowledge/sector-coverage.md](../../bafu/knowledge/sector-coverage.md).
- **System model.** The release ships linked processes; there is no menu of system models
  to choose from, unlike ecoinvent
  ([../../bafu/knowledge/methodology.md](../../bafu/knowledge/methodology.md)).
- **Format.** Four components: pre-calculated LCIA results, documentation with the LCI
  reports, an ecoSpold v1 archive of one XML file per process, and a ready-to-use openLCA
  `.zolca` package (openlca-bafu-2026-notes; bafu-2026-release). Detail:
  [../../bafu/knowledge/format.md](../../bafu/knowledge/format.md).
- **Methods available.** IPCC 2021, Ecological Scarcity 2021 (UBP2021) and Environmental
  Footprint 3.1, all three as pre-calculated results in the release's own workbook
  (openlca-bafu-2026-notes;
  [../../bafu/knowledge/methods.md](../../bafu/knowledge/methods.md)). Only EF 3.1 can be
  recalculated on an installed copy: the Sentier loader installs the 25 EF 3.1 categories
  and nothing else, because IPCC 2021 and ReCiPe 2016 are declared but empty folders in
  the methods repository and Ecological Scarcity 2021 is not there at all
  (sentier-methods-repo). If the study needs an eco-point total for a system BAFU did not
  publish, this database does not supply it.

### ecoinvent

A licensed background database published by the ecoinvent association, stated to contain
more than 26,000 datasets across a wide range of sectors (ecoinvent-website).

- **Licence.** Access is acquired through an ecoinvent licence, sold as Single-User,
  Enterprise, Developer and Educational types; the Developer licence is the one carrying
  sub-licensing rights for software integration, and the other types carry none
  (ecoinvent-licences). This wiki publishes structure only: names, units, versions,
  classifications and short attributed quotations, never amounts
  ([../../ecoinvent/README.md](../../ecoinvent/README.md)).
- **Coverage.** Broad and international, which is its main advantage over a
  nationally-scoped database
  ([../../ecoinvent/knowledge/sector-coverage.md](../../ecoinvent/knowledge/sector-coverage.md)).
- **System model.** Four are offered, and the choice is the user's: "Allocation, cut-off
  by classification", "Allocation, cut-off, EN15804", "Allocation at the point of
  substitution" (APOS) and "Substitution, consequential, long-term"
  (ecoinvent-kb-system-models). Choose a different system model and you get a different
  database out of the same base data, so the choice is recorded in the scope
  ([../../ecoinvent/knowledge/system-models.md](../../ecoinvent/knowledge/system-models.md)).
- **Format.** ecoSpold2 (ecospold2-format;
  [../../ecoinvent/knowledge/format.md](../../ecoinvent/knowledge/format.md)).

### EF-compliant data sets

Not a database but a compliance class: a data set is EF compliant when it meets the
*Guide for EF compliant data sets*, Version 2.0, and the EF 3.1 addendum
(ef-compliant-data-guide-2.0; ef-data-guide-3.1-addendum, via
[../standards/ef-pef.md](../standards/ef-pef.md)).

- **What it requires.** The ILCD process data set types, the declared metadata list of
  section 5.2, coverage of all 16 EF impact categories, documented update procedures, and
  review by an eligible reviewer
  (ef-compliant-data-guide-2.0, chapters 1, 3 and 8 and section 5.2).
- **Where it comes from.** Nodes of the Life Cycle Data Network, launched in 2014 to
  provide a globally usable infrastructure for publishing quality-assured LCA data sets
  (eplca-developer-ef).
- **Availability.** Scarce, which is why the Commission issued transitional guidance on
  14 July 2026: EF-compliant data sets where they exist, otherwise ILCD-EL compliant data
  sets, and only otherwise omission (ef-transitional-guidance-2026).

## Steps

1. **Start from the licence, not the coverage.** Ask what the study will do with the
   result: an internal screening, a published comparison, a declaration, a calculator
   shipped to a customer. BAFU's terms forbid selling, reselling, distributing or
   marketing the data separately or inside another database (bafu-terms-of-use-2025);
   ecoinvent's licence types differ precisely on sub-licensing rights
   (ecoinvent-licences). A background you may not redistribute constrains the deliverable,
   not just the project.

2. **Check the rule set.** An EN 15804 declaration wants a system model built for it,
   which is why ecoinvent publishes an "Allocation, cut-off, EN15804" variant
   (ecoinvent-kb-system-models). A PEF study wants EF-compliant data, and the transitional
   guidance says what to do when it does not exist (ef-transitional-guidance-2026).

3. **Check coverage against your sector page.** Each GICS sector page names the BAFU
   top-level categories and the Sentier inventory folders that serve it; see
   [../sectors/](../sectors/) and the crosswalk table in
   [../sectors/crosswalk.md](../sectors/crosswalk.md).

4. **Check geography.** BAFU:2026 is tailored to Swiss needs (bafu-2026-release), and
   BAFU itself states that regionalisation of inventories and impact assessment is only
   partly taken into account in BAFU:2026 and names it as a development need
   (bafu-2026-release). A study whose supply chain leaves Europe needs a different or an
   additional source.

5. **Record the system model as a scope decision.** For ecoinvent it is an explicit
   choice among four (ecoinvent-kb-system-models); for a database that ships linked, it is
   still a property of the data you inherit and report
   ([../concepts/allocation-and-multifunctionality.md](../concepts/allocation-and-multifunctionality.md)).

6. **Check that the method's flow list matches the inventory's.** They usually do not, and
   the fix is a bridge, not a rename:
   [map-flows-between-nomenclatures.md](map-flows-between-nomenclatures.md).

7. **Install it with the tooling.** In this wiki the Sentier loader installs a published
   inventory, an elementary-flow biosphere and the matching methods into a Brightway
   project or as plain files, fetching the data from pinned commits of the Sentier data
   repositories on first use (sentier-brightway-repo); the BAFU:2026 inventory reaches it
   as the `bafu-2026` package through sentier-inventory (sentier-inventory-readme).
   Commands:
   [../../sentier/modules/sentier-brightway/use-cases/](../../sentier/modules/sentier-brightway/use-cases/)
   and
   [../../sentier/modules/sentier-inventory/use-cases/](../../sentier/modules/sentier-inventory/use-cases/).
   For ecoinvent, a licensed user authenticates and downloads through
   [../../brightway/modules/ecoinvent_interface/use-cases/](../../brightway/modules/ecoinvent_interface/use-cases/),
   with the database itself described in
   [../../ecoinvent/use-cases/](../../ecoinvent/use-cases/). Direct import of a release in
   its own format is
   [../../brightway/modules/bw2io/use-cases/](../../brightway/modules/bw2io/use-cases/),
   and the BAFU release itself is
   [../../bafu/use-cases/](../../bafu/use-cases/).

8. **Write the choice down with its reasons.** The background database is one of the
   methodological choices the handbook names as a source of choice uncertainty, to be
   tested as a scenario rather than assumed away (ilcd-2010, chapter 16.2).

## Expected output

- **A one-page justification** in the scope document: database, version, system model,
  flow list, licence clause relied on, and the sectors and regions it does and does not
  cover.
- **A coverage gap list**: the inputs your foreground needs that the chosen background
  does not carry, and what fills them.
- **A citation string** ready for the report. Work derived from the BAFU inventory
  installed through the Sentier loader must carry "Source: Life Cycle Inventory database
  of the Swiss Federal Administration, BAFU:2026." (sentier-brightway-repo;
  bafu-terms-of-use-2025).
- **A scenario entry** for the interpretation phase: what the result would look like on a
  second background (ilcd-2010, chapter 16.2).

## Pitfalls

- **Choosing on coverage and discovering the licence later.** The BAFU terms bind
  redistribution and require documented modifications and share-alike onward
  (bafu-terms-of-use-2025); ecoinvent binds access itself (ecoinvent-licences).
- **Mixing two backgrounds inside one comparison**, which converts a database difference
  into a product difference ([run-a-comparative-lca.md](run-a-comparative-lca.md)).
- **Adopting the background's cut-off implicitly** and then claiming the study's own,
  stricter one (ilcd-2010, chapter 6.6.3).
- **Assuming a highly representative dataset is automatically appropriate** for the
  process your model needs. The handbook separates the two, with the example of a 1995 UK
  low carbon steel production mix in a model that needs a 2005 global consumption mix of
  high carbon steel (ilcd-2010, chapter 12.2).
- **Forgetting that the system model is part of the result.** Four ecoinvent system models
  produce four different databases from the same base data
  (ecoinvent-kb-system-models).
- **Treating pre-calculated LCIA results as an inventory.** BAFU ships them as a separate
  component alongside the process data (openlca-bafu-2026-notes).
- **Publishing the data instead of the study.** Whatever the licence allows, this wiki
  publishes structure only for licensed sources (lca-wiki-editorial).

## Related vocabulary

- [LCA database](../../vocabulary.md#lca-database)
- [system model](../../vocabulary.md#system-model)
- [background](../../vocabulary.md#background)
- [data format](../../vocabulary.md#data-format)
- [nomenclature](../../vocabulary.md#nomenclature)
- [EF-compliant dataset](../../vocabulary.md#ef-compliant-dataset)
- [data quality](../../vocabulary.md#data-quality)

## Related pages

- [../../bafu/README.md](../../bafu/README.md) - the BAFU branch
- [../../ecoinvent/README.md](../../ecoinvent/README.md) - the ecoinvent branch
- [map-flows-between-nomenclatures.md](map-flows-between-nomenclatures.md) - what to do
  once two sources have to meet
- [document-data-quality-and-uncertainty.md](document-data-quality-and-uncertainty.md) -
  rating what you chose

## Verification

`verified: no`. This is a methodological use case; verification means a reviewer
following the steps on a real study. A verifier would need to download a BAFU release
under its terms of use, hold an ecoinvent licence to check the system model claims against
the live database, and have access to an LCDN node to confirm what EF-compliant data is
actually available for a given product category. The licence readings here are summaries
of the published terms and are not legal advice.
