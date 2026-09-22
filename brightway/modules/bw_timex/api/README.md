# API reference: bw_timex 1.4.0

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `bw_timex` 1.4.0. Generated files: do not edit them by hand; each
one carries the command that produced it and regenerating overwrites it.

The package source is the `bw_timex` 1.4.0 distribution from PyPI, installed without
dependencies into a throwaway environment; pydoc-markdown reads the source statically,
so nothing here required importing the package.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_timex==1.4.0'
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
  -I "$SP" -m bw_timex cfg.yml > bw_timex.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `bw_timex` and stay under
that package's own licence: BSD 3-Clause. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [bw_timex](bw_timex.md) — 1 KB
- [bw_timex.background_solver](bw_timex.background_solver.md) — 11 KB
- [bw_timex.block_structure](bw_timex.block_structure.md) — 3 KB
- [bw_timex.database_metadata](bw_timex.database_metadata.md) — 7 KB
- [bw_timex.dynamic_biosphere_builder](bw_timex.dynamic_biosphere_builder.md) — 11 KB
- [bw_timex.edge_extractor](bw_timex.edge_extractor.md) — 11 KB
- [bw_timex.errors](bw_timex.errors.md) — 1 KB
- [bw_timex.helper_classes](bw_timex.helper_classes.md) — 5 KB
- [bw_timex.matrix_modifier](bw_timex.matrix_modifier.md) — 6 KB
- [bw_timex.scenario_builder](bw_timex.scenario_builder.md) — 3 KB
- [bw_timex.solvers](bw_timex.solvers.md) — 11 KB
- [bw_timex.timeline_builder](bw_timex.timeline_builder.md) — 10 KB
- [bw_timex.timex_lca](bw_timex.timex_lca.md) — 49 KB
- [bw_timex.utils](bw_timex.utils.md) — 13 KB
- [bw_timex.validation](bw_timex.validation.md) — 10 KB

Total: 15 files, 160 KB.
