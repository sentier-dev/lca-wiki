---
title: Fetching a BAFU release
type: database
summary: Where the files are, why the download cannot be fully automated, and how to verify and unpack them.
audience: [P1, P3]
updated: 2026-09-21
sources: [bafu-2026-release, openlca-bafu-2026-notes, bafu-terms-of-use-2025]
related: [../knowledge/access-and-licence.md, ../knowledge/format.md]
---

# Fetching a BAFU release

## Where the files are

One place: the database's page on openLCA Nexus,
<https://nexus.openlca.org/database/BAFU> (source: bafu-2026-release). It lists the
components of the current release and of the releases before it.

**There is no open API.** Nothing in this release is served as a queryable endpoint, and
no documented stable direct file URL exists. A download is a person clicking through the
Nexus page after accepting the terms of use, which is a deliberate part of the
distribution: the terms have to be accepted before the data is handed over (source:
openlca-bafu-2026-notes). A script cannot do that for you, and this wiki will not ship
one that pretends to. Read
[../knowledge/access-and-licence.md](../knowledge/access-and-licence.md) before you
download, not after.

## What to download

Four components are published for BAFU:2026 v1 (source: openlca-bafu-2026-notes):

| Component | File, as named in the release inspected here | Take it when |
|---|---|---|
| openLCA database | `BAFU-2026 v1.1 openLCA.zolca` | your tool is openLCA |
| ecoSpold v1 files | `BAFU-2026 v1_ecoSpold v1.zip` | any other tool, or your own importer |
| LCIA results | `BAFU-2026 v1_LCIA Results_corrected.zip` | you only need indicator results per process |
| Documentation | the LCI reports and the dataset change log | you need the assumptions or the diff to the last release |

Note the version labels: the openLCA package of this release is `v1.1`, the ecoSpold
archive `v1` (source: bafu-2026-release). Write down what you actually downloaded.

## Record a checksum, every time

The release pages do not publish checksums, so make your own at the moment of download
and keep them beside the files. A `CHECKSUMS.txt` with one `sha256sum` line per file and
a comment saying when and from where it was downloaded is enough, and it is what
[fetch.sh](fetch.sh) expects.

```bash
sha256sum "BAFU-2026 v1.1 openLCA.zolca" \
          "BAFU-2026 v1_ecoSpold v1.zip" \
          "BAFU-2026 v1_LCIA Results_corrected.zip" > CHECKSUMS.txt
```

For the record, the openLCA package of BAFU:2026 v1.1 downloaded from the Nexus page on
2026-09-02 has the SHA-256 digest
`e63b7e7ef5cde04bfe1176a783a55b5f72e2b73f42c36632b6150af39d348c4c` (source:
bafu-2026-release). If yours differs, you have a different build, not a corrupted file:
check the version label and the date before assuming the worst.

## What you get when you unpack

- `BAFU-2026 v1_ecoSpold v1.zip` unpacks to one directory, `ecoSpold files/`, holding
  11,947 files named `process_<uuid>.xml` and nothing else (source: bafu-2026-release).
- `BAFU-2026 v1_LCIA Results_corrected.zip` unpacks to one directory,
  `BAFU-2026 v1_LCIA Results/`, holding one workbook,
  `BAFU-2026 v1 LCIA Results_corrected.xlsx` (source: bafu-2026-release).
- `BAFU-2026 v1.1 openLCA.zolca` is itself a zip archive, but its payload is an openLCA
  database directory rather than dataset documents; unzipping it by hand is only useful
  if you intend to read that database directly (source: bafu-2026-release). The normal
  route is to import the file in openLCA.

The full field layout of each component is in
[../knowledge/format.md](../knowledge/format.md).

## Where to put it

Not in this repository. The wiki carries no inventory data, and a BAFU release is
hundreds of megabytes. Keep the downloads in a directory of your own, keep the
`CHECKSUMS.txt` beside them, and point your tool at that directory.

## Getting it into a tool

- openLCA: import the `.zolca` file.
- Brightway and anything else in this wiki's tooling: the Sentier platform ships this
  database as the `bafu-2026` inventory package, and that route is documented on its own
  module page, [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/),
  with the loader at
  [../../sentier/modules/sentier-brightway/](../../sentier/modules/sentier-brightway/).
- Your own importer: write it against the ecoSpold v1 archive, and read
  [../knowledge/schemas-and-nomenclature.md](../knowledge/schemas-and-nomenclature.md)
  first, in particular the note that the LCIA results workbook joins on names rather than
  on UUIDs.

## Related pages

- [fetch.sh](fetch.sh): verify and unpack what you downloaded.
- [../knowledge/access-and-licence.md](../knowledge/access-and-licence.md): what you may then do with it.
