---
title: Migrate a Brightway 2 project to the 2.5 line
type: use-case
summary: Move a project written by bw2data 3.x onto bw2data 4.x, with a backup first and a reprocessing pass that rewrites every datapackage.
audience: [P1]
updated: 2026-09-22
sources: [brightway-upgrading, brightway-faq-versions, brightway-installation, pypi-bw2data, pypi-bw2io, brightway-faq-data]
verified: no
related: [../commands.md, ../gotchas.md, ../../../packages.md]
---

# Migrate a Brightway 2 project to the 2.5 line

**Persona:** P1 practitioner with a model built years ago under Brightway 2 who needs it
to run on the current stack · **GICS sector:** any

## Goal

An existing project, written by the Brightway 2 line, readable by `bw2data` 4.7 and the
rest of the 2.5 generation, with the pre-migration state kept so the move can be undone.

## Prerequisites

- A Brightway 2 project you own. The steps below were **not run**: no such project was
  available in the verification environment, and a migration cannot be honestly
  demonstrated on a project created by the new line.
- A separate environment for the 2.5 stack. `bw2data < 3.99` is Brightway 2 and
  `>= 4.0` is Brightway 2.5; the meta-packages `brightway2` and `brightway25` pin the
  two lines (source: brightway-faq-versions). Do not upgrade in place in the
  environment you still need for the old line.
- Enough free disk for a full copy of the project: the backup, then the rewritten
  datapackages.
- Time. Migration reprocesses every database and every impact category, which on a
  project holding a full background database is minutes, not seconds
  (source: brightway-upgrading).

## Steps

1. From the **old** environment, take a backup of the project. The archive is a
   `.tar.gz` of the whole project directory.

   ```python
   import bw2io as bi

   bi.backup.backup_project_directory(project="<project name>")
   ```

2. Create a fresh environment for the 2.5 line and install it there
   (source: brightway-installation).

   ```bash
   pip install brightway25 pypardiso
   ```

   On Apple silicon, `pypardiso` does not run; the documented substitute is
   `pip install brightway25 scikit-umfpack` (source: brightway-installation). See
   [../../pypardiso/gotchas.md](../../pypardiso/gotchas.md).

3. In the new environment, confirm the project is visible. The data directory is global
   and shared between environments, which is why the old project shows up at all
   (source: brightway-faq-data).

   ```python
   import bw2data as bd

   sorted(bd.projects)
   bd.projects.set_current("<project name>")
   ```

4. Run the migration. It asserts the project is not already 2.5, reprocesses every
   database and impact assessment object, and sets the project's `25` flag (read from
   the installed `bw2data` 4.7; documented in brightway-upgrading).

   ```python
   bd.projects.migrate_project_25()
   ```

5. Check what came across, then recalculate one result you already know the answer to.

   ```python
   sorted(bd.databases)
   sorted(bd.methods)
   bd.Database("<database>").metadata["backend"]
   ```

6. Keep the stack current afterwards (source: brightway-upgrading).

   ```bash
   pip install -U brightway25
   ```

## Expected output

- The backup call writes one `.tar.gz` whose size is roughly the project directory's.
- `migrate_project_25()` returns nothing and prints progress while it reprocesses. On a
  project with a background database expect minutes of work and a rewrite of every
  datapackage under the project directory.
- After migration the database and impact category names are unchanged; what changed is
  the processed arrays behind them.
- A recalculated score should match the old one to within floating point noise. A score
  that moves by a visible amount is a finding, not a rounding artefact: report it rather
  than accepting it.

## Pitfalls

- **You cannot mix the lines.** A 2.5 `bw2data` with a Brightway 2 `bw2calc` does not
  work, and a Brightway 2 tutorial will not run on 4.7
  (source: brightway-faq-versions). See [../gotchas.md](../gotchas.md).
- **The migration is one way in practice.** There is no `migrate_project_2()`. The
  backup from step 1 is what you restore if you need the old state, with
  `bi.backup.restore_project_directory(fp="<path>")`.
- **Copy the project before migrating** if you want both states at once:
  `bd.projects.copy_project("<name>-25")` first, then migrate the copy.
- **The shared data directory cuts both ways.** A 2.5 install seeing an unmigrated
  Brightway 2 project will complain about it; that is the mechanism, not a bug
  (source: brightway-faq-data).
- **`Database` is a function,** returning whichever backend class the metadata names. If
  you wrote code that tested `isinstance(db, bd.Database)` under Brightway 2, replace it
  with a check on `db.metadata["backend"]`.
- **Old import code will not survive unchanged.** `bw2io < 0.8.9` is the Brightway 2
  line and its API differs (source: brightway-faq-versions, pypi-bw2io).

## Related vocabulary

- [Project](../../../../vocabulary.md#project)
- [Project directory](../../../../vocabulary.md#project-directory)
- [Data root](../../../../vocabulary.md#data-root)
- [Database](../../../../vocabulary.md#database)
- [Backend](../../../../vocabulary.md#backend)
- [Datapackage](../../../../vocabulary.md#datapackage)
- [Processed arrays](../../../../vocabulary.md#processed-arrays)
- [Method](../../../../vocabulary.md#method)

## Verification

`verified: no`. No Brightway 2 project existed in the verification environment, and
creating one only to migrate it would have tested the fixture rather than the upgrade
path a practitioner faces. The API surface was checked: `projects.migrate_project_25`,
`projects.copy_project`, `backup.backup_project_directory` and
`backup.restore_project_directory` all exist on `bw2data` 4.7 and `bw2io` 0.9.17, which
was introspected on 2026-09-21 for [../commands.md](../commands.md). The sequence and
the timing claim come from the upstream upgrading page (source: brightway-upgrading).

A verifier would need a real Brightway 2 project, ideally one with a background database
and a handful of known scores, and two environments: one pinned to `brightway2`, one to
`brightway25`. Recording the scores before and after is the check that matters.
