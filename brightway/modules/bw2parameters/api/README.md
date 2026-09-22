# API reference: bw2parameters 1.1.0

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `bw2parameters` 1.1.0. Generated files: do not edit them by hand;
each one carries the command that produced it and regenerating overwrites it.

The package source is the `bw2parameters` 1.1.0 distribution from PyPI, installed
without dependencies into a throwaway environment; pydoc-markdown reads the source
statically, so nothing here required importing the package.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2parameters==1.1.0'
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
  -I "$SP" -m bw2parameters cfg.yml > bw2parameters.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `bw2parameters` and stay under
that package's own licence: BSD 3-Clause. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [bw2parameters](bw2parameters.md) — 1 KB
- [bw2parameters.errors](bw2parameters.errors.md) — 2 KB
- [bw2parameters.interpreter](bw2parameters.interpreter.md) — 6 KB
- [bw2parameters.mangling](bw2parameters.mangling.md) — 3 KB
- [bw2parameters.parameter_set](bw2parameters.parameter_set.md) — 4 KB
- [bw2parameters.pint](bw2parameters.pint.md) — 2 KB
- [bw2parameters.utils](bw2parameters.utils.md) — 1 KB

Total: 7 files, 22 KB.
