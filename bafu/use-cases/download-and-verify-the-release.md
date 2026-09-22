---
title: Download and verify a BAFU release
type: use-case
summary: "Get the release components from the Nexus page, record your own checksums because the publisher does not, and unpack what you took."
audience: [P1]
updated: 2026-09-22
sources: [bafu-2026-release, openlca-bafu-2026-notes, bafu-terms-of-use-2025]
verified: yes
verified_on: 2026-09-22
verified_env: "Ubuntu 22.04, coreutils sha256sum, against a copy of the BAFU-2026 v1.1 openLCA package downloaded earlier and its CHECKSUMS.txt"
---

# Download and verify a BAFU release

**Persona:** P1 practitioner obtaining the database for the first time ·
**GICS sector:** any; the database is cross-sectoral

## Goal

The release components on your own disk, each with a checksum you made yourself at the
moment of download, so that six months later you can still say which build you used.

## Prerequisites

- A browser, and acceptance of the terms of use, which is part of the download rather
  than an afterthought. Read
  [../knowledge/access-and-licence.md](../knowledge/access-and-licence.md) first: the
  data is free of charge but may not be resold or redistributed as part of another
  database, and every use must credit the source.
- Several hundred megabytes of free disk, outside any repository.
- `sha256sum`, or any equivalent.

## Steps

1. Open the database's page on openLCA Nexus and accept the terms. There is no open API
   and no documented stable direct file URL, so this step is a person clicking, and a
   script cannot stand in for it. See [../data/fetch.md](../data/fetch.md).

2. Download the components you need: the openLCA package if your tool is openLCA, the
   ecoSpold archive for anything else or for your own importer, the
   [LCIA results](../../vocabulary.md#lcia-results) workbook if you only need indicator
   results per process, and the documentation for the assumptions and the change log.

3. Make your own checksums immediately, in the directory you downloaded into:

   ```bash
   sha256sum *.zip *.zolca > CHECKSUMS.txt
   ```

4. Add a comment line to that file recording the date and the page you took the files
   from, because the version labels of the components within one release can differ:

   ```bash
   printf '# downloaded %s from the openLCA Nexus BAFU page\n' "$(date +%F)" >> CHECKSUMS.txt
   ```

5. Verify, then and whenever you come back to the files:

   ```bash
   sha256sum -c CHECKSUMS.txt
   ```

6. Unpack what you took:

   ```bash
   unzip "BAFU-2026 v1_LCIA Results_corrected.zip"
   ```

## Expected output

Step 3 writes one line per file. Step 5 prints one `OK` per file, and exits non-zero on
any mismatch.

Step 6 unpacks each archive into exactly one directory. The ecoSpold archive gives one
directory of about twelve thousand process documents, one per process, and nothing else.
The results archive gives one directory holding a single workbook. The openLCA package is
itself a zip, but its payload is a database directory rather than dataset documents, so
unzipping it by hand is only useful if you intend to read that database directly; the
normal route is to import it, which is
[open-the-release-in-openlca.md](open-the-release-in-openlca.md).

The [release components](../../vocabulary.md#release-component) of one release do not all
carry the same version label. In the release inspected for this wiki the openLCA package
was labelled one minor version ahead of the ecoSpold archive. Write down what you
actually downloaded rather than the release year.

## Pitfalls

- **The publisher does not publish checksums.** That is why you make your own at download
  time. A checksum made later proves only that the file has not changed since you made
  it.
- **A digest that differs from someone else's is usually a different build**, not a
  corrupted file. Check the version label and the download date before assuming the
  worst.
- **Do not put the files in a repository.** They are hundreds of megabytes, and the
  licence does not let you redistribute them.
- **Accepting the terms is a condition, not a formality.** Reuse is allowed, including in
  commissioned studies and calculators; selling, reselling or distributing the data,
  separately or inside another database, is not, and any modification has to be
  documented in a standalone document that travels with the data.
- **Do not confuse the results workbook with the inventory.** It carries indicator
  results per process, not exchanges, and it joins to the inventory on names rather than
  on identifiers.

## Related vocabulary

[Release component](../../vocabulary.md#release-component),
[ecoSpold format](../../vocabulary.md#ecospold-format),
[LCIA results](../../vocabulary.md#lcia-results),
[LCA database](../../vocabulary.md#lca-database),
[life cycle inventory (LCI) data set](../../vocabulary.md#life-cycle-inventory-lci-data-set),
[eco-point (UBP)](../../vocabulary.md#eco-point-ubp).

## Verification

Steps 5 and 6 were run on 2026-09-22 on Ubuntu 22.04 against a copy of the BAFU-2026
v1.1 openLCA package and the results archive downloaded earlier, with a `CHECKSUMS.txt`
written at that earlier download. The verification took 1.2 s and printed `OK` for the
openLCA package; unpacking the results archive took under a second and produced one
directory holding one workbook, as described. Steps 1 to 4 were not repeated: the
download itself is an interactive acceptance of the terms of use, and re-running it would
have added nothing this wiki can check. The digest of the openLCA package of this release
is recorded on [../data/fetch.md](../data/fetch.md).
