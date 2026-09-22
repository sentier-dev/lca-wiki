---
title: Install BAFU-2026 into a Brightway project
type: use-case
summary: "Install the BAFU-2026 inventory, an EF 3.1 biosphere and the 25 EF 3.1 methods into a Brightway project with one command, then score an activity."
audience: [P1]
updated: 2026-09-22
sources: [sentier-brightway-repo, bafu-2026-release]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.11.15, Ubuntu 22.04, sentier-brightway 0.1.0 from a clone, four sibling data clones under one data root, a throwaway BRIGHTWAY2_DIR"
---

# Install BAFU-2026 into a Brightway project

**Persona:** P1 practitioner who already works in Brightway or the Activity Browser ·
**GICS sector:** any

## Goal

A Brightway project that holds the BAFU-2026 life cycle inventory, an EF 3.1
[biosphere](../../../../vocabulary.md#biosphere), a
[residual database](../../../../vocabulary.md#residual-database) for the flows that do
not bridge, and the 25 EF 3.1 [LCIA methods](../../../../vocabulary.md#lcia-method), so
that a stock `bw2calc` run scores a BAFU process without any further setup.

## Prerequisites

- Python 3.10 or newer, `uv`, and a clone of sentier-brightway.
- `bw2data` in the same environment: it is not a runtime dependency of the package and
  the `db` command writes through it. In a clone, `--extra testing` pulls it in.
- Either network access on the first run, or local clones of the four Sentier data
  repositories under one [data root](../../../../vocabulary.md#data-root).
- About 1.5 GB free in the Brightway
  [project directory](../../../../vocabulary.md#project-directory), and a few minutes.

## Steps

1. Check what will be installed and how much of it bridges onto EF 3.1, without touching
   Brightway:

   ```bash
   uv run sentier-brightway coverage --data-root /path/to/data-root
   ```

2. Install into a named [project](../../../../vocabulary.md#project). Point
   `BRIGHTWAY2_DIR` at a directory of your own first if you do not want this in your
   default Brightway data directory:

   ```bash
   uv run sentier-brightway db --project bafu-2026 --data-root /path/to/data-root
   ```

3. Confirm the three databases and the 25 methods are there:

   ```bash
   uv run python -c "import bw2data as bd; bd.projects.set_current('bafu-2026'); print({k: len(bd.Database(k)) for k in bd.databases}, len([m for m in bd.methods if m[0]=='sentier']))"
   ```

4. Score one process with stock `bw2calc`:

   ```bash
   uv run python -c "import bw2data as bd, bw2calc as bc; bd.projects.set_current('bafu-2026'); a = bd.Database('bafu-2026').get('009419a4-b0e8-32f1-be68-6be9e45ee860'); l = bc.LCA({a: 1}, ('sentier','EF v3.1','Climate change')); l.lci(); l.lcia(); print(a['name'], l.score)"
   ```

## Expected output

Step 1 prints the install summary and the coverage split: 11,947 processes, 25 methods,
about 96 per cent of the roughly 2,700 source flows and of the roughly 294,000 biosphere
exchange rows bridged onto EF 3.1, a per-compartment count of what stays unlinked, and
the citation line the release requires (source: sentier-brightway-repo).

Step 2 writes the inventory, then the biosphere, then the residual database, then the
methods one by one, printing `writing method n/25` as it goes. It ends with the same
coverage summary and the citation.

Step 3 reports three databases: the inventory at 11,947 nodes, the EF 3.1 biosphere at
roughly ninety thousand [elementary flows](../../../../vocabulary.md#elementary-flow),
and the residual database at just over a hundred, plus 25 methods under the `sentier`
prefix.

Step 4 prints the activity name, a Swiss high-voltage electricity process measured per
kilowatt hour, and its climate change score, which is of the order of
0.1 kg CO2 eq per kilowatt hour. Per-process values are not reproduced here; run the
command to see yours.

## Pitfalls

- **`bw2data` missing.** The `db` command is the only one that needs it. If the import
  fails, either install it in this environment or use
  [export-bafu-2026-as-file-mode-datapackages.md](export-bafu-2026-as-file-mode-datapackages.md)
  instead.
- **A project that already exists.** Re-running without `--overwrite` refuses rather
  than merging. `--overwrite` is also the recovery step after a write that failed part
  way through.
- **No network and no data root.** Nothing ships in the package. Without a warm cache
  the run needs either the network or `--data-root` (or `SENTIER_DATA_ROOT`) pointing at
  a folder holding one subfolder per data repository, named as the repository is.
- **The Activity Browser caches projects.** Reload the project after the install, and
  look for the methods grouped under the `sentier` prefix rather than beside the ones
  the Activity Browser ships.
- **The residual database is not a bug.** The flows in it have no EF 3.1 counterpart, so
  their exchanges are kept with no [characterisation factor](../../../../vocabulary.md#characterization-factors).
  The mass balance survives; the score does not count them.

## Related vocabulary

[Project mode](../../../../vocabulary.md#project-mode),
[project](../../../../vocabulary.md#project),
[biosphere](../../../../vocabulary.md#biosphere),
[residual database](../../../../vocabulary.md#residual-database),
[bridge](../../../../vocabulary.md#bridge),
[relink](../../../../vocabulary.md#relink),
[data root](../../../../vocabulary.md#data-root),
[LCIA method](../../../../vocabulary.md#lcia-method).

## Verification

Run on 2026-09-22 on Ubuntu 22.04 with uv 0.11.14 and Python 3.11.15, in a clone of
sentier-brightway at version 0.1.0, with `--data-root` pointing at four sibling clones of
the data repositories and `BRIGHTWAY2_DIR` set to a throwaway directory. All four steps
were executed as written. Step 1 took 8.6 s, step 2 278 s (with another
heavy job running in parallel on the same machine), and steps 3 and 4 together 2.4 s. The install reported the three databases at 11,947, 93,041 and 113
nodes and 25 methods; the scored activity is `Electricity, high voltage, production SI,
at grid`, in kilowatt hours.
