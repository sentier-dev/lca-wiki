---
title: Create a project and a database
type: use-case
summary: Build a Brightway 2.5 project from nothing, write a biosphere and a three-process inventory, then read its nodes, edges and search index.
audience: [P1]
updated: 2026-09-22
sources: [brightway-cheatsheet, bw2data-docs, pypi-bw2data, brightway-faq-data]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with bw2data 4.7, bw2calc 2.5.0 and bw2io 0.9.17, BRIGHTWAY2_DIR set to a temporary directory, Linux x86-64
related: [../commands.md, ../classes.md, ../gotchas.md]
---

# Create a project and a database

**Persona:** P1 practitioner, someone starting a model from scratch rather than from a
downloaded database · **GICS sector:** any

## Goal

A working Brightway 2.5 project holding a one-flow biosphere database, a three-process
inventory with production, technosphere and biosphere edges, and one impact category.
Everything later on this branch builds on it: the same toy bakery is reused by the
[bw2calc](../../bw2calc/use-cases/run-an-lca-and-read-the-score.md),
[bw2analyzer](../../bw2analyzer/use-cases/run-a-contribution-analysis.md) and
[bw_graph_tools](../../bw_graph_tools/use-cases/traverse-a-supply-chain-graph.md) use
cases.

## Prerequisites

- Python 3.11 and `uv`, or any environment manager you prefer.
- `bw2data` 4.7. No licence, no credentials, no network access.
- A directory Brightway may write to. Set `BRIGHTWAY2_DIR` when you want the project
  kept away from your real data directory; the data directory is global and shared
  between environments otherwise (source: brightway-faq-data).

## Steps

1. Open a throwaway environment with its own data directory.

   ```bash
   export BRIGHTWAY2_DIR=$(mktemp -d)
   uv run --python 3.11 --with bw2data==4.7 python toy_bakery.py
   ```

2. Switch to a project. The call creates it if it does not exist
   (source: brightway-cheatsheet).

   ```python
   import bw2data as bd

   bd.projects.set_current("toy-bakery")
   ```

3. Write a biosphere database. One elementary flow is enough to make an impact category
   mean something.

   ```python
   bd.Database("toy-biosphere").write({
       ("toy-biosphere", "co2"): {
           "name": "Carbon dioxide, fossil",
           "categories": ("air",),
           "unit": "kilogram",
           "type": "emission",
       },
   })
   ```

4. Write the inventory. Every process carries its own production edge; the technosphere
   edges point at the other processes and the biosphere edge at the flow above.

   ```python
   bd.Database("toy-bakery-db").write({
       ("toy-bakery-db", "bread"): {
           "name": "bread production", "unit": "kilogram", "location": "CH",
           "exchanges": [
               {"input": ("toy-bakery-db", "bread"), "amount": 1.0, "type": "production"},
               {"input": ("toy-bakery-db", "flour"), "amount": 0.7, "type": "technosphere"},
               {"input": ("toy-bakery-db", "heat"), "amount": 1.2, "type": "technosphere"},
               {"input": ("toy-biosphere", "co2"), "amount": 0.05, "type": "biosphere"},
           ],
       },
       ("toy-bakery-db", "flour"): {
           "name": "flour production", "unit": "kilogram", "location": "CH",
           "exchanges": [
               {"input": ("toy-bakery-db", "flour"), "amount": 1.0, "type": "production"},
               {"input": ("toy-bakery-db", "heat"), "amount": 0.3, "type": "technosphere"},
               {"input": ("toy-biosphere", "co2"), "amount": 0.4, "type": "biosphere"},
           ],
       },
       ("toy-bakery-db", "heat"): {
           "name": "heat production, natural gas", "unit": "megajoule", "location": "CH",
           "exchanges": [
               {"input": ("toy-bakery-db", "heat"), "amount": 1.0, "type": "production"},
               {"input": ("toy-biosphere", "co2"), "amount": 0.06, "type": "biosphere"},
           ],
       },
   })
   ```

5. Read one node back and look at its edges by kind.

   ```python
   bread = bd.get_node(database="toy-bakery-db", name="bread production")
   [(e.input["name"], e["amount"]) for e in bread.technosphere()]
   [(e.input["name"], e["amount"]) for e in bread.biosphere()]
   ```

6. Search the database, and pull it into pandas when you want to eyeball it.

   ```python
   bd.Database("toy-bakery-db").search("bread")
   bd.Database("toy-bakery-db").nodes_to_dataframe().shape
   bd.Database("toy-bakery-db").edges_to_dataframe().shape
   ```

7. Write an impact category. Factors are `(flow key, factor)` tuples; the unit lives in
   the metadata (source: brightway-cheatsheet).

   ```python
   gwp = bd.Method(("toy method", "climate change", "GWP100"))
   gwp.write([(("toy-biosphere", "co2"), 1.0)])
   gwp.metadata["unit"] = "kg CO2-eq"
   ```

## Expected output

- `sorted(bd.databases)` lists two names, `toy-bakery-db` and `toy-biosphere`.
- `len(bd.Database("toy-bakery-db"))` is 3 and `len(bd.Database("toy-biosphere"))` is 1.
- `bd.get_node(...)` prints as `'bread production' (kilogram, CH, None)`: name, unit,
  location, and `None` where a database with a reference product would print one.
- The technosphere edge list has two entries, 0.7 of flour and 1.2 of heat; the
  biosphere edge list has one, 0.05 kg of carbon dioxide.
- `search("bread")` returns a list with the one matching node.
- `nodes_to_dataframe()` is a 3 by 7 frame; `edges_to_dataframe()` is 9 by 18, because
  the nine rows count all production, technosphere and biosphere edges of the three
  processes.
- `sorted(bd.methods)` has one entry and `list(gwp)` has one factor.
- Each `write()` prints a progress bar and a `Vacuuming database` line. These are
  progress messages, not warnings.

## Pitfalls

- **Nothing is saved until `.save()`** when you edit a node or an edge in place. The
  proxies behave like dictionaries, so the change looks applied while it is only in
  memory. See [../gotchas.md](../gotchas.md).
- **Writing data does not update the matrices.** A calculation reads datapackages, not
  SQLite. After editing, call `.process()` or fetch fresh datapackages with
  `bd.prepare_lca_inputs`.
- **`bd.get_node` wants exactly one match** and raises otherwise. Iterate the database
  with a comprehension when you expect a set.
- **The data directory is global.** Without `BRIGHTWAY2_DIR` this project lands beside
  your real ones, on a path chosen per platform (source: brightway-faq-data).
- **Search has to be switched on** for a database that was not indexed at write time:
  `db.make_searchable()`.
- **Keys are local.** The integer ids Brightway assigns are per machine, so a key tuple
  from one computer does not resolve on another.

## Related vocabulary

- [Project](../../../../vocabulary.md#project)
- [Database](../../../../vocabulary.md#database)
- [Node](../../../../vocabulary.md#node)
- [Edge](../../../../vocabulary.md#edge)
- [Exchange](../../../../vocabulary.md#exchange)
- [Biosphere](../../../../vocabulary.md#biosphere)
- [Technosphere](../../../../vocabulary.md#technosphere)
- [Elementary flow](../../../../vocabulary.md#elementary-flow)
- [Method](../../../../vocabulary.md#method)
- [Backend](../../../../vocabulary.md#backend)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`bw2data` 4.7 with `bw2calc` 2.5.0 and `bw2io` 0.9.17 installed alongside,
`BRIGHTWAY2_DIR` pointed at a fresh temporary directory, Linux x86-64. Every step above
ran, and every number under **Expected output** is what the run printed. Duration,
including resolving and installing the environment from a warm `uv` cache: about
3 seconds.
