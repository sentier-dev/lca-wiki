---
title: Export a database to Excel
type: use-case
summary: Write a Brightway database out as an Excel workbook you can read, diff or hand to someone without Python.
audience: [P1]
updated: 2026-09-22
sources: [bw2io-docs, pypi-bw2io, brightway-cheatsheet]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with bw2data 4.7, bw2io 0.9.17 and openpyxl, BRIGHTWAY2_DIR set to a temporary directory, Linux x86-64
related: [../commands.md, ../classes.md, ../gotchas.md]
---

# Export a database to Excel

**Persona:** P1 practitioner handing a model to a reviewer, or checking what a script
actually wrote · **GICS sector:** any

## Goal

One `.xlsx` file holding every node of a database and every edge of every node, in the
same layout `bi.ExcelImporter` reads back. It is the cheapest review artefact Brightway
produces, and the cheapest way to diff two versions of a foreground model.

## Prerequisites

- The toy bakery project from
  [../../bw2data/use-cases/create-a-project-and-a-database.md](../../bw2data/use-cases/create-a-project-and-a-database.md),
  or any database of your own.
- `bw2data` 4.7 and `bw2io` 0.9.17. `openpyxl` only if you want to read the file back in
  Python; `bw2io` writes it without your help.

## Steps

1. Open the project holding the database.

   ```python
   import bw2data as bd
   import bw2io as bi

   bd.projects.set_current("toy-bakery")
   sorted(bd.databases)
   ```

2. Write the workbook. The function returns the path it wrote.

   ```python
   fp = bi.export.write_lci_excel("toy-bakery-db")
   fp
   ```

3. Read it back when you want to check the shape from Python.

   ```python
   import openpyxl

   wb = openpyxl.load_workbook(fp)
   wb.sheetnames
   ws = wb[wb.sheetnames[0]]
   ws.dimensions, ws.max_row, ws.max_column
   ```

4. To get only the unlinked edges of an import rather than a whole database, use the
   importer's own writer instead; see
   [import-a-simapro-csv.md](import-a-simapro-csv.md).

   ```python
   imp.write_excel(only_unlinked=True)
   ```

## Expected output

- `write_lci_excel` returns a path under the project's `output` directory, named
  `lci-<database name>.xlsx`.
- The workbook has one worksheet, named after the database.
- For the three-process toy bakery the sheet is A1 to F34: 34 rows, 6 columns, about
  6 kB on disk.
- The layout is block per activity, not one flat table. Each block starts with a
  `Database` row, then an `Activity` row with the name, then one row per activity field
  (`code`, `location`, `type`, `unit`), then an `Exchanges` row, then a header row
  (`name`, `amount`, `location`, `unit`, `categories`, `type`), then one row per edge,
  then a blank row.
- A node written by `bw2data` 4.7 carries `type: processwithreferenceproduct`, which is
  the 2.5 default for a process that also declares its product.
- The edge rows carry the amounts you wrote: 0.05 kg of carbon dioxide, 1 kg of bread
  produced, 0.7 kg of flour, 1.2 MJ of heat.

## Pitfalls

- **The output directory is inside the project.** `bd.projects.dir / "output"`. If you
  are running with `BRIGHTWAY2_DIR` set to a temporary directory, the file disappears
  with it; copy it out.
- **Excel is not a round trip for everything.** Uncertainty distributions, nested
  metadata and anything that is not a scalar field come out flattened or not at all.
  Treat the workbook as a review artefact, not as a backup. A backup is
  `bi.backup.backup_project_directory(project="<name>")`.
- **Big databases make big workbooks.** A background database exported this way is
  hundreds of thousands of rows and Excel will struggle. Export the foreground.
- **Never export licensed amounts to a file you then share.** An Excel workbook is easy
  to email, which is exactly the problem; see the licence terms of whatever you
  imported.
- **`write_lci_excel` lives on `bi.export`,** not on `bi` directly.

## Related vocabulary

- [Database](../../../../vocabulary.md#database)
- [Node](../../../../vocabulary.md#node)
- [Edge](../../../../vocabulary.md#edge)
- [Exchange](../../../../vocabulary.md#exchange)
- [Activity](../../../../vocabulary.md#activity)
- [Reference product](../../../../vocabulary.md#reference-product)
- [File format](../../../../vocabulary.md#file-format)
- [Metadata](../../../../vocabulary.md#metadata)
- [Project directory](../../../../vocabulary.md#project-directory)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`bw2data` 4.7, `bw2io` 0.9.17, `openpyxl`, `BRIGHTWAY2_DIR` pointed at a fresh temporary
directory, Linux x86-64. The toy bakery database exported to
`lci-toy-bakery-db.xlsx`, 6 014 bytes, one worksheet named `toy-bakery-db`, dimensions
A1:F34. The block layout and every field name above were read back out of the file.
Duration, including building the toy project: about 5 seconds.
