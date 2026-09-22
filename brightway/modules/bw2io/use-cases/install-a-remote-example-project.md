---
title: Install a remote example project
type: use-case
summary: Download one of the public Brightway example projects with bw2io.remote and run a first calculation on it, without any licence or credential.
audience: [P1]
updated: 2026-09-22
sources: [brightway-cheatsheet, bw2io-docs, pypi-bw2io, brightway-files-server, useeio-epa]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with bw2data 4.7, bw2calc 2.5.0 and bw2io 0.9.17, BRIGHTWAY2_DIR set to a temporary directory, network access, Linux x86-64
related: [../commands.md, ../datasets.md, ../gotchas.md]
---

# Install a remote example project

**Persona:** P1 practitioner who wants a real database to practise on before buying a
licence, or a teacher preparing an exercise · **GICS sector:** any

## Goal

A project holding a complete, freely redistributable database and its impact categories,
installed in one call, ready to calculate against. The example used here is US EEIO 1.1,
an environmentally extended input-output model of the United States economy published by
the EPA (source: useeio-epa).

## Prerequisites

- `bw2data` 4.7, `bw2calc` 2.5.0 and `bw2io` 0.9.17.
- Network access to the public archive server the client reads
  (source: brightway-files-server). The US EEIO archive is about 16 MB; `forwast` is
  smaller.
- No ecoinvent licence and no credentials. The biosphere-only projects on that server
  carry ecoinvent **elementary flow lists**, not inventory data; the USEEIO and forwast
  projects carry no ecoinvent content at all.

## Steps

1. Ask what is on offer. The list is fetched from the server, so it changes over time.

   ```python
   import bw2io as bi

   sorted(bi.remote.get_projects())
   ```

2. Install one under a project name of your choosing.

   ```python
   bi.remote.install_project("USEEIO-1.1", "useeio-demo", overwrite_existing=True)
   ```

3. Switch to it and look around.

   ```python
   import bw2data as bd

   bd.projects.set_current("useeio-demo")
   sorted(bd.databases)
   len(bd.Database("USEEIO-1.1"))
   sorted(bd.methods)[:3]
   ```

4. Pick a product node. In this database products and processes are separate nodes, so
   filter by type rather than taking the first thing you find.

   ```python
   product = [n for n in bd.Database("USEEIO-1.1") if n.get("type") == "product"][0]
   product["name"], product.get("location")
   ```

5. Calculate one score, exactly as in
   [../../bw2calc/use-cases/run-an-lca-and-read-the-score.md](../../bw2calc/use-cases/run-an-lca-and-read-the-score.md).

   ```python
   import bw2calc as bc

   method = sorted(bd.methods)[0]
   fu, objs, _ = bd.prepare_lca_inputs({product: 1}, method=method)
   lca = bc.LCA(demand=fu, data_objs=objs)
   lca.lci()
   lca.lcia()
   lca.score
   ```

## Expected output

- `get_projects()` returned eleven keys on the verification day: two US and European
  example models (`USEEIO-1.1`, `forwast`), six ecoinvent biosphere-only starter
  projects, a regionalisation example, a spatiotemporal example, a multifunctionality
  demonstration and a BAFU project. Expect the list to have grown.
- The download prints its destination inside `bw2io_cache_dir` under the data directory,
  then `Restoring project backup archive`, then `Restored project: <name>`.
- On first open, `bw2data` applies its automatic project updates and reindexes the
  database. Two or three `info` lines about updates are normal.
- `USEEIO-1.1` holds 2 649 nodes: 388 processes, 388 products and 1 873 emissions. There
  are 19 impact categories, the first of them `('Impact Potential', 'ACID')`.
- The technosphere matrix is 388 by 388 and the biosphere matrix 1 871 by 388.
- A score for one dollar of one sector is a small number in that method's own unit; the
  run here returned about 4.4e-4 for acidification potential. Do not read an EEIO
  sector score as a product score: the functional unit is a dollar of output.

## Pitfalls

- **The database name is not the project name.** The project you asked for is
  `useeio-demo`; the database inside it is `USEEIO-1.1`. Reading `bd.databases` first
  saves a puzzling empty iteration.
- **`overwrite_existing` defaults to false** and the call refuses rather than replacing.
- **Products and processes are separate nodes** in this database, so `db.random()` may
  hand you something you cannot put a demand on.
- **The archive is cached.** A second install of the same project does not download
  again; delete the file under `bw2io_cache_dir` if you suspect a bad download.
- **`bw2setup()` is the deprecated ancestor of this call** and still appears in old
  notebooks (source: brightway-cheatsheet). See [../gotchas.md](../gotchas.md).
- **The biosphere you start from decides what links later.** A project built from
  `ecoinvent-3.8-biosphere` does not have the same flow list as one built from
  `ecoinvent-3.11-biosphere`, and that is where most unlinked edges come from.
- **Set `BRIGHTWAY2_DIR`** if you do not want a demonstration project beside your real
  ones.

## Related vocabulary

- [Project](../../../../vocabulary.md#project)
- [Database](../../../../vocabulary.md#database)
- [Biosphere](../../../../vocabulary.md#biosphere)
- [Elementary flow](../../../../vocabulary.md#elementary-flow)
- [Impact category](../../../../vocabulary.md#impact-category)
- [LCIA method](../../../../vocabulary.md#lcia-method)
- [Node](../../../../vocabulary.md#node)
- [Product](../../../../vocabulary.md#product)
- [bw2setup](../../../../vocabulary.md#bw2setup)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`bw2data` 4.7, `bw2calc` 2.5.0, `bw2io` 0.9.17, `BRIGHTWAY2_DIR` pointed at a fresh
temporary directory, network access, Linux x86-64. `USEEIO-1.1.tar.gz` is 15 915 413
bytes on the server, checked the same day. Every count above is what the run printed;
the score was `0.00044451160122815545` for `('Impact Potential', 'ACID')` on the first
product node. Duration, including the download and the project restore: about
10 seconds.
