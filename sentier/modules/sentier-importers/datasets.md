---
title: sentier-importers datasets
type: module-page
summary: What the registered sources read, what they write, and into which target repository.
audience: [P1, P2]
updated: 2026-10-12
sources: [sentier-importers-repo, sentier-importers-pr-29]
---

# sentier-importers datasets

The repository ships no dataset of its own. It ships 46 registered sources, read from
`registry.yaml` at commit `a27910f` on 2026-10-12, the head of branch
`feat/source-folders` proposed as pull request #29 and not yet merged, which read
external data and deliver it into four target repositories. There were 66 at commit
`dac2e67` on 2026-09-21: the 22 per-sector inventory blocks of the Swiss federal family
became two. Descriptors stay broad: no amounts and no characterisation factor values
appear on this page. (source: sentier-importers-repo, sentier-importers-pr-29)

## Targets

| Target repository | Sources delivering to it | Files land in | Validated by |
|---|---|---|---|
| sentier-vocab | 34 | the repository's data folder | its LinkML schema, at a pinned reference |
| sentier-inventory | 3 | one folder per source release, `data/<source>-<source_version>/`, replaced whole on delivery | the target repository's own checker |
| sentier-mappings | 7 | the repository's data folder | the randonneur package schema, in the source |
| sentier-methods | 2 | the repository's data folder | the target repository's own checker |

The published data is documented on the target module pages:
[../sentier-vocab/](../sentier-vocab/), [../sentier-inventory/](../sentier-inventory/),
[../sentier-mappings/](../sentier-mappings/) and [../sentier-methods/](../sentier-methods/).

## Source families

### Swiss federal inventory (24 registered sources)

- **Reads:** the published exchange-format inventory, from local paths.
- **Writes:** process and elementary-flow vocabulary terms; processes and exchanges as
  parquet, one pair in the inventory's source folder `data/bafu-2026-v1/`, from the two
  registry blocks `bafu-processes` and `bafu-exchanges` with category `bafu-2026-v1`;
  the folder's `metadata.json`, written by the local regeneration script from the
  staged parquet and the publisher constants; and the flow bridge onto the EF 3.1
  nomenclature as ordered mapping packages, with a coverage sidecar.
- **Sectors:** every dataset is emitted, and its sector is written into the `sector`
  column of the process table from the map of BAFU categories onto the inventory's
  eleven sector ids, agriculture through building-services plus obsolete. A delivery
  replaces the source folder whole; sources never share a folder.
  (source: sentier-importers-pr-29)
- **Source branch:** [../../../bafu/](../../../bafu/)

### Agribalyse and the EF 3.1 reference package (15 registered sources)

- **Reads:** the Agribalyse export and the EF 3.1 reference tables, from local paths.
- **Writes:** product, process, LCIA method and impact category vocabulary terms;
  elementary flows by compartment; the method and characterisation factor tables of the
  EF 3.1 data folder; and an Agribalyse to EF 3.1 flow bridge, hand-authored entries
  only.
- **Source branch:** [../sentier-agribalyse/](../sentier-agribalyse/)

### FoodEx2 (4 registered sources)

- **Reads:** the FoodEx2 food classification.
- **Writes:** products, organisms and qualifiers as parquet, plus a provenance term, into
  the vocabulary.

### Flow inference from an extension list (2 registered sources)

- **Reads:** an extension elementary flow list published by a third party.
- **Writes:** inferred additions to the inventory-to-EF flow bridge, plus a review
  sidecar recording what was inferred and why, so a reviewer can accept or reject an
  entry rather than trust it.

### The reference plugin (1 registered source)

- **Reads:** a small comma-separated file shipped with the repository.
- **Writes:** an example category into the inventory target.
- It is the only source enabled by default, which keeps the run-everything smoke test
  fast, and it is the worked example a new plugin is copied from.

## Curated data in the repository

Two small files under the matching package are data rather than code: a list of curated
aliases, and a list of known upstream label defects with their corrections. Both are
read by the flow matcher and both are reviewable in a pull request.
(source: sentier-importers-repo)

## Output formats

| Format | Used for |
|---|---|
| YAML | single vocabulary terms and provenance entries |
| JSON | randonneur mapping packages and their sidecars |
| parquet | bulk vocabulary, inventory and method tables, with an explicit Arrow schema |

Turtle is read but never written: RDF is an input concern, and the vocabulary repository
generates its own Turtle from what it receives. (source: sentier-importers-repo)
