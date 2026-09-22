---
title: Read the bundled mapping index
type: use-case
summary: Open the mappings archive shipped inside ecoinvent_interface, without credentials, to see which releases and system models it indexes and what a record holds.
audience: [P1, P2]
updated: 2026-09-22
sources: [ecoinvent-interface-repo, pypi-ecoinvent-interface]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with ecoinvent_interface 3.1, no credentials, no network access, Linux x86-64
related: [list-releases-and-download.md, ../classes.md, ../datasets.md, ../gotchas.md]
---

# Read the bundled mapping index

**Persona:** P1 practitioner deciding whether a release is covered before buying time on
it, or a P2 contributor sizing a dependency · **GICS sector:** any

## Goal

Know what the mapping index inside `ecoinvent_interface` covers, and what one of its
records looks like, without an ecoinvent account. The index is what turns
`select_process(name=..., location=...)` into a filename, so its coverage decides which
releases the attribute-based API works for at all.

## Prerequisites

- `ecoinvent_interface` 3.1. **No credentials, no licence, no network access.** The
  archive ships inside the wheel.
- About 40 MB of disk, which the install brings anyway, and a little more if you extract
  one of the index files.

## Steps

1. Find the archive. It is one file in the package's `data` directory.

   ```python
   from ecoinvent_interface.mapping import DATA_DIR

   sorted(p.name for p in DATA_DIR.iterdir())
   (DATA_DIR / "mappings.zip").stat().st_size
   ```

2. List its members. One JSON file per release version and system model, plus a
   catalogue.

   ```python
   import zipfile

   zf = zipfile.ZipFile(DATA_DIR / "mappings.zip")
   sorted(zf.namelist())
   ```

3. Derive the coverage from the member names.

   ```python
   names = [n for n in zf.namelist() if "_" in n]
   sorted({n[:-5].rsplit("_", 1)[0] for n in names})   # versions
   sorted({n[:-5].rsplit("_", 1)[1] for n in names})   # system models
   ```

4. Read the system model name table, which maps the long official names to the short
   ones the API takes.

   ```python
   from ecoinvent_interface.mapping import SYSTEM_MODELS

   SYSTEM_MODELS
   ```

5. Open one index and look at a record's shape. Do not print the records themselves into
   anything you publish: the names are ecoinvent's.

   ```python
   import json

   with zf.open("3.11_cutoff.json") as fh:
       records = json.load(fh)

   len(records), type(records).__name__
   sorted(records[0])
   {k: type(v).__name__ for k, v in records[0].items()}
   ```

## Expected output

- `DATA_DIR` holds exactly one file, `mappings.zip`, 38 540 301 bytes in 3.1.
- The archive has 30 members: 29 index files named `<version>_<system model>.json`, plus
  `catalogue.json`. Uncompressed they total about 194 MB, so the archive is roughly a
  fifth of what it expands to.
- Versions covered: 3.5, 3.6, 3.7.1, 3.8, 3.9.1, 3.10, 3.10.1 and 3.11. System models
  covered: `cutoff`, `consequential`, `apos` and `EN15804`. Not every pair exists:
  `EN15804` appears only from 3.8 onwards, and 3.5 to 3.7.1 carry the three classic
  system models only.
- `SYSTEM_MODELS` maps four long names to those four short ones: allocation cut-off by
  classification, substitution consequential long-term, allocation at the point of
  substitution, and allocation cut-off EN15804.
- One index is a JSON **list**. The 3.11 cut-off index has 25 412 records. Each record
  is a dictionary with five keys: `filename` and `activity_name`, `reference_product`
  and `geography` as strings, and `index` as an integer.
- A newer release than 3.11 is not in the archive, and attribute-based selection will
  not work for it until `ProcessMapping.create_remote_mapping` fetches one
  (source: pypi-ecoinvent-interface).

## Pitfalls

- **This is an index, not data.** It holds activity names, reference products,
  geographies and filenames. No amounts, no exchanges, no characterisation factors. That
  is exactly why it can ship in a wheel and be read here.
- **Do not republish the records.** The names are ecoinvent's; this wiki describes the
  structure and the counts, and nothing else. See the licensing constraint in
  [../../../../CLAUDE.md](../../../../CLAUDE.md).
- **`ProcessMapping` still wants `Settings`.** Constructing the class is not what reads
  the archive; the steps above go at the zip directly, which is why they need no
  account.
- **194 MB uncompressed is not free.** Loading one index into Python costs tens of
  megabytes of memory. Read the one version you need, not all of them.
- **The archive dominates the wheel.** If you are sizing a container image,
  `ecoinvent_interface` is about 40 MB of index plus a small library.
- **Coverage is not licence.** Having the index for 3.5 does not mean your account may
  download 3.5.

## Related vocabulary

- [System model](../../../../vocabulary.md#system-model)
- [Cut-off](../../../../vocabulary.md#cut-off)
- [APOS](../../../../vocabulary.md#apos)
- [Consequential modelling](../../../../vocabulary.md#consequential-modelling)
- [Activity](../../../../vocabulary.md#activity)
- [Reference product](../../../../vocabulary.md#reference-product)
- [Geography](../../../../vocabulary.md#geography)
- [Release component](../../../../vocabulary.md#release-component)
- [ecoSpold format](../../../../vocabulary.md#ecospold-format)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`ecoinvent_interface` 3.1, Linux x86-64, with no credentials configured and no network
access needed. Every size, count and field name above is what the run printed. No record
contents were copied out of the archive, and none appear here.

Duration: under 2 seconds once the package was installed; the install itself is the slow
part, because of the 38 MB archive.
