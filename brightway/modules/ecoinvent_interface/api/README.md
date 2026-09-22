# API reference: ecoinvent_interface 3.1

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `ecoinvent_interface` 3.1. Generated files: do not edit them by
hand; each one carries the command that produced it and regenerating overwrites it.

The package source is the `ecoinvent_interface` 3.1 distribution from PyPI, installed
without dependencies into a throwaway environment; pydoc-markdown reads the source
statically, so nothing here required importing the package.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'ecoinvent_interface==3.1'
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
  -I "$SP" -m ecoinvent_interface cfg.yml > ecoinvent_interface.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `ecoinvent_interface` and stay under
that package's own licence: MIT. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [ecoinvent_interface](ecoinvent_interface.md) — 1 KB
- [ecoinvent_interface.core](ecoinvent_interface.core.md) — 2 KB
- [ecoinvent_interface.mapping](ecoinvent_interface.mapping.md) — 2 KB
- [ecoinvent_interface.process_interface](ecoinvent_interface.process_interface.md) — 3 KB
- [ecoinvent_interface.release](ecoinvent_interface.release.md) — 4 KB
- [ecoinvent_interface.settings](ecoinvent_interface.settings.md) — 2 KB
- [ecoinvent_interface.spold_versions](ecoinvent_interface.spold_versions.md) — 1 KB
- [ecoinvent_interface.storage](ecoinvent_interface.storage.md) — 2 KB
- [ecoinvent_interface.string_distance](ecoinvent_interface.string_distance.md) — 1 KB

Total: 9 files, 23 KB.
