# API reference: bw_processing 1.6

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `bw_processing` 1.6. Generated files: do not edit them by hand; each
one carries the command that produced it and regenerating overwrites it.

The package source is the `bw_processing` 1.6 distribution from PyPI, installed without
dependencies into a throwaway environment; pydoc-markdown reads the source statically,
so nothing here required importing the package.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_processing==1.6'
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
  -I "$SP" -m bw_processing cfg.yml > bw_processing.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `bw_processing` and stay under
that package's own licence: BSD 3-Clause. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [bw_processing](bw_processing.md) — 1 KB
- [bw_processing.array_creation](bw_processing.array_creation.md) — 3 KB
- [bw_processing.constants](bw_processing.constants.md) — 2 KB
- [bw_processing.datapackage](bw_processing.datapackage.md) — 25 KB
- [bw_processing.errors](bw_processing.errors.md) — 3 KB
- [bw_processing.filesystem](bw_processing.filesystem.md) — 2 KB
- [bw_processing.indexing](bw_processing.indexing.md) — 3 KB
- [bw_processing.io_helpers](bw_processing.io_helpers.md) — 3 KB
- [bw_processing.io_parquet_helpers](bw_processing.io_parquet_helpers.md) — 3 KB
- [bw_processing.io_pyarrow_helpers](bw_processing.io_pyarrow_helpers.md) — 6 KB
- [bw_processing.matrix_entry](bw_processing.matrix_entry.md) — 7 KB
- [bw_processing.merging](bw_processing.merging.md) — 3 KB
- [bw_processing.param_labels](bw_processing.param_labels.md) — 3 KB
- [bw_processing.proxies](bw_processing.proxies.md) — 2 KB
- [bw_processing.unique_fields](bw_processing.unique_fields.md) — 4 KB
- [bw_processing.utils](bw_processing.utils.md) — 2 KB

Total: 16 files, 80 KB.
