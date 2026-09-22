---
title: Prepare an EPD under EN 15804
type: use-case
summary: "Produce a construction product declaration: declared unit, modules A1 to D, programme PCR, third-party verification and publication."
audience: [P1]
updated: 2026-09-21
sources: [en-15804-2019, epd-pcr-2019-14, iso-14044-2006, ilcd-2010, epd-international-pcr-library, lca-wiki-editorial]
verified: no
related: [../standards/en-15804.md, ../concepts/functional-unit.md, ../concepts/system-boundary.md, assess-a-building-product-in-real-estate.md, document-data-quality-and-uncertainty.md]
---

# Prepare an EPD under EN 15804

**Persona:** P1 practitioner working for or with a construction product manufacturer ·
**GICS sector:** Materials and Real Estate, see
[../sectors/materials.md](../sectors/materials.md) and
[../sectors/real-estate.md](../sectors/real-estate.md)

## Goal

Produce an Environmental Product Declaration for a construction product that a programme
operator will publish: a declared unit, a life cycle model split into the prescribed
information modules, results per indicator per module, and a verification statement.

The core rules are EN 15804:2012+A2:2019, published by CEN and paywalled
(en-15804-2019). They are never used alone: an EPD follows the core rules together with a
programme operator's product category rules, and complementary PCRs narrow them further
for specific product groups (epd-pcr-2019-14, sections 1.2 and 1.4). This page describes
the route as a programme operator's public PCR states it; it does not reproduce the
standard's text (lca-wiki-editorial).

## Prerequisites

- **A programme operator and its PCR.** The International EPD System's PCR library is one
  public index of them, with `Construction products` and `Infrastructure & buildings`
  among its categories (epd-international-pcr-library). PCR 2019:14 *Construction
  products* is the document this page follows, and it states that all EPDs based on it
  comply with EN 15804:2012+A2:2019/AC:2021 (epd-pcr-2019-14, sections 1.2 and 1.3).
- **Manufacturer-specific foreground data** for the product stage. A sector average is
  defensible for a screening study and not for a declaration
  ([../sectors/materials.md](../sectors/materials.md)).
- **A background database** whose system model suits an attributional declaration; see
  [choose-a-background-database.md](choose-a-background-database.md) and, for ecoinvent's
  EN 15804 variant,
  [../../ecoinvent/knowledge/system-models.md](../../ecoinvent/knowledge/system-models.md).
- **A verifier.** Third-party verification is what distinguishes a declaration from a
  report (epd-pcr-2019-14, section 1.2).

## Steps

1. **Pick the EPD type, because it fixes the module set.** The programme rules tabulate
   which modules each type must declare (epd-pcr-2019-14, sections 2.2.2 and Table 2):
   cradle to gate with C1 to C4 and D; cradle to gate with options; cradle to grave and
   module D; the two reduced cradle-to-gate types that may exclude C and D only under
   stated conditions; and the construction service EPD, A1 to A5 with optional modules.
   In practice A1 to A3, C1 to C4 and D form the normal minimum scope for a construction
   product EPD (epd-pcr-2019-14, Table 2). Standard page:
   [../standards/en-15804.md](../standards/en-15804.md).

2. **Choose a declared unit or a functional unit.** A declared unit is used where the
   function and the reference scenario for the whole life cycle of the construction works
   are not stated; a functional unit is used where they are, and is required for a
   cradle-to-grave and module D EPD, which additionally needs a complementary PCR
   (epd-pcr-2019-14, sections 1.4, 2.2 and 4.1). The declared unit exists because a
   construction product often has no single function until it is placed in a building.
   Concept page: [../concepts/functional-unit.md](../concepts/functional-unit.md).

3. **Map the life cycle onto the information modules.** A1 raw material supply, A2
   transport, A3 manufacturing; A4 transport and A5 construction installation; B1 use, B2
   maintenance, B3 repair, B4 replacement, B5 refurbishment, B6 operational energy use,
   B7 operational water use; C1 deconstruction and demolition, C2 transport, C3 waste
   processing, C4 disposal; and D, beyond the system boundary
   (epd-pcr-2019-14, Table 2). This is a prescribed
   [system boundary](../../vocabulary.md#system-boundary) structure rather than one you
   draw: [../concepts/system-boundary.md](../concepts/system-boundary.md).

4. **Collect the A1 to A3 foreground.** Recipe, energy carriers, direct emissions,
   production waste and the fate of by-products, per declared unit, for the named
   production sites and the declared reference period.

5. **Install the background and link the foreground onto it.** The loader that installs a
   published inventory, biosphere and methods is documented in
   [../../sentier/modules/sentier-brightway/use-cases/](../../sentier/modules/sentier-brightway/use-cases/);
   the databases themselves in [../../bafu/use-cases/](../../bafu/use-cases/) and
   [../../ecoinvent/use-cases/](../../ecoinvent/use-cases/). Where the flow lists differ,
   bridge them: [map-flows-between-nomenclatures.md](map-flows-between-nomenclatures.md).

6. **Handle production scrap and recycled input as the programme rules require.**
   Programme rules note that EN 15804 and ISO 21930 assign some processes, such as
   electricity generation, to different modules, which is why results for A1 to A3 are
   declared in aggregated form so that one EPD can comply with both, and that their
   allocation requirements for production scrap from A1 to A3 are not fully compatible
   (epd-pcr-2019-14, sections 1.4 and 5.4.5). Concept page:
   [../concepts/allocation-and-multifunctionality.md](../concepts/allocation-and-multifunctionality.md).

7. **Model the end-of-life scenarios.** C1 to C4 need a stated scenario for
   deconstruction, transport distance, waste processing route and disposal. A scenario is
   an assumption, and it belongs in the declaration next to the number it produced.

8. **Compute module D separately.** Module D reports the net benefits and loads beyond
   the system boundary from reuse, recovery and recycling; it is mandatory for EPD types
   a, b and c and not applicable to a construction service EPD
   (epd-pcr-2019-14, Table 2). Because it is defined as beyond the system boundary, its
   results are declared separately and are not added into the product result
   ([../standards/en-15804.md](../standards/en-15804.md)).

9. **Calculate the indicator set per module.** Every declared module gets its own column,
   so the calculation is run once per module rather than once for the product. Module:
   [../../brightway/modules/bw2calc/use-cases/](../../brightway/modules/bw2calc/use-cases/).

10. **Rate and document data quality.** EPD-style documentation reports the data set
    furthest away from the declared result (epd-pcr-2019-14, section 5), and the six ILCD
    indicators are the generic frame behind that requirement
    (ilcd-2010, chapter 12.3). See
    [document-data-quality-and-uncertainty.md](document-data-quality-and-uncertainty.md).

11. **Submit for verification and publication.** The verifier checks the PCR conformity,
    the module coverage, the data quality statement and the arithmetic. Registration and
    publication happen through the programme operator
    (epd-international-pcr-library).

## Where the rules come from

Three documents stack, and knowing which one answers a question saves a lot of time.

| Layer | Document | What it decides |
|---|---|---|
| Core PCR | EN 15804:2012+A2:2019 | the module structure A1 to D, the indicator set, the general calculation rules (en-15804-2019) |
| Programme PCR | for example PCR 2019:14 Construction products | the EPD types and their mandatory modules, the declared unit conventions, the reporting template, the verification route (epd-pcr-2019-14) |
| Complementary PCR | a c-PCR for the product group | further narrowing, and the document a functional-unit EPD requires (epd-pcr-2019-14, sections 1.4 and 4.1) |

Underneath all three sits ISO 14040 and 14044: EN 15804 applies LCA as standardised
there, with the modules acting as a prescribed system boundary structure
([../standards/iso-14040-14044.md](../standards/iso-14040-14044.md);
en-15804-2019, iso-14044-2006). That is why the concept pages still apply: what EN 15804
removes is the freedom to choose, not the underlying method
([../standards/en-15804.md](../standards/en-15804.md)).

## Expected output

- **An EPD document** in the programme operator's template: product description, declared
  or functional unit, system boundary as a module table with declared and non-declared
  modules marked, scenarios, results, data quality, references and the verification
  statement.
- **An inventory** with one aggregated dataset per declared module, each traceable to the
  unit processes behind it. A1 to A3 is normally declared aggregated
  (epd-pcr-2019-14, section 1.4).
- **A results table** with one row per indicator and one column per declared module, plus
  the separate module D column that is not summed into the product total
  (epd-pcr-2019-14, Table 2).
- **A scenario annex** stating every assumption behind A4, A5, B and C.
- **A verification statement** naming the verifier and the PCR version.

Never present two declared-unit EPDs as a comparison: two EPDs that use declared units
are not automatically comparable, and the comparison only holds at building level
([../standards/en-15804.md](../standards/en-15804.md);
epd-pcr-2019-14, sections 4.1 and Table 2). The building-level route is
[assess-a-building-product-in-real-estate.md](assess-a-building-product-in-real-estate.md).

## Pitfalls

- **Confusing a declared unit with a functional unit** and then comparing two EPDs that
  were never comparable (epd-pcr-2019-14, section 4.1).
- **Adding module D into the product total.** It is declared beyond the system boundary
  (epd-pcr-2019-14, Table 2).
- **Dropping C1 to C4 without meeting the stated conditions.** Only EPD types d and e may
  exclude them, and only under those conditions (epd-pcr-2019-14, Table 2).
- **Assuming an EN 15804 result and an ISO 21930 result are interchangeable.** The two
  assign some processes to different modules and their production-scrap allocation
  requirements are not fully compatible (epd-pcr-2019-14, sections 1.4 and 5.4.5).
- **Using a background system model that contradicts the declaration.** ecoinvent
  publishes an "Allocation, cut-off, EN15804" variant precisely because plain cut-off does
  not match the EPD reading
  ([../../ecoinvent/knowledge/system-models.md](../../ecoinvent/knowledge/system-models.md)).
- **Letting the PCR version drift.** A PCR has a version and an expiry; the declaration
  states the one it was built against (epd-pcr-2019-14, section 1.3).
- **Quoting an EF single score in an EN 15804 EPD.** EF is a separate European system with
  its own category rules and impact category set
  ([../standards/ef-pef.md](../standards/ef-pef.md)); the PEF route is
  [run-a-pef-study.md](run-a-pef-study.md).

## Related vocabulary

- [PCR](../../vocabulary.md#pcr)
- [functional unit](../../vocabulary.md#functional-unit)
- [reference flow](../../vocabulary.md#reference-flow)
- [system boundary](../../vocabulary.md#system-boundary)
- [allocation](../../vocabulary.md#allocation)
- [substitution](../../vocabulary.md#substitution)
- [recycling, reuse, recovery](../../vocabulary.md#recycling-reuse-recovery)
- [data quality](../../vocabulary.md#data-quality)

## Related pages

- [../standards/en-15804.md](../standards/en-15804.md) - the module table and the EPD
  types
- [assess-a-building-product-in-real-estate.md](assess-a-building-product-in-real-estate.md) -
  the same product seen from the building
- [run-a-pef-study.md](run-a-pef-study.md) - the other European rule set
- [document-data-quality-and-uncertainty.md](document-data-quality-and-uncertainty.md) -
  the quality statement a verifier reads

## Verification

`verified: no`. This is a methodological use case; verification means a reviewer
following the steps on a real study. A verifier would need a real construction product, a
current programme PCR, manufacturer-specific A1 to A3 data, a background database whose
licence permits a published declaration, and an accredited third-party verifier to
confirm that a declaration built by following these steps would be accepted. The
standard itself is paywalled, so the module structure here is cited from a programme
operator's public PCR rather than from EN 15804 directly (epd-pcr-2019-14).
