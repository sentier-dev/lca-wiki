# API reference: randonneur 0.7.2

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `randonneur` 0.7.2. Generated files: do not edit them by hand; each
one carries the command that produced it and regenerating overwrites it.

The package source is the `randonneur` 0.7.2 distribution from PyPI, installed without
dependencies into a throwaway environment; pydoc-markdown reads the source statically,
so nothing here required importing the package.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'randonneur==0.7.2'
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
  -I "$SP" -m randonneur cfg.yml > randonneur.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `randonneur` and stay under
that package's own licence: MIT. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [randonneur](randonneur.md) — 1 KB
- [randonneur.config](randonneur.config.md) — 7 KB
- [randonneur.constants](randonneur.constants.md) — 1 KB
- [randonneur.datapackage](randonneur.datapackage.md) — 2 KB
- [randonneur.edge_functions](randonneur.edge_functions.md) — 2 KB
- [randonneur.edges](randonneur.edges.md) — 2 KB
- [randonneur.errors](randonneur.errors.md) — 1 KB
- [randonneur.generic_transformation](randonneur.generic_transformation.md) — 1 KB
- [randonneur.licenses](randonneur.licenses.md) — 1 KB
- [randonneur.node_functions](randonneur.node_functions.md) — 2 KB
- [randonneur.nodes](randonneur.nodes.md) — 2 KB
- [randonneur.templates](randonneur.templates.md) — 2 KB
- [randonneur.utils](randonneur.utils.md) — 4 KB
- [randonneur.validation](randonneur.validation.md) — 2 KB

Total: 14 files, 36 KB.
