# API reference: bw_temporalis 1.2.0

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `bw_temporalis` 1.2.0. Generated files: do not edit them by hand;
each one carries the command that produced it and regenerating overwrites it.

The package source is the `bw_temporalis` 1.2.0 distribution from PyPI, installed
without dependencies into a throwaway environment; pydoc-markdown reads the source
statically, so nothing here required importing the package.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_temporalis==1.2.0'
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
  -I "$SP" -m bw_temporalis cfg.yml > bw_temporalis.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `bw_temporalis` and stay under
that package's own licence: BSD 3-Clause. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [bw_temporalis](bw_temporalis.md) — 1 KB
- [bw_temporalis.convolution](bw_temporalis.convolution.md) — 2 KB
- [bw_temporalis.lca](bw_temporalis.lca.md) — 4 KB
- [bw_temporalis.lcia](bw_temporalis.lcia.md) — 1 KB
- [bw_temporalis.lcia.climate](bw_temporalis.lcia.climate.md) — 3 KB
- [bw_temporalis.temporal_distribution](bw_temporalis.temporal_distribution.md) — 7 KB
- [bw_temporalis.timeline](bw_temporalis.timeline.md) — 7 KB
- [bw_temporalis.utils](bw_temporalis.utils.md) — 5 KB

Total: 8 files, 35 KB.
