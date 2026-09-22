---
title: flowmapper commands
type: module-page
summary: The flowmapper console script and its three subcommands.
audience: [P1]
updated: 2026-09-22
sources: [pypi-flowmapper, flowmapper-repo]
---

# flowmapper commands

flowmapper 0.4 installs one console script, `flowmapper`, pointing at
`flowmapper.cli:app` (source: pypi-flowmapper). The tables below were checked against
`flowmapper --help` and `flowmapper map --help` run in a throwaway environment on
2026-09-21.

| Command | What it does | Key options |
|---|---|---|
| `flowmapper --version` | print the installed version | none |
| `flowmapper map SOURCE TARGET` | match the source flow list against the target list and write the mapping and diagnostics | `--output-dir`, `--format`, `-t/--transformations`, the four `--[no-]matched/unmatched-source/target` switches |
| `flowmapper extract-simapro-csv` | read a SimaPro CSV export and write a flow list in flowmapper's shape | see its own `--help` |
| `flowmapper extract-ecospold2` | read ecospold2 files and write a flow list in flowmapper's shape | see its own `--help` |

## `flowmapper map` options

**Known defect in 0.4 (verified 2026-09-22):** `flowmapper map` exits with a `TypeError`
because the command calls the library entry point without its required arguments, and
`--format all` fails in the GLAD writer. Use the Python API (`flowmapper.flowmapper(...)`
with `OutputFormat.randonneur`) until a fixed release ships; see
[use-cases/map-two-flow-lists.md](use-cases/map-two-flow-lists.md).

| Option | Default | What it does |
|---|---|---|
| `--output-dir <path>` | `.` | where the mapping and diagnostic files are written |
| `--format <all\|glad\|randonneur>` | `all` | which mapping file formats to write |
| `--default-transformations` / `--no-default-transformations` | on | include the bundled context and unit transformations |
| `-t`, `--transformations <path>` | none | a randonneur transformation file applied to the source flows before matching; may be repeated |
| `--unmatched-source` / `--no-unmatched-source` | on | write the unmatched source flows to their own file |
| `--unmatched-target` / `--no-unmatched-target` | on | write the unmatched target flows to their own file |
| `--matched-source` / `--no-matched-source` | off | write the matched source flows to their own file |
| `--matched-target` / `--no-matched-target` | off | write the matched target flows to their own file |

`SOURCE` and `TARGET` are both required paths to flow lists.

A typical run, writing only a randonneur transformation file:

```bash
flowmapper map source-flows.json target-flows.json \
  --output-dir out/ \
  --format randonneur
```

Applying a fixup before matching:

```bash
flowmapper map source-flows.json target-flows.json \
  -t fix-source-names.json \
  --output-dir out/
```

## Notebook entry points

The same work from Python, when you want the `Flowmap` object rather than files:

```python
from flowmapper import Flow, Flowmap

source = [Flow(d) for d in source_records]
target = [Flow(d) for d in target_records]

flowmap = Flowmap(source, target)
flowmap.statistics
flowmap.unmatched_source
flowmap.to_randonneur()
```

The one-call driver, when you want the file writing too:

```python
from pathlib import Path
from flowmapper import flowmapper
from flowmapper.main import OutputFormat

flowmap = flowmapper(
    source=Path("source-flows.json"),
    target=Path("target-flows.json"),
    mapping_source=mapping_source, mapping_target=mapping_target,
    source_id="simapro-9-biosphere", target_id="ecoinvent-3.11-biosphere",
    contributors=[{"title": "Your name", "role": "wrangler"}],
    output_dir=Path("out"), format=OutputFormat.all,
)
```
