---
title: BAFU data formats
type: database
summary: "The three components of a BAFU release: the openLCA package, the ecoSpold v1 archive and the LCIA results workbook."
audience: [P1, P3]
updated: 2026-09-21
sources: [bafu-2026-release, openlca-bafu-2026-notes, esu-bafu-database]
related: [schemas-and-nomenclature.md, ../data/fetch.md]
---

# BAFU data formats

A BAFU release is not one file. BAFU:2026 v1 is announced as four components: the
pre-calculated LCIA results, the documentation with the LCI reports, the EcoSpold1 files
and a ready-to-use openLCA database (source: openlca-bafu-2026-notes). The publisher
describes the machine-readable formats as ecoSpold V1 and zolca, compatible with LCA
software and with scripting from Python and R (source: esu-bafu-database).

## The ecoSpold v1 archive

The archive `BAFU-2026 v1_ecoSpold v1.zip` holds a single directory, `ecoSpold files/`,
with one XML file per process named `process_<uuid>.xml`; the BAFU:2026 v1 archive holds
11,947 of them (source: bafu-2026-release).

Each file is an `<ecoSpold>` document with one `<dataset>`, and the dataset splits into
`<metaInformation>` and `<flowData>` (source: bafu-2026-release). Inside the metadata:

- `processInformation/referenceFunction` carries the reference amount, the unit, the
  category and sub-category, the name and the local (German) name, the general comment
  that repeats the dataset UUID, and the infrastructure flag.
- `processInformation/geography` carries the location code.
- `processInformation/timePeriod` carries a start date and an end date.
- `processInformation/dataSetInformation` carries the language codes, the internal
  version, the dataset type and the version year.
- `modellingAndValidation` carries representativeness, the bibliographic source block
  and the validation block.
- `administrativeInformation` carries the data entry person, the publication block and a
  person record whose address, e-mail and telephone fields are anonymised in the public
  release.

`<flowData>` holds the `<exchange>` elements, each carrying its own category and
sub-category, location, name and unit, plus the amount. This wiki describes the fields
and never reproduces the amounts.

Identifiers: every process file is named after a UUID, and that same UUID is repeated in
the general comment of the reference function (source: bafu-2026-release). The generator
attribute on the dataset element records that the files were written out by openLCA
(source: bafu-2026-release).

## The openLCA package

`BAFU-2026 v1.1 openLCA.zolca` is an openLCA database package: a zip archive whose
payload is an openLCA database directory rather than a set of dataset documents (source:
bafu-2026-release). It is the component to use when the target tool is openLCA, because
it needs no import mapping.

For BAFU:2026 v1 the openLCA package was changed in one way worth knowing: the list of
elementary flows it carries is restricted to the flows actually used inside the BAFU:2026
database, so that new datasets built on top of it stay consistent (source:
openlca-bafu-2026-notes). A tool that expects the full openLCA reference flow list will
see a shorter list here.

Inside the package the data is organised as the usual openLCA entities: flows with a
flow type and a reference flow property, categories with a parent and a model type, flow
properties, unit groups, units, locations, impact categories and impact factors (source:
bafu-2026-release). The counts of each are in
[schemas-and-nomenclature.md](schemas-and-nomenclature.md).

## The LCIA results workbook

`BAFU-2026 v1_LCIA Results_corrected.zip` holds one spreadsheet,
`BAFU-2026 v1 LCIA Results_corrected.xlsx`, with two sheets (source: bafu-2026-release).
The first sheet, "Info", states the file content, the methods, the version, the date, the
database name, the provider, the contact address and a legend of the unit abbreviations
used. The second sheet holds one row per process and one column per indicator, under a
banner row that groups the columns by method (source: bafu-2026-release).

The workbook's own description says it compiles the impact factors of the inventories for
the compatible methods so that impact calculations can be done directly, for example in a
spreadsheet (source: bafu-2026-release). Its header row is the cleanest published list of
the indicators a BAFU release carries; see [methods.md](methods.md).

The "corrected" suffix and the date field in the Info sheet matter: the July 2026 file
corrects the headers of the June 2026 one (source: bafu-2026-release). Check the date
field before assuming two copies of the workbook agree.

## Choosing a component

- openLCA user: take the openLCA package.
- Any other tool that reads ecoSpold v1, including a Brightway importer: take the
  ecoSpold v1 archive.
- Screening, or a calculation that only needs indicator results per process: take the
  LCIA results workbook and skip the inventory entirely.
- Reading the method or the assumptions behind a dataset: take the documentation
  component, which is where the LCI reports are.

## Related pages

- [schemas-and-nomenclature.md](schemas-and-nomenclature.md): flow lists, compartments, units.
- [methods.md](methods.md): the indicators in the workbook.
- [../data/fetch.md](../data/fetch.md): how to download and unpack the components.
