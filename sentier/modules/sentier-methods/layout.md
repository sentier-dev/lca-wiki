---
title: sentier-methods layout
type: module-page
summary: "The repository tree: three datasource folders, five schema files, one validator."
audience: [P2, P3]
updated: 2026-09-21
sources: [sentier-methods-repo]
---

# sentier-methods layout

The whole repository, as of commit `8d0f504` dated 2026-09-17.
(source: sentier-methods-repo)

```
data/                           the methods, one folder per datasource
  README.md                     the folder convention and the rank rule
  01-ef-3.1/                    Environmental Footprint 3.1, populated
    methods.parquet             one row per (method, impact category)
    characterization-factors.parquet   one row per characterisation factor
    metadata.json               datasource provenance and row counts
  02-ipcc-2021/                 scaffold: metadata.json only
  03-recipe-2016/               scaffold: metadata.json only
schema/                         the data contract the importers validate against
  README.md                     how the plain-YAML column definitions work
  common.yaml                   shared notes and the column type list
  method.yaml                   the columns of methods.parquet, primary key method_id
  characterization-factor.yaml  the columns of characterization-factors.parquet
  normalization-weighting.yaml  the optional normalisation and weighting table
  metadata.schema.json          JSON Schema for a datasource's metadata.json
scripts/validate.py             the CI validator, self-contained
.github/workflows/ci.yml        runs the validator on every pull request
LICENSE                         MIT
README.md                       what the repository is, how to read and validate it
```

A populated datasource folder holds up to four files:

```
data/<NN>-<datasource>/
  methods.parquet                    the parent table
  characterization-factors.parquet   joined on method_id
  normalization-weighting.parquet    optional, joined on method_id
  metadata.json                      datasource, title, publisher, version, licence,
                                     source URL, rank, schema version, row counts
```

## Key files

- `schema/method.yaml` and `schema/characterization-factor.yaml` are the contract the
  importers cast and validate against before they open a delivery pull request.
- `data/<NN>-<datasource>/metadata.json` carries the publisher, the version, the licence
  string and the source URL. It is the provenance record for the whole folder, and a new
  datasource is added by writing this file first: it validates on its own, with no
  parquet present.
- `scripts/validate.py` depends only on jsonschema, pyyaml and pyarrow and imports
  nothing from the repository.

## Naming

`data/<NN>-<datasource>/`, where the datasource identifier is lower-kebab and carries
its version, such as `ef-3.1`, and `<NN>` sets resolution precedence: lower wins when
records overlap. The rank prefix is not part of the datasource identifier stored in the
`datasource` column or in a method identifier.
