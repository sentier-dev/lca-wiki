---
title: sentier-mappings
type: module
summary: "Cross-source bridges as randonneur packages: one folder per source and target pair, ordered packages, no proprietary data."
audience: [P1, P2]
updated: 2026-09-21
sources: [sentier-mappings-repo, randonneur-repo]
related: [../sentier-inventory/README.md, ../sentier-methods/README.md, ../../../ecoinvent/README.md]
---

# sentier-mappings

sentier-mappings is a data repository holding the bridges between nomenclatures: which
elementary flow of one database corresponds to which flow key of another, and which
process of one corresponds to which activity of another. Bridges are stored as
randonneur JSON packages, one folder per source and target pair, and they are read by
the loader at build time and by anyone who needs to relink a dataset. Contributors and
the importers write here by pull request; there is no fetch, parse or calculate code,
only the validator continuous integration runs.
(source: sentier-mappings-repo, randonneur-repo)

**Version documented:** mapping schema version `0.2.0`, as required by every pair's
`metadata.json` · **obtained from:** a clone of
`github.com/sentier-dev/sentier-mappings` at commit `4a25ec3`, dated 2026-09-17 ·
**as of:** 2026-09-21.

## Install

Nothing to install. Clone the repository and read the JSON:

```bash
git clone https://github.com/sentier-dev/sentier-mappings.git
```

The validator and its tests need `jsonschema[format]` and `pytest`, which `uv run`
fetches on demand. A consumer that wants to apply a package rather than read it uses
[randonneur](https://github.com/brightway-lca/randonneur), the package format these
files follow. (source: sentier-mappings-repo)

## What it does

1. **Stores a bridge per pair.** `data/<source>__<target>/`, with the ordered package
   files and one identity file. See [datasets.md](datasets.md).
2. **Keeps proprietary data out.** A bridge whose target is a licensed database marks
   itself as such and encodes its targets as an opaque database and code pair only. A
   licensed holder resolves the code locally. See [gotchas.md](gotchas.md).
3. **Validates the whole set.** Folder naming, package naming and order, entry counts,
   duplicate source keys within and across the packages of a pair, unit consistency,
   stray files and the proprietary rule. See [commands.md](commands.md).

## Datasets

Five pairs, four of them populated. Counts as declared in each pair's metadata.

| Pair | Kind | Packages | Entries |
|---|---|---|---|
| `agribalyse-3.2__ecoinvent-3.9.1` | foreground to background | stub, targets marked proprietary | 0 |
| `agribalyse-3.2__ef-3.1` | elementary flow to factor key | 1 | 1,095 |
| `bafu-2026-v1__ef-3.1` | elementary flow to factor key | 4, ordered | 2,566 |
| `eaternity-bafu-ext__ef-3.1` | elementary flow to factor key | 1 | 19,275 |
| `ecoinvent-biosphere3__eaternity-bafu-ext` | flow to flow | 1 | 1,371 |

Licence: MIT. The detail, including what each pair bridges and how the ordered packages
of a pair relate, is in [datasets.md](datasets.md).
(source: sentier-mappings-repo)

## Pages

- [layout.md](layout.md): the repository tree, one line per file or folder
- [classes.md](classes.md): the package profile, the metadata schema and the validator
- [commands.md](commands.md): every runnable entry point
- [datasets.md](datasets.md): the pairs this repository ships
- [gotchas.md](gotchas.md): what surprises people
- [status.md](status.md): what works, what is in flight, what is missing
- [use-cases/](use-cases/): end-to-end things a practitioner does with it

`api/` is absent: there is no package to document.
