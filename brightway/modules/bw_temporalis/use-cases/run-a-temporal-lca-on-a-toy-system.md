---
title: Run a temporal LCA on a toy system
type: use-case
summary: Attach temporal distributions to the edges of a two-process system, traverse it with TemporalisLCA, and read the emissions timeline year by year.
audience: [P1]
updated: 2026-09-22
sources: [bw-temporalis-repo, pypi-bw-temporalis, pypi-bw-graph-tools]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with bw2data 4.7, bw2calc 2.5.0, bw2io 0.9.17 and bw_temporalis 1.2.0, BRIGHTWAY2_DIR set to a temporary directory, Linux x86-64
related: [../commands.md, ../classes.md, ../gotchas.md, ../../bw_timex/use-cases/run-the-electric-vehicle-example.md]
---

# Run a temporal LCA on a toy system

**Persona:** P1 practitioner whose emissions are not all at once: biogenic carbon,
landfill, a long use phase · **GICS sector:** any; the example is Materials (wood
products)

## Goal

The same inventory, spread over time. A static LCA says one kilogram of plank causes
1.012 kg of CO2; a temporal one says when, which is what a time-dependent
characterisation needs.

## Prerequisites

- `bw2data` 4.7, `bw2calc` 2.5.0 and `bw_temporalis` 1.2.0. No licence, no network
  access.
- Python 3.11 works. The README's warning that 3.11 is broken is stale:
  `bw_graph_tools` 0.10 no longer depends on `scikit-network`
  (source: bw-temporalis-repo, pypi-bw-graph-tools).

## Steps

1. Build a two-process system. Logs are cut over the three years before the plank is
   made; the plank's carbon is released over the twenty years after.

   ```python
   import bw2data as bd
   from bw_temporalis import easy_timedelta_distribution

   bd.projects.set_current("toy-temporal")

   bd.Database("toy-biosphere").write({
       ("toy-biosphere", "co2"): {
           "name": "Carbon dioxide, fossil", "categories": ("air",),
           "unit": "kilogram", "type": "emission",
       },
   })

   bd.Database("toy-forest").write({
       ("toy-forest", "plank"): {
           "name": "plank production", "unit": "kilogram", "location": "CH",
           "exchanges": [
               {"input": ("toy-forest", "plank"), "amount": 1.0, "type": "production"},
               {"input": ("toy-forest", "log"), "amount": 1.4, "type": "technosphere",
                "temporal_distribution": easy_timedelta_distribution(
                    start=-3, end=0, resolution="Y", steps=4)},
               {"input": ("toy-biosphere", "co2"), "amount": 0.9, "type": "biosphere",
                "temporal_distribution": easy_timedelta_distribution(
                    start=0, end=20, resolution="Y", steps=5)},
           ],
       },
       ("toy-forest", "log"): {
           "name": "log production", "unit": "kilogram", "location": "CH",
           "exchanges": [
               {"input": ("toy-forest", "log"), "amount": 1.0, "type": "production"},
               {"input": ("toy-biosphere", "co2"), "amount": 0.08, "type": "biosphere"},
           ],
       },
   })
   ```

2. Write an impact category and solve the static calculation first. The temporal layer
   reads a solved `LCA`.

   ```python
   import bw2calc as bc

   m = bd.Method(("toy method", "climate change", "GWP100"))
   m.write([(("toy-biosphere", "co2"), 1.0)])

   plank = bd.get_node(database="toy-forest", name="plank production")
   fu, objs, _ = bd.prepare_lca_inputs(
       {plank: 1}, method=("toy method", "climate change", "GWP100")
   )
   lca = bc.LCA(demand=fu, data_objs=objs)
   lca.lci()
   lca.lcia()
   lca.score
   ```

3. Traverse it in time. `starting_datetime` is when the functional unit happens;
   everything relative is placed around it.

   ```python
   from bw_temporalis import TemporalisLCA

   tlca = TemporalisLCA(lca, starting_datetime="2026-01-01", cutoff=0.001)
   timeline = tlca.build_timeline()
   ```

4. Read the timeline as a dataframe.

   ```python
   df = timeline.build_dataframe()
   len(df), list(df.columns)
   df["amount"].sum()
   df.groupby(df["date"].dt.year)["amount"].sum()
   ```

## Expected output

- The static score is `1.012` kg CO2-eq: 0.9 direct from the plank plus 1.4 kg of log at
  0.08.
- `easy_timedelta_distribution(start=0, end=20, resolution="Y", steps=5)` produces five
  equal shares of 0.2, at offsets of 0, 5, 10, 15 and 20 years, stored as
  `timedelta64` seconds.
- The traversal prints `Starting graph traversal` and `Calculation count: 1`.
- The dataframe has 9 rows and four columns: `date`, `amount`, `flow`, `activity`. The
  flow and activity columns hold integer ids, not names.
- Five rows of 0.18 carry the plank's own emission, 0.9 split five ways and spread
  forwards over twenty years: 2026-01-01, 2031-01-01, 2036-01-01, 2040-12-31 and
  2045-12-31.
- Four rows of 0.028 carry the log's emission, 1.4 times 0.08 split four ways and spread
  **backwards**, because the log's edge carries a negative offset: 2023-01-01,
  2024-01-01, 2024-12-31 and 2026-01-01.
- The amounts sum to `1.012`, exactly the static score. A temporal LCA redistributes an
  inventory; it does not change it.
- Dates drift off the first of January by hours and then by a day, because a year is
  stored as a fixed number of seconds rather than as a calendar year. Grouping by
  calendar year therefore lands the fifteen and twenty year offsets in 2040 and 2045,
  not 2041 and 2046. Do not read that drift as a modelling result.

## Pitfalls

- **A distribution must sum to its exchange amount** or the shares are relative; run
  `check_database_exchanges` before calculating rather than debugging a strange timeline
  afterwards. It raises `IncongruentDistribution`. See [../gotchas.md](../gotchas.md).
- **Relative and absolute distributions are different things.** A `timedelta64` date
  array means "relative to the consuming process"; a `datetime64` array means an
  absolute moment. Mixing them moves an entire branch.
- **The cutoffs are tight by default:** `cutoff` 0.0005, `biosphere_cutoff` 1e-06,
  `max_calc` 2000. A result is only as complete as those allow.
- **Traversing the background is slow and usually pointless,** because background edges
  carry no distributions. `static_activity_indices` exists to freeze it.
- **The net amount is what gets distributed** where several edges with different signs
  connect the same two nodes, and the individual timings are lost. Split such edges
  across processes (source: bw-temporalis-repo).
- **`__version__` is a tuple,** `(1, 2, 0)`.
- **This is one layer, not the whole story.** bw_temporalis dates flows inside the
  databases you already have. Choosing a different background per date is
  [../../bw_timex/use-cases/run-the-electric-vehicle-example.md](../../bw_timex/use-cases/run-the-electric-vehicle-example.md).

## Related vocabulary

- [Exchange](../../../../vocabulary.md#exchange)
- [Edge](../../../../vocabulary.md#edge)
- [Inventory](../../../../vocabulary.md#inventory)
- [Elementary flow](../../../../vocabulary.md#elementary-flow)
- [Direct emissions](../../../../vocabulary.md#direct-emissions)
- [Functional unit](../../../../vocabulary.md#functional-unit)
- [Foreground](../../../../vocabulary.md#foreground)
- [Background](../../../../vocabulary.md#background)
- [Cut-off](../../../../vocabulary.md#cut-off)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`bw2data` 4.7, `bw2calc` 2.5.0, `bw2io` 0.9.17, `bw_temporalis` 1.2.0,
`BRIGHTWAY2_DIR` pointed at a fresh temporary directory, Linux x86-64. The static score
was `1.0119999717473984`; the timeline had 9 rows summing to the same number; the yearly
totals were 0.028 in 2023, 0.056 in 2024, 0.208 in 2026, and 0.180 in each of 2031,
2036, 2040 and 2045. Duration, including building the toy project: about 4 seconds.
