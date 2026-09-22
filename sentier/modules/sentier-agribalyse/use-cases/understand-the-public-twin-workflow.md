---
title: Understand the public twin workflow
type: use-case
summary: "What a licensed user actually does with the adapter, end to end, and what stays public: the mapping packages, the reviews and the stripped skeleton."
audience: [P1, P2]
updated: 2026-09-22
sources: [sentier-agribalyse-repo, ecoinvent-licences]
verified: no
---

# Understand the public twin workflow

**Persona:** P1 practitioner with an Agribalyse study and a background database licence,
or a P2 contributor deciding what can be shared · **GICS sector:** Consumer Staples,
food products

## Goal

A clear picture of the two halves of this repository: the public half, which anyone can
read and contribute to, and the licensed half, which a licence holder regenerates on
their own machine and never publishes. The point of the design is that the public half is
a complete, reviewable twin of the work, and the licensed half is only amounts.

## Prerequisites

- Python 3.11 or newer, `uv`, and a clone of sentier-agribalyse with
  `uv sync --extra pardiso` and `pre-commit install` run before anything else.
- The publisher's Agribalyse 3.2 SimaPro export and the harmonised flow list, placed
  under the repository's source folder. Neither is in git.
- A licence for the background database, and the credentials that come with it, used once
  for the bootstrap snapshot.
- The faster sparse solver: the default one rejects the matrix's zero-diagonal
  placeholder activities as exactly singular.

## Steps

1. Activate the guard that refuses to commit licensed files, before regenerating any of
   them:

   ```bash
   pre-commit install
   ```

2. Bootstrap once, snapshotting the licensed background exchanges into the local source
   folder:

   ```bash
   uv run dds-snapshot-ecoinvent-exchanges --sqlite /path/to/brightway/database.sqlite3
   ```

3. Build the mapping registry from every artifact under the source folder, then its
   catalogues, in the documented order:

   ```bash
   uv run dds-build-registry
   ```

4. Link [foreground](../../../../vocabulary.md#foreground) to
   [background](../../../../vocabulary.md#background) through the tiered registry, which
   writes the scoring package and the run report:

   ```bash
   uv run dds-link-all
   ```

5. Score every mapped product against the publisher's reference values:

   ```bash
   uv run dds-backtest --solver pardiso
   ```

6. Build the dashboard tables and serve the dashboard folder with any static file server:

   ```bash
   uv run dds-build-flow-decomp
   ```

7. Export the linked system for a tool that reads
   [datapackages](../../../../vocabulary.md#datapackage), which is licensed output and
   stays local:

   ```bash
   uv run dds-build-bw-package --out /path/to/export
   ```

8. Write the public twin: the same scoring package with the licensed amounts stripped
   out, into a separate checkout:

   ```bash
   uv run dds-build-skeleton --content-hash <hash> --bundle-root /path/to/public-checkout
   ```

## Expected output

Steps 3 to 5 each write parquet under the repository's registry folder and print a
progress log; the link writes a run report naming how many products linked at which tier,
and the backtest writes per-product differences against the reference values. Step 6
writes the per-product flow decomposition the dashboard drills into. Step 7 writes
datapackages plus a standalone importer and parity-checks them through a stock
calculation.

What comes out public is step 8's skeleton, the
[randonneur packages](../../../../vocabulary.md#randonneur-package) the repository
authors, the review artifacts (the mapping comparison, the residuals spreadsheet, the
factor comparison) and the registry provenance record. What stays local is everything
carrying background amounts: the snapshot, the built registry tables, the scoring package
and the datapackage export.

## Pitfalls

- **Install the guard first.** Regenerating the licensed files and installing the hook
  afterwards leaves a window in which an ordinary `git add -A` stages licensed data. The
  ignore file covers the same paths, and the hook exists because an ignore file can be
  bypassed.
- **The datapackage export is licensed output.** It embeds the background amounts. Do not
  commit it, publish it or attach it to an issue; share the skeleton or the mapping
  packages instead.
- **Build the registry in order.** Each catalogue depends on the step before, and running
  the link against a half-built registry produces a link with silently fewer tiers rather
  than an error.
- **Nothing runs in a fresh clone.** The export and the flow list are not in git, and
  neither is anything derived from the background database. A fresh clone can run the
  test suite, which uses synthetic fixtures, and print every command's help, which is
  [list-the-console-scripts.md](list-the-console-scripts.md); it cannot run a real link.
- **Two factor tables disagree on purpose.** The public reference export and the adapted
  table used by the import side are shipped side by side, with audits of the difference,
  rather than one being silently chosen. Read the audit before quoting either.
- **Replacing the export means starting again.** Reset the caches and the parsed import
  before the next link, or you score a mixture of two releases.

## Related vocabulary

[Foreground](../../../../vocabulary.md#foreground),
[background](../../../../vocabulary.md#background),
[linking](../../../../vocabulary.md#linking),
[randonneur package](../../../../vocabulary.md#randonneur-package),
[datapackage](../../../../vocabulary.md#datapackage),
[system model](../../../../vocabulary.md#system-model),
[LCIA method](../../../../vocabulary.md#lcia-method),
[impact category](../../../../vocabulary.md#impact-category).

## Verification

`verified: no`. The steps are the repository's documented order, read on 2026-09-22 in a
clone at version 0.3.0, with each command's flags taken from its own `--help`. They were
not executed, because every step from the bootstrap onwards requires licensed inputs: a
background database licence and its credentials, plus the publisher's export, none of
which were available in this environment. What was verified on the same day is the
command surface itself, on
[list-the-console-scripts.md](list-the-console-scripts.md). A verifier would need an
Agribalyse 3.2 SimaPro export, a harmonised flow list and a background database licence,
and would record the run report counts and the backtest summary rather than any amount.
