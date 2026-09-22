---
title: bw_temporalis commands
type: module-page
summary: bw_temporalis has no command line; it is used from a notebook.
audience: [P1]
updated: 2026-09-21
sources: [pypi-bw-temporalis, bw-temporalis-repo]
---

# bw_temporalis commands

bw_temporalis 1.2.0 installs **no console script**. The wheel published on PyPI
contains no `entry_points.txt`, checked by reading the wheel's metadata directly
(source: pypi-bw-temporalis).

| Command | What it does | Key options |
|---|---|---|
| none | bw_temporalis is a library, used interactively | not applicable |

## Notebook entry points

### Attaching timing to an exchange

```python
from bw_temporalis import easy_timedelta_distribution

td = easy_timedelta_distribution(start=-5, end=0, resolution="Y", steps=6, kind="uniform")
exchange["temporal_distribution"] = td
exchange.save()
```

### Checking the model before calculating

```python
from bw_temporalis import check_database_exchanges

check_database_exchanges("my-foreground")
```

This raises `IncongruentDistribution` where a distribution's amounts do not sum to the
exchange amount, which is the most common modelling error.

### Building a timeline

```python
import bw2calc as bc
from bw_temporalis import TemporalisLCA

lca = bc.LCA(demand, method)
lca.lci()
lca.lcia()

tlca = TemporalisLCA(lca, starting_datetime="2026-01-01")
timeline = tlca.build_timeline()
df = timeline.build_dataframe()
```

### Characterising over time

```python
from bw_temporalis.lcia.climate import characterize_co2, characterize_methane

forcing = characterize_co2(series, period=100, cumulative=True)
```

### Keeping the background static

```python
tlca = TemporalisLCA(lca, static_activity_indices=background_indices, max_calc=5000)
```

Without this, traversal of a large background is both slow and meaningless, since the
background usually has no temporal information to convolve.

## Learning material

The maintainers point at the `from-the-ground-up` teaching repository, whose `temporal`
directory holds worked examples (source: bw-temporalis-repo).

## What comes next

If your question is "which background vintage should this process use", that is
`bw_timex` rather than `bw_temporalis`; see
[../bw_timex/commands.md](../bw_timex/commands.md).
