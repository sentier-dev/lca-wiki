---
title: bw_temporalis classes and functions
type: module-page
summary: The public surface of bw_temporalis 1.2.0, from a distribution to a timeline.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-bw-temporalis, bw-temporalis-repo]
---

# bw_temporalis classes and functions

Hand-written companion to the generated `api/` folder. Names, signatures and docstring
first lines were read by importing bw_temporalis 1.2.0 from PyPI and inspecting
`__all__` (source: pypi-bw-temporalis); the usage notes follow the repository README
(source: bw-temporalis-repo).

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `TemporalDistribution` | class | A series of amounts spread over time | `TemporalDistribution(date, amount)` |
| `FixedTD` | class | An absolute distribution that ignores the timing it inherits | `FixedTD(date, amount)` |
| `FixedTimeOfYearTD` | class | An absolute period in the first available year, rather than a relative shift | `FixedTimeOfYearTD(date, amount, allow_overlap=False)` |
| `TDAware` | class | Base class for callables that can be multiplied by a distribution | subclassed |
| `easy_timedelta_distribution` | function | Build a relative distribution from a few parameters | `easy_timedelta_distribution(start, end, resolution, steps, kind)` |
| `easy_datetime_distribution` | function | The same, with absolute dates | `easy_datetime_distribution(start, end, steps, kind)` |
| `TemporalisLCA` | class | Graph traversal that convolves distributions along each path | `TemporalisLCA(lca_object)` |
| `Timeline` | class | Sums and groups the dated flows | returned by `TemporalisLCA.build_timeline()` |
| `check_database_exchanges` | function | Verify each distribution sums to its exchange amount | `check_database_exchanges("my-database")` |
| `IncongruentDistribution` | exception | Raised when it does not | caught around the check |
| `loader_registry` | dict | Maps a serialised type name back to its loader | used when reading distributions from a database |

## TemporalDistribution

```python
TemporalDistribution(
    date: numpy.ndarray,   # datetime64 for absolute timing, timedelta64 for relative
    amount: numpy.ndarray, # the same length as date
)
```

Two flavours, distinguished by the dtype of `date`:

- **timedelta64** means relative: "this input happens two years before the process that
  consumes it". This is what you attach to a foreground exchange.
- **datetime64** means absolute: "this happens in March 2030", regardless of what
  consumes it.

`FixedTD` is the absolute case made explicit: it ignores the temporal information it
would otherwise inherit from the path. `FixedTimeOfYearTD` takes a timedelta and pins
it to a period within the first available year, with an `allow_overlap` switch.

## The easy constructors

```python
easy_timedelta_distribution(start: int, end: int, resolution: str, steps: int = 50,
                            kind: str = "uniform", param: float | None = None)

easy_datetime_distribution(start: str, end: str, steps: int = 50,
                           kind: str = "uniform", param: float | None = None)
```

`kind` selects the shape: uniform, triangular or normal, with `param` giving the mode
or the standard deviation where the shape needs one. `resolution` is the time unit of
`start` and `end` in the timedelta case.

## TemporalisLCA

```python
TemporalisLCA(
    lca_object: bw2calc.LCA,
    starting_datetime: datetime | str = "now",
    cutoff: float | None = 0.0005,
    biosphere_cutoff: float | None = 1e-06,
    max_calc: int | None = 2000,
    static_activity_indices: set[int] | None = None,
    skip_coproducts: bool | None = False,
    functional_unit_unique_id: int | None = -1,
    graph_traversal = NewNodeEachVisitGraphTraversal,
)
```

`static_activity_indices` is the escape hatch for the background: activities listed
there are treated as happening at a single time, which keeps the traversal tractable.

The usual call sequence is to solve an `LCA`, wrap it, build the timeline, and
characterise:

```python
tlca = TemporalisLCA(lca)
timeline = tlca.build_timeline()
df = timeline.build_dataframe()
```

## Timeline

`Timeline(data: list[FlowTD] | None = None)` holds the dated characterised flows and
groups them. A `FlowTD` is one flow, one activity and one distribution; the timeline
sums them into the resolution you ask for.

## Characterisation

`bw_temporalis.lcia.climate` ships two functions:

```python
characterize_co2(series, period: int = 100, cumulative: bool = False) -> pandas.DataFrame
characterize_methane(series, period: int = 100, cumulative: bool = False) -> pandas.DataFrame
```

Both return the marginal or cumulative radiative forcing for each year of the period.
They are functions of time, which is the difference from a characterisation factor, and
they are why a dynamic result cannot simply be compared with a static one.

## Notes

- `check_database_exchanges(label)` walks a database and raises
  `IncongruentDistribution` where the sum of a distribution's amounts is not close to
  the exchange amount it is attached to. Run it before trusting a temporal model.
- `loader_registry` is how a distribution survives a round trip through a Brightway
  database: the serialised form names its type, and the registry maps that name to the
  `from_json` method that rebuilds it.
