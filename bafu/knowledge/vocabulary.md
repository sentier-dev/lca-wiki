---
title: BAFU vocabulary
type: database
summary: The words a BAFU release uses for its own parts, and where each one is defined in this wiki.
audience: [P1, P3]
updated: 2026-09-21
sources: [bafu-2026-release, bafu-terms-of-use-2025, openlca-bafu-2026-notes]
related: [../../vocabulary.md, schemas-and-nomenclature.md]
---

# BAFU vocabulary

This page is the map. The definitions themselves live in the root
[../../vocabulary.md](../../vocabulary.md), one bullet per term and context. Nothing is
defined twice.

## The words a release uses for itself

- **Database, Dataset, Data, Reports, Authors.** The terms of use define all five, and
  they carry legal weight: the licence treats Data and Reports differently, so knowing
  which one you are holding decides what you may do with it (source:
  bafu-terms-of-use-2025). See [access-and-licence.md](access-and-licence.md).
- **Release, version, component.** A release is a year (`BAFU:2026`); a version is a
  label inside that year (`v1`, `v1.1`); a component is one of the four downloads that
  make up the release (source: openlca-bafu-2026-notes). The components of one release do
  not necessarily share a version number (source: bafu-2026-release).
- **Category and sub-category.** The database's own two-level grouping of processes and
  flows, carried on every process and every exchange, and mirrored by a category tree in
  the openLCA package (source: bafu-2026-release).
- **Local name, local category, local sub-category.** The German-language counterparts of
  the name and the grouping, carried alongside the English ones in the ecoSpold v1 files
  (source: bafu-2026-release).
- **Reference function.** The ecoSpold v1 element that carries a process's reference
  amount, unit, name and grouping (source: bafu-2026-release).
- **Eco-point, UBP.** The unit of the Ecological Scarcity method, in which twenty of the
  workbook's indicator columns and their total are expressed (source:
  bafu-2026-release). See [methods.md](methods.md).

## Where each word is defined

| Word | Defined in | Why there |
|---|---|---|
| Compartment, Sub-compartment | [../../vocabulary.md](../../vocabulary.md), beside the ILCD senses | the concept is shared, the contents are BAFU's |
| Elementary flows, Unit processes, Processes, Product | [../../vocabulary.md](../../vocabulary.md) | the standards define them; BAFU adds a context bullet |
| Category, Sub-category, Eco-point (UBP), Local name | [../../vocabulary.md](../../vocabulary.md) | database-only terms, marked first-use |
| Release, component, ecoSpold v1, openLCA package | [format.md](format.md) and [versions-and-provenance.md](versions-and-provenance.md) | they describe the delivery, not the model |

## Two traps

**"Category" is not a sector.** The BAFU categories are a subject grouping that grew with
the database, mixing materials (`metals`), services (`transport systems`), life-cycle
stages (`construction processes`) and housekeeping (`Others`, the four `obsolete` ones).
The mapping onto GICS sectors is an editorial reading kept in
[../../core/sectors/crosswalk.md](../../core/sectors/crosswalk.md), not something the
database asserts.

**"Waste" is both a flow kind and a compartment.** The openLCA package has waste flows as
a third kind beside product and elementary flows, and it also has a `Waste` compartment
under `Elementary flows` (source: bafu-2026-release). They are different things: the
first is an exchange between processes, the second is where a method scores a deposited
quantity. See [schemas-and-nomenclature.md](schemas-and-nomenclature.md).

## Related pages

- [../../vocabulary.md](../../vocabulary.md): the definitions themselves.
- [schemas-and-nomenclature.md](schemas-and-nomenclature.md): the structures the words name.
