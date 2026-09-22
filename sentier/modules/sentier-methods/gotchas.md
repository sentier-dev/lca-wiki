---
title: sentier-methods gotchas
type: module-page
summary: "What surprises people: overlapping sub-indicators, flow keys that match no inventory, scaffolds that validate empty, and unchecked row counts."
audience: [P1, P3]
updated: 2026-09-22
sources: [sentier-methods-repo, ef-methods-lca]
---

# sentier-methods gotchas

Each bullet says what happens, why, and what to do instead. Checked against the
repository at commit `8d0f504`, 2026-09-17. (source: sentier-methods-repo)

- **Two of the three datasources are empty.** `02-ipcc-2021` and `03-recipe-2016` carry
  a metadata file and nothing else, and they validate that way on purpose. A consumer
  that iterates over `data/*/` and expects parquet in every folder breaks on the
  scaffolds.

- **The 25 EF categories overlap.** Climate change is shipped as a headline category and
  as biogenic, fossil, and land use and land use change splits; the toxicity and
  ecotoxicity categories likewise ship a headline row plus organics and inorganics rows.
  Nine of the 25 rows are sub-indicators in this way, and the remaining sixteen are the
  sixteen impact categories an EF study reports, listed in
  [../../../core/standards/ef-pef.md](../../../core/standards/ef-pef.md) (ef-methods-lca).
  Summing every category double counts. Choose the reported set deliberately.

- **The factor flow keys match nothing in the inventory.** They are EF flow identifiers
  written as IRIs in the Sentier flows namespace, and they share no identifier with the
  inventory flows in [../sentier-inventory/](../sentier-inventory/). Characterising
  without first applying the bridge in [../sentier-mappings/](../sentier-mappings/)
  yields almost no matched flows and a plausible-looking near-zero score.

- **`flow_context` is the publisher's wording, not a controlled code.** It is a single
  string holding the compartment path, in the source nomenclature. Splitting it on a
  separator works today and is not contracted; do not key on it.

- **A regionalised factor is a second match dimension.** About 42,700 factor rows carry
  a location, mostly for land use and water use. An exchange with no geography does not
  automatically get the global factor: decide, and document, whether you fall back to
  the unlocated row or aggregate the regionalised ones.

- **The declared row counts are not validated.** The validator checks the metadata
  against its JSON Schema, the required columns, the dtypes, the primary key and the
  foreign key, but it does not compare `row_counts` with the actual files, unlike the
  inventory repository. Treat the counts as documentation.

- **`indicator` is contracted but absent.** The method schema defines an optional
  `indicator` column; the EF 3.1 delivery does not carry it. Read by column name and
  handle the column being missing.

- **The rank prefix is not the datasource identifier.** The folder is `01-ef-3.1` and
  the identifier stored in the data and in every method identifier is `ef-3.1`. Parsing
  the folder name into a key gives you the wrong string.

- **Normalisation and weighting are optional and not shipped.** The table exists in the
  schema, so code may be written against it, but no datasource provides one today.

- **The factor table is large.** Three hundred thousand rows for one datasource, and it
  is a committed parquet file rather than a release artifact, because the platform uses
  no git-LFS and publishes no release artifacts. Select the columns you need and filter
  by method rather than loading the whole table.

- **Nothing here fetches or calculates.** By design this is a data layer: no importer
  code, no scorer. Both belong in other repositories, and a pull request adding them
  here would be refused.
