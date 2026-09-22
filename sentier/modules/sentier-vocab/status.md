---
title: sentier-vocab status
type: module-page
summary: "Where the vocabulary stands: thirteen term types with schemas, two still transitional, no release."
audience: [P2]
updated: 2026-09-22
sources: [sentier-vocab-repo]
---

# sentier-vocab status

As of commit `ef440c6`, dated 2026-09-17, read together with the generated coverage
matrix in `docs/COVERAGE.md`. (source: sentier-vocab-repo)

## Works today

- Thirteen term types have a LinkML schema, curated data and generated Turtle:
  elementary flows, flow properties, unit groups, products, processes, LCIA methods,
  impact categories, characterisation factors, model terms, sources, contacts, organisms
  and qualifiers.
- The generator validates every source file and writes deterministic Turtle, one file
  per source, with the primary files committed.
- Bulk delivery as content-named parquet works end to end, including the FoodEx2
  organisms and qualifiers and the sector-sharded processes and products.
- The coverage matrix is generated rather than maintained by hand.
- Continuous integration gates pull requests, runs the test suite and deploys the
  importer Turtle on a push to the default branch.

## In flight

- **Units.** QUDT units are imported rather than curated, and the coverage matrix marks
  the unit model as transitional: there is a unit-group schema, but the units namespace
  itself is still fed by the importer.
- **Elementary flows.** Marked partial: the native curation covers the water subset while
  the bulk of the flow nomenclature still arrives through imports.
- **Products.** A mix of native terms and imported ones, with the schema described as
  needing to be formalised.
- **LCIA methods and characterisation factors.** Schema and pilot data exist; the import
  of full method packages is planned rather than done.

## Missing

- No release. The package is not on PyPI and the changelog has no entries, so every
  consumer clones. A contributor could close this once the API settles.
- The importers are described in the repository as transitional. Folding them into the
  schema-validated native pipeline is the larger open task.
- No documented migration procedure for an IRI namespace, although the registry promises
  one.

## Where help is welcome

Native curation of elementary flows and the unit model are the two places where a
contributor can move the coverage matrix. Anything larger belongs on
[../../roadmap.md](../../roadmap.md).
