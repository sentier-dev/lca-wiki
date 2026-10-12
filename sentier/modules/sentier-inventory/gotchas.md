---
title: sentier-inventory gotchas
type: module-page
summary: "What surprises people: a layout change pending merge, the obsolete sector, per-folder guarantees, absent optional columns and flow identifiers that match nothing else."
audience: [P1, P3]
updated: 2026-10-12
sources: [sentier-inventory-repo, sentier-inventory-pr-5, sentier-importers-pr-29, sentier-brightway-pr-3]
---

# sentier-inventory gotchas

Each bullet says what happens, why, and what to do instead. Checked against the
repository at commit `cf54f55`, 2026-10-12. (source: sentier-inventory-pr-5)

- **The layout changed on 2026-10-12, and the change is still on open pull requests.**
  Until then `data/` held eleven sector folders, `01-agriculture` through
  `10-building-services` plus `99-obsolete`, and the sector was the folder. Now `data/`
  holds one folder per published release of one datasource, `data/<source>-<source_version>/`,
  and the sector is a required column. The reason: sector parquet from several sources
  did not stack. A delivery copied its sector file over the existing one, so the first
  delivery of a second source into an existing sector folder would have erased the rows
  already there. The change is pull request #5 here, #29 on the importers and #3 on the
  loader, all open and pending merge as of 2026-10-12; a clone of the default branch
  before the merge still shows the sector folders. (source: sentier-inventory-pr-5,
  sentier-importers-pr-29, sentier-brightway-pr-3)

- **`obsolete` is a sector value, not a sector.** The 779 processes and about 27,000
  exchanges with `sector = obsolete` are legacy link targets kept so older references
  resolve. They sit in the same folder as the current rows, so loading the folder
  blindly puts them in the same database. Filter on the column if you do not want them,
  and know that exchanges in other sectors may point at them: the loader in
  [../sentier-brightway/](../sentier-brightway/) keeps them for exactly that reason.
  (source: sentier-brightway-pr-3)

- **The guarantees are per folder, and a folder is one source.** Primary key uniqueness
  and the exchange to process foreign key are checked inside one source folder. A
  process identifier is not promised to be unique across sources, and a link from one
  source to another is not a parquet join: it goes through
  [../sentier-mappings/](../sentier-mappings/).

- **There is no precedence between folders.** The rank prefix and its "lower wins" rule
  are gone with the sector folders. A consumer names the source it wants, and the
  version when two releases of one source are served side by side; nothing in the
  repository decides for it.

- **An optional column can be missing entirely.** The contract lists `valid_from` on the
  process table, but the delivered table does not carry that column. The validator
  accepts a missing optional column, so read with a column check rather than by position,
  and never assume a column exists because the schema mentions it.

- **An all-null column passes the type check.** The validator skips the type check for a
  column whose values are all null, because an all-null column carries no typed values
  to disagree with the contract. A physically mistyped but empty column therefore reaches
  you unflagged.

- **Uncertainty is sparse.** The five uncertainty columns are present in the delivered
  table but are null for the large majority of rows. Treat an exchange as deterministic
  unless `uncertainty_type` says otherwise, and do not read a null `scale` as zero.

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

- **The source of a row is in the row, and in the folder name, and they must agree.**
  `source` and `source_version` are required columns with exactly one value each per
  folder, pinned by the validator to the metadata and to the folder name. What is not
  in the row is which upstream file produced it; that import log lives with the
  importers.

- **There is no loader here, by design.** The repository is artifacts only. Writing a
  reader against the parquet is fine, but the supported path into an LCA tool is
  [../sentier-brightway/](../sentier-brightway/), which pins a commit of this repository.

- **Parquet is committed directly.** No git-LFS and no release artifacts, by policy. A
  clone is a full copy of the data, and the history carries every delivered version of
  it.
