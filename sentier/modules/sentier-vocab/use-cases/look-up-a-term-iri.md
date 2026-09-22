---
title: Look up a term IRI
type: use-case
summary: "Find the canonical Sentier IRI of an elementary flow by its label, read straight from the curated parquet shards."
audience: [P1]
updated: 2026-09-22
sources: [sentier-vocab-repo]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.12.13, Ubuntu 22.04, sentier-vocab 0.0.2 from a clone, pyarrow via uv --with"
---

# Look up a term IRI

**Persona:** P1 practitioner who has a flow name from an inventory and needs the
identifier the platform uses for it · **GICS sector:** any

## Goal

The canonical IRI of a term, plus the [compartment](../../../../vocabulary.md#compartment)
and [sub-compartment](../../../../vocabulary.md#sub-compartment) it sits in, so you can
point a mapping, a report or a query at the identifier rather than at a name.

## Prerequisites

- A clone of sentier-vocab. Nothing needs to be installed: the curated data is parquet
  and YAML, and `uv run --with pyarrow` is enough.
- Know which category you are looking in. Elementary flows live in one folder, products,
  processes, units and the rest in their own.

## Steps

1. See which shards a category is split into:

   ```bash
   ls data/elementary-flows/
   ```

2. Search every shard for an exact label match, case-insensitively, and print the IRI
   with its placement:

   ```bash
   uv run --with pyarrow python -c "
   import glob
   import pyarrow.compute as pc, pyarrow.parquet as pq
   wanted = 'sulfur hexafluoride'
   for path in sorted(glob.glob('data/elementary-flows/*.parquet')):
       t = pq.read_table(path, columns=['iri','pref_label','compartment','sub_compartment'])
       for r in t.filter(pc.equal(pc.utf8_lower(t['pref_label']), wanted)).to_pylist():
           print(path.rsplit('/',1)[-1], r['iri'], r['compartment'], r['sub_compartment'])
   "
   ```

3. When the name is not exact, widen the search to a substring and to the alternative
   labels, which is where synonyms, trade names and upstream spellings live:

   ```bash
   uv run --with pyarrow python -c "import pyarrow.parquet as pq; t = pq.read_table('data/elementary-flows/air-01.parquet'); print(t.column_names)"
   ```

4. To read the same term as SKOS instead, generate the Turtle first, as in
   [regenerate-the-vocabulary-ttl.md](regenerate-the-vocabulary-ttl.md), and parse the
   relevant file with `rdflib`.

## Expected output

Step 1 shows the category split into shards named by compartment or theme, plus a curated
YAML file for the hand-authored terms.

Step 2 prints one line per hit. A common substance has many: the same name appears in the
air, water and soil shards of the impact-assessment
[nomenclature](../../../../vocabulary.md#nomenclature), and again in the inventory-side
shards where it carries a real sub-compartment such as "unspecified", "low. pop." or
"high. pop.". That multiplicity is the point of the lookup: a label alone does not
identify a flow, a label plus a compartment and a sub-compartment does, and only the IRI
is unambiguous.

Step 3 shows the columns every flow record carries: the IRI, the preferred label, the
alternative labels, a definition, a notation, the broader term, the SKOS match
properties, the bibliographic source, the compartment and sub-compartment, the CAS
number, the chemical formula and a status.

## Pitfalls

- **Labels are not identifiers.** Search on the label to find the IRI, then use the IRI.
  Two flows can share a preferred label and differ in compartment, in CAS number or in
  nothing you can see from the name.
- **Case and spelling differ between sources.** Impact assessment tables and inventories
  disagree about "sulfur" and "sulphur", about ion forms and about qualifiers. Lower-case
  both sides, and fall back to the alternative labels and the CAS number.
- **A blank sub-compartment is not the same as "unspecified".** In the shards that carry
  the impact assessment nomenclature the sub-compartment is often empty; in the
  inventory-side shards it is an explicit value. Do not treat one as the other.
- **The curated YAML is a pilot, not the corpus.** Several categories hold only a handful
  of hand-written terms, with the bulk arriving as parquet. Read the repository's own
  coverage matrix before concluding a category is thin.
- **The IRI is an identifier first.** Dereferencing one over HTTP with a Turtle `Accept`
  header answered 404 when checked on 2026-09-22, so resolve terms against the repository
  or the generated Turtle rather than assuming the web address serves the term.

## Related vocabulary

[Elementary flow](../../../../vocabulary.md#elementary-flow),
[flow code](../../../../vocabulary.md#flow-code),
[compartment](../../../../vocabulary.md#compartment),
[sub-compartment](../../../../vocabulary.md#sub-compartment),
[nomenclature](../../../../vocabulary.md#nomenclature),
[substance](../../../../vocabulary.md#substance),
[metadata](../../../../vocabulary.md#metadata).

## Verification

Run on 2026-09-22 on Ubuntu 22.04 with uv 0.11.14 and Python 3.12.13, in a clone of
sentier-vocab at version 0.0.2. Steps 1 to 3 were executed as written and took under a
second each. The example label matched fifteen flow records across seven shards: seven in
the impact-assessment shards for air, soil and water with no sub-compartment, three in
the inventory-side emissions-to-air shard carrying "unspecified", "low. pop." and
"high. pop.", and the rest in the soil and water inventory shards. The 404 noted under
Pitfalls was observed on the same day with a single HTTP request carrying a Turtle
`Accept` header. Step 4 was not run here; the generation it depends on is verified on its
own page.
