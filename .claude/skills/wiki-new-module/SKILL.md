---
name: wiki-new-module
description: Add a module folder to a tool branch, filled from the codebase template. Use when documenting a package, library or data repository that this wiki does not cover yet.
---

# wiki-new-module

A module is one thing a practitioner installs, reads or connects to.

## 1. Check it belongs

- Is it public? This wiki documents public repositories only.
- Is it a module or a database? A database large enough to stand on its own gets a root
  branch from `templates/pages/module-database/`, not a module folder.
- Read the branch's `modules/README.md` for the naming rule: the upstream package name,
  unchanged, with no version in the folder name.

## 2. Create it

```bash
cp -r templates/pages/module-codebase <branch>/modules/<name>
```

A module folder created by a skeleton phase may carry `status: stub` in its `README.md`.
Filling the module means giving the page real `sources:` and **deleting that line**.

Fill, in this order:

1. `README.md` — purpose, install, **the version you documented and how you obtained
   it**, the Datasets section. A module page without a version goes stale silently.
2. `layout.md` — the tree, one line per file or folder that a reader would open.
3. `classes.md` — the public surface, with what invokes each name.
4. `commands.md` — every entry point, each checked against its own `--help` on the date
   in the frontmatter.
5. `datasets.md` — name, version, sectors, provenance, schema, methods, vocabulary.
   Broad descriptors, never per datapoint. Link the source database's branch.
6. `gotchas.md` — what surprises people, with how to tell.
7. `status.md` — what works, what is in flight, what is missing.

## 3. Register sources

Every one of those pages needs resolving `sources:` ids: the package documentation, its
registry entry for versions, the repository itself. Add them to `sources.md` first.

## 4. The API reference, if the module owes one

No script generates it. Run `pdoc` by hand, one file per submodule, into
`<branch>/modules/<name>/api/`, and stamp each file with the package, the version and
the date you generated it. Keep each file under 1 MB. The module page may link into
them like any other page.

## 5. Vocabulary, at least one use case, then finish

Add the terms the module introduces to the root `vocabulary.md`, one bullet per context.
Write at least one use case in `use-cases/` and set `verified:` honestly.

Then add a line to `index.md` for every page you created, and open every link and
`vocabulary.md#anchor` you wrote to confirm it resolves.

Append one line to `log.md`:
`## [YYYY-MM-DD] task | module <name> documented at version <version>`
