# API reference: bw2calc 2.5.0

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `bw2calc` 2.5.0. Generated files: do not edit them by hand; each one
carries the command that produced it and regenerating overwrites it.

The package source is the `bw2calc` 2.5.0 distribution from PyPI, installed without
dependencies into a throwaway environment; pydoc-markdown reads the source statically,
so nothing here required importing the package.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2calc==2.5.0'
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
  -I "$SP" -m bw2calc cfg.yml > bw2calc.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `bw2calc` and stay under
that package's own licence: BSD 3-Clause. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [bw2calc](bw2calc.md) — 1 KB
- [bw2calc.caching_lca](bw2calc.caching_lca.md) — 1 KB
- [bw2calc.dense_lca](bw2calc.dense_lca.md) — 1 KB
- [bw2calc.dictionary_manager](bw2calc.dictionary_manager.md) — 4 KB
- [bw2calc.errors](bw2calc.errors.md) — 4 KB
- [bw2calc.fast_scores](bw2calc.fast_scores.md) — 2 KB
- [bw2calc.fast_supply_arrays](bw2calc.fast_supply_arrays.md) — 2 KB
- [bw2calc.grid](bw2calc.grid.md) — 1 KB
- [bw2calc.iterative_lca](bw2calc.iterative_lca.md) — 1 KB
- [bw2calc.jacobi_gmres_lca](bw2calc.jacobi_gmres_lca.md) — 2 KB
- [bw2calc.lca](bw2calc.lca.md) — 10 KB
- [bw2calc.lca_base](bw2calc.lca_base.md) — 7 KB
- [bw2calc.least_squares](bw2calc.least_squares.md) — 2 KB
- [bw2calc.log_utils](bw2calc.log_utils.md) — 2 KB
- [bw2calc.method_config](bw2calc.method_config.md) — 5 KB
- [bw2calc.multi_lca](bw2calc.multi_lca.md) — 7 KB
- [bw2calc.partitioned_lca](bw2calc.partitioned_lca.md) — 5 KB
- [bw2calc.restricted_sparse_matrix_dict](bw2calc.restricted_sparse_matrix_dict.md) — 2 KB
- [bw2calc.result_cache](bw2calc.result_cache.md) — 2 KB
- [bw2calc.single_value_diagonal_matrix](bw2calc.single_value_diagonal_matrix.md) — 3 KB
- [bw2calc.utils](bw2calc.utils.md) — 1 KB

Total: 21 files, 76 KB.
