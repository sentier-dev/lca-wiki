---
title: Read the EF 3.1 categories and their units
type: use-case
summary: "List the 25 EF 3.1 impact categories with their method ids and reporting units, straight from the delivered methods table, without touching the factors."
audience: [P1]
updated: 2026-09-22
sources: [sentier-methods-repo, ef-pef-method]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.11.15, Ubuntu 22.04, a clone of sentier-methods, pyarrow via uv --with"
---

# Read the EF 3.1 categories and their units

**Persona:** P1 practitioner deciding what to report and in which units ·
**GICS sector:** any

## Goal

The list of [impact categories](../../../../vocabulary.md#impact-category) a datasource
offers, each with the [method id](../../../../vocabulary.md#method-id) you address it by
and the unit its score is expressed in, so a results table can be labelled correctly.
Names and units only: no [characterisation factors](../../../../vocabulary.md#characterization-factors)
are read or reproduced here.

## Prerequisites

- A clone of sentier-methods. There is no package and nothing to install.
- `uv` and pyarrow, supplied for the length of the command.

## Steps

1. See which datasources the repository carries:

   ```bash
   ls data/
   ```

2. Read the methods table of the EF 3.1 datasource, selecting the three columns you
   need:

   ```bash
   uv run --with pyarrow python -c "
   import pyarrow.parquet as pq
   t = pq.read_table('data/01-ef-3.1/methods.parquet', columns=['method_id','impact_category','unit'])
   d = t.to_pydict()
   for i in range(t.num_rows):
       print(d['method_id'][i], '|', d['impact_category'][i], '|', d['unit'][i])
   "
   ```

3. See what else a method row carries, without printing the factors:

   ```bash
   uv run --with pyarrow python -c "import pyarrow.parquet as pq; print(pq.read_schema('data/01-ef-3.1/methods.parquet'))"
   ```

4. Read the datasource's own declaration of itself:

   ```bash
   cat data/01-ef-3.1/metadata.json
   ```

## Expected output

Step 1 shows three datasource folders. Only one of them carries factor data today; the
other two hold [metadata](../../../../vocabulary.md#metadata) and no parquet, which is a
valid state and the documented way a datasource is opened before its factors arrive.

Step 2 prints 25 lines. The [method id](../../../../vocabulary.md#method-id) has the shape
`<datasource>:<category>`, for example `ef-3.1:climate-change`, which is exactly the
string the loader in [../../sentier-brightway/](../../sentier-brightway/) takes. The
categories are the EF 3.1 set: acidification, four climate change entries (total,
biogenic, fossil, and land use and land use change), three ecotoxicity freshwater
entries, three eutrophication entries, six human toxicity entries, ionising radiation,
land use, ozone depletion, particulate matter, photochemical ozone formation, two
resource use entries and water use.

Fifteen distinct units appear across those 25 categories, from familiar ones such as
kg CO2 eq, kg P eq and MJ to comparative toxic units, disease incidence, a dimensionless
land use point and a deprivation-weighted cubic metre. Two things follow. Categories in
the same family share a unit, so a total and its sub-indicators are additive within the
family and nowhere else; and a score is meaningless without its unit, so carry the unit
column through into any results table.

Step 3 shows the full row shape: the method id, a method name, the impact category, the
unit, a methodology, a source and the datasource key. Step 4 gives the datasource's
version and provenance.

## Pitfalls

- **Do not add the sub-indicators to their totals.** Climate change total and its
  biogenic, fossil and land-use components share a unit and overlap; the same holds for
  the human toxicity and ecotoxicity families. Report either the total or the split.
- **The factor table is large.** Select columns and filter on the method id rather than
  loading it whole; and do not redistribute it.
- **Global factors only.** What is delivered here is the global EF 3.1 set; regionalised
  categories such as country-level water use are not covered.
- **A datasource folder with no parquet is not broken.** Metadata first is the documented
  order for opening a datasource; factors arrive later as a delivery.
- **Units are strings from the publisher.** Spellings vary between sources, and the
  loader normalises them on the way into an LCA tool. Do not join two datasources on the
  unit string.

## Related vocabulary

[Impact category](../../../../vocabulary.md#impact-category),
[LCIA method](../../../../vocabulary.md#lcia-method),
[method id](../../../../vocabulary.md#method-id),
[characterisation factor table](../../../../vocabulary.md#characterisation-factor-table),
[EF 3.1](../../../../vocabulary.md#ef-31),
[normalisation](../../../../vocabulary.md#normalisation),
[single overall score](../../../../vocabulary.md#single-overall-score).

## Verification

Run on 2026-09-22 on Ubuntu 22.04 with uv 0.11.14 and Python 3.11.15, in a clone of
sentier-methods. Steps 1 and 2 were executed as written and took under half a second. The
methods table returned 25 rows with the seven columns listed under step 3, and fifteen
distinct unit strings. Steps 3 and 4 were not run separately; the column list in step 3
was read from the same table load.
