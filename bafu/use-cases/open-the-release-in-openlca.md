---
title: Open the release in openLCA
type: use-case
summary: "Load the release's openLCA package as a new database, which is a restore rather than an import, and know what that implies."
audience: [P1]
updated: 2026-09-22
sources: [bafu-2026-release, openlca-manual-2, openlca-bafu-2026-notes]
verified: no
---

# Open the release in openLCA

**Persona:** P1 practitioner whose tool is openLCA · **GICS sector:** any

## Goal

The whole database open in openLCA, with its processes, flows, methods and any models the
publisher shipped, ready to build a product system against.

## Prerequisites

- openLCA 2, recent enough to read the package. Databases are created with the openLCA
  version that packaged them, and an older installation is the usual cause of the version
  error under Pitfalls (source: openlca-manual-2).
- The openLCA package component of the release, obtained and checksummed as in
  [download-and-verify-the-release.md](download-and-verify-the-release.md).
- Free disk for the decompressed database, which is considerably larger than the package.

## Steps

1. Verify the file you are about to load is the one you downloaded:

   ```bash
   sha256sum -c CHECKSUMS.txt
   ```

2. In openLCA, right-click in the navigation window, choose "New database", then
   "From file..." (source: openlca-manual-2).

3. Select the package file. openLCA decompresses it into its own data directory and
   leaves your file untouched, so the package stays a clean copy you can reload later
   (source: openlca-manual-2).

4. Open the new database and check what came with it: the process count, the
   [LCIA methods](../../vocabulary.md#lcia-method) the package carries, and the
   [elementary flows](../../vocabulary.md#elementary-flow) list.

5. Build a product system for the process you care about and calculate it, following the
   openLCA manual's own chapters on product systems and on calculation
   (source: openlca-manual-2).

## Expected output

A new database in the navigation tree holding the release: on the order of twelve
thousand processes, grouped into the database's own category and sub-category tree rather
than into GICS sectors, with the flows, units and methods the package includes. The
[sector coverage](../knowledge/sector-coverage.md) page says what that tree covers and how
it maps onto GICS.

Loading a package is a restore of a complete database, not an import into an existing
one. Nothing is merged, nothing is matched, and no flow mapping happens. If you want this
database combined with another, that is the manual's separate chapter on importing data
and combining databases, and it is where flow mapping files come in
(source: openlca-manual-2).

## Pitfalls

- **"Could not get the version from the database. Is this an openLCA database?"** is
  usually an openLCA that is older than the one the package was built with. Update
  openLCA (source: openlca-manual-2).
- **The package is compressed and stays that way.** openLCA decompresses into its own
  data directory, so changes you make inside the tool do not touch the file. That is
  convenient, and it also means disk usage roughly doubles.
- **A restore is not a merge.** Do not expect the release to appear inside a database you
  already have.
- **Component versions differ within one release.** The openLCA package and the ecoSpold
  archive of the same release can carry different version labels; record which one you
  loaded.
- **The citation travels with the results.** Every use must credit the source in the
  wording the terms give for the release in hand.
- **For Brightway, do not go through openLCA.** The route is the Sentier loader, which is
  [install-into-brightway.md](install-into-brightway.md).

## Related vocabulary

[LCA software](../../vocabulary.md#lca-software),
[LCA database](../../vocabulary.md#lca-database),
[release component](../../vocabulary.md#release-component),
[LCIA method](../../vocabulary.md#lcia-method),
[elementary flow](../../vocabulary.md#elementary-flow),
[system boundary](../../vocabulary.md#system-boundary),
[category](../../vocabulary.md#category),
[sub-category](../../vocabulary.md#sub-category).

## Verification

`verified: no`. Steps 2 to 5 are graphical steps inside openLCA, taken from the openLCA 2
manual's chapter on creating a new database by loading it from file, read on 2026-09-22;
openLCA was not installed in this environment, so nothing was clicked. Step 1 is verified
on [download-and-verify-the-release.md](download-and-verify-the-release.md). A verifier
would install openLCA 2, load the package, and record the process count, the method list
and the time the decompression took.
