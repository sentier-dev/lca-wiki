---
title: Map flows between nomenclatures
type: use-case
summary: "Why two LCA data sets rarely combine as they are, what a bridge is, and how to build, review and apply one without renaming anything."
audience: [P1, P2]
updated: 2026-09-22
sources: [ilcd-2010, glad-network, ef-compliant-data-guide-2.0, ecoinvent-kb-glossary, sentier-mappings-repo, randonneur-repo, flowmapper-repo, sentier-brightway-repo, lca-wiki-editorial]
verified: no
related: [../standards/glad-and-nomenclatures.md, ../concepts/elementary-and-intermediate-flows.md, choose-a-background-database.md, document-data-quality-and-uncertainty.md]
---

# Map flows between nomenclatures

**Persona:** P1 practitioner whose inventory and whose LCIA method come from different
places, or P2 contributor building a reusable bridge · **GICS sector:** any

## Goal

Get an inventory written against one flow list to characterise correctly against a method
written against another, by building or reusing a documented correspondence between the
two lists, and by keeping what does not match visible instead of silently zero.

Two LCA data sets only combine if their flows mean the same thing
([../standards/glad-and-nomenclatures.md](../standards/glad-and-nomenclatures.md)). The
operation is mapping, not renaming: the same substance in two lists stays two identifiers
with a documented correspondence (glad-network).

## Why mapping is needed at all

- **The lists genuinely differ.** ILCD instructs that the ILCD reference elementary flows
  should be used wherever possible and relevant, so that inventories stay compatible and
  the same flow does not occur twice in a joint or aggregated inventory
  (ilcd-2010, chapter 7.1, footnote), and a separate handbook document, *Nomenclature and
  other conventions*, defines the applicable default compartments and naming rules
  (ilcd-2010, chapters 7.4.5 and 8.2). The Environmental Footprint guide nevertheless
  recommends using the EF flow list, found in the EF package, even for ILCD-compliant data
  sets (ef-compliant-data-guide-2.0, chapter 1, footnote 3). Two recommendations, two
  lists.
- **Databases name their own structures.** ecoinvent calls an elementary flow an
  "elementary exchange", an "exchange with the natural, social or economic environment",
  and an intermediate flow an "intermediate exchange", "an exchange between two activities
  that stays within the technosphere" (ecoinvent-kb-glossary). The concepts line up; the
  identifiers do not.
- **A flow's identity is more than its name.** It is a canonical name, an identifier, a
  context as a hierarchical tuple of compartments, a unit, sector-specific labels such as
  a CAS number, and synonyms (flowmapper-repo). Matching on the name alone is how a
  mapping becomes wrong quietly.
- **Regionalised and duplicated flows exist on purpose.** EF data sets declare them
  explicitly (ef-compliant-data-guide-2.0, sections 5.2.6 and 5.2.7), so a one-to-one
  match is not always the right answer.

## The bridge concept

A [bridge](../../vocabulary.md#bridge) is a reviewable data artefact, not code: which
elementary flow of one database corresponds to which flow key of another, and which
process of one corresponds to which activity of another, stored as
[randonneur packages](../../vocabulary.md#randonneur-package), one folder per source and
target pair (sentier-mappings-repo, randonneur-repo).

Three properties make it reviewable (sentier-mappings-repo):

1. **It is data under version control**, written by pull request, with a validator in
   continuous integration checking folder naming, package naming and order, entry counts,
   duplicate source keys within and across the packages of a pair, unit consistency and
   stray files.
2. **Packages are ordered.** A pair may hold several packages applied in sequence, so a
   general rule and its exceptions stay separable instead of being merged into one flat
   table.
3. **It keeps proprietary data out.** A bridge whose target is a licensed database marks
   itself as such and encodes its targets as an opaque database and code pair only; a
   licence holder resolves the code locally.

What a bridge is not: a rename. Renaming destroys the ability to trace a result back to
the source database, and it is the reason GLAD speaks of mapping tables from its ongoing
elementary flow harmonisation efforts rather than of a single canonical list
(glad-network).

## Prerequisites

- **Both flow lists in a comparable shape**: canonical name, identifier, context tuple,
  unit, sector labels, synonyms (flowmapper-repo).
- **The unit systems of both sides**, because a correspondence between flows in different
  units carries a conversion factor, not just a pair of identifiers
  (flowmapper-repo, sentier-mappings-repo).
- **A decision on what to do with the unmatched remainder**, taken before the run rather
  than after ([../concepts/cut-off-criteria.md](../concepts/cut-off-criteria.md)).

## Steps

1. **Name the pair, and its direction.** A bridge is between a stated source and a stated
   target, in that order, which is why the pair folders are named
   `<source>__<target>` (sentier-mappings-repo). Reversing a mapping is a separate
   artefact, not a flag.

2. **Extract both lists from their own formats.** flowmapper ships extractors that produce
   its list shape from ecospold2 and SimaPro files
   (flowmapper-repo). Module:
   [../../brightway/modules/flowmapper/use-cases/](../../brightway/modules/flowmapper/use-cases/).

3. **Run the matching strategies and read the diagnostics.** flowmapper applies a sequence
   of matching strategies, reports what matched and what did not, and writes the result as
   a reusable mapping file in GLAD format, randonneur transformation format, or both
   (flowmapper-repo). The unmatched list is the useful output at this stage.

4. **Review the matches by hand where the identity is doubtful.** Context and unit
   disagreements, regionalised variants and duplicated flows are where automated matching
   is least reliable (ef-compliant-data-guide-2.0, sections 5.2.6 and 5.2.7;
   flowmapper-repo).

5. **Store the result as an ordered set of packages.** General rules first, exceptions
   after, each package with its own metadata and entry count
   (sentier-mappings-repo). Module:
   [../../sentier/modules/sentier-mappings/use-cases/](../../sentier/modules/sentier-mappings/use-cases/).

6. **Validate.** The repository's validator checks naming, order, entry counts, duplicate
   source keys within and across packages, unit consistency, stray files and the
   proprietary rule (sentier-mappings-repo).

7. **Apply the bridge to relink an inventory.** Applying a randonneur package to a dataset
   is what [relinking](../../vocabulary.md#relink) means here. Module:
   [../../brightway/modules/randonneur/use-cases/](../../brightway/modules/randonneur/use-cases/).
   In the Sentier loader the ordered mapping packages of the bridge folder move source
   elementary flows onto EF 3.1 flows, and what cannot be linked is kept in a
   [residual database](../../vocabulary.md#residual-database) rather than dropped
   (sentier-brightway-repo). Module:
   [../../sentier/modules/sentier-brightway/use-cases/](../../sentier/modules/sentier-brightway/use-cases/).

8. **Report the residual.** The share of the inventory that did not map, by flow count and
   by contribution to each impact category, belongs in the study's completeness check
   (ilcd-2010, chapter 9.3.2). See
   [document-data-quality-and-uncertainty.md](document-data-quality-and-uncertainty.md).

## When a bridge is not enough

A flow bridge solves identity, not method. Three problems look like mapping problems and
are not:

- **A missing characterisation factor.** If the target method has no factor for a flow
  that does map, the handbook's rule applies: check the potential importance of the flow,
  estimate the factor if the contribution could be significant, and if estimation is
  impossible, report the missing factor and consider its influence in the interpretation
  (ilcd-2010, chapter 8.2).
- **A different system model.** Two inventories can share a flow list and still be
  incompatible because they were linked under different rules; that decision belongs to
  [choose-a-background-database.md](choose-a-background-database.md).
- **A different data format.** Converting ILCD to EcoSpold 2 is a format job. GLAD offers
  a conversion service for that pair, and it draws on the same harmonisation tables for
  the flows it carries across; what it does, in GLAD's own words, is described in
  [../standards/glad-and-nomenclatures.md](../standards/glad-and-nomenclatures.md)
  (glad-network). Format and nomenclature are two layers, and a tool that does one does
  not do the other.

## Expected output

- **A mapping file** in GLAD format, randonneur transformation format, or both
  (flowmapper-repo), or a pair folder of ordered randonneur packages with metadata
  (sentier-mappings-repo).
- **An unmatched-flow diagnostic**: which source flows found no target, with their
  contexts and units, which is what a reviewer actually reads (flowmapper-repo).
- **A relinked inventory** plus a residual database holding what could not be linked
  (sentier-brightway-repo).
- **A residual statement** for the study report: how many flows and how much of each
  impact category sit in the residual.

Mapping files carry name, context, unit and identifier correspondences, with unit
conversion factors where units differ; they carry no inventory amounts and no
characterisation factors (flowmapper-repo), which is why they can be published where the
databases they bridge cannot (lca-wiki-editorial).

## Pitfalls

- **Renaming instead of mapping**, which loses the trace back to the source database
  (glad-network).
- **Matching on the name and ignoring the context.** A flow's identity includes its
  compartment tuple and its unit (flowmapper-repo).
- **Silently dropping unmatched flows.** A dropped flow is a zero that looks like a
  result; keeping a residual database makes it visible
  (sentier-brightway-repo).
- **Merging ordered packages into one flat table**, which destroys the separation between
  a general rule and its exceptions (sentier-mappings-repo).
- **Putting licensed target identifiers into a public bridge.** A bridge whose target is a
  licensed database marks itself and encodes targets as an opaque database and code pair
  (sentier-mappings-repo).
- **Assuming one-to-one.** Regionalised and duplicated elementary flows are declared
  deliberately in EF data sets (ef-compliant-data-guide-2.0, sections 5.2.6 and 5.2.7).
- **Bridging once and forgetting the version.** Both lists move; a bridge is pinned to the
  versions it was built against (sentier-mappings-repo).

## Related vocabulary

- [bridge](../../vocabulary.md#bridge)
- [nomenclature](../../vocabulary.md#nomenclature)
- [flow mapper](../../vocabulary.md#flow-mapper)
- [randonneur package](../../vocabulary.md#randonneur-package)
- [relink](../../vocabulary.md#relink)
- [residual database](../../vocabulary.md#residual-database)
- [elementary flow](../../vocabulary.md#elementary-flow)
- [compartment](../../vocabulary.md#compartment)

## Related pages

- [../standards/glad-and-nomenclatures.md](../standards/glad-and-nomenclatures.md) - GLAD,
  the ILCD reference flows, the EF flow list and ecoinvent's own terms
- [../concepts/elementary-and-intermediate-flows.md](../concepts/elementary-and-intermediate-flows.md) -
  what is being mapped
- [choose-a-background-database.md](choose-a-background-database.md) - the choice that
  creates the mapping problem
- [run-a-pef-study.md](run-a-pef-study.md) - where the EF flow list is compulsory

## Verification

`verified: no`. This is a methodological use case; verification means a reviewer
following the steps on a real study. A verifier would need two real flow lists, a
flowmapper installation, a checkout of a mappings repository to validate against, and a
recalculation of one inventory before and after relinking to confirm that the residual
reported here is the residual the tooling produces. No command appears on this page by
design; they live in the module use-case folders it links to.
