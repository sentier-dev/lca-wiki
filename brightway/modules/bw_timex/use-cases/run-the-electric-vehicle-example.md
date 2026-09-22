---
title: Run the electric vehicle example
type: use-case
summary: Build bw_timex's bundled electric vehicle product system, date its databases and compare a static score with a time-explicit one.
audience: [P1]
updated: 2026-09-22
sources: [bw-timex-docs, bw-timex-repo, pypi-bw-timex, ecoinvent-licences]
verified: no
related: [../commands.md, ../classes.md, ../gotchas.md, ../../bw_temporalis/use-cases/run-a-temporal-lca-on-a-toy-system.md]
---

# Run the electric vehicle example

**Persona:** P1 practitioner assessing something built now and used for fifteen years,
where the background changes underneath it · **GICS sector:** Consumer Discretionary
(automobiles), or any long-lived product

## Goal

The example bw_timex ships to demonstrate its point: an electric vehicle assembled once
and driven for fifteen years, scored against a static background and against a
time-explicit one, so the difference the grid's decarbonisation makes is visible.

## Prerequisites

- **An ecoinvent background database in the project.** This is why the page is
  `verified: no`. `create_electric_vehicle_example` requires
  `background_database_name` and then looks up four specific ecoinvent market activities
  in it by name: the electric car without its battery, the lithium-ion battery, the
  global low-voltage electricity market, and the used battery treatment market. Read
  from the installed `bw_timex` 1.4.0 source on 2026-09-22. No ecoinvent licence was
  available (source: ecoinvent-licences).
- Ideally two or more dated background databases, one per vintage, so there is something
  to interpolate between. Building vintages is `premise`'s job, not bw_timex's.
- `bw_timex` 1.4.0 in its **own environment**. It depends on Brightway 2.5 and cannot
  share an environment with Brightway 2, including one holding the stable Activity
  Browser (source: bw-timex-docs).
- On x64 Linux or Windows, `pypardiso` as well: the conda build is noarch and cannot
  pull it in (source: bw-timex-docs). See
  [../../pypardiso/use-cases/solve-with-pardiso-in-bw2calc.md](../../pypardiso/use-cases/solve-with-pardiso-in-bw2calc.md).

## Steps

1. Open a project that already holds a dated ecoinvent background.

   ```python
   import bw2data as bd

   bd.projects.set_current("<project with an ecoinvent background>")
   sorted(bd.databases)
   ```

2. Build the foreground. The function registers a database with two nodes, an assembly
   and a driving activity, and wires them to the four background markets with temporal
   distributions attached.

   ```python
   from bw_timex import create_electric_vehicle_example

   create_electric_vehicle_example(
       background_database_name="<your ecoinvent database>",
       foreground_database_name="foreground",
       overwrite_existing=True,
   )
   ```

3. Date every database the traversal will reach. A database that is neither in
   `database_dates` nor carries the metadata raises `UnmappedDatabaseError`.

   ```python
   import datetime

   database_dates = {
       "<ecoinvent 2020 vintage>": datetime.datetime(2020, 1, 1),
       "<ecoinvent 2030 vintage>": datetime.datetime(2030, 1, 1),
       "foreground": "dynamic",
   }
   ```

4. Build the calculation on the driving activity.

   ```python
   from bw_timex import TimexLCA

   driving = bd.get_node(database="foreground", name="driving an electric vehicle")
   tlca = TimexLCA(
       demand={driving: 1},
       method=("<an impact category>",),
       database_dates=database_dates,
   )
   ```

5. Build the timeline, then look at which background databases it decided to use.

   ```python
   tlca.build_timeline()
   tlca.databases_used_by_timeline()
   ```

6. Score it three ways and report which is which.

   ```python
   tlca.lci()
   tlca.static_lcia()
   tlca.static_score
   tlca.base_score
   tlca.dynamic_lcia()
   tlca.dynamic_score
   ```

## Expected output

Described from the documentation and the installed source, not from a run:

- The foreground database has two nodes: `assembly of an electric vehicle`, in units,
  with `electric vehicle` as its reference product, and
  `driving an electric vehicle`, whose unit is passenger kilometres over the vehicle's
  lifetime.
- The constants the example builds from are in its source: a fifteen year lifetime,
  100 000 km driven, 0.2 kWh per km, 840 kg of car without the battery and 280 kg of
  battery.
- `build_timeline` returns a dataframe with one row per dated edge, carrying the
  producer, the consumer, the date and the interpolation weights across the background
  vintages.
- `base_score` is the ordinary Brightway score with no time explicitness;
  `static_score` applies the same characterisation factors to the time-explicit
  inventory; `dynamic_score` applies characterisation **functions** over a time horizon
  and defaults to radiative forcing over 100 years. These are three different
  quantities, not three ways of writing one.
- With a decarbonising electricity vintage in the background, the time-explicit score
  for driving is expected below the static one, because most of the electricity is
  consumed years after the vehicle is built. Do not take that direction as given: it is
  what the example is meant to show, and the size of the difference is entirely the
  background's.

## Pitfalls

- **Every database the traversal reaches must be dated.** Dating a project once with
  `set_database_metadata` is less fragile than passing the map on every call. See
  [../gotchas.md](../gotchas.md).
- **Interpolation happens between vintages, silently,** linearly by default. The result
  is not "the nearest database"; check `databases_used_by_timeline()` when a number
  surprises you.
- **`temporal_grouping` defaults to the year,** so anything finer disappears.
- **Static and dynamic scores are different quantities.** Comparing them directly is a
  common error.
- **Caches survive between runs.** After changing a database in place, call
  `clear_background_lci_cache`, or you compare a new model against an old solution.
- **`traverse_background` is off by default.** Usually what you want, occasionally not.
- **The `premise` extra downgrades numpy** below 2 and drags scipy back with it. Use a
  separate environment on Python 3.11 or 3.12; projects are shared between environments,
  so building vintages in one and calculating in the other costs nothing
  (source: bw-timex-docs).
- **Releases come fast.** Four went out between 2026-08-14 and 2026-09-18; pin the
  version in anything reproducible (source: pypi-bw-timex).

## Related vocabulary

- [Background](../../../../vocabulary.md#background)
- [Foreground](../../../../vocabulary.md#foreground)
- [Database](../../../../vocabulary.md#database)
- [System boundary](../../../../vocabulary.md#system-boundary)
- [Functional unit](../../../../vocabulary.md#functional-unit)
- [Assumption scenario](../../../../vocabulary.md#assumption-scenario)
- [Impact category](../../../../vocabulary.md#impact-category)
- [LCIA results](../../../../vocabulary.md#lcia-results)
- [Market activity](../../../../vocabulary.md#market-activity)

## Verification

`verified: no`. `bw_timex` 1.4.0 was installed in a throwaway `uv` environment on
2026-09-22 and `create_electric_vehicle_example` was called: it raised
`TypeError: create_electric_vehicle_example() missing 1 required positional argument:
'background_database_name'`, and reading its source showed it then resolves four named
ecoinvent market activities in that background. Without an ecoinvent licence there is no
such background, so the example cannot run, and this wiki does not obtain one.

What was checked: the package imports on Python 3.11, `create_electric_vehicle_example`
and `TimexLCA` exist with the signatures used above, and the example's constants are as
listed. A verifier needs an ecoinvent licence and at least two dated background
vintages; the three scores and `databases_used_by_timeline()` are the outputs worth
recording.
