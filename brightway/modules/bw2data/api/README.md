# API reference: bw2data 4.7

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `bw2data` 4.7. Generated files: do not edit them by hand; each one
carries the command that produced it and regenerating overwrites it.

The package source is the `bw2data` 4.7 distribution from PyPI, installed without
dependencies into a throwaway environment; pydoc-markdown reads the source statically,
so nothing here required importing the package.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2data==4.7'
SP="$(pkg/bin/python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
cat > cfg.yml <<'YML'
processors:
  - type: filter
    documented_only: false
    expression: "type(obj).__name__ != 'Indirection' and default()"
  - type: smart
renderer:
  type: markdown
  render_toc: false
YML
uvx --python 3.11 --from pydoc-markdown==4.8.2 pydoc-markdown \
  -I "$SP" -m bw2data cfg.yml > bw2data.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `bw2data` and stay under
that package's own licence: BSD 3-Clause. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [bw2data](bw2data.md) — 1 KB
- [bw2data.backends](bw2data.backends.md) — 1 KB
- [bw2data.backends.base](bw2data.backends.base.md) — 17 KB
- [bw2data.backends.iotable](bw2data.backends.iotable.md) — 1 KB
- [bw2data.backends.iotable.backend](bw2data.backends.iotable.backend.md) — 3 KB
- [bw2data.backends.iotable.proxies](bw2data.backends.iotable.proxies.md) — 5 KB
- [bw2data.backends.proxies](bw2data.backends.proxies.md) — 11 KB
- [bw2data.backends.schema](bw2data.backends.schema.md) — 2 KB
- [bw2data.backends.typos](bw2data.backends.typos.md) — 1 KB
- [bw2data.backends.utils](bw2data.backends.utils.md) — 3 KB
- [bw2data.backends.wurst_extraction](bw2data.backends.wurst_extraction.md) — 3 KB
- [bw2data.compat](bw2data.compat.md) — 3 KB
- [bw2data.configuration](bw2data.configuration.md) — 5 KB
- [bw2data.data_store](bw2data.data_store.md) — 6 KB
- [bw2data.database](bw2data.database.md) — 1 KB
- [bw2data.errors](bw2data.errors.md) — 4 KB
- [bw2data.fatomic](bw2data.fatomic.md) — 2 KB
- [bw2data.filesystem](bw2data.filesystem.md) — 1 KB
- [bw2data.ia_data_store](bw2data.ia_data_store.md) — 4 KB
- [bw2data.logs](bw2data.logs.md) — 2 KB
- [bw2data.meta](bw2data.meta.md) — 5 KB
- [bw2data.method](bw2data.method.md) — 3 KB
- [bw2data.parameters](bw2data.parameters.md) — 26 KB
- [bw2data.project](bw2data.project.md) — 12 KB
- [bw2data.proxies](bw2data.proxies.md) — 5 KB
- [bw2data.query](bw2data.query.md) — 5 KB
- [bw2data.revisions](bw2data.revisions.md) — 15 KB
- [bw2data.search](bw2data.search.md) — 1 KB
- [bw2data.search.indices](bw2data.search.indices.md) — 2 KB
- [bw2data.search.schema](bw2data.search.schema.md) — 1 KB
- [bw2data.search.search](bw2data.search.search.md) — 2 KB
- [bw2data.serialization](bw2data.serialization.md) — 6 KB
- [bw2data.signals](bw2data.signals.md) — 3 KB
- [bw2data.snowflake_ids](bw2data.snowflake_ids.md) — 1 KB
- [bw2data.sqlite](bw2data.sqlite.md) — 2 KB
- [bw2data.string_distance](bw2data.string_distance.md) — 1 KB
- [bw2data.subclass_mapping](bw2data.subclass_mapping.md) — 1 KB
- [bw2data.updates](bw2data.updates.md) — 3 KB
- [bw2data.utils](bw2data.utils.md) — 6 KB
- [bw2data.validate](bw2data.validate.md) — 1 KB
- [bw2data.weighting_normalization](bw2data.weighting_normalization.md) — 2 KB

Total: 41 files, 200 KB.
