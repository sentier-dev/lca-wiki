---
title: sentier-vocab datasets
type: module-page
summary: The thirteen curated term categories, the IRI scheme they publish under, and the Turtle the generator writes.
audience: [P1, P2]
updated: 2026-09-21
sources: [sentier-vocab-repo]
related: [../sentier-inventory/datasets.md, ../sentier-methods/datasets.md]
---

# sentier-vocab datasets

The dataset this repository ships is the vocabulary itself. Descriptors stay broad: no
characterisation factor values and no inventory amounts appear here, only the shape of
the data and where it comes from. Counts are as of commit `ef440c6`, 2026-09-17.
(source: sentier-vocab-repo)

## The IRI scheme

Every term has one canonical IRI under `https://vocab.sentier.dev/`, minted from the
category namespace plus a stable identifier. The registry in `app/sentier_vocab/iris.py`
is the contract: a published namespace does not change without a vocabulary migration,
and a data file whose declared concept scheme is not registered fails generation.

| Category key | Namespace |
|---|---|
| flows | `https://vocab.sentier.dev/flows/` |
| units | `https://vocab.sentier.dev/units/` |
| unit-groups | `https://vocab.sentier.dev/units/group/` |
| products | `https://vocab.sentier.dev/products/` |
| processes | `https://vocab.sentier.dev/processes/` |
| flow-properties | `https://vocab.sentier.dev/flow-properties/` |
| lcia-methods | `https://vocab.sentier.dev/lcia-methods/` |
| impact-categories | `https://vocab.sentier.dev/impact-categories/` |
| characterization-factors | `https://vocab.sentier.dev/characterization-factors/` |
| model-terms | `https://vocab.sentier.dev/model-terms/` |
| sources | `https://vocab.sentier.dev/sources/` |
| contacts | `https://vocab.sentier.dev/contacts/` |
| organisms | `https://vocab.sentier.dev/organisms/` |
| qualifiers | `https://vocab.sentier.dev/qualifiers/` |

A characterisation factor gets a deterministic IRI built from its method, its impact
category and its flow, so the same factor always resolves to the same term.

## What every term carries

The abstract `Concept` class in `schemas/common.yaml` gives every term type the same
core: the IRI, a preferred English label, alternative labels, a definition, a notation,
a broader term, the SKOS `exactMatch`, `closeMatch` and `related` properties, a
bibliographic source and a status. Each term type then adds its own slots, for example
compartment, sub-compartment, CAS number and chemical formula for an elementary flow.

## The curated categories

| Category | Source files | Scale | What a record holds |
|---|---|---|---|
| `elementary-flows` | `water.yaml` plus 17 parquet shards | about 82,000 parquet rows | a flow with its compartment, sub-compartment, CAS number and formula; shards are named by compartment or theme |
| `processes` | `core.yaml` plus 12 parquet shards | about 14,400 parquet rows | a process with geography, validity date, technology, process type and an inlined list of exchanges; shards are named per sector |
| `products` | `core.yaml`, plus Agribalyse and FoodEx2 parquet | about 8,400 parquet rows | a product with its CPC code and its reference flow property |
| `organisms` | `foodex2.parquet` | about 23,900 rows | biological source taxa from FoodEx2 |
| `qualifiers` | `foodex2.parquet` | about 1,900 rows | FoodEx2 facets and non-food matrices |
| `flow-properties` | `core.yaml` | pilot | a property such as mass or energy, with its default unit as a QUDT IRI and a data type |
| `unit-groups` | `core.yaml` | pilot | a group of units with a reference unit and a QUDT quantity kind |
| `impact-categories` | `core.yaml`, `ef-3.1.yaml` | the EF 3.1 categories | a category, the method it belongs to and its bibliographic source |
| `lcia-methods` | `core.yaml`, `ef-3.1.yaml` | the EF 3.1 method | a method and the list of impact category IRIs it covers |
| `characterization-factors` | `core.yaml` | pilot | the link between one method, one impact category and one flow |
| `model-terms` | `core.yaml` | pilot | a modelling term such as efficiency, tied to a QUDT quantity kind |
| `sources` | `core.yaml` plus one file per imported database | five files | a bibliographic reference: title, creators, publisher, date, identifier and the citation string a user must carry |
| `contacts` | `core.yaml` | pilot | a data provider or maintainer |

Two of these matter for the rest of the platform. The elementary-flow shards are the
flow nomenclature that impact assessment and inventory are matched against, and the
`sources` category holds the citation strings that derived work has to reproduce,
including the one required for the Swiss federal inventory documented in
[../../../bafu/](../../../bafu/).

## Provenance

- **Native curation.** Hand-authored YAML under `data/<category>/`, reviewed by pull
  request. This is the only place a term is authored.
- **Bulk delivery.** Content-named parquet, opened as pull requests by the importers.
  A bulk file stays under 3 MB, enforced by a pre-commit size guard, and is sharded with
  a numeric suffix rather than stored with git-LFS.
- **External ontologies.** ENVO, QUDT, the Open Energy Ontology, the EU Combined
  Nomenclature and geonames are fetched and converted by the transitional importer
  layer, which writes its own Turtle outside `output/`. Those terms keep the licence of
  the ontology they came from.

## The generated Turtle

`output/` holds SKOS Turtle, one file per source file. The primary files, generated from
the `core` and `water` stems, are committed so that a reviewer can read the diff:
`flows.ttl`, `products.ttl`, `processes.ttl`, `flow-properties.ttl`, `unit-groups.ttl`,
`impact-categories.ttl`, `lcia-methods.ttl`, `characterization-factors.ttl`,
`model-terms.ttl`, `sources.ttl` and `contacts.ttl`. Everything generated from a bulk
source, for example `organisms.foodex2.ttl` or `processes.agriculture.ttl`, is
gitignored and rebuilt when the vocabulary is deployed. The serializer orders statements
deterministically, so a regenerated file only differs where the data did.

## Vocabulary

The vocabulary is SKOS. Terms are `skos:Concept`, labels are `skos:prefLabel` and
`skos:altLabel`, hierarchy is `skos:broader`, and alignment to an external ontology is
`skos:exactMatch` or `skos:closeMatch`. Units and quantity kinds are referenced as QUDT
IRIs rather than redefined.

## Source branch

The databases whose terms are imported here are documented on their own branches:
[../../../bafu/](../../../bafu/) for the Swiss federal inventory and
[../../../ecoinvent/](../../../ecoinvent/) for ecoinvent.
