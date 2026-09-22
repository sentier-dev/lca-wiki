# API reference: matrix_utils 0.9

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `matrix_utils` 0.9. Generated files: do not edit them by hand; each
one carries the command that produced it and regenerating overwrites it.

The package source is the `matrix_utils` 0.9 distribution from PyPI, installed without
dependencies into a throwaway environment; pydoc-markdown reads the source statically,
so nothing here required importing the package.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'matrix_utils==0.9'
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
  -I "$SP" -m matrix_utils cfg.yml > matrix_utils.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `matrix_utils` and stay under
that package's own licence: BSD 3-Clause. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [matrix_utils](matrix_utils.md) — 1 KB
- [matrix_utils.aggregation](matrix_utils.aggregation.md) — 1 KB
- [matrix_utils.array_mapper](matrix_utils.array_mapper.md) — 2 KB
- [matrix_utils.errors](matrix_utils.errors.md) — 1 KB
- [matrix_utils.indexers](matrix_utils.indexers.md) — 3 KB
- [matrix_utils.mapped_matrix](matrix_utils.mapped_matrix.md) — 10 KB
- [matrix_utils.mapped_matrix_dict](matrix_utils.mapped_matrix_dict.md) — 5 KB
- [matrix_utils.resource_group](matrix_utils.resource_group.md) — 11 KB
- [matrix_utils.utils](matrix_utils.utils.md) — 2 KB

Total: 9 files, 41 KB.
