---
title: sentier-vocab gotchas
type: module-page
summary: "What surprises people about the vocabulary repository: the two repository spellings, the primary stems, the size guard and the regeneration rule."
audience: [P1, P3]
updated: 2026-09-21
sources: [sentier-vocab-repo]
---

# sentier-vocab gotchas

Each bullet says what happens, why, and what to do instead. All were checked against the
repository at commit `ef440c6`, 2026-09-17. (source: sentier-vocab-repo)

- **The repository is spelled two ways.** The remote is
  `github.com/sentier-dev/sentier_vocab` with an underscore, the README clones
  `sentier-vocab` with a hyphen, and the Python package is `sentier_vocab`. Both URL
  spellings reach the same repository. Use the underscore spelling when you need the
  canonical remote, and the underscore always for the import.

- **There is no release to install.** The package is not on PyPI, the version is still
  `0.0.2` and `CHANGES.md` has nothing under its unreleased heading. A wheel and a
  source distribution sit in `dist/`, but they are build artifacts of a clone. Clone the
  repository and `uv sync`.

- **Only the `core` and `water` stems write a committed file.** A source file named
  anything else writes `<category>.<stem>.ttl`, which is gitignored. Adding
  `data/products/my-import.parquet` therefore produces `products.my-import.ttl`, which
  will never appear in a pull request diff. That is deliberate, but it means the way to
  review a bulk delivery is to review the parquet, not the Turtle.

- **The elementary-flows category writes files called `flows`.** The output stem is
  renamed in the CLI, so `data/elementary-flows/water.yaml` becomes `output/flows.ttl`
  and the namespace is `.../flows/`. Searching `output/` for `elementary` finds nothing.

- **An unregistered concept scheme fails the whole source.** The generator checks the
  `scheme` a source declares against `iris.py` before it writes anything. A new category
  needs a namespace entry there first, and changing an existing one is a vocabulary
  migration, not an edit.

- **Regeneration is part of the pull request.** Continuous integration fails when
  `output/` or `docs/COVERAGE.md` does not match `data/` and `schemas/`. Run
  `sentier_vocab generate` and `sentier_vocab coverage` in the same change that touches
  the data or a schema.

- **Bulk files are capped at 3 MB.** The pre-commit hook `check-added-large-files` runs
  with `--maxkb=3000`. Shard a larger delivery with a numeric suffix. There is no
  git-LFS in this repository and no release artifacts, by policy.

- **`schemas/_generated/` is not source.** The Pydantic models there are derived from
  the LinkML schemas. Editing them changes nothing and is overwritten on the next build.

- **The importers are transitional and are not the package CLI.** They live under
  `app/sentier_vocab/importers/`, write into their own `output/` folder, and are run by
  `scripts/generate.sh`. The fetch step downloads the Combined Nomenclature archive from
  an external portal with a hand-built request, so it is the first thing to break when
  that portal changes.

- **Curated YAML is a pilot, not the corpus.** Several categories hold only a handful of
  hand-written terms, with the bulk arriving as parquet. Reading
  `data/flow-properties/core.yaml` and concluding the platform knows two flow properties
  would be wrong; read `docs/COVERAGE.md` for the real state per term type.
