# API reference: sentier-brightway 0.1.0

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `sentier-brightway` 0.1.0. Generated files: do not edit them by
hand; each one carries the command that produced it and regenerating overwrites it.

The package source is a clone of `https://github.com/sentier-dev/sentier-brightway` at
commit `a9dba75`, the commit the module page documents. pydoc-markdown reads the source
statically, so no install and none of the package's dependencies were needed.

The run itself used a clone already on the generating machine, at that same commit, and
the command above names a fresh clone instead so that no path outside this repository
appears in a generated file.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-brightway repo && git -C repo checkout a9dba75
SP=repo/src
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
  -I "$SP" -m sentier_brightway cfg.yml > sentier_brightway.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `sentier-brightway` and stay under
that package's own licence: MIT for the code. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [sentier_brightway](sentier_brightway.md) — 3 KB
- [sentier_brightway.backtest](sentier_brightway.backtest.md) — 3 KB
- [sentier_brightway.backtest.boxes](sentier_brightway.backtest.boxes.md) — 2 KB
- [sentier_brightway.backtest.categories](sentier_brightway.backtest.categories.md) — 3 KB
- [sentier_brightway.backtest.compare](sentier_brightway.backtest.compare.md) — 7 KB
- [sentier_brightway.backtest.emit](sentier_brightway.backtest.emit.md) — 5 KB
- [sentier_brightway.backtest.reference](sentier_brightway.backtest.reference.md) — 2 KB
- [sentier_brightway.backtest.scorer](sentier_brightway.backtest.scorer.md) — 4 KB
- [sentier_brightway.bridge](sentier_brightway.bridge.md) — 2 KB
- [sentier_brightway.build](sentier_brightway.build.md) — 3 KB
- [sentier_brightway.cli](sentier_brightway.cli.md) — 1 KB
- [sentier_brightway.constants](sentier_brightway.constants.md) — 2 KB
- [sentier_brightway.datapackage](sentier_brightway.datapackage.md) — 4 KB
- [sentier_brightway.fetch](sentier_brightway.fetch.md) — 3 KB
- [sentier_brightway.files](sentier_brightway.files.md) — 2 KB
- [sentier_brightway.flows](sentier_brightway.flows.md) — 1 KB
- [sentier_brightway.inventory](sentier_brightway.inventory.md) — 2 KB
- [sentier_brightway.methods](sentier_brightway.methods.md) — 2 KB
- [sentier_brightway.registry](sentier_brightway.registry.md) — 3 KB
- [sentier_brightway.report](sentier_brightway.report.md) — 2 KB
- [sentier_brightway.units](sentier_brightway.units.md) — 1 KB
- [sentier_brightway.writer](sentier_brightway.writer.md) — 2 KB

Total: 22 files, 67 KB.
