---
title: ecoinvent data formats
type: database
summary: "ecoSpold2 and what came before it: the format a release ships in, its supporting files, and the release types a licensed user can download."
audience: [P2, P3]
updated: 2026-09-21
sources: [ecospold2-format, ecoinvent-kb-glossary, ecoinvent-kb-activities-products, ecoinvent-interface-repo]
related: [schemas-and-nomenclature.md, ../data/access.md]
---

# ecoinvent data formats

## ecoSpold, in two generations

"ecoSpold is a name for a format used by ecoinvent to create life cycle inventories",
setting out which fields are mandatory and which optional for a life cycle inventory;
ecoSpold 1 is the format of ecoinvent versions 1 and 2, and ecoSpold2 the format of
version 3 (source: ecoinvent-kb-glossary). The abbreviation behind the name is SPOLD, the
Society for the Promotion of Lifecycle Development (source: ecoinvent-kb-glossary).

ecoSpold2 replaced ecoSpold1 when version 3 was released in May 2013. The revision was
guided by an ad-hoc expert working group convened by ecoinvent and an open hearing, and
the result is designed to represent all three stages of an assessment, UPR, LCI and LCIA,
on an XML basis (source: ecospold2-format).

What ecoSpold2 adds over ecoSpold1 (source: ecospold2-format):

- properties of exchanges, such as dry mass, wet mass and carbon content;
- mathematical relations in a formula language, with variable names for exchanges,
  properties and parameters;
- UUIDs for referencing;
- fields for production volumes.

The formula language matters more than it sounds: a parameter is a value defined by the
data provider, and the format allows formulas to compute the amounts of flows from them,
so that for example a reaction yield can be carried as a parameter rather than baked into
every number (source: ecoinvent-kb-glossary).

## The supporting files ecoinvent publishes

The format is documented in a public package containing the schema definitions (XSD), the
stylesheets (XSL) and a readable HTML description of the formats. Three further documents
accompany it: an ecoEditor user manual, a dataset documentation manual explaining what is
expected in each documentation field, and a formula language specification describing what
may appear in the `mathematicalRelation` field (source: ecospold2-format). A separate
page documents how the geodata behind ecoinvent geographies is created and processed
(source: ecospold2-format).

The datasets themselves use the `.spold` extension, which is XML: rename it and any XML
editor will open it, showing the unit process, the cumulative inventory or the impact
assessment results of an activity (source: ecoinvent-kb-activities-products).

## Who reads it

ecoSpold2 is used by most of the software providers that carry the ecoinvent database,
and the open-source Brightway framework imports it (source: ecospold2-format). Within this
wiki, the importer side is documented under
[../../brightway/modules/bw2io/](../../brightway/modules/bw2io/) rather than here.

## Release types a licensee can download

Beyond the dataset files, a release is published in several packaged forms. The
`ecoinvent_interface` library, which automates the download for a licensed user, names six
release types: ecospold (single-output unit process files), matrix (a universal matrix
export), lci, lcia, cumulative_lci and cumulative_lcia (source: ecoinvent-interface-repo).
Cumulative inventories and impact assessment results for the whole database are also
published as spreadsheets, per system model, in the files section of ecoQuery (source:
ecoinvent-kb-activities-products).

Pick by what you intend to do: the ecospold release to build your own supply chains, the
matrix release to go straight into a solver, the cumulative releases to read results
without recalculating them.

## ecoSpold1, for the older versions

Versions 1 and 2 of the database are ecoSpold1 (source: ecoinvent-kb-glossary), and the
Knowledge Base keeps a page describing the changes from ecoSpold1 to ecoSpold2 (source:
ecospold2-format). Two differences bite when reading old data: ecoSpold1 has no exchange
properties and no formula language, and version 2 datasets name the activity and the
product with the same string, so an ecoSpold1 file gives you no independent product name
(source: ecoinvent-kb-glossary).

The same format, in its own dialect, is what the BAFU database ships in; see
[../../bafu/knowledge/format.md](../../bafu/knowledge/format.md) for a worked description
of an ecoSpold v1 file. The two are not interchangeable: they share a format generation,
not a nomenclature.

## Related pages

- [schemas-and-nomenclature.md](schemas-and-nomenclature.md): the classifications and identifiers inside the format.
- [../data/access.md](../data/access.md): how a licensed user actually gets the files.
