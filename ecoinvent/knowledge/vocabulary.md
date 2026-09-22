---
title: ecoinvent vocabulary
type: database
summary: "The ecoinvent Knowledge Base glossary as a source, what it covers, and where each term is defined in this wiki."
audience: [P1, P3]
updated: 2026-09-21
sources: [ecoinvent-kb-glossary, ecoinvent-kb, ecoinvent-kb-system-models]
related: [../../vocabulary.md, schemas-and-nomenclature.md]
---

# ecoinvent vocabulary

## The source

ecoinvent publishes a glossary in its Knowledge Base, one page per initial letter, at
`support.ecoinvent.org/glossary` (source: ecoinvent-kb-glossary). It is open access and
short: nineteen letter pages, most of them with a handful of entries, and a substantial
share of the entries are expansions of abbreviations rather than definitions.

This wiki imports it as the ecoinvent context bullet of each term it covers, quoted or
closely paraphrased with attribution and a link. The definitions themselves are in the
root [../../vocabulary.md](../../vocabulary.md), and for the terms the standards also
define, the ecoinvent bullet sits there beside the ILCD and ISO wordings. Nothing is
defined twice.

## What the glossary does and does not cover

**It covers, with a real definition:** activity, activity class, activity link, by-product
and waste, child and parent dataset, conditional exchange, constrained market, consumption
mix, CPC, database service layer, data quality guidelines, dry mass, ecoEditor, ecoQuery,
ecoSpold format, elementary exchange, exchange, geography, inheritance, intermediate
exchange, ISIC, linking, market activity, mft and non-mft, multi-output activity,
parameter, process, product, production mix, production volume, property, Rest of the
World, service, supply mix, system model, technosphere, transforming activity, treatment
activity, unit process, and a dense set of water terms.

**It does not cover**, at least not as glossary entries: cut-off, APOS and consequential
as such, allocation, substitution, compartment, sub-compartment, or reference product.
The first five are defined instead on the System Models page (source:
ecoinvent-kb-system-models), reference product on the Activities and Products page, and
compartment nowhere this wiki has found. Where a term has no source, this branch leaves
the gap rather than filling it; see [../roadmap.md](../roadmap.md).

## Terms whose ecoinvent meaning differs from the standard one

These are the ones worth reading side by side in
[../../vocabulary.md](../../vocabulary.md) before writing anything that crosses between a
standard and this database:

- **Activity against process.** ecoinvent uses activity for what ISO calls a process, and
  reserves process as the version 2 word (source: ecoinvent-kb-glossary).
- **Elementary exchange against elementary flow.** Same concept, different word, and the
  ecoinvent wording explicitly includes social and economic exchanges such as working
  hours, which a purely environmental reading of elementary flow does not (source:
  ecoinvent-kb-glossary).
- **Product against reference product.** In version 3 a product is a thing with a name of
  its own; whether it is the reference product is a property of the activity that makes
  it, not of the product (source: ecoinvent-kb-glossary).
- **Waste.** In ecoinvent, waste is an intermediate exchange with no economic value, so
  it flows between activities and has to be treated; it is not an emission (source:
  ecoinvent-kb-glossary).
- **System model.** ecoinvent's system model is an operational thing, a set of linking
  and allocation rules applied by the database service layer, not the general notion of a
  modelling perspective (source: ecoinvent-kb-glossary).

## Two traps

**"Waste" is used in three senses.** As a by-product class (allocatable, recyclable,
waste), as the general word for an intermediate exchange with no economic value, and
inside the mft classification that APOS uses. They agree most of the time and not always;
the documentation itself warns that waste paper is classified recyclable (source:
ecoinvent-kb-system-models).

**"Cut-off" names two different things.** The cut-off system model, and the cut-off point
in a supply chain, which is where the primary system ends. The EN15804 system model shares
the first sense and moves the second (source: ecoinvent-kb-system-models).

## Related pages

- [../../vocabulary.md](../../vocabulary.md): the definitions themselves.
- [schemas-and-nomenclature.md](schemas-and-nomenclature.md): the structures the words name.
