---
title: bw2calc datasets
type: module-page
summary: bw2calc ships no data; everything it reads arrives as datapackages.
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-bw2calc, brightway-cheatsheet]
related: [README.md, ../bw_processing/README.md, ../bw2data/datasets.md]
---

# bw2calc datasets

## Nothing is shipped

`bw2calc` 2.5.0 contains code only. Walking the installed package on 2026-09-21 found no
data directory and no bundled arrays: the only non-code files are packaging metadata
(source: pypi-bw2calc).

## What it reads

### Datapackages

- **Version:** the `bw_processing` format; 2.5.0 requires `bw_processing >= 1.0`
  (source: pypi-bw2calc).
- **Provenance:** written by `bw2data` when a database or impact category is processed,
  or built directly with `bw_processing`.
- **Schema:** numpy arrays with `row` and `col` index fields, an optional `flip` vector,
  an optional `scale` vector, optional uncertainty parameters and a metadata file. See
  [../bw_processing/](../bw_processing/).
- **Methods:** whichever impact categories the datapackages contain; `bw2calc` has no
  opinion about them.
- **Source branch:** whatever database the inventory came from, for example
  [../../../ecoinvent/](../../../ecoinvent/) or [../../../bafu/](../../../bafu/).

### What it writes

Nothing to disk. Results are numpy arrays and scipy sparse matrices on the calculation
object, and `to_dataframe` turns them into pandas frames in memory
(source: brightway-cheatsheet). Saving a result is your own code's job.
