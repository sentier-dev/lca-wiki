---
title: ILCD data format 1.1 and eILCD
type: standard
summary: "The seven ILCD 1.1 data set types, what each carries, and the eILCD life cycle model extension."
audience: [P1, P2, P3]
updated: 2026-09-21
sources: [ilcd-format-1.1-process, ilcd-format-1.1-lifecyclemodel, ilcd-format-1.1-docs, ef-compliant-data-guide-2.0, eplca-developer-ef, ilcd-2010]
---

# ILCD data format 1.1 and eILCD

The ILCD data format is the XML exchange format of the International Reference Life Cycle
Data System. It is the "LCI data set documentation format" named among the supporting
documents of the ILCD Handbook (ilcd-2010, "Role of this document"). Version 1.1 is the
version the European Commission's reference documentation describes and the version the
Environmental Footprint reference packages ship against
(ef-compliant-data-guide-2.0, chapter 2).

A data set is one XML file; a data package is a ZIP with one folder per data set type,
plus `Schemas` (the XSD files), `Stylesheets` (XSL), `external_docs` for linked PDFs and
images, and a `META-INF` folder (ef-compliant-data-guide-2.0, chapter 2).

## Scope

The format describes data sets, not studies. It says what fields exist and what they
mean; it does not say what values are correct. Which fields must be filled is set by a
compliance scheme layered on top, such as the ILCD Entry-Level scheme: the ILCD schema
"specifies the level of recommendation for each field (mandatory, recommended, optional)
according to the ILCD Entry-Level Scheme" (eplca-developer-ef).

## What it requires

### The seven data set types

**1. Process data set** (ilcd-format-1.1-process). Covers unit processes, partly
terminated systems and LCI results, with optional LCIA results. Its top-level sections
are `processInformation`, which covers the ISO/TS 14048 process description including
`dataSetInformation`, `quantitativeReference`, `time`, `geography` and `technology`;
`modellingAndValidation`, which carries `LCIMethodAndAllocation`,
`dataSourcesTreatmentAndRepresentativeness`, completeness and compliance declarations;
`administrativeInformation`, with commissioner, generator, entry, publication and
ownership; `exchanges`, the "Input/Output list of exchanges with the quantitative
inventory data" with amounts and uncertainty; and the optional `LCIAResults`, the
"pre-calculated LCIA results of the Input/Output list".

The process types the format distinguishes are the ones an inventory practitioner has to
choose between: "Unit process, single operation", a process that cannot be usefully
further subdivided; "Unit process, black box", a process-chain or plant-level unit
process that can be both vertically aggregated and horizontally averaged and is often
distorted among co-functions; "LCI result", an aggregated data set whose input/output
list holds only elementary flows plus the reference product; "Partly terminated system",
an aggregated data set with at least one further product flow to be modelled, such as an
open electricity input; and parameterised data sets, whose exchange values scale through
a characteristic parameter documented in the mathematical model
(ef-compliant-data-guide-2.0, chapter 1).

**2. Flow data set** (ilcd-format-1.1-docs). Sections `flowInformation`,
`modellingAndValidation`, `administrativeInformation` and `flowProperties`. Its
`typeOfDataSet` distinguishes elementary flows, product flows, waste flows and other
flows, and `referenceToReferenceFlowProperty` names the default flow property the flow is
measured in.

**3. Flow property data set** (ilcd-format-1.1-docs). A measurable characteristic such as
mass or energy. Sections `flowPropertiesInformation`, `quantitativeReference`,
`modellingAndValidation` and `administrativeInformation`; it links to a unit group through
`referenceToReferenceUnitGroup`.

**4. Unit group data set** (ilcd-format-1.1-docs). A set of units interconvertible with a
fixed factor. Sections `unitGroupInformation`, `quantitativeReference`,
`modellingAndValidation`, `administrativeInformation` and `units`. Each `unit` carries a
`name` and a `meanValue`, the linear conversion factor relative to the reference unit
named by `referenceToReferenceUnit`.

**5. Source data set** (ilcd-format-1.1-docs). Bibliographic references, databases, tools,
format and conformity system definitions, images and digital files. Key elements are
`shortName`, `sourceCitation`, `publicationType` and `referenceToDigitalFile`.

**6. Contact data set** (ilcd-format-1.1-docs). Persons, organisations, working groups or
database networks, with `contactInformation`, `administrativeInformation`,
`publicationAndOwnership` and `other`; it carries `UUID`, `name`, `shortName`,
`classification` and `centralContactPoint`.

**7. LCIA method data set** (ilcd-format-1.1-docs). An impact assessment method as data.
`LCIAMethodInformation` holds the UUID and a name following the pattern "methodology;
impact category; level; indicator; source"; `characterisationFactors` is the "Flow /
Exchanges list with corresponding impact factors according to the respective LCIA
method"; `impactCategory`, `impactIndicator` and `areaOfProtection` ("Natural resources",
"Human health", "Natural environment", "Man-made environment") classify what is measured,
and the data set type distinguishes midpoint from damage indicators.

### eILCD: the Life cycle model data set

The eILCD extension adds an eighth type, the Life cycle model data set
(ilcd-format-1.1-lifecyclemodel). It represents "a system of interconnected processes
that jointly represent the full or partial life cycle of a product system". Its sections
are `lifeCycleModelInformation`, `modellingAndValidation` and
`administrativeInformation`. Structurally it holds `processes` with one `processInstance`
per occurrence, each with a `@dataSetInternalID` and a `@multiplicationFactor` and a
`referenceToProcess` pointing at the underlying process data set; a
`referenceToReferenceProcess` naming the scaling process; a `connections` section whose
`outputExchange` elements link to a `downstreamProcess` by flow UUID and process id; and
`groupDeclarations`, which categorise process instances into life cycle stages or
foreground and background roles. In other words, eILCD stores the product system graph
itself, not only its aggregated result.

## How it relates to other documents

- **ILCD Handbook.** The format is a supporting document of the handbook series
  (ilcd-2010, "Role of this document"), and the process types mirror the handbook's unit
  process typology (ilcd-2010, chapter 3).
- **EF reference packages.** The EF packages are ILCD-format ZIPs with `processes`,
  `flows`, `flowproperties`, `unitgroups`, `lciamethods`, `sources` and `contacts`
  folders, plus schemas, stylesheets and a validation profile
  (ef-compliant-data-guide-2.0, chapter 2). See [ef-pef.md](ef-pef.md).
- **ILCD Entry-Level.** The field-level obligation levels come from the Entry-Level
  scheme, not from the XSD alone (eplca-developer-ef).
- **Other formats.** Conversion between ILCD and EcoSpold 2 is one of the services of the
  GLAD network; see [glad-and-nomenclatures.md](glad-and-nomenclatures.md).

## What it means for this wiki

The format is the reason `core/` can talk about data sets without talking about tools.
When a tool branch describes an importer or an exporter, the field names above are the
vocabulary it should use. The concept pages this format most directly encodes are
[life-cycle-inventory.md](../concepts/life-cycle-inventory.md),
[elementary-and-intermediate-flows.md](../concepts/elementary-and-intermediate-flows.md)
and
[life-cycle-impact-assessment.md](../concepts/life-cycle-impact-assessment.md).
