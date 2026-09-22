---
title: Import a SimaPro CSV export
type: use-case
summary: Read a SimaPro CSV export into Brightway, apply the default strategies, and read the linking statistics before writing anything into a project.
audience: [P1]
updated: 2026-09-22
sources: [brightway-cheatsheet, bw2io-docs, pypi-bw2io]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with bw2data 4.7 and bw2io 0.9.17, BRIGHTWAY2_DIR set to a temporary directory, Linux x86-64, on a hand-written four-exchange CSV
related: [../commands.md, ../classes.md, ../gotchas.md]
---

# Import a SimaPro CSV export

**Persona:** P1 practitioner moving a model out of SimaPro, or reading a supplier's
export · **GICS sector:** any

## Goal

A SimaPro CSV export parsed into Brightway's own shape, with the default clean-up
strategies applied and an honest count of what did not link, before a single row reaches
your project.

## Prerequisites

- `bw2data` 4.7 and `bw2io` 0.9.17. No licence and no network access.
- A SimaPro CSV export. `bw2io` ships no SimaPro fixture: the files under its
  `data/examples/` directory are Brightway's own CSV and Excel templates, not SimaPro
  exports. The verification run used a hand-written four-exchange file in the SimaPro 9
  layout, described under **Verification**.
- Know your separator. SimaPro writes the one configured in the export dialogue, and
  records it in the file header; the importer takes it as `delimiter`.

## Steps

1. Create the core migrations in the project. Without them the strategy pass raises
   `MissingMigration: Migration 'default-units' is missing`.

   ```python
   import bw2data as bd
   import bw2io as bi
   from bw2io.migrations import create_core_migrations

   bd.projects.set_current("simapro-toy")
   create_core_migrations()
   ```

2. Read the file. Nothing touches the project yet: what you get is a list of
   dictionaries in memory.

   ```python
   imp = bi.SimaProCSVImporter("toy-bakery.csv", "toy-simapro", delimiter=";")
   ```

3. Apply the default strategies: unit normalisation, location updates, production edge
   detection, sub-category clean-up, SimaPro allocation and name splitting, among
   others.

   ```python
   imp.apply_strategies()
   ```

4. Read the statistics. This is the number that decides whether the import is usable.

   ```python
   imp.statistics()
   imp.all_linked
   ```

5. Look at what came out, before deciding what to do about the unlinked edges.

   ```python
   for ds in imp.data:
       print(ds["name"], ds.get("unit"), len(ds["exchanges"]))
       for exc in ds["exchanges"]:
           print("   ", exc.get("name"), exc.get("amount"), exc.get("unit"),
                 exc.get("type"), exc.get("categories"))
   ```

6. Write the unlinked edges out for a domain expert to map. Do this rather than dropping
   them.

   ```python
   imp.write_excel(only_unlinked=True)
   ```

7. Link against the database that holds the counterparts, then write, only once
   `all_linked` is true (source: brightway-cheatsheet).

   ```python
   imp.match_database("<biosphere or background database>", fields=["name", "unit", "categories"])
   imp.statistics()
   imp.write_database()
   ```

## Expected output

- The extractor prints `Extracted N unallocated datasets in ... seconds`, then one line
  per strategy, then `Applied 20 strategies in ... seconds`.
- `statistics()` prints a block naming the graph nodes by type, the graph edges by type,
  which databases the edges point at, and the unique unlinked edges by type.
- On the verification file: 1 process node, 4 edges (2 technosphere, 1 production,
  1 biosphere), 1 edge already resolving inside `toy-simapro`, and 3 unique unlinked
  edges, since nothing in the project supplies flour, heat or carbon dioxide yet.
- `all_linked` is `False` until every edge resolves.
- The parsed process keeps its SimaPro categories: the production edge carries the
  product category from the `Products` block, the technosphere edges carry
  `('Materials/fuels',)` and `('Electricity/heat',)`, and the emission carries
  `('air',)`.
- `write_excel(only_unlinked=True)` prints `Wrote matching file to:` and a path under
  the project's `output` directory, named `db-matching-<database>-unlinked.xlsx`. The
  file is a few kilobytes.

## Pitfalls

- **The block CSV importer is an optional extra.** Importing `bw2io` 0.9.17 without
  `multifunctional` and `bw_simapro_csv` prints a warning and leaves
  `SimaProBlockCSVImporter` undefined. Install with `pip install "bw2io[multifunctional]"`
  when you need it; `SimaProCSVImporter` used here needs nothing extra. See
  [../gotchas.md](../gotchas.md).
- **`create_core_migrations()` is not optional.** A fresh project has no migrations, and
  the failure arrives in the middle of the strategy pass rather than at construction.
- **An import does nothing to your project until `write_database()`.** That is the
  point: inspect and fix first.
- **`drop_unlinked(i_am_reckless=True)` is named that way on purpose.** Dropping unlinked
  edges silently changes the inventory.
- **The strategy order matters** and `imp.strategies` is an ordinary list. Appending a
  linking strategy before the naming strategies have run links less
  (source: brightway-cheatsheet).
- **The shipped mapping tables age.** SimaPro to ecoinvent mappings in `bw2io` stop at
  ecoinvent 3.5. Newer pairs are `randonneur` transformations; see
  [../../randonneur/use-cases/apply-a-migration-to-inventory-data.md](../../randonneur/use-cases/apply-a-migration-to-inventory-data.md).
- **Column positions differ per block.** An emission line carries a sub-compartment
  column that a materials line does not, so a hand-edited file fails with
  `ValueError: Unknown uncertainty type`. Export from SimaPro rather than typing one.

## Related vocabulary

- [Importer](../../../../vocabulary.md#importer)
- [Linking](../../../../vocabulary.md#linking)
- [Exchange](../../../../vocabulary.md#exchange)
- [Elementary flow](../../../../vocabulary.md#elementary-flow)
- [Compartment](../../../../vocabulary.md#compartment)
- [Sub-compartment](../../../../vocabulary.md#sub-compartment)
- [Nomenclature](../../../../vocabulary.md#nomenclature)
- [Unit process, single operation](../../../../vocabulary.md#unit-process-single-operation)
- [Data format](../../../../vocabulary.md#data-format)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`bw2data` 4.7, `bw2io` 0.9.17, `BRIGHTWAY2_DIR` pointed at a fresh temporary directory,
Linux x86-64.

The input was written by hand rather than exported, because `bw2io` ships no SimaPro
fixture and no SimaPro licence was available: a semicolon-separated file with a
`{SimaPro 9.4}` header block, one `Process` with a `Products` line, one
`Materials/fuels` line, one `Electricity/heat` line and one `Emissions to air` line. It
exercises the extractor and the full strategy pass, not the variety of a real export. A
verifier with SimaPro should repeat this on a genuine export, where the interesting part
is how many edges fail to link and why.

Steps 1 to 6 ran; step 7 was not run, since the toy file has no counterpart database to
match against. Duration: about 20 seconds, nearly all of it installing `bw2io` and its
dependencies.
