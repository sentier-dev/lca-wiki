---
title: bw2data gotchas
type: module-page
summary: What surprises people about bw2data 4.x, and what to do instead.
audience: [P1, P3]
updated: 2026-09-21
sources: [brightway-faq-versions, brightway-upgrading, brightway-cheatsheet, brightway-faq-data, brightway-glossary, pypi-bw2data]
related: [classes.md, commands.md, status.md]
---

# bw2data gotchas

One bullet per surprise, version-specific ones first.

- **Version 4 is a different framework, not a bigger version 3.** `bw2data < 3.99` is
  Brightway 2 and `>= 4.0` is Brightway 2.5; the meta-packages `brightway2` and
  `brightway25` pin the two lines (source: brightway-faq-versions). Mixing a 2.5
  `bw2data` with a Brightway 2 `bw2calc` does not work, and a Brightway 2 tutorial will
  not run on 4.7.

- **An old project has to be migrated, and migration reprocesses everything.**
  `bd.projects.migrate_project_25()` asserts the project is not already 2.5, then
  reprocesses every database and impact assessment object and sets the project's `25`
  flag (read from the installed 4.7; documented in brightway-upgrading). On a large
  project this is minutes of work, not seconds, and it rewrites every datapackage.

- **`Database` is a function.** It returns whichever backend class the database's metadata
  names, so `bd.Database('x')` may be a `SQLiteBackend` or an `IOTableBackend`.
  `isinstance` against `Database` fails; check `db.metadata['backend']` instead.

- **The backend is chosen at write time and changes what you may store.** `sqlite` is the
  default; `iotable` keeps edges only in datapackages and restricts them to a single value
  with no uncertainty, in exchange for speed on large input-output data; `multifunctional`
  exists only when that package is installed (source: brightway-cheatsheet; the installed
  4.7 maps `sqlite` and `iotable`). Converting later means rewriting the database.

- **Editing a node or an edge does nothing until you call `.save()`.** The proxies behave
  like dictionaries, so `node['name'] = 'x'` looks like it worked; it is in memory only.

- **Writing data does not update the matrices.** The calculation layer reads datapackages,
  not SQLite. After changing a database, `.process()` it, or fetch fresh datapackages with
  `bd.prepare_lca_inputs(...)`, or the next LCA will quietly use the old numbers.

- **`bd.get_node` wants exactly one match.** It raises when zero or several nodes match,
  which is the point of it. Use iteration with a comprehension when you expect a set.

- **Keys with spaces need the dictionary form.** `bd.get_node(**{"some field": True})`,
  because you cannot write a keyword argument with a space (source: brightway-cheatsheet).

- **Search has to be switched on.** A database is searchable only after
  `db.make_searchable()`; imported databases are not always indexed.

- **`delete_project(name)` without `delete_dir=True` leaves the data.** The project name
  disappears from the list but the directory stays, which is useful when you meant it and
  confusing when you did not.

- **The data directory is global, not per environment.** Two virtual environments on one
  machine share the same projects unless you set the `BRIGHTWAY2_DIR` environment
  variable; the documentation warns beginners away from doing so (source:
  brightway-faq-data). This is how a 2.5 install can suddenly see a Brightway 2 project
  and complain about it.

- **Ids are not stable across machines.** Nodes get integer ids locally, so a key tuple
  from one computer does not resolve on another. Datapackages carry reindexing metadata
  for exactly this reason; see [../bw_processing/](../bw_processing/).

- **`Method` is the class, impact category is the concept.** The upstream glossary says
  the class name does not follow ISO and prefers "impact category"
  (source: brightway-glossary, quoted in
  [../../../vocabulary.md](../../../vocabulary.md)).
