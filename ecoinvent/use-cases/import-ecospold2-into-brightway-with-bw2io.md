---
title: Import ecoSpold2 into Brightway with bw2io
type: use-case
summary: "Take an extracted ecoSpold2 release into a Brightway project: set the project up, run the importer, link it, and check nothing is left unlinked."
audience: [P1]
updated: 2026-09-22
sources: [bw2io-docs, brightway-cheatsheet, ecoinvent-interface-repo, ecospold2-format]
verified: no
---

# Import ecoSpold2 into Brightway with bw2io

**Persona:** P1 practitioner with a licence, building a Brightway project on an ecoinvent
background · **GICS sector:** any

## Goal

A licensed release written into a Brightway [project](../../vocabulary.md#project) as a
[database](../../vocabulary.md#database), fully linked, with the
[biosphere](../../vocabulary.md#biosphere) and the methods in place and no unlinked
[exchanges](../../vocabulary.md#exchange) left behind.

## Prerequisites

- A licence, credentials and an extracted ecoSpold release directory, as in
  [download-a-release-with-ecoinvent-interface.md](download-a-release-with-ecoinvent-interface.md).
- `bw2data`, `bw2io` and `bw2calc` in one environment, and a project to write into.
- Time and memory: a full release is a long import.

## Steps

1. Choose a project and set the defaults up, so the biosphere and the bundled methods
   exist before the import:

   ```python
   import bw2data as bd
   import bw2io as bi

   bd.projects.set_current("ecoinvent-3.11-cutoff")
   bi.bw2setup()
   ```

2. Point the importer at the extracted directory or the zip, and name the database:

   ```python
   imp = bi.SingleOutputEcospold2Importer("<extracted directory or zip>", "ecoinvent-3.11-cutoff")
   ```

3. Run the importer's default strategy list, which normalises names, units and contexts:

   ```python
   imp.apply_strategies()
   ```

4. Link the imported [edges](../../vocabulary.md#edge), inside the data and against the
   biosphere:

   ```python
   imp.match_database()
   ```

5. Look at what is left before writing anything:

   ```python
   imp.statistics()
   ```

6. Write it into the project:

   ```python
   imp.write_database()
   ```

7. As a one-call alternative, when you would rather the download and the import happened
   together, `bw2io` wraps the client:

   ```python
   bi.import_ecoinvent_release(version="3.11", system_model="cutoff",
                               username=..., password=...)
   ```

## Expected output

Step 3 prints the strategies as it applies them. Step 5 prints how many datasets were
read, how many exchanges, and how many are still unlinked, and `imp.all_linked` is the
boolean form of the same question. A clean release import should reach zero unlinked; a
non-zero count means a strategy did not fire or the biosphere does not match, and it is a
reason to stop rather than to continue.

Step 6 writes the database. Step 7 does the same work behind one call and additionally
gives the release its own namespaced biosphere, which is convenient and means linking
your own activities across two differently namespaced biospheres needs care.

If anything remains unlinked, `bw2io` gives you tools rather than a shrug: a workbook of
the unlinked edges, a template for writing the missing mapping, an iterator over the
unique unlinked edges, and explicit moves for putting unmatched biosphere flows into a
database of their own. Dropping them is also possible, and the argument you have to pass
to do it is named to make you think twice.

## Pitfalls

- **Keep credentials out of the notebook.** The one-call route takes a username and a
  password; let the client read them from its settings or the environment instead of
  typing them into a cell.
- **`import_ecoinvent_release` namespaces the biosphere.** Each release imported that way
  gets its own. Linking across namespaced biospheres is deliberate work, not an accident
  to discover later.
- **Do not drop unlinked edges to make the count zero.** They are missing inventory. Map
  them, move them, or stop.
- **Check the statistics before writing.** Writing first and inspecting afterwards means
  a database in the project that you then have to delete.
- **The system model is part of the database's identity.** Name the database after the
  version and the [system model](../../vocabulary.md#system-model), or you will not know
  later which one you scored.
- **Nothing about this may be published.** The imported database holds licensed amounts.
  Describe the import; never paste a table of exchanges.

## Related vocabulary

[ecoSpold format](../../vocabulary.md#ecospold-format),
[importer](../../vocabulary.md#importer),
[linking](../../vocabulary.md#linking),
[biosphere](../../vocabulary.md#biosphere),
[edge](../../vocabulary.md#edge),
[exchange](../../vocabulary.md#exchange),
[bw2setup](../../vocabulary.md#bw2setup),
[project](../../vocabulary.md#project),
[system model](../../vocabulary.md#system-model).

## Verification

`verified: no`. No ecoinvent licence, credentials or release archive were available in
this environment, so no step was executed. The calls and their order are the ones the
`bw2io` module pages of this wiki record from the package's own documentation and its
installed source, read on 2026-09-22; the module pages are
[../../brightway/modules/bw2io/commands.md](../../brightway/modules/bw2io/commands.md) and
[../../brightway/modules/bw2io/gotchas.md](../../brightway/modules/bw2io/gotchas.md). A
verifier with a licence would run steps 1 to 6 against a real extracted release and record
the dataset count, the unlinked count and the wall-clock time, and nothing else.
