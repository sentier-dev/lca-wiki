# API reference: flowmapper 0.4

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `flowmapper` 0.4. Generated files: do not edit them by hand; each
one carries the command that produced it and regenerating overwrites it.

The package source is the `flowmapper` 0.4 distribution from PyPI, installed without
dependencies into a throwaway environment; pydoc-markdown reads the source statically,
so nothing here required importing the package.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'flowmapper==0.4'
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
  -I "$SP" -m flowmapper cfg.yml > flowmapper.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `flowmapper` and stay under
that package's own licence: not stated by the distribution (unknown). This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [flowmapper](flowmapper.md) — 1 KB
- [flowmapper.cas](flowmapper.cas.md) — 2 KB
- [flowmapper.cli](flowmapper.cli.md) — 3 KB
- [flowmapper.constants](flowmapper.constants.md) — 1 KB
- [flowmapper.context](flowmapper.context.md) — 2 KB
- [flowmapper.errors](flowmapper.errors.md) — 1 KB
- [flowmapper.extraction](flowmapper.extraction.md) — 1 KB
- [flowmapper.extraction.ecospold2](flowmapper.extraction.ecospold2.md) — 1 KB
- [flowmapper.extraction.simapro_csv](flowmapper.extraction.simapro_csv.md) — 1 KB
- [flowmapper.extraction.simapro_ecospold1](flowmapper.extraction.simapro_ecospold1.md) — 1 KB
- [flowmapper.flow](flowmapper.flow.md) — 2 KB
- [flowmapper.flowmap](flowmapper.flowmap.md) — 7 KB
- [flowmapper.main](flowmapper.main.md) — 2 KB
- [flowmapper.match](flowmapper.match.md) — 5 KB
- [flowmapper.string_field](flowmapper.string_field.md) — 1 KB
- [flowmapper.string_list](flowmapper.string_list.md) — 1 KB
- [flowmapper.transformation_mapping](flowmapper.transformation_mapping.md) — 2 KB
- [flowmapper.unit](flowmapper.unit.md) — 2 KB
- [flowmapper.utils](flowmapper.utils.md) — 3 KB

Total: 19 files, 47 KB.
