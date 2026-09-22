---
title: Where to install BAFU-2026 into Brightway (pointer)
type: use-case
summary: "A pointer page: the supported route from a BAFU release into Brightway is the Sentier loader, not a hand-written importer, and the commands live on the loader's own pages."
audience: [P1]
updated: 2026-09-22
sources: [bafu-2026-release, sentier-brightway-repo, sentier-inventory-repo, sentier-methods-repo]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.11.15, Ubuntu 22.04, sentier-brightway 0.1.0 from a clone; the pointed-at use cases were run on the same day"
---

# Where to install BAFU-2026 into Brightway (pointer)

**Persona:** P1 practitioner who works in Brightway or the Activity Browser and wants this
database in it · **GICS sector:** any

## Goal

BAFU-2026 usable in Brightway, characterised against EF 3.1, without writing an importer
and without downloading the release at all.

## Steps

There is one supported route, and it is documented on the loader's own pages rather than
duplicated here.

1. **A Brightway project.** One command writes the inventory, an EF 3.1 biosphere, a
   [residual database](../../vocabulary.md#residual-database) and the 25 EF 3.1 methods
   into a named project:
   [../../sentier/modules/sentier-brightway/use-cases/install-bafu-2026-into-a-brightway-project.md](../../sentier/modules/sentier-brightway/use-cases/install-bafu-2026-into-a-brightway-project.md).

2. **Plain files instead.** The same build as a parquet registry and
   [datapackages](../../vocabulary.md#datapackage) that stock `bw2calc` reads without
   `bw2data`:
   [../../sentier/modules/sentier-brightway/use-cases/export-bafu-2026-as-file-mode-datapackages.md](../../sentier/modules/sentier-brightway/use-cases/export-bafu-2026-as-file-mode-datapackages.md).

3. **Before either, read the coverage.** How much of the flow list actually reaches a
   [characterisation factor](../../vocabulary.md#characterization-factors):
   [../../sentier/modules/sentier-brightway/use-cases/check-bridge-coverage.md](../../sentier/modules/sentier-brightway/use-cases/check-bridge-coverage.md).

4. **Afterwards, check it against the publisher.** The backtest scores every process for
   all 25 categories and compares it with the published results workbook:
   [../../sentier/modules/sentier-brightway/use-cases/run-the-backtest-against-bafu-results.md](../../sentier/modules/sentier-brightway/use-cases/run-the-backtest-against-bafu-results.md).

## Why this route rather than your own importer

The release ships as ecoSpold documents whose
[elementary flows](../../vocabulary.md#elementary-flow) use the database's own
[nomenclature](../../vocabulary.md#nomenclature). Reading them is the easy half. The hard
half is relinking those flows onto a nomenclature that impact assessment factors exist
for, and that work is published as an ordered set of
[randonneur packages](../../vocabulary.md#randonneur-package) in
[../../sentier/modules/sentier-mappings/](../../sentier/modules/sentier-mappings/),
reviewed, versioned and covered by a coverage sidecar. The loader applies them in order,
normalises the unit spellings and keeps what cannot be linked in a residual database so
the mass balance survives.

The inventory itself is republished as parquet in
[../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/), which
is what the loader reads: you do not need the release archive for this route. You do need
it for the backtest, which compares against the publisher's own results workbook.

## Expected output

Whichever route you take, three databases and 25 methods, roughly twelve thousand
processes, about ninety thousand elementary flows, and just over a hundred flows in the
residual database. The pointed-at pages give the counts and the timings.

## Pitfalls

- **Only EF 3.1 comes with it.** The release publishes results for three methods, and
  only one of them can be recalculated on an installed database: the loader installs the
  25 EF 3.1 categories and nothing else. IPCC 2021 and Ecological Scarcity 2021 (UBP)
  exist for BAFU-2026 as pre-calculated columns of the results workbook, and the factors
  behind them are not redistributed here, so an eco-point total for a system BAFU did not
  publish is not obtainable this way. See
  [../knowledge/methods.md](../knowledge/methods.md) and
  [../../sentier/modules/sentier-methods/](../../sentier/modules/sentier-methods/)
  (source: sentier-methods-repo).
- **The citation is not optional.** Work derived from this inventory must carry the
  wording the release prescribes; the loader prints it after every run, which is the
  easiest place to copy it from.
- **Do not go through openLCA to reach Brightway.** Loading the openLCA package and
  exporting from it adds a conversion and loses the reviewed flow bridge.
- **Version the pins, not the year.** What you installed is a pinned commit of four data
  repositories, recorded in the export manifest. Record that, not "BAFU 2026".
- **Coverage is not accuracy.** Read the coverage report and the backtest together before
  quoting a score.

## Related vocabulary

[LCA database](../../vocabulary.md#lca-database),
[bridge](../../vocabulary.md#bridge),
[relink](../../vocabulary.md#relink),
[nomenclature](../../vocabulary.md#nomenclature),
[residual database](../../vocabulary.md#residual-database),
[randonneur package](../../vocabulary.md#randonneur-package),
[datapackage](../../vocabulary.md#datapackage),
[project mode](../../vocabulary.md#project-mode),
[file mode](../../vocabulary.md#file-mode).

## Verification

This page is a pointer, and what it points at was run on 2026-09-22 on Ubuntu 22.04 with
uv 0.11.14 and Python 3.11.15, in a clone of sentier-brightway at version 0.1.0 reading
four sibling data clones. The project install, the file-mode export, the coverage report
and the backtest were each executed and are recorded with their durations and their
counts on their own pages. Nothing on this page was claimed that is not verified there.
