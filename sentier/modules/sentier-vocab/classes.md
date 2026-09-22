---
title: sentier-vocab classes and functions
type: module-page
summary: "The public surface of the vocabulary package: the IRI registry, the loaders, the validator, the RDF mapping and the generator."
audience: [P1, P3]
updated: 2026-09-22
sources: [sentier-vocab-repo]
---

# sentier-vocab classes and functions

Hand-written companion to the generated [api/](api/README.md) folder. The
names below are read from the package at commit `ef440c6`, in the order a user meets
them. (source: sentier-vocab-repo)

## The IRI registry

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `iris.NAMESPACES` | mapping | every published `vocab.sentier.dev` namespace, keyed by category; read-only and versioned | everything that mints an IRI |
| `iris.ONTOLOGY` | constant | the ontology namespace the schemas use for their own predicates | the LinkML schemas |
| `iris.namespace_for` | function | the rdflib namespace for a category key, raising on an unknown key | `rdf_mapping`, the importers |
| `iris.iri_for` | function | the full IRI of one term in one category | `rdf_mapping` |
| `iris.iri_for_cf` | function | the deterministic IRI of a characterisation factor, built from method, impact category and flow | the characterisation-factor mapping |
| `iris.identifier_from` | function | the trailing identifier of a term IRI | consumers that need the bare id |

## Reading and validating sources

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `loaders.load_source` | function | read one YAML or parquet source and return its scheme plus its records | `generate.generate_sources` |
| `loaders.arrow_schema_for` | function | the arrow schema a category's bulk parquet must follow | the importers that deliver parquet |
| `loaders.dump_parquet` | function | write records as a bulk parquet source for a category | the importers |
| `schemas.validate_data_file` | function | validate one data file against its LinkML schema | `generate` |
| `schemas.validate_collection` | function | validate an in-memory collection against a schema class | tests and importers |
| `rdf_mapping.schema_view` | function | the LinkML `SchemaView` for a schema path | `generate` |
| `rdf_mapping.member_slot_and_class` | function | which slot of a collection holds the terms, and their class | `generate` |
| `rdf_mapping.concept_to_triples` | function | turn one validated record into its SKOS triples | `generate.build_graph` |

## Generating Turtle

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `generate.build_graph` | function | build the SKOS graph for a list of records in one concept scheme | `generate_sources` |
| `generate.write_ttl` | function | serialise a graph with the ordered serializer | `generate_sources` |
| `generate.generate_sources` | function | validate given sources and write one Turtle file | the `generate` command |
| `generate.generate_category` | function | the same for a whole category | callers that work per category |
| `ordered_serialization.OrderedTurtleSerializer` | class | rdflib Turtle serializer with a stable statement order | `write_ttl` |
| `coverage.DataType` | class | one row of the coverage catalogue | `coverage.render` |
| `coverage.count_terms`, `coverage.render`, `coverage.write` | functions | count the native files per type, render the matrix, write it | the `coverage` command |

## The transitional importers

Each importer is a script with a single entry point that fetches an external ontology
and writes Turtle into `app/sentier_vocab/importers/output/`. They are run by
`scripts/generate.sh`, not by the package CLI.

| Name | Kind | What it is for |
|---|---|---|
| `graph_base.GraphBase` | class | shared graph plumbing for the ontology importers |
| `importers.envo.ENVO` | class | ENVO elementary flows |
| `importers.qudt.QUDT` | class | QUDT units, plus `add_quantity_kinds_to_graph` |
| `importers.open_energy_ontology.OpenEnergyProducts` | class | OEO energy products |
| `importers.combined_nomenclature.CN2024` | function | the EU Combined Nomenclature 2024 |
| `importers.model_terms.ModelTerms` | function | model terms |
| `importers.custom_products.add_custom_products` | function | hand-added products |
| `importers.geonames_iri_terms.generateGeonameVocabulary` | function | geonames places |
| `add_terms.add_custom_terms` | function | append hand-written terms to a namespace file |

## Errors

`errors.py` defines `GraphFilterError`, `MissingDimensionVector` and
`SchemaValidationError`. A source whose concept scheme is not registered in `iris.py`
raises before anything is written.

## Notes

- Nothing here is a stable public API in the packaging sense: the package is not
  released, and the CLI plus `iris.py` are what other repositories depend on.
- The generator is deliberately one output file per source file. It never merges two
  sources into one graph, so a bulk delivery cannot silently overwrite curated terms.
- `schemas/_generated/` holds Pydantic models derived from the LinkML schemas. They are
  a build artifact: edit the schema, not the generated model.
