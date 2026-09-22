---
title: sentier-brightway gotchas
type: module-page
summary: What surprises people about sentier-brightway, and what to do about it.
audience: [P1, P3]
updated: 2026-09-21
sources: [sentier-brightway-repo]
---

# sentier-brightway gotchas

One bullet per surprise, as the repository documents them at version 0.1.0, commit
`a9dba75`. (source: sentier-brightway-repo)

- **Nothing ships in the package.** The first run downloads the pinned data, checks every
  file against its sha256 and caches it in the user cache directory. An offline machine
  needs `--data-root` pointing at local clones of the four data repositories, or the
  `SENTIER_DATA_ROOT` environment variable, or a warm cache.

- **Install it where Brightway lives.** `db` writes through `bw2data`, which is not a
  runtime dependency of this package: it must already be in the same environment as the
  Activity Browser or your Brightway project, otherwise use `files`.

- **The Activity Browser caches projects.** After an install, reload the project before
  looking for the new databases and methods; the methods appear grouped under the
  Sentier method prefix rather than beside the ones the Activity Browser ships.

- **Some flows are deliberately not linked.** 113 inventory flows have no EF 3.1
  counterpart. They are kept in the residual database with their exchanges intact and
  no characterisation factor, so the mass balance survives while the score does not
  count them. `coverage` prints the split; `--skip-nomenclature` moves more flows there
  on purpose.

- **`--overwrite` is narrow, by design.** In file mode it replaces only a folder that
  already holds a `manifest.json`. Pointing `--out` at a folder full of other files
  fails rather than deleting them.

- **Production exchanges are typed, not inferred.** The registry identifies a production
  row by its exchange type, never by the input and the process sharing an id: the
  inventory contains technosphere self-loops, where a process consumes its own reference
  product, and the equality would misread them.

- **The export is static.** The registry carries uncertainty columns, but 0.1.0 does not
  write them into the datapackages, so a Monte Carlo run over an export sees fixed
  amounts.

- **Global factors only.** The methods are the global EF 3.1 factors; regionalised
  categories such as country-level water use are not covered in 0.1.0, and neither is any
  method family other than EF 3.1 or any inventory other than BAFU-2026 v1.

- **Unit spellings are normalised on the way in.** Source and bridge unit strings are
  mapped onto the names Brightway uses, and a conflict between the two is warned about
  rather than silently resolved. If a downstream tool disagrees about a unit name, look
  at the normalisation table first.

- **The backtest needs the reference workbook.** Its `--xlsx` default points at a path on
  the author's machine, so pass the published results file explicitly. The backtest also
  takes a while: it solves once per category over the whole system, and the `fast` extra
  adds a faster solver.

- **Differences against the reference results are expected in places.** The dashboard
  marks the categories with a documented cause, such as a counting difference for one
  substance family behind human toxicity, cancer. Read those notes before treating a
  deviation as a bug.

- **`sources.toml` is generated.** Re-pin it with the pinning script after the data
  repositories move rather than editing the commit ids by hand, or the sha256 checks
  fail on the next fetch.
