---
title: sentier-inventory gotchas
type: module-page
summary: "What surprises people: the obsolete folder, per-folder guarantees, absent optional columns and flow identifiers that match nothing else."
audience: [P1, P3]
updated: 2026-09-21
sources: [sentier-inventory-repo]
---

# sentier-inventory gotchas

Each bullet says what happens, why, and what to do instead. Checked against the
repository at commit `6fced18`, 2026-09-17. (source: sentier-inventory-repo)

- **The rank-99 folder is not a sector.** `data/99-obsolete/` holds legacy link targets
  kept so older references resolve. It carries 779 processes and about 27,000 exchanges,
  and loading every folder blindly puts them in the same database as the current ones.
  Decide explicitly whether you want it.

- **The guarantees are per folder, not per repository.** Primary key uniqueness and the
  exchange to process foreign key are checked inside one sector folder. Nothing in the
  contract says a process identifier is unique across sectors, and nothing prevents an
  exchange in one folder from naming a flow that only exists in another. The rank prefix
  is the documented tie break: lower wins when records overlap.

- **Nothing enforces the rank.** The rank is a number in the metadata and a prefix on
  the folder name. No code in this repository applies it. A consumer that merges sectors
  has to implement the precedence itself.

- **An optional column can be missing entirely.** The contract lists `valid_from` on the
  process table, but no sector folder in this release actually carries that column. The
  validator accepts a missing optional column, so read with a column check rather than
  by position, and never assume a column exists because the schema mentions it.

- **An all-null column passes the type check.** The validator skips the type check for a
  column whose values are all null, because an all-null column carries no typed values
  to disagree with the contract. A physically mistyped but empty column therefore reaches
  you unflagged.

- **Uncertainty is sparse.** The five uncertainty columns are present in every sector but
  are null for the large majority of rows. Treat an exchange as deterministic unless
  `uncertainty_type` says otherwise, and do not read a null `scale` as zero.

- **Biosphere flow identifiers match nothing outside this repository.** They are
  deterministic name-based UUIDs from the delivery, and they do not overlap with the flow
  keys used in [../sentier-methods/](../sentier-methods/). Characterising this inventory
  without first applying the `bafu-2026-v1__ef-3.1` bridge from
  [../sentier-mappings/](../sentier-mappings/) silently produces almost nothing.

- **A flow identifier usually implies its unit, but not always.** Across the release
  about 14,600 distinct identifiers appear, and 29 of them appear with more than one
  unit. Keep reading the `unit` column; do not cache a unit per identifier.

- **Link on the reference product, not on the process name.** The schema says so
  explicitly: the reference product is the technosphere match key.

- **The source of a row is not in the row.** Inventory is organised by sector rather than
  by source, so no column says which upstream database a process came from. The sector
  metadata names the source database for the whole folder, and the per-row import log
  lives with the importers.

- **There is no loader here, by design.** The repository is artifacts only. Writing a
  reader against the parquet is fine, but the supported path into an LCA tool is
  [../sentier-brightway/](../sentier-brightway/), which pins a commit of this repository.

- **Parquet is committed directly.** No git-LFS and no release artifacts, by policy. A
  clone is a full copy of the data, and the history carries every delivered version of
  it.
