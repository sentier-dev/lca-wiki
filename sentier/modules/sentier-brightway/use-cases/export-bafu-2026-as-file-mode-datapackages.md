---
title: Export BAFU-2026 as file-mode datapackages
type: use-case
summary: "Write the BAFU-2026 build as a parquet registry plus bw_processing datapackages, then score a process with stock bw2calc and no bw2data."
audience: [P1]
updated: 2026-09-22
sources: [sentier-brightway-repo, bw-processing-docs, bw2calc-docs]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.11.15, Ubuntu 22.04, sentier-brightway 0.1.0 from a clone, four sibling data clones under one data root, output into a throwaway directory"
---

# Export BAFU-2026 as file-mode datapackages

**Persona:** P1 practitioner building a calculation service or a notebook that must not
depend on a Brightway project directory · **GICS sector:** any

## Goal

A folder of plain files holding the same build as the project install: a parquet
[registry](../../../../vocabulary.md#database), the applied
[randonneur packages](../../../../vocabulary.md#randonneur-package), and
[bw_processing](../../../../vocabulary.md#datapackage) datapackages that stock `bw2calc`
reads directly. No `bw2data`, no project directory, no shared state.

## Prerequisites

- Python 3.10 or newer, `uv`, and a clone of sentier-brightway. `bw_processing` and
  `bw2calc` are runtime dependencies, so nothing extra is needed.
- Network access on the first run, or local clones of the four Sentier data repositories
  under one [data root](../../../../vocabulary.md#data-root).
- An empty output directory, or one holding a previous export.

## Steps

1. Write the export:

   ```bash
   uv run sentier-brightway files --out /path/to/export --data-root /path/to/data-root
   ```

2. Look at what was written, starting with the
   [manifest](../../../../vocabulary.md#manifest):

   ```bash
   cat /path/to/export/manifest.json
   ```

3. Find the code of the process you want to score in the registry:

   ```bash
   uv run python -c "from sentier_brightway import datapackage; r = datapackage.load_registry('/path/to/export/registry'); p = r.processes; print(p[p['name'].str.contains('Electricity, high voltage', na=False)][['code','name','unit']].head().to_string())"
   ```

4. Score it for one [method id](../../../../vocabulary.md#method-id), the documented
   one-call pattern:

   ```bash
   uv run python -c "from sentier_brightway import datapackage; print(datapackage.score('/path/to/export', '009419a4-b0e8-32f1-be68-6be9e45ee860', 'ef-3.1:climate-change'))"
   ```

## Expected output

Step 1 prints the same install and coverage summary as the project install, then the
path it wrote to. The folder holds four entries: `registry/` with five parquet tables
(processes, biosphere, exchanges, methods, characterisation factors), `mappings/` with
the bridge folder copied verbatim, `bw_package/` with one inventory datapackage and one
per method, and `manifest.json`.

Step 2 shows the pinned commit of each of the four data repositories, the bridge folder
and the ordered list of its four packages, the coverage block, the row counts (about
12,000 processes, about 93,000 biosphere flows, about 420,000 exchanges, 25 methods) and
the citation the release requires.

Step 3 lists candidate processes with their code, name and unit.

Step 4 prints a single float: the score of one unit of that process for that method. For
the Swiss high-voltage electricity process it is of the order of 0.1 kg CO2 eq per
kilowatt hour, and it matches what the project install returns for the same process and
method. Per-process values are not reproduced here.

`datapackage.score` is a convenience wrapper. Underneath it loads the inventory
datapackage and the method datapackage with `bw_processing` and hands both to a stock
`bw2calc.LCA`, keyed by the integer id the registry and the datapackages share
(source: sentier-brightway-repo). Build your own `LCA` the same way when you need the
inventory vector, the supply array or several methods in one factorisation.

## Pitfalls

- **`--overwrite` is narrow by design.** In file mode it replaces only a folder that
  already holds a `manifest.json`. Pointing `--out` at a folder full of other files
  fails rather than deleting them.
- **`load_registry` wants the registry folder, not the export root.** Pass
  `<export>/registry`; `datapackage.score` takes the export root instead. Getting this
  the wrong way round raises a `FileNotFoundError` naming the missing parquet.
- **The export is static.** The registry carries
  [uncertainty](../../../../vocabulary.md#uncertainty) columns, but 0.1.0 does not write
  them into the datapackages, so a Monte Carlo run over an export sees fixed amounts.
- **`--no-datapackages` gives you the registry only.** Useful when you want the parquet
  tables for analysis, useless when you want to calculate.
- **The export is large.** The registry and the datapackages together are hundreds of
  megabytes; keep them out of any repository.

## Related vocabulary

[File mode](../../../../vocabulary.md#file-mode),
[datapackage](../../../../vocabulary.md#datapackage),
[processed arrays](../../../../vocabulary.md#processed-arrays),
[manifest](../../../../vocabulary.md#manifest),
[method id](../../../../vocabulary.md#method-id),
[randonneur package](../../../../vocabulary.md#randonneur-package),
[uncertainty](../../../../vocabulary.md#uncertainty).

## Verification

Run on 2026-09-22 on Ubuntu 22.04 with uv 0.11.14 and Python 3.11.15, in a clone of
sentier-brightway at version 0.1.0, with `--data-root` pointing at four sibling clones of
the data repositories and `--out` at a throwaway directory. All four steps were executed
as written. The export took 9.2 s; loading the registry and scoring one process took
5.7 s including interpreter start. The manifest reported 11,947 processes, 93,154
biosphere flows, 420,063 exchanges and 25 methods. The score of the Swiss high-voltage
electricity process for climate change agreed with the project-install score of the same
process to the printed precision.
