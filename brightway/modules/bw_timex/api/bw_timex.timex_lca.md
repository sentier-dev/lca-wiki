**Generated API reference** · package `bw_timex` 1.4.0 · module `bw_timex.timex_lca` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_timex.timex_lca cfg.yml > bw_timex.timex_lca.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_timex.timex_lca"></a>

# bw\_timex.timex\_lca

<a id="bw_timex.timex_lca.FACTORIZE_SOLVES_THRESHOLD"></a>

#### FACTORIZE\_SOLVES\_THRESHOLD

<a id="bw_timex.timex_lca.TimexLCASettings"></a>

## TimexLCASettings Objects

```python
@dataclass
class TimexLCASettings()
```

Everything needed to run one time-explicit LCA calculation.

One `TimexLCASettings` fully describes a calculation, so it doubles as the
record of what was run - keep it, log it, or put a list of them into
[`TimexLCA.compare`][bw_timex.timex_lca.TimexLCA.compare].

The fields fall into two groups. `database_dates`, `scenario` and
`use_global_lci_cache` (`FIXED_FIELDS`) pick the background databases, which
fix the column space of the time-explicit matrices and the caches keyed on
them: they are set when the `TimexLCA` is built and cannot be changed per
run. Everything else - the demand, the method, and all the timeline, LCI and
LCIA knobs - may vary from run to run on the same object.

Every knob can also be written grouped by the stage it belongs to, which
keeps a long settings block readable:

```python
TimexLCASettings(
    demand=demand,
    method=method,
    timeline={"starting_datetime": datetime(2024, 1, 1), "temporal_grouping": "month"},
    lci={"build_dynamic_biosphere": False},
    lcia={"metric": "GWP", "time_horizon": 20},
)
```

The groups are only a way of writing the call: they are unpacked into the
same flat fields, so the two spellings produce equal objects, and
`dataclasses.replace` and `run(**overrides)` stay flat either way.

<a id="bw_timex.timex_lca.TimexLCASettings.FIXED_FIELDS"></a>

#### FIXED\_FIELDS

Fields that pick the background, and so cannot vary between runs of one
`TimexLCA`. Changing one means building a new object (which
`TimexLCA.compare` does for you).

<a id="bw_timex.timex_lca.TimexLCASettings.STAGE_GROUPS"></a>

#### STAGE\_GROUPS

The stage each knob belongs to, for the grouped spelling above. Also
what the reference documentation is organised by.

<a id="bw_timex.timex_lca.TimexLCASettings.demand"></a>

#### demand

<a id="bw_timex.timex_lca.TimexLCASettings.method"></a>

#### method

<a id="bw_timex.timex_lca.TimexLCASettings.database_dates"></a>

#### database\_dates

<a id="bw_timex.timex_lca.TimexLCASettings.scenario"></a>

#### scenario

<a id="bw_timex.timex_lca.TimexLCASettings.create_missing"></a>

#### create\_missing

<a id="bw_timex.timex_lca.TimexLCASettings.use_global_lci_cache"></a>

#### use\_global\_lci\_cache

<a id="bw_timex.timex_lca.TimexLCASettings.label"></a>

#### label

Name for this calculation, used to label its row in a comparison.

<a id="bw_timex.timex_lca.TimexLCASettings.starting_datetime"></a>

#### starting\_datetime

<a id="bw_timex.timex_lca.TimexLCASettings.temporal_grouping"></a>

#### temporal\_grouping

<a id="bw_timex.timex_lca.TimexLCASettings.interpolation_type"></a>

#### interpolation\_type

<a id="bw_timex.timex_lca.TimexLCASettings.edge_filter_function"></a>

#### edge\_filter\_function

<a id="bw_timex.timex_lca.TimexLCASettings.cutoff"></a>

#### cutoff

<a id="bw_timex.timex_lca.TimexLCASettings.max_calc"></a>

#### max\_calc

<a id="bw_timex.timex_lca.TimexLCASettings.graph_traversal"></a>

#### graph\_traversal

<a id="bw_timex.timex_lca.TimexLCASettings.traverse_background"></a>

#### traverse\_background

<a id="bw_timex.timex_lca.TimexLCASettings.timeline_args"></a>

#### timeline\_args

<a id="bw_timex.timex_lca.TimexLCASettings.timeline_kwargs"></a>

#### timeline\_kwargs

<a id="bw_timex.timex_lca.TimexLCASettings.build_dynamic_biosphere"></a>

#### build\_dynamic\_biosphere

<a id="bw_timex.timex_lca.TimexLCASettings.expand_technosphere"></a>

#### expand\_technosphere

<a id="bw_timex.timex_lca.TimexLCASettings.keep_activity_dimension"></a>

#### keep\_activity\_dimension

<a id="bw_timex.timex_lca.TimexLCASettings.static_lcia_enabled"></a>

#### static\_lcia\_enabled

<a id="bw_timex.timex_lca.TimexLCASettings.dynamic_lcia_enabled"></a>

#### dynamic\_lcia\_enabled

Whether [`run`][bw_timex.timex_lca.TimexLCA.run] characterizes the
inventory dynamically. `None` (the default) means "if it can": dynamic
characterization needs a characterization function per biosphere flow,
and those are only found automatically for ecoinvent / `biosphere3`
flows, so a model on its own biosphere database is characterized
statically only, unless `characterization_functions` says how. `True`
asks for it explicitly, and raises if the flows cannot be matched.

<a id="bw_timex.timex_lca.TimexLCASettings.metric"></a>

#### metric

<a id="bw_timex.timex_lca.TimexLCASettings.time_horizon"></a>

#### time\_horizon

<a id="bw_timex.timex_lca.TimexLCASettings.fixed_time_horizon"></a>

#### fixed\_time\_horizon

<a id="bw_timex.timex_lca.TimexLCASettings.time_horizon_start"></a>

#### time\_horizon\_start

<a id="bw_timex.timex_lca.TimexLCASettings.characterization_functions"></a>

#### characterization\_functions

<a id="bw_timex.timex_lca.TimexLCASettings.characterization_function_co2"></a>

#### characterization\_function\_co2

<a id="bw_timex.timex_lca.TimexLCASettings.use_disaggregated_lci"></a>

#### use\_disaggregated\_lci

<a id="bw_timex.timex_lca.TimexLCASettings.timeline"></a>

#### timeline

<a id="bw_timex.timex_lca.TimexLCASettings.lci"></a>

#### lci

<a id="bw_timex.timex_lca.TimexLCASettings.lcia"></a>

#### lcia

<a id="bw_timex.timex_lca.TimexLCASettings.years"></a>

#### years

Convenience to set `scenario["years"]` directly as a top-level kwarg.

<a id="bw_timex.timex_lca.TimexLCASettings.scenario_updates"></a>

#### scenario\_updates

Convenience to merge arbitrary scenario updates. E.g., `scenario_updates={"pathway": "SSP2-Base", "years": [2030]}`.

<a id="bw_timex.timex_lca.TimexLCASettings.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__(timeline, lci, lcia, years, scenario_updates) -> None
```

<a id="bw_timex.timex_lca.ComparisonResult"></a>

## ComparisonResult Objects

```python
@dataclass
class ComparisonResult()
```

What [`TimexLCA.compare`][bw_timex.timex_lca.TimexLCA.compare] found.

Attributes
----------
summary : pandas.DataFrame
    One row per calculation: its label, its scores, the settings it was run
    with, how long it took, and the error it raised, if any. Scenario
    metadata is spread over `scenario_*` columns, so scenarios can be
    grouped and plotted directly.
settings : list[TimexLCASettings]
    The settings of each row, in the same order - the full record of what
    produced the comparison.
objects : dict[str, TimexLCA] or None
    The `TimexLCA` objects by label, if `compare(keep_objects=True)`. Use
    these to dig into a single result - its timeline, dynamic inventory, or
    contributions. Calculations that share a background share one object,
    so the same object can appear under several labels. `None` by default,
    since holding every object of a large comparison is expensive.

<a id="bw_timex.timex_lca.ComparisonResult.summary"></a>

#### summary

<a id="bw_timex.timex_lca.ComparisonResult.settings"></a>

#### settings

<a id="bw_timex.timex_lca.ComparisonResult.objects"></a>

#### objects

<a id="bw_timex.timex_lca.ComparisonResult.__len__"></a>

#### \_\_len\_\_

```python
def __len__() -> int
```

<a id="bw_timex.timex_lca.ComparisonResult._repr_html_"></a>

#### \_repr\_html\_

```python
def _repr_html_() -> str
```

<a id="bw_timex.timex_lca.TimexLCA"></a>

## TimexLCA Objects

```python
class TimexLCA()
```

Class to perform time-explicit LCA calculations.

A TimexLCA contains the LCI of processes occurring at explicit points in time. It tracks the timing of processes,
relinks their technosphere and biosphere exchanges to match the technology landscape at that point in time,
and also keeps track of the timing of the resulting emissions. As such, it combines prospective and dynamic LCA
approaches.

TimexLCA first calculates a static LCA, which informs a priority-first graph traversal. From the
graph traversal, temporal relationships between exchanges and processes are derived. Based on
the timing of the processes, bw_timex matches the processes at the intersection between
foreground and background to the best available background databases. This temporal relinking is
achieved by using datapackages to add new time-specific processes. The new processes and their
exchanges to other technosphere processes or biosphere flows extent the technosphere and
biosphere matrices.

Temporal information of both processes and biosphere flows is retained, allowing for dynamic
LCIA.

TimexLCA calculates:
 1) a static "base" LCA score (`TimexLCA.base_score`, same as `bw2calc.lca.score`),
 2) a static time-explicit LCA score (`TimexLCA.static_score`), which links LCIs to the
    respective background databases, but without dynamic characterization of the time-explicit inventory
 3) a dynamic time-explicit LCA score (`TimexLCA.dynamic_score`), with dynamic inventory and
    dynamic characterization. These are provided for radiative forcing and GWP but can also be
    user-defined.


Examples
--------
```python
from bw_timex import TimexLCA, set_database_metadata

demand = {("my_foreground_database", "my_process"): 1}
method = ("some_method_family", "some_category", "some_method")

# Databases exported by premise >= 2.4.9.2 already know the point in
# time they represent. For your own databases, say so once:
set_database_metadata("my_background_database_one", representative_time=datetime(2020, 1, 1))
set_database_metadata("my_background_database_two", representative_time=datetime(2030, 1, 1))

tlca = TimexLCA(demand, method)

# ... or map the databases explicitly, which then replaces the metadata:
tlca = TimexLCA(
    demand,
    method,
    database_dates={
        "my_background_database_one": datetime(2020, 1, 1),
        "my_background_database_two": datetime(2030, 1, 1),
        # Several databases may share the same date, e.g. to keep your own
        # modified copies of background processes in their own database:
        "my_modified_background_2020": datetime(2020, 1, 1),
        "my_foreground_database": "dynamic",
    },
)

# Run the whole calculation. `run` takes every argument of the four stages
# it calls, e.g. metric="GWP" - also available: "pGWP", "pGTP",
# "prospective_radiative_forcing".
tlca.run()
print(tlca.static_score)
print(tlca.dynamic_score)

# The stages can also be called one at a time, to inspect an intermediate
# result or to re-run only part of the calculation:
tlca.build_timeline()  # has many optional arguments
tlca.lci()
tlca.static_lcia()
tlca.dynamic_lcia(metric="radiative_forcing")
```

<a id="bw_timex.timex_lca.TimexLCA.__init__"></a>

#### \_\_init\_\_

```python
def __init__(demand: "dict | TimexLCASettings",
             method: tuple = None,
             database_dates: dict = None,
             scenario: dict = None,
             create_missing: bool = False,
             premise_key: str = None,
             ecoinvent_credentials: tuple = None,
             use_global_lci_cache: bool = True) -> None
```

Instantiating a `TimexLCA` object calculates a static LCA, initializes time mappings
for activities and biosphere flows, and stores useful subsets of ids in the
node_collections.

Parameters
----------
demand : dict[object: float] or TimexLCASettings
        The demand for which the LCA will be calculated. The keys can be Brightway `Node`
        instances, `(database, code)` tuples, or integer ids.
        A [`TimexLCASettings`][bw_timex.timex_lca.TimexLCASettings] can be
        passed instead of the demand, in which case it supplies the demand,
        the method and the background selection, and becomes the default
        settings of [`run`][bw_timex.timex_lca.TimexLCA.run].
method : tuple
        Tuple defining the LCIA method, such as `('foo', 'bar')` or default methods, such as
        `("EF v3.1", "climate change", "global warming potential (GWP100)")`.
        Required unless a `TimexLCASettings` is given as the first argument.
database_dates : dict, optional
        Fallback for mapping the databases yourself instead of letting
        `bw_timex` read their metadata - useful for databases written by
        premise < 2.4.9.2, which carry no metadata, or when you want to
        override what the metadata says. Dictionary mapping database names
        to the point in time they represent, as a `datetime`, or to
        `"dynamic"` for databases whose processes are distributed over
        time (typically the foreground).
        Several databases may share the same date, e.g. to keep your own
        modified copies of background processes in their own database
        instead of writing them into the shared background database for
        that vintage. If not given, the mapping is read from the
        databases' own `representative_time` metadata (which premise
        >= 2.4.9.2 writes when exporting, and which you can set yourself
        with `bw_timex.set_database_metadata`). Passing this argument replaces
        the metadata entirely: only the databases listed here are used.
scenario : dict, optional
        Metadata a background database must match to be used, e.g.
        `{"iam_model": "remind", "pathway": "SSP2-PkBudg500"}`. Reads the
        scenario metadata written by premise >= 2.4.9.2 (or by you, with
        `bw_timex.set_database_metadata`), so it does nothing for
        databases that carry none. Only needed when the project
        holds several scenarios - `TimexLCA`
        raises and lists them otherwise. Databases that don't declare the
        filtered key (your foreground, a hand-built vintage) are always
        kept. Cannot be combined with `database_dates`.
create_missing : bool, optional
        If True, background databases the `scenario` names but that this
        project does not hold yet are built with `premise`, and ecoinvent
        is imported first if it is missing. The `scenario` then has to
        describe the build completely: a `years` list plus all four of
        `iam_model`, `pathway`, `system_model` and `ecoinvent_version`
        (it may also narrow `sectors` or name a `source_database`).
        Needs the optional dependency:
        `pip install "bw_timex[premise]"`. Building takes tens of minutes
        and roughly 2-4 GB per year. Default is False, which raises
        instead of building. Cannot be combined with `database_dates`.
premise_key : str, optional
        premise decryption key, used only when building. Falls back to the
        environment variable `PREMISE_KEY`.
ecoinvent_credentials : tuple, optional
        `(username, password)`, used only when ecoinvent itself has to be
        imported. Falls back to the environment variables
        `ECOINVENT_USERNAME` and `ECOINVENT_PASSWORD`.
use_global_lci_cache : bool, optional
        If True (default), background unit LCI matrices are cached at
        module level and reused across `TimexLCA` objects within the
        same Python session. The cache is keyed by background process
        identity plus the database's `modified` token, so edits to a
        background database invalidate stale entries automatically. Set
        to False to isolate this object's caching (e.g. when mutating
        background databases via raw SQL that bypasses bw2data). The
        module-level cache can be cleared with
        `bw_timex.clear_background_lci_cache()`.

<a id="bw_timex.timex_lca.TimexLCA.__repr__"></a>

#### \_\_repr\_\_

```python
def __repr__() -> str
```

What a notebook shows for a cell ending in `tlca.run()`.

`run` returns the object for chaining, so this is the first thing a
user sees of their results - report the scores it has, rather than an
address in memory.

<a id="bw_timex.timex_lca.TimexLCA.from_settings"></a>

#### from\_settings

```python
@classmethod
def from_settings(cls, settings: TimexLCASettings) -> "TimexLCA"
```

Build a `TimexLCA` from a [`TimexLCASettings`][bw_timex.timex_lca.TimexLCASettings].

Same as passing the settings straight to the constructor, which is the
shorter way to write it:

```python
settings = TimexLCASettings(demand=demand, method=method, database_dates=dates)
tlca = TimexLCA(settings).run()
print(tlca.static_score)
```

<a id="bw_timex.timex_lca.TimexLCA.run"></a>

#### run

```python
def run(settings: TimexLCASettings | None = None, **overrides) -> "TimexLCA"
```

Run the whole calculation: timeline, LCI, and LCIA.

Runs `build_timeline()`, `lci()`, `static_lcia()` and `dynamic_lcia()`.
Dynamic characterization is skipped, with a warning, when no
characterization function can be found for the method's biosphere flows
- see `dynamic_lcia_enabled`.

Can be called repeatedly on one object to vary the demand, the method,
or any knob. The background caches and, where the timeline parameters
are unchanged, the timeline itself are reused between calls; only a
changed demand or method forces the base LCA to be recalculated.
Changing the background databases is refused - see
[`compare`][bw_timex.timex_lca.TimexLCA.compare] for that.

Parameters
----------
settings : TimexLCASettings, optional
    Settings for this run. Defaults to the ones the object was built
    with by [`from_settings`][bw_timex.timex_lca.TimexLCA.from_settings].
**overrides
    Individual settings to override for this run only, e.g.
    `run(time_horizon=20)`. Neither `settings` nor the object's own
    settings are modified.

Returns
-------
TimexLCA
    The object itself, so calls can be chained.

Raises
------
TypeError
    If an override is not a field of `TimexLCASettings`.
ValueError
    If an override would change the background databases.

Examples
--------
```python
tlca = TimexLCA.from_settings(settings)
tlca.run()                            # the settings as given
tlca.run(time_horizon=20)             # one knob, settings untouched
tlca.run(demand={other_process: 1})   # new demand, background reused
```

<a id="bw_timex.timex_lca.TimexLCA.compare"></a>

#### compare

```python
@classmethod
def compare(cls,
            settings: list,
            keep_objects: bool = False,
            on_error: str = "raise") -> ComparisonResult
```

Run several calculations and collect them into one table.

This is the way to compare scenarios. Scenarios differ in their
background databases, and the background fixes the columns of the
time-explicit matrices and the caches keyed on them, so each one needs
its own `TimexLCA` - there is nothing shareable between them to begin
with. `compare` builds one object per distinct background and runs every
calculation that asks for that background on it, so a scenario × demand
grid only pays for a new object when the background actually changes.

Parameters
----------
settings : list[TimexLCASettings]
    The calculations to run, in the order they should appear.
keep_objects : bool, optional
    If True, keep each `TimexLCA` in `ComparisonResult.objects` so the
    timelines and inventories behind the scores stay available. Default
    is False, since a large comparison holds a lot of memory this way.
on_error : str, optional
    `"raise"` (default) propagates the first failure. `"record"` puts
    the message in the row's `error` column, leaves its scores as NaN,
    and carries on - useful for long unattended sweeps.

Returns
-------
ComparisonResult
    Its `summary` is a `DataFrame` with one row per calculation.

Examples
--------
```python
base = TimexLCASettings(demand=demand, method=method)
comparison = TimexLCA.compare(
    [
        replace(base, scenario={"pathway": "SSP2-Base"}, label="Base"),
        replace(base, scenario={"pathway": "SSP2-PkBudg500"}, label="PkBudg500"),
    ]
)
comparison.summary.plot.bar(x="label", y="static_score")
```

<a id="bw_timex.timex_lca.TimexLCA.build_timeline"></a>

#### build\_timeline

```python
def build_timeline(starting_datetime: datetime | str = "now",
                   temporal_grouping: str = "year",
                   interpolation_type: str = "linear",
                   edge_filter_function: Callable = None,
                   cutoff: float = 1e-9,
                   max_calc: int = 2000,
                   graph_traversal: str = "priority",
                   traverse_background: bool = False,
                   *args,
                   **kwargs) -> pd.DataFrame
```

Creates a `TimelineBuilder` instance that does the graph traversal (similar to
bw_temporalis) and extracts all edges with their temporal information. Creates the
`TimexLCA.timeline` of technosphere exchanges.

Parameters
----------
starting_datetime: datetime | str, optional
    Point in time when the demand occurs. This is the initial starting point of the
    graph traversal and the timeline. Something like `"now"` or `"2023-01-01"`.
    Default is `"now"`.
temporal_grouping : str, optional
    Time resolution for grouping exchanges over time in the timeline. Default is 'year',
    other options are 'month', 'day', 'hour'.
interpolation_type : str, optional
    Type of interpolation when sourcing the new producers in the time-mapped background
    databases. Default is 'linear', which means linear interpolation between the closest 2
    databases, other options are 'nearest' (or 'closest'), which selects only the closest database.
edge_filter_function : Callable, optional
    Function to skip edges in the graph traversal. Default is to skip all edges within
    background databases.
cutoff: float, optional
    The cutoff value for the graph traversal. Default is 1e-9.
max_calc: float, optional
    The maximum number of calculations to be performed by the graph traversal. Default is
    2000.
graph_traversal : str, optional
    The graph traversal algorithm to use. Default is 'priority' (priority-first,
    using bw_temporalis TemporalisLCA). Alternative is 'bfs' (Breadth-First-Search,
    independent of TemporalisLCA, avoids per-subgraph LCA overhead).
traverse_background : bool, optional
    If True, the graph traversal descends into background databases instead of
    stopping at the first-level background frontier. Temporal distributions defined
    on exchanges inside background databases are then honored: time-spread flows are
    sourced from the temporally-appropriate background-db variant(s). Bounded by
    ``cutoff`` and ``max_calc``. Default is False (background treated as static,
    as before).

    With ``graph_traversal='priority'``, non-referenced background variants are NOT
    placed on the priority heap. Instead, each variant's subtree is walked in full
    via proxy reads when the parent edge is reached. The referenced-system heap
    exploration order is unchanged and explored amounts are exact (identical to
    ``graph_traversal='bfs'`` for those subtrees). A one-time warning is emitted
    when this combination is used.
*args : iterable
    Positional arguments for the graph traversal, for `bw_temporalis.TemporalisLCA` passed
    to the `EdgeExtractor` class, which inherits from `TemporalisLCA`. See `bw_temporalis`
    documentation for more information.
**kwargs : dict
    Additional keyword arguments for the graph traversal, for `bw_temporalis.TemporalisLCA`
    passed to the EdgeExtractor class, which inherits from TemporalisLCA. See bw_temporalis
    documentation for more information.

Returns
-------
pandas.DataFrame:
    A DataFrame containing the timeline of technosphere exchanges

See Also
--------
- [`TimelineBuilder`][bw_timex.timeline_builder.TimelineBuilder]: Class that builds the
  timeline.

<a id="bw_timex.timex_lca.TimexLCA.lci"></a>

#### lci

```python
def lci(build_dynamic_biosphere: Optional[bool] = True,
        expand_technosphere: Optional[bool] = True,
        keep_activity_dimension: Optional[bool] = True,
        group_background_by_time: Optional[bool] = None) -> None
```

Calculates the time-explicit LCI.

There are two ways to generate time-explicit LCIs:
If `expand_technosphere' is True, the biosphere and technosphere matrices are expanded by inserting
time-specific processes via the `MatrixModifier` class by calling `TimexLCA.build_datapackage().
Otherwise ('expand_technosphere' is False), it generates a dynamic inventory directly from the
timeline without technosphere matrix calculations.

Next to the choice above concerning how to retrieve the time-explicit inventory, users
can also decide if they want to retain all temporal information at the biosphere level
(build_dynamic_biosphere = True).
Set `build_dynamic_biosphere` to False if you only want to get a new overall score of
the time-explicit inventory and don't care about the timing of the emissions.
This saves time and memory.

Parameters
----------
build_dynamic_biosphere: bool
    if True, build the dynamic biosphere matrix and calculate the dynamic LCI.
    Default is True.
expand_technosphere: bool
    if True, creates an expanded time-explicit technosphere and biosphere matrix and
    calculates the LCI from it.
    if False, creates no new technosphere, but calculates the dynamic inventory directly
    from the timeline. Building from the timeline currently only works if
    `build_dynamic_biosphere` is also True.
keep_activity_dimension: bool
    if True (default), the dynamic inventory keeps one column per emitting
    activity, which is what a contribution analysis needs.
    if False, emissions are accumulated per (biosphere flow, time) only, in a
    single column. Scores - static and dynamic - are identical, and so is the
    timing of the emissions, but they can no longer be attributed to the
    activities that caused them. Use this for large time-explicit systems,
    where the per-activity columns dominate memory.
group_background_by_time: bool, optional
    How the background unit LCIs are solved. `None` (default) picks
    whichever of the two strategies needs fewer solves for this call;
    `True` forces per-time-step solving and `False` forces per-process
    solving.

    Per-time-step solving sums the background demands of every temporal
    market landing at the same point in time and solves those sums,
    costing one solve per `(time, block)` pair rather than one per
    distinct background process. It only applies with
    `expand_technosphere=False` and `keep_activity_dimension=False`,
    where the rows it sums share a column anyway - asking for it
    elsewhere logs a warning and is ignored.

    Worth pinning to `False` when re-running `lci()` several times in
    one session: grouped right-hand sides are sums specific to a run,
    so they are never cached, while per-process unit LCIs are - which
    makes every run after the first free.

Returns
-------
None
    calls LCI calculations from bw2calc and calculates the dynamic inventory, if
    `build_dynamic_biosphere` is True.

See Also
--------
- [`build_datapackage`][bw_timex.timex_lca.TimexLCA.build_datapackage]: Method to create
  the datapackages that contain the modifications to the technosphere and biosphere matrix
  using the [`MatrixModifier`][bw_timex.matrix_modifier.MatrixModifier] class.
- [`calculate_dynamic_inventory`][bw_timex.timex_lca.TimexLCA.calculate_dynamic_inventory]:
  Method to calculate the dynamic inventory if `build_dynamic_biosphere` is True.

<a id="bw_timex.timex_lca.TimexLCA.temporal_market_lcis"></a>

#### temporal\_market\_lcis

```python
@property
def temporal_market_lcis() -> dict
```

Background LCI matrix per temporal market, keyed by time-mapped id.

Materialized on first access from the recipes recorded during the
matrix build: `sum(coefficient * unit supply)` over the market's
background activities, scaled by the market's own supply, spread back
over the biosphere as `B @ diag(x)`. Keeping the recipes instead of
the matrices is what lets a premise-sized run finish `lci()`; anything
that actually wants the matrices - `disaggregate_background_lci()`,
contribution analyses - still gets them here.

Empty unless the inventory was built with `expand_technosphere=True`,
which is the only mode that can disaggregate a background.

<a id="bw_timex.timex_lca.TimexLCA.disaggregate_background_lci"></a>

#### disaggregate\_background\_lci

```python
def disaggregate_background_lci() -> None
```

This method disaggregates the background LCI's of the temporal markets.
The disaggregated background LCI's allow a contribution analysis on the
orginal inventory level as compared to the aggregated temporal market emissions.

Returns
-------
None
    Stores the disaggregated background inventory in the attribute
    `dynamic_inventory_disaggregated` as a matrix and in `dynamic_inventory_disaggregated_df`
    as a DataFrame.

<a id="bw_timex.timex_lca.TimexLCA.static_lcia"></a>

#### static\_lcia

```python
def static_lcia() -> None
```

Calculates static LCIA using time-explicit LCIs with the standard static characterization
factors of the selected LCIA method using `bw2calc.lcia()`.

Returns
-------
None
    Stores the static score in the attribute `static_score`.

<a id="bw_timex.timex_lca.TimexLCA.dynamic_lcia"></a>

#### dynamic\_lcia

```python
def dynamic_lcia(metric: str = "radiative_forcing",
                 time_horizon: int = 100,
                 fixed_time_horizon: bool = False,
                 time_horizon_start: datetime = None,
                 characterization_functions: dict = None,
                 characterization_function_co2: dict = None,
                 use_disaggregated_lci: bool = False) -> pd.DataFrame
```

Calculates dynamic LCIA with the `DynamicCharacterization` class using the dynamic inventory
and dynamic characterization functions. Dynamic characterization is handled by the separate
package `dynamic_characterization` (https://dynamic-characterization.readthedocs.io).

Dynamic characterization functions in the form of a dictionary {biosphere_flow_database_id:
characterization_function} can be given by the user.
If none are given, a set of default dynamic characterization functions based on IPCC AR6 are
provided from `dynamic_characterization` package. These are mapped to the biosphere3 flows
of the chosen static climate change impact category. If there is no characterization
function for a biosphere flow, it will be ignored.

Dynamic climate change metrics are supported for "GWP", "radiative_forcing",
"pGWP", "pGTP", and "prospective_radiative_forcing".
The time horizon for the impact assessment can be set with the `time_horizon` parameter,
defaulting to 100 years. The `fixed_time_horizon` parameter determines whether the emission
time horizon for all emissions is calculated from a specific starting point `time_horizon_start`
(`fixed_time_horizon=True`) or from the time of the emission (`fixed_time_horizon=False`).
The former is the implementation of the Levasseur approach
(see https://doi.org/10.1021/es9030003), while the latter is how conventional LCA is done.

Parameters
----------
metric : str, optional
    the metric for which the dynamic LCIA should be calculated. Default is
    "radiative_forcing". Available: "GWP", "radiative_forcing", "pGWP",
    "pGTP", and "prospective_radiative_forcing"
time_horizon: int, optional
    the time horizon for the impact assessment. Unit is years. Default is 100.
fixed_time_horizon: bool, optional
    Whether the emission time horizon for all emissions is calculated from the functional
    unit (fixed_time_horizon=True) or from the time of the emission
    (fixed_time_horizon=False). Default is False.
time_horizon_start: pd.Timestamp, optional
    The starting timestamp of the time horizon for the dynamic characterization. Only needed
    for fixed time horizons. Default is datetime.now().
characterization_functions: dict, optional
    Dict of the form {biosphere_flow_database_id: characterization_function}. Default is
    None, which triggers the use of the provided dynamic characterization functions based on
    IPCC AR6 Chapter 7.
characterization_function_co2: Callable, optional
    Characterization function for CO2 emissions. Necessary if GWP metric is chosen. Default
    is None, which triggers the use of the provided dynamic characterization function of CO2
    based on IPCC AR6 Chapter 7.
use_disaggregated_lci: bool, optional
    Whether to use the disaggregated background LCI for the dynamic LCIA. Default is False.
    Use True if you want to perform a contribution analysis on the disaggregated background.

Returns
-------
pandas.DataFrame
    A DataFrame with the characterized inventory for the chosen metric and parameters.

See Also
--------
- [`dynamic_characterization`](https://dynamic-characterization.readthedocs.io/en/latest/):
  Package handling the dynamic characterization.

<a id="bw_timex.timex_lca.TimexLCA.timeline_summary"></a>

#### timeline\_summary

```python
@property
def timeline_summary() -> pd.DataFrame
```

The readable view of `timeline`: what happens when, and sourced from where.

`timeline` itself carries the bookkeeping columns the calculation needs
(hashes, time-mapped ids). This is what `build_timeline` returns, and
what to look at after [`run`][bw_timex.timex_lca.TimexLCA.run], which
returns the object rather than a timeline.

<a id="bw_timex.timex_lca.TimexLCA.base_score"></a>

#### base\_score

```python
@property
def base_score() -> float
```

Score of the base LCA, i.e., the "normal" LCA without time-explicit information.
Same as bw2calc.LCA.score

<a id="bw_timex.timex_lca.TimexLCA.static_score"></a>

#### static\_score

```python
@property
def static_score() -> float
```

Score resulting from the static LCIA of the time-explicit inventory.

<a id="bw_timex.timex_lca.TimexLCA.dynamic_score"></a>

#### dynamic\_score

```python
@property
def dynamic_score() -> float
```

Score resulting from the dynamic LCIA of the time-explicit inventory.

<a id="bw_timex.timex_lca.TimexLCA.build_datapackage"></a>

#### build\_datapackage

```python
def build_datapackage() -> list
```

Creates the datapackages that contain the modifications to the technosphere and biosphere
matrix using the `MatrixModifier` class.

Returns
-------
list
    List of datapackages that contain the modifications to the technosphere and biosphere
    matrix

See Also
--------
- [`MatrixModifier`][bw_timex.matrix_modifier.MatrixModifier]: Class that handles the
  technosphere and biosphere matrix modifications.

<a id="bw_timex.timex_lca.TimexLCA.calculate_dynamic_inventory"></a>

#### calculate\_dynamic\_inventory

```python
def calculate_dynamic_inventory(expand_technosphere=True,
                                keep_activity_dimension=True,
                                group_background_by_time=False) -> None
```

Calculates the dynamic inventory, by first creating a dynamic biosphere matrix using the
`DynamicBiosphereBuilder` class and then multiplying it with the dynamic supply array. The
dynamic inventory matrix is stored in the attribute `dynamic_inventory`. It is also
converted to a DataFrame and stored in the attribute `dynamic_inventory_df`.

Parameters
----------
expand_technosphere: bool
    A boolean indicating if the dynamic biosphere matrix is built directly from the
    expanded matrices or from the timeline. Default is True (from expanded matrices).

Returns
-------
None
    calculates the dynamic inventory and stores it in the attribute
    `dynamic_inventory` as a matrix and in `dynamic_inventory_df` as a DataFrame.
    Also calculates and stores the lci of the temporal markets in the attribute
    self.temporal_market_lcis for use in contribution analysis of the background processes.

See Also
--------
- [`DynamicBiosphereBuilder`][bw_timex.dynamic_biosphere_builder.DynamicBiosphereBuilder]:
  Class for creating the dynamic biosphere matrix and inventory.

<a id="bw_timex.timex_lca.TimexLCA.create_dynamic_inventory_dataframe"></a>

#### create\_dynamic\_inventory\_dataframe

```python
def create_dynamic_inventory_dataframe(
        expand_technosphere=True,
        use_disaggregated_lci=False,
        keep_activity_dimension=True) -> pd.DataFrame
```

Brings the dynamic inventory from its matrix form in `dynamic_inventory` into the
format of a pandas.DataFrame, with the right structure to later apply dynamic
characterization functions.

Format is:

+------------+--------+------+----------+
|   date     | amount | flow | activity |
+============+========+======+==========+
|  datetime  |   33   |  1   |    2     |
+------------+--------+------+----------+
|  datetime  |   32   |  1   |    2     |
+------------+--------+------+----------+
|  datetime  |   31   |  1   |    2     |
+------------+--------+------+----------+

- date: datetime, e.g. '2024-01-01 00:00:00'
- flow: flow id
- activity: activity id

Parameters
----------
expand_technosphere: bool
    A boolean indicating if the dynamic biosphere matrix is built directly from the
    expanded matrices or from the timeline. Default is True.

Returns
-------
pandas.DataFrame, dynamic inventory in DataFrame format

<a id="bw_timex.timex_lca.TimexLCA.clean_databases"></a>

#### clean\_databases

```python
def clean_databases() -> None
```

Reprocess the databases that have been modified since they were last processed.

Editing a database invalidates its datapackage, and the next calculation has to
rebuild it. For large background databases that takes tens of seconds each, so
the databases concerned are logged instead of the calculation appearing to hang.

Returns
-------
None

<a id="bw_timex.timex_lca.TimexLCA.prepare_base_lca_inputs"></a>

#### prepare\_base\_lca\_inputs

```python
def prepare_base_lca_inputs(demand=None,
                            method=None,
                            weighting=None,
                            normalization=None,
                            demands=None,
                            remapping=True,
                            demand_database_last=True) -> tuple
```

Prepare LCA input arguments in Brightway2.5 style.

Adapted bw2data.compat.py

The difference to the original method is that we load all available databases into the
matrices instead of just the ones depending on the demand. We need this for the creation of
the time mapping dict that creates a mapping between the producer id and the reference
timing of the databases in the `database_dates`.

Parameters
----------
demand : dict[object: float]
    The demand for which the LCA will be calculated. The keys can be Brightway `Node`
    instances, `(database, code)` tuples, or integer ids.
method : tuple
    Tuple defining the LCIA method, such as `('foo', 'bar')`. Only needed if not passing
    `data_objs`.
weighting : tuple
    Tuple defining the LCIA weighting, such as `('foo', 'bar')`. Only needed if not passing
    `data_objs`.
normalization: str
demands: list of dicts of demands
remapping: bool
    If True, remap dictionaries
demand_database_last: bool
    If True, add the demand databases last in the list `database_names`.

Returns
-------
tuple
    Indexed demand, data objects, and remapping dictionaries

See Also
--------
- [`bw2data.compat.prepare_lca_inputs`](https://github.com/brightway-lca/brightway2-data/blob/main/bw2data/compat.py):
  Original code this function is adapted from.

<a id="bw_timex.timex_lca.TimexLCA.databases_used_by_timeline"></a>

#### databases\_used\_by\_timeline

```python
def databases_used_by_timeline() -> list
```

The mapped databases the time-explicit matrices actually reference.

A project can hold vintages a given study never sources from - e.g. a
2050 vintage for a system that ends in 2042, or the vintages of an
unrelated study. They get no temporal market share, and the expanded
technosphere only ever references a background database that a row's
`temporal_market_shares` names, so their processes would only add
columns to the matrix that has to be solved.

Kept are the dynamic databases, the databases holding the demand, every
database a temporal market draws on, and the databases of the traversed
processes themselves (which is what `traverse_background` adds). Their
graph dependents are added by the caller.

Returns
-------
list
    Names of the databases to load, in `database_dates` order. All of
    them, if no timeline has been built yet.

<a id="bw_timex.timex_lca.TimexLCA.prepare_bw_timex_inputs"></a>

#### prepare\_bw\_timex\_inputs

```python
def prepare_bw_timex_inputs(demand=None,
                            method=None,
                            weighting=None,
                            normalization=None,
                            demands=None,
                            remapping=True,
                            demand_database_last=True) -> tuple
```

Prepare LCA input arguments in Brightway 2.5 style.

ORIGINALLY FROM bw2data.compat.py

Changes include:
- always load all databases in demand_database_names
- indexed_demand has the id of the new consumer_id of the "exploded" demand

Parameters
----------
demand : dict[object: float]
    The demand for which the LCA will be calculated. The keys can be Brightway `Node`
    instances, `(database, code)` tuples, or integer ids.
method : tuple
    Tuple defining the LCIA method, such as `('foo', 'bar')`. Only needed if not passing
    `data_objs`.
weighting : tuple
    Tuple defining the LCIA weighting, such as `('foo', 'bar')`. Only needed if not passing
    `data_objs`.
normalization: str
demands: list of dicts of demands
remapping: bool
    If True, remap dictionaries
demand_database_last: bool
    If True, add the demand databases last in the list `database_names`.

Returns
-------
tuple
    Indexed demand, data objects, and remapping dictionaries

See Also
--------
- [`bw2data.compat.prepare_lca_inputs`](https://github.com/brightway-lca/brightway2-data/blob/main/bw2data/compat.py):
  Original code this function is adapted from.

<a id="bw_timex.timex_lca.TimexLCA.create_node_collections"></a>

#### create\_node\_collections

```python
def create_node_collections() -> None
```

Creates a dict of collections of nodes that will be useful down the line, e.g. to determine
static nodes for the graph traversal or create the dynamic biosphere matrix.
Available collections are:

- ``background``: set of node ids of all processes that depend on the demand processes and are in the background databases
- ``foreground``: set of node ids of all processes that are not in the background databases
- ``first_level_background_static``: set of node ids of all processes that are in the background databases and are directly linked to the demand processes

Returns
-------
    None
        adds the `node_collections containing` the above-mentioned collections,
        as well as interdatabase_activity_mapping

<a id="bw_timex.timex_lca.TimexLCA.add_full_interdatabase_activity_mapping"></a>

#### add\_full\_interdatabase\_activity\_mapping

```python
def add_full_interdatabase_activity_mapping() -> None
```

Populate ``interdatabase_activity_mapping`` for every background activity
across all static variant databases.

Unlike ``add_interdatabase_activity_mapping_from_timeline`` (which only
maps producers that appear in the finished timeline), this pre-pass maps
every static-database node to its sibling in every other static database,
so the BFS extractor can resolve and read the respective (non-referenced)
variant's exchanges while it is still traversing.

<a id="bw_timex.timex_lca.TimexLCA.add_interdatabase_activity_mapping_from_timeline"></a>

#### add\_interdatabase\_activity\_mapping\_from\_timeline

```python
def add_interdatabase_activity_mapping_from_timeline() -> None
```

Fills the interdatabase_activity_mapping, which is a SetList of the matching processes
across background databases in the format of {(id, database_name_1), (id, database_name_2)}
with only those activities and background databases that are actually mapped in the
timeline.


Returns
-------
None
    Adds the ids of producers in other background databases
    (only those interpolated to in the timeline) to the `interdatabase_activity_mapping`.

<a id="bw_timex.timex_lca.TimexLCA.collect_temporalized_processes_from_timeline"></a>

#### collect\_temporalized\_processes\_from\_timeline

```python
def collect_temporalized_processes_from_timeline() -> None
```

Prepares the input for the LCA from the timeline.

Returns
-------
None
    Adds "temporal_markets" and "temporalized_processes" to the
    node_collections based on the timeline.

<a id="bw_timex.timex_lca.TimexLCA.add_static_activities_to_activity_time_mapping"></a>

#### add\_static\_activities\_to\_activity\_time\_mapping

```python
def add_static_activities_to_activity_time_mapping() -> None
```

Adds all activities from the static LCA to `activity_time_mapping`, an instance of
`TimeMappingDict`. This gives a unique mapping in the form of
(('database', 'code'), datetime_as_integer): time_mapping_id) that is later used to uniquely
identify time-resolved processes. Here, the activity_time_mapping is the
pre-population with the static activities. The time-explicit activities (from other
temporalized background databases) are added later on by the TimelineBuilder.
Activities in the foreground database are mapped with
(('database', 'code'), "dynamic"): time_mapping_id)" as their timing is not yet known.

Returns
-------
None
    adds the static activities to the `activity_time_mapping`

<a id="bw_timex.timex_lca.TimexLCA.create_demand_timing"></a>

#### create\_demand\_timing

```python
def create_demand_timing() -> dict
```

Generate a dictionary that maps demand id (key) to timing (value) for the demands in the
product system. It searches the timeline for the FU rows (consumer == -1) and looks up the
timing of the producing process. For demands keyed by an explicit product node, the producer
in the timeline is the process producing that product, so we resolve the product → process
relationship via the production exchange.

Returns
-------
dict
    Dictionary mapping demand ids to reference timing for the specified demands.

<a id="bw_timex.timex_lca.TimexLCA.create_labelled_technosphere_dataframe"></a>

#### create\_labelled\_technosphere\_dataframe

```python
def create_labelled_technosphere_dataframe() -> pd.DataFrame
```

Returns the technosphere matrix as a dataframe with comprehensible labels instead of ids.

Returns
-------
pd.DataFrame
    technosphere matrix as a pandas.DataFrame with comprehensible labels instead
    of ids.

<a id="bw_timex.timex_lca.TimexLCA.create_labelled_biosphere_dataframe"></a>

#### create\_labelled\_biosphere\_dataframe

```python
def create_labelled_biosphere_dataframe() -> pd.DataFrame
```

Returns the biosphere matrix as a pandas.DataFrame with comprehensible labels instead of ids.

Returns
-------
pd.DataFrame
    biosphere matrix as a pandas.DataFrame with comprehensible labels instead of
    ids.

<a id="bw_timex.timex_lca.TimexLCA.create_labelled_dynamic_biosphere_dataframe"></a>

#### create\_labelled\_dynamic\_biosphere\_dataframe

```python
def create_labelled_dynamic_biosphere_dataframe() -> pd.DataFrame
```

Returns the dynamic biosphere matrix as a dataframe with comprehensible labels instead of
ids.

Returns
-------
pd.DataFrame
    dynamic biosphere matrix as a pandas.DataFrame with comprehensible labels
    instead of ids.

<a id="bw_timex.timex_lca.TimexLCA.get_activity_name_from_time_mapped_id"></a>

#### get\_activity\_name\_from\_time\_mapped\_id

```python
def get_activity_name_from_time_mapped_id(time_mapped_id: int) -> str
```

Get the activity name for a time-mapped activity ID.
Uses the pre-built code-to-name cache for efficient lookups.

Parameters
----------
time_mapped_id : int
    The time-mapped activity ID from activity_time_mapping

Returns
-------
str
    The name of the activity

<a id="bw_timex.timex_lca.TimexLCA.create_labelled_dynamic_inventory_dataframe"></a>

#### create\_labelled\_dynamic\_inventory\_dataframe

```python
def create_labelled_dynamic_inventory_dataframe() -> pd.DataFrame
```

Returns the dynamic_inventory_df with comprehensible labels for flows and activities instead
of ids.

Returns
-------
pd.DataFrame
    dynamic inventory matrix as a pandas.DataFrame with comprehensible labels
    instead of ids.

<a id="bw_timex.timex_lca.TimexLCA.plot_dynamic_inventory"></a>

#### plot\_dynamic\_inventory

```python
def plot_dynamic_inventory(bio_flows, cumulative=False) -> None
```

Simple plot of dynamic inventory of a biosphere flow over time, with optional cumulative
plotting.

Parameters
----------
bio_flows : list of int
    database ids of the biosphere flows to plot.
cumulative : bool
    if True, plot cumulative amounts over time

Returns
-------
None
    shows a plot

<a id="bw_timex.timex_lca.TimexLCA.plot_dynamic_characterized_inventory"></a>

#### plot\_dynamic\_characterized\_inventory

```python
def plot_dynamic_characterized_inventory(
        cumsum: bool = False,
        sum_emissions_within_activity: bool = False,
        sum_activities: bool = False) -> None
```

Plot the characterized inventory of the dynamic LCI in a very simple plot.
Legend and title are selected automatically based on the chosen metric.

Parameters
----------
cumsum : bool
    if True, plot cumulative amounts over time
sum_emissions_within_activity : bool
    if True, sum emissions within each activity over time
sum_activities : bool
    if True, sum emissions over all activities over time

Returns
-------
None
    shows a plot
