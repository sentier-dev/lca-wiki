---
title: GLAD and flow nomenclatures
type: standard
summary: "The Global LCA Data Access network and the flow and activity nomenclatures data sets are written against."
audience: [P1, P2, P3]
updated: 2026-09-21
sources: [glad-network, ef-compliant-data-guide-2.0, ecoinvent-kb-glossary, unsd-isic-rev4, ilcd-2010]
---

# GLAD and flow nomenclatures

Two LCA data sets only combine if their flows mean the same thing. This page covers the
network built to search across data sources, GLAD, and the nomenclatures that data sets
are written against.

## Scope

This page is short on purpose: it records what could be sourced from the publishers
themselves. Detailed per-database naming conventions belong to the database branches, not
to `core/`.

## What it requires

### GLAD, the Global LCA Data Access network

GLAD lets a user "search, convert and download datasets from different life cycle
assessment dataset providers" (glad-network). Two of its services matter for
nomenclature:

- **Format conversion.** The Lavoisier conversion framework provides "robust and
  up-to-date conversion between ILCD and EcoSpold 2 inventory formats", with customisable
  options. It was developed by the Federal University of Technology, Paraná (UTFPR) and
  the Brazilian Institute of Information in Science and Technology (IBICT) under the UNEP
  InTex Project (glad-network).
- **Elementary flow mapping.** Conversion uses "mapping tables from GLAD's ongoing
  elementary flow harmonization efforts" (glad-network). Mapping, not renaming: the same
  substance in two lists stays two identifiers with a documented correspondence.

### The ILCD reference elementary flows

The ILCD Handbook instructs that the ILCD reference elementary flows should be used
wherever possible and relevant, so that inventories stay compatible and the same flow
does not occur twice in a joint or aggregated inventory
(ilcd-2010, chapter 7.1, footnote). A separate handbook document, *Nomenclature and other
conventions*, defines the applicable default compartments and naming rules
(ilcd-2010, chapters 7.4.5 and 8.2).

### The EF flow list

The Environmental Footprint reference package ships the flow list as ILCD XML in its
`flows` folder, alongside `flowproperties` and `unitgroups`
(ef-compliant-data-guide-2.0, chapter 2). The guide recommends using the EF flow list,
found in the EF package, even for ILCD-compliant data sets, and notes that the ILCD
compliance system exists next to the EF compliance system
(ef-compliant-data-guide-2.0, chapter 1, footnote 3). EF data sets also declare
regionalised and duplicated elementary flows explicitly
(ef-compliant-data-guide-2.0, sections 5.2.6 and 5.2.7).

### ecoinvent nomenclature

ecoinvent uses its own terms for the same structures (ecoinvent-kb-glossary):

- An **activity** data set "represents a unit process of a human activity and its
  exchanges with the environment and with other human activities". Activity types include
  transforming activities, treatment activities, market activities, import and export
  activities, and production and supply mixes.
- An **exchange** is either an **elementary exchange**, an "exchange with the natural,
  social or economic environment", or an **intermediate exchange**, "an exchange between
  two activities that stays within the technosphere".
- An **activity class** is a "group of activities classified together under a heading in a
  statistical classification of activities, such as ISIC".
- An **activity link**, also called a direct link, points an exchange at a specific
  supplying data set rather than letting the database service layer link it during system
  model resolution.

### ISIC and CPC as classification bases

The International Standard Industrial Classification of All Economic Activities (ISIC) is
published by the United Nations Statistics Division and is "a coherent and consistent
classification structure of economic activities based on a set of internationally agreed
concepts, definitions, principles and classification rules"; ISIC Revision 5 was endorsed
by the United Nations Statistical Commission at its 54th session in 2023, and a
consolidated standing task team maintains ISIC together with the Central Product
Classification (CPC) (unsd-isic-rev4). ecoinvent states that ISIC "provides a
classification system for activities and products that ecoinvent has adopted for version
3" (ecoinvent-kb-glossary).

## How it relates to other documents

- **ILCD format.** The flow, flow property and unit group data sets are where a
  nomenclature is actually expressed; see [ilcd-format.md](ilcd-format.md).
- **EF/PEF.** The EF reference package is the authoritative flow list in the EF world; see
  [ef-pef.md](ef-pef.md).
- **ILCD Handbook.** The nomenclature and conventions document is part of the handbook
  series; see [ilcd-handbook.md](ilcd-handbook.md).

## What it means for this wiki

Every branch of this wiki that describes a data source has to say which flow list and
which classification it uses, and the mapping between them belongs in that branch rather
than here. The concept page that depends most on this one is
[elementary-and-intermediate-flows.md](../concepts/elementary-and-intermediate-flows.md).

## Gaps

The GLAD elementary flow harmonisation tables themselves, and the per-version details of
the EF flow list, are not described here: neither could be read in full from a public
page at the date above. They are on [../roadmap.md](../roadmap.md).
