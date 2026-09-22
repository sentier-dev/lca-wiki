---
title: Run an importer end to end
type: use-case
summary: "Run the reference plugin through the full staged pipeline offline, inspect the staged output, and see where a delivery would go."
audience: [P1, P2]
updated: 2026-09-22
sources: [sentier-importers-repo]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.10.12, Ubuntu 22.04, sentier-importers 0.0.1 from a clone, throwaway cache and output directories, no network needed"
---

# Run an importer end to end

**Persona:** P2 contributor meeting the import side of the platform for the first time ·
**GICS sector:** any

## Goal

One complete pipeline run, from fetch to staged files, using the one source that runs
anywhere: the reference plugin bundled with the repository. It is the worked example a
new plugin is copied from, and it is the only source enabled by default.

## Prerequisites

- Python 3.10 or newer, `uv`, and a clone of sentier-importers with `uv sync --extra dev`.
- No network, no credentials and no licensed input files: the reference plugin reads a
  small comma-separated file shipped in the repository through the cached fetcher.
- Two throwaway directories, one for the fetch cache and one for the staging folder, if
  you do not want the defaults.

## Steps

1. See what is registered and what is enabled:

   ```bash
   uv run sentier-importers list
   ```

2. Run the pipeline up to validation, which emits nothing:

   ```bash
   uv run sentier-importers validate example-csv
   ```

3. Run it end to end as a dry run, staging the files somewhere of your own:

   ```bash
   uv run sentier-importers run example-csv --output-dir /path/to/staging --cache-dir /path/to/cache
   ```

4. Read what it staged:

   ```bash
   cat /path/to/staging/sentier_inventory/example/example-csv.json
   ```

5. When you want to see the change as a diff instead, stage into a local checkout of the
   target repository. No git operation happens and no pull request is opened:

   ```bash
   uv run sentier-importers run example-csv --deliver-local /path/to/sentier-inventory
   ```

## Expected output

Step 1 prints one line per registered source: its name, the target repository and
category it writes into, and whether it is enabled. There are 66 of them and exactly one
is enabled, which is why the run-everything smoke test stays fast.

Step 2 prints the source name and the number of valid rows, three for the reference
plugin, and writes nothing.

Step 3 prints the path of the single file it wrote, under
`<staging>/<target>/<category>/`. Step 4 shows that file: a small JSON array of records,
each normalised into the shape the plugin's `transform` declares. It is a toy shape, not
an [LCI](../../../../vocabulary.md#lci) shape, on purpose.

Step 5 puts the same file into the target repository's data folder in your checkout, so
`git diff` there shows exactly what a pull request would propose.

## Pitfalls

- **Most sources will not run for you.** 65 of the 66 are disabled, and several of the
  disabled ones read local paths holding licensed or large inputs. Naming one of those
  explicitly fails on a missing file, not on a bug.
- **A run is a dry run.** Nothing leaves the staging folder without `--deliver`, and
  `--deliver` additionally needs an authenticated GitHub command line client. Prefer
  `--deliver-local` while you are still looking at the diff.
- **`--offline` makes a cache miss an error.** That is what continuous integration uses,
  and it is the honest way to check that a source really does ship its fixtures.
- **Validation is pinned to the target's schema reference.** A [schema](../../../../vocabulary.md#schema)
  change that is not merged yet will not be picked up; pass `--schema-dir` while it is in
  flight.
- **Identifiers are minted, not copied.** Re-running a source must produce byte-identical
  identifiers. Changing what the slug is built from silently produces a second term
  rather than an update.

## Related vocabulary

[Importer](../../../../vocabulary.md#importer),
[schema](../../../../vocabulary.md#schema),
[nomenclature](../../../../vocabulary.md#nomenclature),
[randonneur package](../../../../vocabulary.md#randonneur-package),
[sector folder](../../../../vocabulary.md#sector-folder).

## Verification

Run on 2026-09-22 on Ubuntu 22.04 with uv 0.11.14 and Python 3.10.12, in a clone of
sentier-importers at version 0.0.1, with throwaway cache and output directories and no
network reachable from the plugin. Steps 1 to 4 were executed as written and took 2.9 s,
3.9 s, 3.3 s and under a second. Step 1 listed 66 sources with one enabled; step 2
reported three valid rows; step 3 wrote one JSON file holding three records with the
fields `id`, `label` and `region`. Step 5 was not run, because it writes into a checkout
of another repository.
