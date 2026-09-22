---
title: sentier-mappings commands
type: module-page
summary: The validator, its test suite, and what continuous integration runs.
audience: [P1]
updated: 2026-09-21
sources: [sentier-mappings-repo]
---

# sentier-mappings commands

There is no command line interface and no package. Two commands matter, both from the
repository README and its workflow file, checked on 2026-09-21 against a clone at commit
`4a25ec3`. Run them from the repository root. (source: sentier-mappings-repo)

| Command | What it does | Key options |
|---|---|---|
| `uv run --with-requirements scripts/requirements.txt python scripts/validate.py` | validate every pair folder against the package profile and the metadata schema; exits non-zero listing every error | none on the command line; the module entry point accepts a data directory when called from Python |
| `uv run --with-requirements scripts/requirements.txt pytest -q tests` | run the validator's own test suite, more than twenty cases built on temporary directories | standard pytest flags |

`scripts/validate.py --help` is not available: the script has no argument parser, so
there are no flags to verify. Its docstring is the specification, and its `main` takes a
data directory argument that defaults to `data/`, which is what the test suite uses to
validate a synthetic tree. Continuous integration installs
`scripts/requirements.txt` and runs both commands on every pull request to the default
branch and on every push to another branch. (source: sentier-mappings-repo)

## Reading a package

```bash
uv run python -c "import json; d = json.load(open('data/bafu-2026-v1__ef-3.1/biosphere-1-curated.json')); print(d['name'], d['version'], len(d['replace']))"
```

## Reading a pair's identity

```bash
cat data/bafu-2026-v1__ef-3.1/metadata.json
```

The packages list is the authoritative order. Apply the files in that order.

## Applying a package

Applying is done by
[randonneur](https://github.com/brightway-lca/randonneur), the format these files
follow, or by the loader in [../sentier-brightway/](../sentier-brightway/), which reads
a pinned commit of this repository and applies the packages of a pair in order. There is
no apply command here, on purpose.

## Notebook entry points

None beyond reading the JSON. A pair folder is small enough to load whole in a notebook,
apart from the largest package, which is about nine megabytes.
