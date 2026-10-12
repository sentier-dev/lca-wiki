---
title: sentier-inventory datasets
type: module-page
summary: "The BAFU-2026 inventory as the platform ships it: one source folder, two tables and a metadata file, the sector as a column, flow identifiers that carry their unit."
audience: [P1, P2]
updated: 2026-10-12
sources: [sentier-inventory-repo, sentier-inventory-pr-5]
related: [../../../bafu/README.md, ../sentier-mappings/datasets.md]
---

# sentier-inventory datasets

One dataset, described broadly. No amounts appear on this page: the descriptors say what
a table holds and how it is keyed, never what any exchange is worth. Counts are as of
commit `cf54f55`, 2026-10-12, the head of pull request #5 (not yet merged).
(source: sentier-inventory-pr-5)

## BAFU-2026 life cycle inventory

- **Version:** schema version `0.3.0`; the datasource id is `bafu-2026`, the publisher's
  release `v1`, so the folder is `data/bafu-2026-v1/`, and the mapping repository refers
  to the same release as `bafu-2026-v1` in its pair name.
- **Sectors:** eleven values of the `sector` column on the process table: agriculture,
  electricity, chemicals, transport, energy, waste, construction, materials, electronics
  and building services, plus `obsolete` for legacy link targets kept so that older
  references still resolve. The sector is a row attribute, not a folder.
- **Provenance:** the life cycle inventory database of the Swiss federal administration,
  BAFU:2026, named in the folder's `metadata.json` together with the publisher, the
  publisher's terms of use, the required citation sentence and the vocabulary's Source
  IRI of the datasource. The database itself, its methodology, its licence and how to
  obtain it are documented on [../../../bafu/](../../../bafu/). Every row also carries
  `source` and `source_version`; which upstream file supplied which row is not recorded
  here, that import log lives with the importers.
- **Schema:** two parquet tables and a metadata file in the source folder, contracted
  in `schema/`. See [classes.md](classes.md) for the columns.
- **Methods:** none. This is inventory only; impact assessment lives in
  [../sentier-methods/](../sentier-methods/).
- **Vocabulary:** process and flow identifiers are the platform's own. Alignment to the
  published term IRIs is the job of [../sentier-vocab/](../sentier-vocab/), and
  alignment to another database's nomenclature is the job of
  [../sentier-mappings/](../sentier-mappings/).
- **Source branch:** [../../../bafu/](../../../bafu/)

### Scale, per sector

Row counts per value of the `sector` column, read from the parquet. The folder's
`metadata.json` declares the totals and the list of sectors present, and the validator
checks both against the files.

| Sector | Processes | Exchanges |
|---|---|---|
| agriculture | 210 | 7,634 |
| electricity | 2,033 | 39,133 |
| chemicals | 510 | 35,566 |
| transport | 2,017 | 91,780 |
| energy | 3,188 | 46,489 |
| waste | 848 | 25,777 |
| construction | 927 | 97,366 |
| materials | 867 | 32,386 |
| electronics | 300 | 4,553 |
| building-services | 268 | 11,887 |
| obsolete | 779 | 27,492 |

That is 11,947 processes and 420,063 exchanges, the same rows as before the layout
change. Every process in the release is a unit process: the `process_type` column holds
only `unit` today, although the contract also allows system processes and aggregated
inventory results.

### What a process row holds

An identifier, a name, the reference product and its unit and amount, a geography code,
the process type, the sector, the datasource id and its version, and optional
technology text, validity date and comment. The reference product is the technosphere
match key: two processes can share a name and produce different products, so linking is
done on the product.

### What an exchange row holds

The owning process, the flow identifier and its name, whether the flow is the production
flow, a technosphere edge or a biosphere edge, the direction, the amount and its unit,
an optional exchange-level geography, and five optional uncertainty columns following
the Brightway convention. Uncertainty is sparse: most rows carry no distribution.

### Flow identifiers carry their unit

Flow identifiers are deterministic name-based UUIDs rather than readable codes, so the
same substance in the same context always gets the same identifier. Across the release
there are about 14,600 distinct flow identifiers, and all but a handful appear with
exactly one unit, which means the unit is a property of the identifier rather than of
the row. Two consequences:

- the same flow name can map to several identifiers, because compartment, sub-compartment
  and unit distinguish them; do not group by name;
- the `unit` column is still authoritative, because the rule is a convention of the
  delivery rather than a validated constraint. See [gotchas.md](gotchas.md).

### How the flows reach an impact assessment method

They do not, directly. The biosphere identifiers in this repository and the flow keys in
[../sentier-methods/](../sentier-methods/) come from different nomenclatures and do not
overlap at all. The bridge is the `bafu-2026-v1__ef-3.1` pair in
[../sentier-mappings/](../sentier-mappings/), which relinks inventory flows onto EF 3.1
flow keys before any characterisation happens.

## Deliveries

A delivery from [../sentier-importers/](../sentier-importers/) replaces its source
folder whole: the two parquet files and the metadata are copied over whatever the folder
held. Sources never share a file, so no merge step exists or is needed, and a second
datasource arrives as its own folder next to `bafu-2026-v1/`. A new release of the same
source is a new folder, `<source>-<new version>`. Parquet is committed directly: no
git-LFS and no release artifacts, by policy, so a file that would be too large is
sharded or trimmed upstream instead. (source: sentier-inventory-pr-5)
