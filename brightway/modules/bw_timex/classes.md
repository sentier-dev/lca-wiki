---
title: bw_timex classes and functions
type: module-page
summary: The public surface of bw_timex 1.4.0, from settings to a dynamic score.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-bw-timex, bw-timex-docs]
---

# bw_timex classes and functions

Hand-written companion to the generated `api/` folder. Names, signatures and method
lists were read by importing bw_timex 1.4.0 from PyPI and inspecting `__all__` and the
classes (source: pypi-bw-timex); the workflow follows the documentation site
(source: bw-timex-docs).

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `TimexLCA` | class | The whole time-explicit calculation | `TimexLCA(demand, method, database_dates)` |
| `TimexLCASettings` | class | Every option of one calculation, as one object | `TimexLCA.from_settings(settings)` or `lca.run(settings)` |
| `ComparisonResult` | class | What `TimexLCA.compare` returns: a summary table and the objects behind it | `result.summary` |
| `TimelineBuilder` | class | Graph traversal into a dated process timeline | used by `TimexLCA.build_timeline` |
| `MatrixModifier` | class | Adds and relinks time-explicit processes in the matrices | used by `TimexLCA.build_datapackage` |
| `DynamicBiosphereBuilder` | class | Builds the biosphere matrix indexed by flow and date | used by `TimexLCA.lci` |
| `EdgeExtractor` | class | The `bw_temporalis` traversal that yields dated edges | used by `TimelineBuilder` |
| `SetList` | class | Maps the same activity across temporal databases | internal helper, exported |
| `UnmappedDatabaseError` | exception | A database the traversal reached is missing from the mapping | raised during traversal |
| `TemporalDistribution` | class | Re-exported from `bw_temporalis`, so one import suffices | `TemporalDistribution(date, amount)` |
| `easy_datetime_distribution`, `easy_timedelta_distribution` | functions | Re-exported convenience constructors | see [../bw_temporalis/classes.md](../bw_temporalis/classes.md) |

## Helper functions

| Name | What it does |
|---|---|
| `add_temporal_distribution_to_exchange` | attach a temporal distribution to the exchange matched by the keyword arguments |
| `add_temporal_evolution_to_exchange` | attach factors or amounts describing how an exchange changes over time |
| `get_temporal_evolution_factor` | interpolate one of those factors for a given date |
| `get_exchange` | fetch a single exchange from the database by keyword arguments |
| `set_database_metadata` | record what a database represents, so bw_timex can date it |
| `ensure_scenario_databases` | build any background vintage a scenario names but the project lacks |
| `add_flows_to_characterization_functions` | register a characterisation function for one or more flows |
| `clear_background_lci_cache` | reset the module-level supply, aggregate and biosphere caches |
| `create_electric_vehicle_example` | build the bundled illustrative product system in a project |
| `interactive_td_widget` | a notebook widget for drafting temporal distributions |
| `plot_characterized_inventory_as_waterfall` | a stacked waterfall of the characterised inventory |

## TimexLCA

```python
TimexLCA(
    demand: dict | TimexLCASettings,
    method: tuple = None,
    database_dates: dict = None,
    scenario: dict = None,
    create_missing: bool = False,
    premise_key: str = None,
    ecoinvent_credentials: tuple = None,
    use_global_lci_cache: bool = True,
)
```

The four-step workflow the documentation walks through
(source: bw-timex-docs):

| Step | Call | What it produces |
|---|---|---|
| 1 | add temporal information to exchanges | a temporalised foreground |
| 2 | `build_timeline(...)` | the dated process timeline |
| 3 | `lci(...)` | the time-explicit inventory, with a dynamic biosphere matrix |
| 4 | `static_lcia()` or `dynamic_lcia(...)` | a score |

`run(settings=None, **overrides)` does steps 2 to 4 in one call.

Selected methods, read from the class: `build_timeline`, `build_datapackage`, `lci`,
`static_lcia`, `dynamic_lcia`, `calculate_dynamic_inventory`, `run`, `from_settings`,
`compare`, `timeline_summary`, `databases_used_by_timeline`,
`disaggregate_background_lci`, `temporal_market_lcis`, the
`create_labelled_*_dataframe` family, `plot_dynamic_inventory` and
`plot_dynamic_characterized_inventory`. Scores are read from the `static_score`,
`dynamic_score` and `base_score` properties.

## TimexLCASettings

One dataclass holding everything a run needs: `demand`, `method`, `database_dates`,
`scenario`, `create_missing`, `use_global_lci_cache`, `label`, `starting_datetime`,
`temporal_grouping`, `interpolation_type`, `edge_filter_function`, `cutoff`,
`max_calc`, `graph_traversal`, `traverse_background`, timeline arguments,
`build_dynamic_biosphere`, `expand_technosphere`, `keep_activity_dimension`,
`static_lcia_enabled`, `dynamic_lcia_enabled`, `metric`, `time_horizon`,
`fixed_time_horizon`, `time_horizon_start`, the two characterisation function
dictionaries and `use_disaggregated_lci`.

Defaults worth knowing: `temporal_grouping` is `"year"`, `interpolation_type` is
`"linear"`, `graph_traversal` is `"priority"`, `cutoff` is 1e-9, `max_calc` is 2000,
`metric` is `"radiative_forcing"` and `time_horizon` is 100 years.

## Comparing configurations

```python
result = TimexLCA.compare([settings_a, settings_b], keep_objects=False, on_error="raise")
result.summary       # a pandas DataFrame, one row per configuration
```

## Notes

- `database_dates` is the map from a background database name to the point in time it
  represents. A database reached by the traversal that is not in the map raises
  `UnmappedDatabaseError`.
- `set_database_metadata` is the alternative to passing `database_dates` on every call:
  it stores what a database represents in Brightway's own metadata, so a project
  carries its own dating.
- `dynamic_lcia` needs characterisation functions, not characterisation factors. The
  package registers a default set; `add_flows_to_characterization_functions` adds more.
