---
title: ecoinvent schemas and nomenclature
type: database
summary: "Flow kinds, classifications, properties, identifiers and naming conventions, and where the published elementary flow list lives."
audience: [P2, P3]
updated: 2026-09-21
sources: [ecoinvent-kb-glossary, ecoinvent-kb-activities-products, ecospold2-format, ecoinvent-kb-impact-assessment, ecoinvent-kb-releases, ecoinvent-kb-system-models]
related: [format.md, ../../vocabulary.md]
---

# ecoinvent schemas and nomenclature

Names, fields, classifications and identifiers. No amounts, no factors, no lists of
dataset contents: this page describes the shape of the data and nothing that fills it.

## Two kinds of exchange, four directions

Every exchange is either elementary or intermediate (source: ecoinvent-kb-glossary). An
elementary exchange is with the natural, social or economic environment; an intermediate
exchange is between two activities and stays inside the technosphere. The technosphere is
"all human activities" (source: ecoinvent-kb-glossary).

The format labels the direction and the kind together with four terms: from environment,
to environment, from technosphere, to technosphere (source: ecoinvent-kb-glossary). An
inventory reader that only tracks sign will lose the distinction between a resource input
and a technosphere input, which is exactly the distinction that decides which matrix a
row belongs in.

## Elementary flow names and the mappings

ecoinvent maintains its own elementary flow list, published in the database overview
file, and it publishes on GitHub the mappings between its own flow names and those of the
impact assessment methods it implements, "for analysis, review, or implementation by
method developers, software developers, scientists, and other users" (source:
ecoinvent-kb-impact-assessment). The documentation's own example of why such a mapping is
needed is that a method may say "Trichloromethane" where ecoinvent says "Chloroform"
(source: ecoinvent-kb-impact-assessment).

Those mappings are the public, citable artefact for anyone building a bridge between
nomenclatures. In this wiki the tooling for that job is documented under
[../../brightway/modules/flowmapper/](../../brightway/modules/flowmapper/).

## Compartments

The glossary does not carry an entry for compartment or sub-compartment, so this page does
not invent one. What it does carry is the direction-and-kind labelling above, and the
water-related vocabulary that plays the same role for water flows: fresh water, salt
water, surface water, groundwater and shallow groundwater are all defined terms, as are
water withdrawal, consumed water, process water, cooling water and produced water (source:
ecoinvent-kb-glossary). Anyone mapping ecoinvent water flows onto another nomenclature
should read those definitions first; they are finer than most flow lists.

The core wiki's compartment and sub-compartment entries are in
[../../vocabulary.md](../../vocabulary.md), and this branch adds no ecoinvent bullet to
them until a source states one. It is on [../roadmap.md](../roadmap.md).

## Product classifications carried on an exchange

Every intermediate exchange carries two classifications that are consistent across every
activity it appears in (source: ecoinvent-kb-activities-products):

- **allocatable, recyclable or waste**, which drives the cut-off system model;
- **mft or non-mft**, material for treatment or not, which drives APOS (source:
  ecoinvent-kb-glossary).

Both are properties of the product, not of the activity, and ecoinvent publishes the full
list of products with their classifications (source: ecoinvent-kb-system-models). A name
does not decide the class: waste paper is classified recyclable.

## Properties

Every exchange with a mass can carry properties, and every product carries at least dry
mass, wet mass, water in wet mass, water content, fossil carbon content and non-fossil
carbon content (source: ecoinvent-kb-glossary, ecoinvent-kb-releases). Several are defined
against each other: wet mass is dry mass plus water in wet mass, water in wet mass is wet
mass minus dry mass, and water content is water in wet mass divided by dry mass (source:
ecoinvent-kb-glossary). Infrastructure products carry lifetime and lifetime capacity
instead of mass properties (source: ecoinvent-kb-activities-products), and a service is
defined simply as a product without a mass (source: ecoinvent-kb-glossary).

Dry mass has a trap in it that the glossary spells out: it is not ash content, and it
does include chemically bound hydrogen and oxygen (source: ecoinvent-kb-glossary).

## Parameters and formulas

A parameter is a value defined by the data provider, and ecoSpold2 allows formulas to
compute amounts of flows and other entities from parameters, so a chemical reaction yield
can live in the dataset as a parameter rather than as a hard-coded number (source:
ecoinvent-kb-glossary). The field is called `mathematicalRelation` and its allowed content
is specified in a published formula language document (source: ecospold2-format).

## Identifiers

- **UUID.** An activity is identified by the combination of name, geography and time
  period, and that combination gets a universally unique identifier (source:
  ecoinvent-kb-activities-products). ecoSpold2 introduced UUIDs for referencing fields
  generally (source: ecospold2-format).
- **Activity link.** A direct link from one exchange to one specific supplying dataset,
  supplied by the data provider instead of being added by the database service layer
  during linking; the reason goes in the exchange's comment field (source:
  ecoinvent-kb-glossary).
- **Parent and child.** A child dataset inherits field values from a parent; only
  geographical inheritance is allowed in version 3 (source: ecoinvent-kb-glossary).

## Naming conventions worth knowing

- **Activity name and product name are separate strings** in version 3, and were the same
  string in version 2 (source: ecoinvent-kb-glossary). Any mapping from version 2 to
  version 3 has to split them.
- **Treatment activities begin with "treatment of"** (source: ecoinvent-kb-glossary).
- **Construction activities usually carry "construction"**, and operation activities carry
  "operation", the latter being ecoinvent's synonym for use (source:
  ecoinvent-kb-activities-products).
- **Cut-off recyclable inputs appear as datasets named "..., recycled content cut-off"**,
  which have no inputs and no emissions (source: ecoinvent-kb-system-models).
- **Geography short names** are codes such as GLO for global and RER for Europe (source:
  ecoinvent-kb-glossary).

## Abbreviations the glossary defines

The glossary is largely a list of abbreviations, and the ones a reader of dataset metadata
meets are AOX, BOD, COD, TOC, DOC, TDS, TSS, NMVOC, TPM, PM10, PM2.5, TCDD, CED, CV, DM,
NPP and NPP-C, alongside the institutional ones such as ISIC, CPC, NAICS, IO and UUID
(source: ecoinvent-kb-glossary). They are expanded there rather than repeated here.

## Related pages

- [format.md](format.md): the file format these fields live in.
- [system-models.md](system-models.md): what the two product classifications are for.
- [../../vocabulary.md](../../vocabulary.md): the terms above, defined with their sources.
