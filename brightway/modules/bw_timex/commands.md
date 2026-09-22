---
title: bw_timex commands
type: module-page
summary: bw_timex has no command line; a time-explicit LCA runs from a notebook.
audience: [P1]
updated: 2026-09-21
sources: [pypi-bw-timex, bw-timex-docs]
---

# bw_timex commands

bw_timex 1.4.0 installs **no console script**. The wheel published on PyPI contains no
`entry_points.txt`, checked by reading the wheel's metadata directly
(source: pypi-bw-timex). The documentation is written around notebooks throughout
(source: bw-timex-docs).

| Command | What it does | Key options |
|---|---|---|
| none | bw_timex is a library, used interactively | not applicable |

## Shell commands you will actually run

These are installation commands from the documentation, not entry points of the package
(source: bw-timex-docs).

| Command | What it does |
|---|---|
| `uv add bw_timex` | add bw_timex to a uv project |
| `uv pip install bw_timex` | install into an activated environment |
| `pip install bw_timex` | the pip equivalent |
| `pip install "bw_timex[solvers]"` | add the macOS solver stack |
| `pip install "bw_timex[premise]"` | add prospective database building, in its own environment |
| `conda create -n timex -c conda-forge -c cmutel -c diepers bw_timex pypardiso` | the conda route, naming pypardiso explicitly because the conda package is noarch |

## Notebook entry points

### The four steps

```python
from bw_timex import TimexLCA

lca = TimexLCA(demand={product: 1}, method=method, database_dates=database_dates)
lca.build_timeline()
lca.lci()
lca.static_lcia()
lca.static_score
```

For a dynamic result instead of a static one:

```python
lca.dynamic_lcia(metric="radiative_forcing", time_horizon=100)
lca.dynamic_score
```

### The same run in one call

```python
from bw_timex import TimexLCA, TimexLCASettings

settings = TimexLCASettings(demand={product: 1}, method=method, database_dates=database_dates)
lca = TimexLCA.from_settings(settings)
lca.run()
```

### Comparing configurations

```python
result = TimexLCA.compare([settings_a, settings_b])
result.summary
```

### Adding temporal information

```python
from bw_timex import add_temporal_distribution_to_exchange, easy_timedelta_distribution

td = easy_timedelta_distribution(start=-4, end=0, resolution="Y", steps=5)
add_temporal_distribution_to_exchange(td, input_node=battery, output_node=car)
```

### Dating the background databases

```python
from bw_timex import set_database_metadata

set_database_metadata("ecoinvent-3.11-cutoff-2030", represents=...)
```

or by passing `database_dates={"db-2020": datetime(2020, 1, 1), ...}` to `TimexLCA`.

### Building the missing vintages

```python
from bw_timex import ensure_scenario_databases

database_dates = ensure_scenario_databases(scenario)
```

This needs premise, its decryption key and ecoinvent credentials, read from the
environment when not passed. The documentation names the variables; their values are
yours and are not recorded here (source: bw-timex-docs).

### Looking at the result

```python
lca.timeline_summary()
lca.databases_used_by_timeline()
lca.create_labelled_dynamic_inventory_dataframe()
lca.plot_dynamic_characterized_inventory()
```

### Starting from the bundled example

```python
from bw_timex import create_electric_vehicle_example

create_electric_vehicle_example(background_database_name="ecoinvent-...", foreground_database_name="foreground")
```

See [datasets.md](datasets.md).
