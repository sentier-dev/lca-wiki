**Generated API reference** · package `bw_timex` 1.4.0 · module `bw_timex.dynamic_biosphere_builder` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_timex==1.4.0'
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
  -I "$SP" -m bw_timex.dynamic_biosphere_builder cfg.yml > bw_timex.dynamic_biosphere_builder.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_timex.dynamic_biosphere_builder"></a>

# bw\_timex.dynamic\_biosphere\_builder

<a id="bw_timex.dynamic_biosphere_builder.DynamicBiosphereBuilder"></a>

## DynamicBiosphereBuilder Objects

```python
class DynamicBiosphereBuilder()
```

Class for building a dynamic biosphere matrix with dimensions (biosphere flow at a specific point in time) x (processes)

<a id="bw_timex.dynamic_biosphere_builder.DynamicBiosphereBuilder.__init__"></a>

#### \_\_init\_\_

```python
def __init__(lca_obj: LCA,
             activity_time_mapping: dict,
             biosphere_time_mapping: dict,
             demand_timing: dict,
             node_collections: dict,
             temporal_grouping: str,
             database_dates: dict,
             database_dates_static: dict,
             timeline: pd.DataFrame,
             interdatabase_activity_mapping: SetList,
             expand_technosphere: bool = True,
             background_solver=None,
             nodes: dict | None = None,
             keep_activity_dimension: bool = True,
             group_background_by_time: bool = False) -> None
```

Initializes the DynamicBiosphereBuilder object.

Parameters
----------
lca_obj : LCA object
    instance of the bw2calc LCA class, e.g. TimexLCA.lca
activity_time_mapping : dict
    A dictionary mapping activity to their respective timing in the format
    (('database', 'code'), datetime_as_integer): time_mapping_id)
biosphere_time_mapping : dict
    A dictionary mapping biosphere flows to their respective timing in the format
    (('database', 'code'), datetime_as_integer): time_mapping_id), empty at this point.
demand_timing : dict
    A dictionary mapping of the demand to demand time
node_collections : dict
    A dictionary containing lists of node ids for different node subsets
temporal_grouping : str
    A string indicating the temporal grouping of the processes, e.g. 'year', 'month',
    'day', 'hour'
database_dates : dict
    A dictionary mapping database names to their respective date
database_dates_static : dict
    A dictionary mapping database names to their respective date, but only containing
    static databases, which are the background databases.
timeline: pd.DataFrame
    The edge timeline, created from TimexLCA.build_timeline()
interdatabase_activity_mapping : SetList
    A list of sets, where each set contains the activity ids of the same activity in
    different databases
expand_technosphere : bool, optional
    A boolean indicating if the dynamic biosphere matrix is built via expanded matrices or directly from the timeline.
    Default is True.
background_solver : BackgroundSolver, optional
    Solver supplying the unit background LCIs the temporal markets are
    made of. Required whenever the timeline contains temporal markets;
    `TimexLCA` builds one per `lci()` call and hands the same instance
    to every builder, so its supply/aggregate caches are shared.
nodes : dict, optional
    A dictionary mapping node ids to their bw2data node proxies, as collected by
    `TimexLCA`. Used to resolve producers by id instead of by code, which is only
    unique within a database.

Returns
-------
None

<a id="bw_timex.dynamic_biosphere_builder.DynamicBiosphereBuilder.build_dynamic_biosphere_matrix"></a>

#### build\_dynamic\_biosphere\_matrix

```python
def build_dynamic_biosphere_matrix(expand_technosphere: bool = True)
```

This function creates a separate biosphere matrix, with the dimensions
(bio_flows at a specific time step) x (processes).

Every temporally resolved biosphere flow has its own row in the matrix, making it highly
sparse. The timing of the emitting process and potential additional temporal information of
the biosphere flow (e.g. delay of emission compared to the timing of the process) are considered.

Absolute Temporal Distributions for biosphere exchanges are dealt with as a look up
function: If an activity happens at timestamp X and the biosphere exchange has an
absolute temporal distribution (ATD), it looks up the amount from the ATD corresponding
to timestamp X. E.g.: X = 2024, TD=(data=[2020,2021,2022,2023,2024,.....,2120],
amount=[3,4,4,5,6,......,3]), it will look up the value 6 corresponding 2024. If timestamp X
does not exist, it finds the nearest timestamp available (if two timestamps are equally close,
it will take the first in order of appearance (see numpy.argmin() for this behavior).

Parameters
----------
expand_technosphere : bool, optional
    A boolean indicating if the dynamic biosphere matrix is built via expanded matrices
    or directly from the timeline. Default is via expanded matrices.

Returns
-------
dynamic_biosphere_matrix : scipy.sparse.csr_matrix
    A sparse matrix with the dimensions (bio_flows at a specific time step) x (processes).
    The temporal markets' background recipes are left on
    `temporal_market_recipes` / `temporal_market_scales`.

<a id="bw_timex.dynamic_biosphere_builder.DynamicBiosphereBuilder.collect_background_demands_by_time"></a>

#### collect\_background\_demands\_by\_time

```python
def collect_background_demands_by_time()
```

Plan the grouped background solves: time step -> summed demand.

The counterpart of `collect_background_demands`, which groups the same
walk by temporal market instead. Supply is folded in here exactly as
the build does it, so the number of distinct `(time, block)` pairs in
the result is the number of solves grouping would actually cost.

<a id="bw_timex.dynamic_biosphere_builder.DynamicBiosphereBuilder.collect_background_demand_plan"></a>

#### collect\_background\_demand\_plan

```python
def collect_background_demand_plan()
```

Both groupings of the background demands, from a single walk.

`TimexLCA` compares the two solve strategies before building, which
needs the demands grouped per temporal market *and* per time step.
Collecting them separately walks the timeline twice and re-derives
every row's demand twice - on a premise-sized model that costs more
than the grouping it is trying to choose.

Returns
-------
tuple of dict
    `(by_market, by_time)`. `by_market` matches
    `collect_background_demands`; `by_time` carries each row's supply
    folded into its amounts, as the grouped build applies it.

<a id="bw_timex.dynamic_biosphere_builder.DynamicBiosphereBuilder.demand_from_timeline"></a>

#### demand\_from\_timeline

```python
def demand_from_timeline(row)
```

Returns a demand dict directly from the timeline row
and its temporal_market_shares.

**Arguments**:

  -----------
- `row` - pd.Series
  A row of the timeline DataFrame
  
  Returns
  -------
- `demand` - dict
  A demand-dictionary with as keys the ids of the time-mapped activities
  and as values the share.

<a id="bw_timex.dynamic_biosphere_builder.DynamicBiosphereBuilder.demand_from_technosphere"></a>

#### demand\_from\_technosphere

```python
def demand_from_technosphere(idx, process_col_index)
```

Returns a demand dict of background processes based on the technosphere column.
Foreground exchanges are skipped as these are added separately.

**Arguments**:

  -----------
- `idx` - int
  The time-mapped-activity id of the producer
- `process_col_index` - int
  The technosphere matrix id of the producer
  
  Returns
  -------
- `demand` - dict
  A demand-dictionary with as keys the brightway ids of the consumed background
  activities and as values their consumed amount.

<a id="bw_timex.dynamic_biosphere_builder.DynamicBiosphereBuilder.add_matrix_entry_for_biosphere_flows"></a>

#### add\_matrix\_entry\_for\_biosphere\_flows

```python
def add_matrix_entry_for_biosphere_flows(row, col, amount)
```

Adds an entry to the internal matrix-entry mapping, which is then used to construct
the dynamic biosphere matrix. Only unique entries are added, i.e. if the same row and
col index already exists, the value is not added again.

Parameters
----------
row : int
    A row index of a new element to the dynamic biosphere matrix
col: int
    A column index of a new element to the dynamic biosphere matrix
amount: float
    The amount of the new element to the dynamic biosphere matrix

Returns
-------
None
    the internal matrix-entry mapping is updated

<a id="bw_timex.dynamic_biosphere_builder.DynamicBiosphereBuilder.get_biosphere_exchanges"></a>

#### get\_biosphere\_exchanges

```python
def get_biosphere_exchanges(original_db, original_code, producer_id=None)
```

Return cached biosphere exchanges for a producer.

Keyed by the source database's `modified` token so foreground or
background edits invalidate stale entries automatically.

Temporalized producers are stored in the activity time mapping under
the pseudo-database "temporalized", which does not identify a node:
codes are only unique *within* a database, so the same code can exist
in several databases of a project (e.g. a benchmark copy of a
foreground, or a background process copied into every vintage). The
timeline's `producer` id is unambiguous, so resolve the real node from
it and key the cache on its actual database.

<a id="bw_timex.dynamic_biosphere_builder.DynamicBiosphereBuilder.get_background_unit_aggregate"></a>

#### get\_background\_unit\_aggregate

```python
def get_background_unit_aggregate(act)
```

Unit background LCI of an activity, aggregated over its processes.

Parameters
----------
act : int
    Node id of the background activity.

Returns
-------
numpy.ndarray
    Emissions per unit of `act`, dense over the biosphere rows of
    `lca_obj`, summed over the background processes that emit them.

Notes
-----
Only the aggregate reaches the dynamic biosphere matrix: a temporal
market contributes one column, so the per-process breakdown would be
summed away immediately. `BackgroundSolver` caches the aggregate (and
the supply column behind it) per background process identity, so
repeated occurrences of the same process cost nothing.

<a id="bw_timex.dynamic_biosphere_builder.DynamicBiosphereBuilder.collect_background_demands"></a>

#### collect\_background\_demands

```python
def collect_background_demands()
```

Plan the background unit LCIs the matrix build will ask for.

Walks the temporal-markets branch of `build_dynamic_biosphere_matrix`
with the same row guards, but without solving anything. `TimexLCA`
uses the activity ids to pre-factorize (via `BackgroundSolver.prepare`)
those blocks that several pending solves would otherwise factorize -
or `spsolve` - one at a time.

Returns
-------
dict
    Time-mapped temporal market id -> `{background activity id:
    coefficient}`. When building from the timeline, several rows can
    share a market and each get their own column; their coefficients
    are summed here, which is all planning needs - only the activity
    ids matter, and they are the same either way.

<a id="bw_timex.dynamic_biosphere_builder.DynamicBiosphereBuilder.get_background_lci_cache_key"></a>

#### get\_background\_lci\_cache\_key

```python
def get_background_lci_cache_key(act)
```

Build a stable cache key for background unit LCI reuse.
