---
title: Run the backtest against the published BAFU results
type: use-case
summary: "Score every BAFU-2026 process for all 25 EF 3.1 categories, compare it with the published results workbook, and read the dashboard the run writes."
audience: [P1, P2]
updated: 2026-09-22
sources: [sentier-brightway-repo, bafu-2026-release]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.11.15, Ubuntu 22.04, sentier-brightway 0.1.0 from a clone, pypardiso solver, an existing file-mode export, the published results zip"
---

# Run the backtest against the published BAFU results

**Persona:** P1 practitioner or P2 contributor who has to say, on the record, how close
this build is to the publisher's own numbers · **GICS sector:** any

## Goal

A per-category comparison of every process in the build against the
[LCIA results](../../../../vocabulary.md#lcia-results) the database publisher ships, plus
a static dashboard you can open in a browser and hand to a reviewer.

## Prerequisites

- Python 3.10 or newer, `uv`, and a clone of sentier-brightway. The `fast` extra adds a
  faster sparse solver and is worth having.
- The published results component of the release, `.xlsx` or the `.zip` that holds it.
  Getting it is [../../../../bafu/use-cases/download-and-verify-the-release.md](../../../../bafu/use-cases/download-and-verify-the-release.md).
- Either a [file-mode](../../../../vocabulary.md#file-mode) export made earlier, or a data
  root so the backtest can write one first.

## Steps

1. If you do not have one yet, write the file-mode export first, as in
   [export-bafu-2026-as-file-mode-datapackages.md](export-bafu-2026-as-file-mode-datapackages.md).

2. Run the backtest against an existing export:

   ```bash
   uv run sentier-brightway backtest --out /path/to/dashboard --files /path/to/export --xlsx "/path/to/BAFU-2026 v1_LCIA Results_corrected.zip"
   ```

3. Serve the dashboard folder and open it:

   ```bash
   uv run python -m http.server 8000 --directory /path/to/dashboard
   ```

4. Read the per-category tables as data rather than in the browser:

   ```bash
   uv run --with pandas --with pyarrow python -c "import pandas as pd; print(pd.read_parquet('/path/to/dashboard/backtest/summary.parquet').to_string())"
   ```

## Expected output

Step 2 prints one line saying how many processes were matched to reference rows, how
many were unmatched, how many were skipped over a unit mismatch, which solver was used
and how long the scoring itself took, then a table with one row per category: the
category's short name, how many processes were compared, the median, first-quartile and
third-quartile percentage difference against the reference, the number of outliers and
the largest absolute difference.

The shape to expect is that most categories sit at a median difference of zero or a
fraction of a per cent, with a long tail of individual outliers, and that a small number
of categories differ systematically. In the run verified below, the human toxicity cancer
family was the one with a large median difference; the dashboard carries a note naming
the documented cause, a counting difference for one substance family. Read those notes
before treating a deviation as a bug.

Step 2 also writes the folder: `backtest/` with the scores, the reference, the percentage
differences and the summary as parquet, `worst/` with a per-category drill-down of the
worst processes, and the JSON files the dashboard page reads.

## Pitfalls

- **`--xlsx` has a default that is not yours.** Its default points at a path on the
  author's machine, so always pass the workbook explicitly.
- **The results workbook joins on names, not identifiers.** Matching is by process name,
  so a renamed or re-encoded name shows up as an unmatched row rather than as a
  difference. Check the unmatched count before reading the table.
- **It is a full solve per category.** Without the `fast` extra the run is much slower;
  with `--files` pointing at an export you already have, you skip rebuilding it.
- **Differences are expected in places.** Categories with a documented cause are marked
  in the dashboard. A category with no note and a large median is worth reporting
  upstream.
- **Do not publish the per-process table.** The comparison contains the publisher's own
  result values; describe it, cite it, and leave the numbers in the release.

## Related vocabulary

[LCIA results](../../../../vocabulary.md#lcia-results),
[impact category](../../../../vocabulary.md#impact-category),
[method id](../../../../vocabulary.md#method-id),
[file mode](../../../../vocabulary.md#file-mode),
[datapackage](../../../../vocabulary.md#datapackage),
[single overall score](../../../../vocabulary.md#single-overall-score).

## Verification

Run on 2026-09-22 on Ubuntu 22.04 with uv 0.11.14 and Python 3.11.15, in a clone of
sentier-brightway at version 0.1.0. Step 2 was executed as written against a file-mode
export made in the same session and the published results zip, and took 11.4 s with the
pypardiso solver; scoring itself was reported as 0.7 s. It mapped 11,947 processes with
no unmatched and no unit-skipped rows, and printed 25 category rows, each comparing
between 11,720 and 11,804 processes. It wrote the four backtest parquet files, the 25
per-category drill-down files and the dashboard JSON. Steps 1, 3 and 4 were not run in
this session: step 1 is verified on its own page, and steps 3 and 4 only read what step 2
wrote.
