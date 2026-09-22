---
title: bw_processing datasets
type: module-page
summary: The three example datapackages bw_processing ships, and what a datapackage contains.
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-bw-processing, bw-processing-docs, brightway-glossary]
related: [README.md, classes.md, ../bw2data/datasets.md]
---

# bw_processing datasets

## Example datapackages

- **What they are:** `datapackage_1` (a directory), `datapackage_2.zip` and `simple.zip`,
  under `bw_processing/examples/` and reachable as `bw_processing.examples_dir` (walked in
  the installed 1.6 on 2026-09-21).
- **Version:** whatever ships with the installed release; they are regenerated when the
  format changes.
- **Provenance:** written by the package's own authors as test and documentation
  fixtures, under the package's BSD 3-Clause licence.
- **Schema:** the datapackage format described below.
- **Sectors, methods, vocabulary:** none. The numbers are arbitrary and have no LCA
  meaning. Do not cite them as data.

Nothing else is shipped and nothing is downloaded: `bw_processing` has no network code.

## The format itself

This is the data structure every Brightway calculation reads, so it is worth describing
even though the package ships no content.

- **What it is:** a directory or zip file holding a `datapackage.json` metadata file and
  one file per resource, each resource being a numpy array serialised as a `.npy` file or
  as parquet, the choice controlled by `MatrixSerializeFormat`
  (source: bw-processing-docs).
- **Provenance:** written by `bw2data` when a database or impact category is processed, or
  by anyone using `create_datapackage`. The metadata records author, licence, version and
  a unique id, so provenance travels with the numbers (source: brightway-glossary).
- **Schema:** resources are grouped into resource groups. A group contributes to one named
  matrix and consists of a data vector or array, an indices array of `(row, col)` pairs
  typed `int64`, and optionally a boolean `flip` vector, a float `scale` vector,
  an uncertainty array following the `stats_arrays` record type, a parameter array and
  its label schema (read from the installed 1.6 and described in bw-processing-docs).
- **Licence field:** a new datapackage records the Open Data Commons Public Domain
  Dedication and Licence 1.0 by default. That is a default value, not a statement about
  the data you put in it; set it when the content is licensed.
- **Vocabulary:** none of its own. The integers in the indices arrays refer to node ids in
  whichever database produced the package, which is what the reindexing metadata is for.
- **Source branch:** whatever database the numbers came from, for example
  [../../../ecoinvent/](../../../ecoinvent/), [../../../bafu/](../../../bafu/) or
  [../../../sentier/](../../../sentier/).

## A note on sharing datapackages

A datapackage is the numbers. Sharing one made from a licensed database shares that
licensed data, whatever the `licenses` field says. Check the source database's terms
before publishing one.
