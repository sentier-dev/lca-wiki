---
title: bw2io use cases
type: readme
summary: End-to-end things a practitioner does with bw2io.
audience: [P1]
updated: 2026-09-22
sources: []
---

# bw2io use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## Pages here

- [Export a database to Excel](export-a-database-to-excel.md) — Write a Brightway database out as an Excel workbook you can read, diff or hand to someone without Python. *(verified)*
- [Import a SimaPro CSV export](import-a-simapro-csv.md) — Read a SimaPro CSV export into Brightway, apply the default strategies, and read the linking statistics before writing anything into a project. *(verified)*
- [Import an ecospold2 release](import-ecospold2.md) — Read an extracted ecospold2 directory into a Brightway project, either file by file with SingleOutputEcospold2Importer or in one call with import_ecoinvent_release. *(not verified)*
- [Install a remote example project](install-a-remote-example-project.md) — Download one of the public Brightway example projects with bw2io.remote and run a first calculation on it, without any licence or credential. *(verified)*

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `import-an-excel-inventory.md`, not `use-excelimporter.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps in a clean environment and record `verified:` honestly.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
