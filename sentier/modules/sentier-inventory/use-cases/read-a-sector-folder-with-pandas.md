---
title: Read a sector folder with pandas
type: use-case
summary: "Open one sector's processes and exchanges parquet in a dataframe, check them against the folder's declared row counts, and see the contracted columns."
audience: [P1]
updated: 2026-09-22
sources: [sentier-inventory-repo]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.11.15, Ubuntu 22.04, a clone of sentier-inventory at schema version 0.1.0, pandas and pyarrow via uv --with"
---

# Read a sector folder with pandas

**Persona:** P1 practitioner who wants the inventory as data, not inside an LCA tool ·
**GICS sector:** any; the folders are the database's own sectors, not GICS ones

## Goal

One [sector folder](../../../../vocabulary.md#sector-folder) in two dataframes, the
processes and their [exchanges](../../../../vocabulary.md#exchange), with the column
contract in front of you and the folder's own declared row counts as a check.

## Prerequisites

- A clone of sentier-inventory. There is no package and nothing to install: the
  repository is data plus one validator.
- `uv`, and pandas and pyarrow, which `uv run --with` supplies for the length of the
  command.

## Steps

1. See which sectors exist and in which order they rank:

   ```bash
   ls data/
   ```

2. Size a sector cheaply, before loading it, by reading what it declares:

   ```bash
   cat data/02-electricity/metadata.json
   ```

3. Load the two tables:

   ```bash
   uv run --with pandas --with pyarrow python -c "import pandas as pd; p = pd.read_parquet('data/02-electricity/processes.parquet'); e = pd.read_parquet('data/02-electricity/exchanges.parquet'); print(p.shape, e.shape); print(list(p.columns)); print(list(e.columns))"
   ```

4. Join them, which is what you are usually after: every exchange of one process, with
   the process named:

   ```bash
   uv run --with pandas --with pyarrow python -c "import pandas as pd; p = pd.read_parquet('data/02-electricity/processes.parquet'); e = pd.read_parquet('data/02-electricity/exchanges.parquet'); print(e.merge(p[['process_id','name']], on='process_id').head().to_string())"
   ```

5. If you do not want pandas, pyarrow alone is enough and reads only the columns you ask
   for:

   ```bash
   uv run --with pyarrow python -c "import pyarrow.parquet as pq; t = pq.read_table('data/02-electricity/exchanges.parquet', columns=['process_id','flow_name','direction','unit']); print(t.num_rows, t.column_names)"
   ```

## Expected output

Step 1 lists eleven folders with a numeric prefix: agriculture, electricity, chemicals,
transport, energy, waste, construction, materials, electronics, building services, and an
obsolete folder kept for completeness. The prefix is a rank, and it also sets resolution
precedence.

Step 2 prints the folder's [metadata](../../../../vocabulary.md#metadata): the sector key,
a title and description, the rank, the [schema](../../../../vocabulary.md#schema) version
and the declared row counts. Those counts are validated against the files, so they are a
cheap and trustworthy size estimate.

Step 3 gives the two shapes and the contracted columns. A process row carries its
identifier, name, [reference product](../../../../vocabulary.md#reference-product) and
reference unit and amount, its [geography](../../../../vocabulary.md#geography), its
process type, a technology description and a comment. An exchange row carries the process
identifier, the flow identifier and name, the flow type, the direction, the amount, the
unit, a location and five [uncertainty](../../../../vocabulary.md#uncertainty) columns.
Electricity, for scale, is roughly two thousand processes and about forty thousand
exchanges.

Step 4 shows the join key is the process identifier on both sides. Step 5 is the same
data with a smaller memory footprint.

## Pitfalls

- **Read a sector, not the repository.** Loading every folder at once is rarely what you
  want and is a lot of memory. Start from the metadata, pick the sector, then load.
- **The obsolete folder is in the list.** It is kept for completeness, not for use. Filter
  it out unless you know why you want it.
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

[Sector folder](../../../../vocabulary.md#sector-folder),
[process](../../../../vocabulary.md#process),
[exchange](../../../../vocabulary.md#exchange),
[reference product](../../../../vocabulary.md#reference-product),
[flow code](../../../../vocabulary.md#flow-code),
[uncertainty](../../../../vocabulary.md#uncertainty),
[metadata](../../../../vocabulary.md#metadata),
[obsolete category](../../../../vocabulary.md#obsolete-category).

## Verification

Run on 2026-09-22 on Ubuntu 22.04 with uv 0.11.14 and Python 3.11.15, in a clone of
sentier-inventory at schema version 0.1.0. Steps 1, 2, 3 and 5 were executed as written
and took 3.8 s together including the dependency resolution. The electricity folder
loaded as 2,033 processes by 9 columns and 39,133 exchanges by 13 columns, with the
column names as described, and `data/` held the eleven folders listed above. Step 4 was
not run; it is the same two reads plus a dataframe merge.
