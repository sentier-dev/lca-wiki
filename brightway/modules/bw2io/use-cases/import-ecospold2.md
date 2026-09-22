---
title: Import an ecospold2 release
type: use-case
summary: Read an extracted ecospold2 directory into a Brightway project, either file by file with SingleOutputEcospold2Importer or in one call with import_ecoinvent_release.
audience: [P1]
updated: 2026-09-22
sources: [brightway-cheatsheet, bw2io-docs, pypi-bw2io, ecospold2-format, ecoinvent-licences, ecoinvent-interface-repo]
verified: no
related: [../commands.md, ../datasets.md, ../gotchas.md, ../../ecoinvent_interface/README.md]
---

# Import an ecospold2 release

**Persona:** P1 practitioner with an ecoinvent licence, setting up a project on a
background database · **GICS sector:** any

## Goal

A Brightway project holding a full ecospold2 release, its biosphere database and its
impact categories, linked and ready to calculate against.

## Prerequisites

- **An ecoinvent licence.** This page is `verified: no` for exactly that reason: no
  ecoinvent credentials were available to the agent that wrote it, and none of the steps
  below were run. Nothing in this wiki carries ecoinvent inventory data
  (source: ecoinvent-licences).
- `bw2data` 4.7, `bw2calc` 2.5.0 and `bw2io` 0.9.17.
- Either an extracted ecospold2 directory you already downloaded, or credentials for the
  download route in step 3.
- Disk space for the archive and its extracted contents at the same time
  (source: ecoinvent-interface-repo).
- Patience. A full release is tens of thousands of XML files; the extraction is the slow
  part.

## Steps

1. Start a project with a matching biosphere. The flow list has to be the one the
   release expects, so pick the starter project for the version you are importing; see
   [install-a-remote-example-project.md](install-a-remote-example-project.md).

   ```python
   import bw2data as bd
   import bw2io as bi

   bi.remote.install_project("ecoinvent-3.11-biosphere", "ei-311-cutoff")
   bd.projects.set_current("ei-311-cutoff")
   ```

2. Point the importer at the directory of `.spold` files. Ecospold2 is the XML format
   ecoinvent publishes unit process data in (source: ecospold2-format).

   ```python
   imp = bi.SingleOutputEcospold2Importer(
       "<path to the datasets directory>", "ecoinvent-3.11-cutoff"
   )
   ```

3. Or skip steps 1 and 2 and let `bw2io` download, extract and import in one call. It
   reads credentials through `ecoinvent_interface`; never write them into the notebook
   (source: ecoinvent-interface-repo).

   ```python
   bi.import_ecoinvent_release(version="3.11", system_model="cutoff")
   ```

4. Apply the default strategies, then read the statistics.

   ```python
   imp.apply_strategies()
   imp.statistics()
   ```

5. Link the biosphere edges against the project's biosphere database.

   ```python
   imp.match_database("ecoinvent-3.11-biosphere", fields=["name", "unit", "categories"])
   imp.statistics()
   imp.all_linked
   ```

6. Write it, once nothing is unlinked.

   ```python
   imp.write_database()
   ```

7. Install the impact categories that go with the release, from the same starter project
   or from the LCIA workbook `ecoinvent_interface` can fetch; see
   [../../ecoinvent_interface/use-cases/list-releases-and-download.md](../../ecoinvent_interface/use-cases/list-releases-and-download.md).

## Expected output

Described from the documentation, not from a run:

- The extraction step prints a progress bar over the `.spold` files. For a recent
  cut-off release expect tens of thousands of processes and a similar number of
  products.
- `statistics()` prints graph nodes by type, graph edges by type, the databases the
  edges point at, and the unique unlinked edges by type. On a clean release against the
  matching biosphere the unlinked count should fall to zero after step 5.
- `write_database()` writes the SQLite rows and the processed arrays, and is the slowest
  single step after extraction.
- The imported database is namespaced: `import_ecoinvent_release` gives a release its
  own biosphere database rather than reusing a shared one
  (source: brightway-cheatsheet).

No counts, amounts or characterisation factors from an ecoinvent release appear on this
page or anywhere in this wiki.

## Pitfalls

- **The biosphere has to match the release.** A project built from the 3.8 flow list and
  a 3.11 import is the commonest source of unlinked edges. See [../gotchas.md](../gotchas.md).
- **`import_ecoinvent_release` wants credentials.** Keep them in environment variables or
  the `ecoinvent_interface` secrets directory, never in the notebook and never in version
  control (source: ecoinvent-interface-repo).
- **A licence is not enough.** The ecoinvent licence and the personal identifying
  information agreement both have to be accepted on the ecoinvent website for the
  account before any client can authenticate (source: ecoinvent-interface-repo).
- **Release types are not interchangeable.** `lci` and `lcia` releases are results. The
  one you import to calculate with is `ecospold`, or `matrix` if you work at matrix
  level (source: ecoinvent-interface-repo).
- **The shipped migration tables stop at ecoinvent 3.9.** Anything newer is a
  `randonneur` job (source: brightway-cheatsheet). See
  [../../randonneur/use-cases/apply-a-migration-to-inventory-data.md](../../randonneur/use-cases/apply-a-migration-to-inventory-data.md).
- **Never redistribute what you imported.** The licence covers you, not the people you
  send a project directory to (source: ecoinvent-licences).

## Related vocabulary

- [ecoSpold format](../../../../vocabulary.md#ecospold-format)
- [Importer](../../../../vocabulary.md#importer)
- [Linking](../../../../vocabulary.md#linking)
- [System model](../../../../vocabulary.md#system-model)
- [Biosphere](../../../../vocabulary.md#biosphere)
- [Elementary flow](../../../../vocabulary.md#elementary-flow)
- [Unit process, single operation](../../../../vocabulary.md#unit-process-single-operation)
- [LCIA method](../../../../vocabulary.md#lcia-method)
- [Cut-off](../../../../vocabulary.md#cut-off)

## Verification

`verified: no`. No ecoinvent credentials and no ecoinvent data were available, and this
wiki does not obtain them: the ecoinvent branch of the wiki documents structure only.
Every step above is taken from the upstream cheat sheet and the `bw2io` and
`ecoinvent_interface` documentation, and the call names were confirmed to exist on
`bw2io` 0.9.17 by introspection on 2026-09-21 for [../commands.md](../commands.md).

A verifier needs an ecoinvent account with both agreements accepted, roughly 20 GB free
for a release and its extraction, and an hour. What matters in the report is the
unlinked count after step 5 and the total wall clock, both per release version.
