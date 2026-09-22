---
title: sentier-inventory datasets
type: module-page
summary: "The BAFU-2026 inventory as the platform ships it: eleven sector folders, two tables per folder, flow identifiers that carry their unit."
audience: [P1, P2]
updated: 2026-09-21
sources: [sentier-inventory-repo]
related: [../../../bafu/README.md, ../sentier-mappings/datasets.md]
---

# sentier-inventory datasets

One dataset, described broadly. No amounts appear on this page: the descriptors say what
a table holds and how it is keyed, never what any exchange is worth. Counts are as of
commit `6fced18`, 2026-09-17. (source: sentier-inventory-repo)

## BAFU-2026 life cycle inventory

- **Version:** schema version `0.1.0`; the source database is named `BAFU:2026` in every
  sector's metadata, and the mapping repository refers to the same release as
  `bafu-2026-v1`.
- **Sectors:** eleven folders, ranked. Agriculture, electricity, chemicals, transport,
  energy carriers, waste management, construction, materials, electronics and building
  services, plus a rank-99 obsolete folder holding legacy link targets so that older
  references still resolve.
- **Provenance:** the life cycle inventory database of the Swiss federal administration,
  BAFU:2026, carried as the `description` of every sector's `metadata.json`. The
  database itself, its methodology, its licence and how to obtain it are documented on
  [../../../bafu/](../../../bafu/). Which upstream source supplied which rows is
  deliberately not recorded here: the inventory is organised by sector, not by source,
  and the import log lives with the importers.
- **Schema:** two parquet tables and a metadata file per folder, contracted in
  `schema/`. See [classes.md](classes.md) for the columns.
- **Methods:** none. This is inventory only; impact assessment lives in
  [../sentier-methods/](../sentier-methods/).
- **Vocabulary:** process and flow identifiers are the platform's own. Alignment to the
  published term IRIs is the job of [../sentier-vocab/](../sentier-vocab/), and
  alignment to another database's nomenclature is the job of
  [../sentier-mappings/](../sentier-mappings/).
- **Source branch:** [../../../bafu/](../../../bafu/)

### Scale, per sector

Row counts as declared in each sector's `metadata.json`, which the validator checks
against the files.

| Rank | Sector | Processes | Exchanges |
|---|---|---|---|
| 01 | agriculture | 210 | 7,634 |
| 02 | electricity | 2,033 | 39,133 |
| 03 | chemicals | 510 | 35,566 |
| 04 | transport | 2,017 | 91,780 |
| 05 | energy carriers | 3,188 | 46,489 |
| 06 | waste management | 848 | 25,777 |
| 07 | construction | 927 | 97,366 |
| 08 | materials | 867 | 32,386 |
| 09 | electronics | 300 | 4,553 |
| 10 | building services | 268 | 11,887 |
| 99 | obsolete | 779 | 27,492 |

That is 11,947 processes and about 420,000 exchanges. Every process in the release is a
unit process: the `process_type` column holds only `unit` today, although the contract
also allows system processes and aggregated inventory results.

### What a process row holds

An identifier, a name, the reference product and its unit and amount, a geography code,
the process type, and optional technology text, validity date and comment. The reference
product is the technosphere match key: two processes can share a name and produce
different products, so linking is done on the product.

### What an exchange row holds

The owning process, the flow identifier and its name, whether the flow is the production
flow, a technosphere edge or a biosphere edge, the direction, the amount and its unit,
an optional exchange-level geography, and five optional uncertainty columns following
the Brightway convention. Uncertainty is sparse: most rows carry no distribution.

### Flow identifiers carry their unit

Flow identifiers are deterministic name-based UUIDs rather than readable codes, so the
same substance in the same context always gets the same identifier. Across the eleven
sector folders there are about 14,600 distinct flow identifiers, and all but a handful
appear with exactly one unit, which means the unit is a property of the identifier
rather than of the row. Two consequences:

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

## Raw sector deliveries

The repository also documents, in `data/README.md`, that a sector folder that has not
been populated yet ships only a `.gitkeep` and a metadata stub. Every folder in this
release carries real parquet. Parquet is committed directly: no git-LFS and no release
artifacts, by policy, so a file that would be too large is sharded or trimmed upstream
instead.
