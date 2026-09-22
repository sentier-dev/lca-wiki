---
title: Inspect the LCIA results workbook structure
type: use-case
summary: "Read the shape of the release's results workbook with openpyxl: two sheets, a two-row header, three method families and 47 indicator columns."
audience: [P1, P2]
updated: 2026-09-22
sources: [bafu-2026-release, bafu-lca-methodology-2021]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.11.15, Ubuntu 22.04, openpyxl in read-only mode, against the BAFU-2026 v1 corrected results workbook"
---

# Inspect the LCIA results workbook structure

**Persona:** P1 practitioner or P2 contributor who wants to join the published results to
something else, and needs to know the shape first · **GICS sector:** any

## Goal

The workbook's structure, not its numbers: how many sheets, where the header really
starts, which method families are in it, what each indicator column is called and in
which unit. That is everything you need to write a reader, and nothing that redistributes
the publisher's results.

## Prerequisites

- The results component of the release, unpacked as in
  [download-and-verify-the-release.md](download-and-verify-the-release.md).
- `uv`, and openpyxl, supplied for the length of the command. Open the workbook in
  read-only mode: it is large, and you only want its shape.

## Steps

1. List the sheets and their dimensions:

   ```bash
   uv run --with openpyxl python -c "
   import openpyxl, sys
   wb = openpyxl.load_workbook(sys.argv[1], read_only=True, data_only=True)
   print(wb.sheetnames)
   for name in wb.sheetnames:
       ws = wb[name]
       print(name, ws.max_row, 'rows x', ws.max_column, 'columns')
   wb.close()
   " "BAFU-2026 v1 LCIA Results_corrected.xlsx"
   ```

2. Read the first two rows of the data sheet, which is where the header lives:

   ```bash
   uv run --with openpyxl python -c "
   import openpyxl, sys
   wb = openpyxl.load_workbook(sys.argv[1], read_only=True, data_only=True)
   ws = wb[wb.sheetnames[1]]
   banner, header = [list(r) for r in ws.iter_rows(min_row=1, max_row=2, values_only=True)]
   print('method families:', [c for c in banner if c])
   print('key columns:', header[:4])
   print('indicator columns:', len(header) - 4)
   for column in header[4:]:
       print('  ', column)
   wb.close()
   " "BAFU-2026 v1 LCIA Results_corrected.xlsx"
   ```

3. Read the information sheet, which documents the file rather than holding data:

   ```bash
   uv run --with openpyxl python -c "
   import openpyxl, sys
   wb = openpyxl.load_workbook(sys.argv[1], read_only=True, data_only=True)
   for row in wb['Info'].iter_rows(values_only=True):
       if any(row):
           print(row)
   wb.close()
   " "BAFU-2026 v1 LCIA Results_corrected.xlsx"
   ```

## Expected output

Two sheets. A small information sheet of about thirty rows and three columns, holding a
description of the file content and the list of methods it covers. And one data sheet
named after the release, of about twelve thousand rows, one per process, by 51 columns.

The header is two rows, not one. The first row is a banner naming the three method
families the file covers: an IPCC greenhouse gas method, the Swiss
[eco-point](../../vocabulary.md#eco-point-ubp) method, and EF 3.1. The second row is the
real header: four key columns, the product name, its
[category](../../vocabulary.md#category) and [sub-category](../../vocabulary.md#sub-category)
and its unit, followed by 47 indicator columns.

Those 47 split as one global warming indicator for the first family, twenty-one eco-point
indicators plus their total for the second, and 25 indicators for EF 3.1. Each carries
its unit in the column name, in brackets. The bracketed unit strings are not typed
consistently: one column spaces the unit out inside the brackets, another separates it
with a hyphen. Parse the unit out of the name rather than matching the name whole.

No values are reproduced here, and none should be republished: the results are the
publisher's, and the licence allows use, not redistribution.

## Pitfalls

- **Skip one header row, not two.** A reader that treats row 1 as the header gets a frame
  whose columns are mostly empty and whose first data row is the real header.
- **Use read-only mode.** The workbook is tens of thousands of cells wide and deep;
  loading it normally is slow and memory-hungry for a structural look.
- **The eco-point total is a total.** It is the sum of the twenty-one eco-point
  indicators, so do not add it to them. The same caution applies to the EF 3.1 families
  with sub-indicators.
- **The workbook joins on names, not identifiers.** It carries no process identifier, so
  joining it to the inventory is a name join, and a renamed or re-encoded process shows up
  as unmatched. This is the single most important thing to know before using it as a
  reference.
- **Three method families in one file means three unit systems.** Eco-points, kg CO2 eq
  and the fifteen EF 3.1 units are not comparable; keep the family with the column.
- **"Corrected" is part of the file name for a reason.** Record which results archive you
  took, alongside the version label of the other components.

## Related vocabulary

[LCIA results](../../vocabulary.md#lcia-results),
[impact category](../../vocabulary.md#impact-category),
[LCIA method](../../vocabulary.md#lcia-method),
[eco-point (UBP)](../../vocabulary.md#eco-point-ubp),
[single overall score](../../vocabulary.md#single-overall-score),
[category](../../vocabulary.md#category),
[sub-category](../../vocabulary.md#sub-category),
[normalisation and weighting set](../../vocabulary.md#normalisation-and-weighting-set).

## Verification

Run on 2026-09-22 on Ubuntu 22.04 with uv 0.11.14 and Python 3.11.15, against the
corrected results workbook of the BAFU-2026 v1 release, unpacked from its archive. Steps
1 and 2 were executed as written and took 0.7 s together. The workbook reported two
sheets, an information sheet of 31 rows by 3 columns and a data sheet of 11,949 rows by
51 columns; the banner row named three method families and the header row gave four key
columns and 47 indicator columns, counted as described. The inconsistent bracket spacing
noted under Pitfalls was observed in two of those column names. Step 3 was run only far
enough to read the information sheet's first rows.
