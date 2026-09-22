---
title: bw_processing
type: module
summary: "The on-disk datapackage format Brightway calculations read."
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-bw-processing, bw-processing-docs, brightway-glossary, brightway-faq-versions]
related: [layout.md, classes.md, commands.md, datasets.md, gotchas.md, status.md]
---

# bw_processing

`bw_processing` defines the file format that Brightway calculations actually read: numeric
arrays, plus a metadata file that says what they are. Its README describes it as a library
for storing numeric data for use in matrix-based calculations
(source: bw-processing-docs). The glossary calls the result a datapackage: the numerical
data of a database, impact category, normalisation or weighting written as numpy arrays
and record arrays, following the Open Knowledge Foundation data package standard, with
author, licence and version included (source: brightway-glossary).

Splitting this out of the data layer is one of the two changes that define the 2.5
generation (source: brightway-faq-versions).

**Version documented:** 1.6 · **obtained from:** the PyPI JSON API for the newest release,
and `bw_processing.__version__` in a local virtual environment that has 1.6 installed ·
**as of:** 2026-09-21

## Install

```bash
pip install bw-processing==1.6
```

The distribution is `bw-processing`; the import name is `bw_processing`.

## What it does

The README lists what the format adds over plain numpy files
(source: bw-processing-docs):

- **Consistent index names.** Every array uses `row` and `col`, whatever the matrix.
- **Metadata that travels with the numbers.** Licence, version and a unique id, in a
  `datapackage.json`.
- **Vectors and arrays.** A vector gives one value per matrix cell; an array gives many,
  which is how presampled values and scenarios are stored.
- **Portability.** Reindexing metadata lets a datapackage be rebuilt against another
  machine's integer ids.
- **Dynamic sources.** Data can be generated at calculation time by an interface instead
  of read from disk.
- **`flip` and `scale` vectors.** A boolean vector for values whose sign must change, and
  a float vector of multiplicative factors such as allocation factors or unit
  conversions.
- **Parameter arrays.** Optional records of the independent variables behind each column,
  for sensitivity analysis.
- **Separate uncertainty parameters.** Loaded only when needed, so distributions are one
  option among several rather than the only one.

## Datasets

`bw_processing` ships three tiny example datapackages under `bw_processing/examples/`,
reachable as `bw_processing.examples_dir`: a directory-based `datapackage_1`, a zipped
`datapackage_2.zip` and `simple.zip` (walked in the installed 1.6 on 2026-09-21). They are
test and documentation fixtures with no LCA meaning. Nothing else is shipped, and the
package downloads nothing. See [datasets.md](datasets.md).

## Pages

- [layout.md](layout.md): the package tree, one line per module
- [classes.md](classes.md): the datapackage API
- [commands.md](commands.md): building and reading a datapackage
- [datasets.md](datasets.md): the example datapackages, and the format itself
- [gotchas.md](gotchas.md): what surprises people
- [status.md](status.md): release cadence, maintainers, open work
- [api/](api/README.md): the generated API reference, one file per submodule, stamped
  with version and date
- [use-cases/](use-cases/): end-to-end things a practitioner does with it

## API reference

[api/README.md](api/README.md) indexes a generated API reference for `bw_processing`
1.6: 16 markdown files, one per public submodule, each stamped with the package version,
the date and the command that produced it. It was produced by running pydoc-markdown
4.8.2 by hand on 2026-09-22 in a throwaway environment, and nothing in the repository
regenerates it. Signatures and docstrings live there; the names worth knowing first are
in [classes.md](classes.md).
