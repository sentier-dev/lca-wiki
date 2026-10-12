---
title: Read a source folder with pandas
type: use-case
summary: "Open one source's processes and exchanges parquet in a dataframe, check them against the folder's declared row counts and sectors, filter one sector out of the column, and see the contracted columns."
audience: [P1]
updated: 2026-10-12
sources: [sentier-inventory-repo, sentier-inventory-pr-5]
verified: yes
verified_on: 2026-10-12
verified_env: "uv 0.11.14, Python 3.9.25 as picked by uv, Ubuntu 22.04, a clone of sentier-inventory at commit cf54f55 (schema version 0.3.0, pull request #5), pandas and pyarrow via uv --with"
---

# Read a source folder with pandas

**Persona:** P1 practitioner who wants the inventory as data, not inside an LCA tool ·
**GICS sector:** any; the `sector` column holds the database's own sectors, not GICS ones

## Goal

One [source folder](../../../../vocabulary.md#source-folder) in two dataframes, the
processes and their [exchanges](../../../../vocabulary.md#exchange), with the column
contract in front of you, the folder's own declared row counts and sectors as a check,
and one sector picked out of the `sector` column.

## Prerequisites

- A clone of sentier-inventory. There is no package and nothing to install: the
  repository is data plus one validator.
- `uv`, and pandas and pyarrow, which `uv run --with` supplies for the length of the
  command.

## Steps

1. See which source releases exist, one folder each:

   ```bash
   ls data/
   ```

2. Size a source cheaply, before loading it, by reading what it declares:

   ```bash
   cat data/bafu-2026-v1/metadata.json
   ```

3. Load the two tables:

   ```bash
   uv run --with pandas --with pyarrow python -c "import pandas as pd; p = pd.read_parquet('data/bafu-2026-v1/processes.parquet'); e = pd.read_parquet('data/bafu-2026-v1/exchanges.parquet'); print(p.shape, e.shape); print(list(p.columns)); print(list(e.columns)); print(p['sector'].value_counts().sort_index().to_string())"
   ```

4. Pick one sector. The sector is a column, so it is a filter, and parquet predicate
   pushdown reads only the matching row groups; the exchanges follow their processes:

   ```bash
   uv run --with pandas --with pyarrow python -c "import pandas as pd; p = pd.read_parquet('data/bafu-2026-v1/processes.parquet', filters=[('sector', '==', 'electricity')]); e = pd.read_parquet('data/bafu-2026-v1/exchanges.parquet', filters=[('process_id', 'in', p['process_id'].tolist())]); print(p.shape, e.shape)"
   ```

5. Join them, which is what you are usually after: every exchange of one process, with
   the process named and its sector beside it:

   ```bash
   uv run --with pandas --with pyarrow python -c "import pandas as pd; p = pd.read_parquet('data/bafu-2026-v1/processes.parquet'); e = pd.read_parquet('data/bafu-2026-v1/exchanges.parquet'); print(e.merge(p[['process_id','name','sector']], on='process_id').head().to_string())"
   ```

6. If you do not want pandas, pyarrow alone is enough and reads only the columns you ask
   for:

   ```bash
   uv run --with pyarrow python -c "import pyarrow.parquet as pq; t = pq.read_table('data/bafu-2026-v1/exchanges.parquet', columns=['process_id','flow_name','direction','unit']); print(t.num_rows, t.column_names)"
   ```

## Expected output

Step 1 lists one folder per published release of one datasource, named
`<source>-<source_version>`, plus the folder's own README. Today that is a single
folder, `bafu-2026-v1`. There is no rank and no precedence between folders; a second
source would appear as its own folder beside it.

Step 2 prints the folder's [metadata](../../../../vocabulary.md#metadata): the source id
and version, a title, the publisher, the licence terms, the required citation, the
[schema](../../../../vocabulary.md#schema) version, the sorted list of sectors present and
the declared row counts. Counts and sectors are validated against the files, so they are
a cheap and trustworthy size estimate.

Step 3 gives the two shapes, the contracted columns and the process count per sector. A
process row carries its identifier, name, [reference
product](../../../../vocabulary.md#reference-product) and reference unit and amount, its
[geography](../../../../vocabulary.md#geography), its process type, its sector, its source
and source version, a technology description and a comment. An exchange row carries the
process identifier, the flow identifier and name, the flow type, the direction, the
amount, the unit, a location and five [uncertainty](../../../../vocabulary.md#uncertainty)
columns. The whole release is 11,947 processes and 420,063 exchanges; the eleven sector
values run from 210 processes for agriculture to 3,188 for energy.

Step 4 gives electricity, for scale: roughly two thousand processes and about forty
thousand exchanges, the same rows the former `02-electricity` folder held.

Step 5 shows the join key is the process identifier on both sides. Step 6 is the same
data with a smaller memory footprint.

## Pitfalls

- **Filter on the column, do not look for a sector folder.** Before 2026-10-12 the
  repository held one folder per sector; a path such as `data/02-electricity/` no longer
  exists. The folder is the source, the sector is `processes.sector`.
- **The obsolete rows are in the folder.** `sector = obsolete` marks legacy link targets
  kept for completeness, not for use. Filter them out unless you know why you want them,
  and know that exchanges in other sectors may point at them.
- **Two releases of one source are two folders.** Pick the one whose metadata says the
  `source_version` you mean; nothing picks for you.
- **A flow identifier is not resolvable here.** The exchange rows carry cross-source flow
  identifiers; resolving them onto an impact assessment
  [nomenclature](../../../../vocabulary.md#nomenclature) is the job of
  [../../sentier-mappings/](../../sentier-mappings/), and the loader in
  [../../sentier-brightway/](../../sentier-brightway/) does it for you.
- **A production row is typed, not inferred.** Do not identify the reference exchange by
  the flow and the process sharing an identifier: the inventory contains technosphere
  self-loops where a process consumes its own reference product, and the equality
  misreads them. Use the exchange type.
- **The uncertainty columns are often empty.** Their presence is a schema promise, not a
  guarantee that every row is characterised.

## Related vocabulary

[Source folder](../../../../vocabulary.md#source-folder),
[sector folder](../../../../vocabulary.md#sector-folder),
[process](../../../../vocabulary.md#process),
[exchange](../../../../vocabulary.md#exchange),
[reference product](../../../../vocabulary.md#reference-product),
[flow code](../../../../vocabulary.md#flow-code),
[uncertainty](../../../../vocabulary.md#uncertainty),
[metadata](../../../../vocabulary.md#metadata),
[obsolete category](../../../../vocabulary.md#obsolete-category).

## Verification

Run on 2026-10-12 on Ubuntu 22.04 with uv 0.11.14 and the Python 3.9.25 that uv picked,
in a clone of sentier-inventory at commit `cf54f55`, schema version 0.3.0. Steps 1, 2,
3, 4 and 6 were executed as written and took 1.0 s together with the dependencies
already cached. The folder loaded as 11,947 processes by 12 columns and 420,063 exchanges
by 13 columns, with the column names as described and the eleven sector values counted
as on [../datasets.md](../datasets.md); the electricity filter returned 2,033 processes
and 39,133 exchanges; `data/` held the one folder `bafu-2026-v1` and a README. Step 5
was not run; it is the same two reads plus a dataframe merge. A first run on 2026-09-22
against the former sector layout (schema 0.1.0) had loaded the `02-electricity` folder
to the same two counts.
