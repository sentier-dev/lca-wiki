---
title: Elementary and intermediate flows
type: concept
summary: "The flow types an inventory contains: elementary flows across the ecosphere boundary, product and waste flows inside the technosphere."
audience: [P1, P3]
updated: 2026-09-21
sources: [ilcd-2010, ilcd-format-1.1-docs, ecoinvent-kb-glossary, ef-compliant-data-guide-2.0]
related: [../standards/ilcd-format.md, ../standards/glad-and-nomenclatures.md]
---

# Elementary and intermediate flows

An inventory contains two families of flows. An
[elementary flow](../../vocabulary.md#elementary-flow) crosses the boundary between the
technosphere and the ecosphere: resources taken from nature, emissions released to it,
and other interventions such as land use (ilcd-2010, chapter 7.1). An intermediate flow
stays inside the technosphere and links one human activity to another. ILCD splits the
intermediate family into [product flows](../../vocabulary.md#product-flow), the goods and
services that connect processes, and [waste flows](../../vocabulary.md#waste-flow), both
wastewater and solid or liquid wastes, which have to be linked to waste management
processes for the model to be complete (ilcd-2010, chapter 7.1).

## Why it matters

The distinction is what makes an LCA computable. Product and waste flows are resolved by
linking them to other processes; elementary flows are resolved by characterisation. A
flow put in the wrong family either never gets an upstream chain or never gets a
characterisation factor, and in both cases the missing impact reads as zero.

## What the standards say

**ILCD Handbook (ilcd-2010, chapter 7.1).** The three flow kinds above, plus the
instruction that the ILCD reference elementary flows should be used wherever possible and
relevant, to keep inventories compatible and avoid the same flow occurring twice when
data sets from different sources are combined (ilcd-2010, chapter 7.1, footnote).

**ILCD data format (ilcd-format-1.1-docs).** The Flow data set makes the families
explicit. Its `typeOfDataSet` distinguishes elementary flows (exchanges between nature
and the technosphere), product flows (goods and services with positive economic value),
waste flows (materials with zero or negative economic value) and other flows, which
support modelling. Every flow carries `flowProperties` with values and uncertainty, and a
`referenceToReferenceFlowProperty` naming the default flow property in which the flow is
measured. A Flow property data set in turn points at a Unit group through
`referenceToReferenceUnitGroup`, and the Unit group defines a reference unit plus the
linear conversion factors of every other unit in the group. That chain is why an amount
in an ILCD data set always has a determinable unit.

**Flows the inventory should not contain (ilcd-2010, chapters 7.4.3 and 8.2).** The
handbook names several shapes that break impact assessment and shall be resolved:

- Ionic compounds inventoried as salts rather than as the separate elementary flows of
  their components, for example ammonium and nitrate.
- Process-type composed emissions such as "diesel engine off-gas", which typically have no
  characterisation factor at all and shall not remain in the inventory.
- Sum indicators such as "metals", and unspecified flows such as "biomass", "renewable
  energy" or "unspecified emissions"; the individual substances should be inventoried, or
  the composition estimated from technology-specific information with the assumptions
  documented.
- Emissions to a sub-compartment with no specific factor, for which the factor of the
  parent compartment shall be assigned, for example nitrate to lakes taking the factor of
  nitrate to freshwater.
- Reminder flows, which are not a flow category of their own but an additional
  classification applicable to flows that are carried for information
  (ilcd-2010, chapter 7.4.3.8).

**ecoinvent's vocabulary (ecoinvent-kb-glossary).** The same split exists under different
names. ecoinvent calls a flow an *exchange*, and states that two basic types exist,
elementary exchanges and intermediate exchanges. An elementary exchange is an "exchange
with the natural, social or economic environment", with examples of unprocessed inputs
from nature, emissions to air, water and soil, physical impacts and working hours under
specified conditions. An intermediate exchange is "an exchange between two activities
that stays within the technosphere and is not emitted to or taken from the environment".
Note that ecoinvent's elementary exchange is broader than ILCD's elementary flow, because
it explicitly admits social and economic environment exchanges.

## How it is decided in practice

- Ask whether the flow has an upstream process. If someone produced it, it is
  intermediate; if it came from or went to nature, it is elementary.
- Look the elementary flow up in the reference list before creating it. In the EF world
  the list ships with the reference package, in the `flows` folder of the ZIP
  (ef-compliant-data-guide-2.0, chapter 2).
- Check the compartment and sub-compartment, not only the substance name. Compartment is
  part of a flow's identity for characterisation (ilcd-2010, chapter 8.2).
- When combining data sets from different sources, map flows rather than merging names.
  The same substance under two names becomes two flows and one of them gets no factor
  (ilcd-2010, chapter 7.1, footnote).

## Common pitfalls

- Creating a new elementary flow in a tool because the name in a spreadsheet did not
  match. The handbook suggests verifying with CAS numbers whether an apparently new flow
  is an existing one under a trivial or alternative chemical name
  (ilcd-2010, chapter 8.2).
- Leaving waste as an unlinked output, so its treatment never enters the model
  (ilcd-2010, chapter 7.1).
- Assuming "elementary flow" means the same in ILCD and in a database. ecoinvent's
  elementary exchange covers more (ecoinvent-kb-glossary).
- Mixing a sum indicator and its components in one inventory, which double counts.

## Related terms

- [elementary flow](../../vocabulary.md#elementary-flow)
- [product flow](../../vocabulary.md#product-flow)
- [waste flow](../../vocabulary.md#waste-flow)
- [functional flow](../../vocabulary.md#functional-flow)
- [non-functional flow](../../vocabulary.md#non-functional-flow)

## Related pages

- [life-cycle-inventory.md](life-cycle-inventory.md) — where flows are collected
- [life-cycle-impact-assessment.md](life-cycle-impact-assessment.md) — what elementary
  flows are used for
- [../standards/ilcd-format.md](../standards/ilcd-format.md) — the Flow, Flow property and
  Unit group data sets
- [../standards/glad-and-nomenclatures.md](../standards/glad-and-nomenclatures.md) — flow
  lists and mapping between them
