**Generated API reference** · package `bw_timex` 1.4.0 · module `bw_timex.timeline_builder` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_timex.timeline_builder cfg.yml > bw_timex.timeline_builder.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_timex.timeline_builder"></a>

# bw\_timex.timeline\_builder

<a id="bw_timex.timeline_builder.TimelineBuilder"></a>

## TimelineBuilder Objects

```python
class TimelineBuilder()
```

Class for building a process timeline based on the temporal distributions of their exchanges.

First, the `EdgeExtractor` does a priority-first graph traversal and extracts a timeline of
exchanges (edge_timeline) with temporal information. Identical edges within temporal grouping
(e.g. year, month, day, hour) are then grouped and the amount of exchanges is summed up.

<a id="bw_timex.timeline_builder.TimelineBuilder.__init__"></a>

#### \_\_init\_\_

```python
def __init__(base_lca: LCA,
             starting_datetime: datetime,
             edge_filter_function: Callable,
             database_dates: dict,
             database_dates_static: dict,
             activity_time_mapping: dict,
             node_collections: dict,
             nodes: dict,
             temporal_grouping: str = "year",
             interpolation_type: str = "linear",
             cutoff: float = 1e-9,
             max_calc: int = 2000,
             graph_traversal: str = "priority",
             traverse_background: bool = False,
             interdatabase_activity_mapping=None,
             extra_reference_databases: set = None,
             *args,
             **kwargs) -> None
```

Parameters
----------
base_lca: LCA
    A static LCA object.
starting_datetime: datetime | str, optional
    Point in time when the demand occurs.
edge_filter_function: Callable
    A callable that filters edges. If not provided, a function that always returns False is used.
database_dates: dict
    A dictionary mapping databases to dates.
database_dates_static: dict
    same as database_dates, but excluding the "dynamic" foreground databases.
activity_time_mapping: dict
    A dictionary to map processes to specific times.
node_collections: dict
    A dictionary collecting useful subsets of node ids.
nodes: dict
    A dictionary {node_id: 'bw2data.backends.proxies.Activity'} for all nodes.
temporal_grouping: str, optional
    The temporal grouping to be used. Default is "year".
interpolation_type: str, optional
    The type of interpolation to be used to select the background databases. Default is "linear".
cutoff:
    The cutoff value for the graph traversal. Default is 1e-9.
max_calc:
    The maximum number of calculations to be performed by the graph traversal. Default is 2000.
args:   Variable length argument list
    Keyword arguments passed to the EdgeExtractor which inherits from TemporalisLCA. Here, things like the further settings for graph traversal can be set. For details, see bw_temporalis.TemporalisLCA.
kwargs: Arbitrary keyword arguments
    Keyword arguments passed to the EdgeExtractor which inherits from TemporalisLCA.

<a id="bw_timex.timeline_builder.TimelineBuilder.build_timeline"></a>

#### build\_timeline

```python
def build_timeline() -> pd.DataFrame
```

Create a DataFrame with grouped, time-explicit edges and, for each grouped edge,
interpolate to the database with the closest time of representativeness.

It uses the edge_timeline, an output from the graph traversal in EdgeExtractor.
Edges from same producer to same consumer that occur at different times within
the same time window (temporal_grouping) are grouped together.
Possible temporal groupings are "year", "month", "day" and "hour".

For edges between foreground and background system, the column "temporal_market_shares"
assigns the ratio [0-1] of the edge's amount to be taken from the database with the closest
time of representativeness. If a process is in the foreground system only, the interpolation weight is set to None.

Available interpolation types are:

- "linear": linear interpolation between the two closest databases, based on temporal distance.

- "closest": closest database is assigned 1

    (all are already passed during instantiation)

Returns
-------
pd.DataFrame
    A timeline with grouped, time-explicit edges and temporal_market_shares to background databases.

<a id="bw_timex.timeline_builder.TimelineBuilder.check_database_names"></a>

#### check\_database\_names

```python
def check_database_names() -> None
```

Check that the strings of the databases exist in the databases of the Brightway project.

<a id="bw_timex.timeline_builder.TimelineBuilder.extract_edge_data"></a>

#### extract\_edge\_data

```python
def extract_edge_data(edge: Edge) -> dict
```

Stores the attributes of an Edge instance in a dictionary.

Parameters
----------
edge: Edge
    Edge instance

Returns
-------
dict
    Dictionary with the attributes of the edge instance.

<a id="bw_timex.timeline_builder.TimelineBuilder.adjust_sign_of_amount_based_on_edge_type"></a>

#### adjust\_sign\_of\_amount\_based\_on\_edge\_type

```python
def adjust_sign_of_amount_based_on_edge_type(edge_type)
```

It checks if the an exchange is of type substitution or a technosphere exchange,
based on bw2data labelling convention, and adjusts the amount accordingly.
Flips the sign of the amount value in the timeline for substitution (positive technosphere) exchanges.

Parameters
----------
edge_type: str
    Type of the edge, as defined in the exchange data.

Returns
-------
int
    Multiplier for the amount value, 1 for technosphere exchanges, -1 for substitution exchanges.

<a id="bw_timex.timeline_builder.TimelineBuilder.get_time_mapping_key"></a>

#### get\_time\_mapping\_key

```python
def get_time_mapping_key(node_id: int, node_hash: int) -> int
```

Returns the time_mapping_id (key) from the activity_time_mapping for a given node.

Parameters
----------
node_id: int
    database id of the node.
node_hash: int
    datetime_as_integer of the node.

Returns
-------
int
    time_mapping_id (key) of the corresponding time-mapped activity.

<a id="bw_timex.timeline_builder.TimelineBuilder.candidate_databases_for_producers"></a>

#### candidate\_databases\_for\_producers

```python
def candidate_databases_for_producers(producers: set) -> dict
```

Map each producer to the static databases that hold a match for it.

Returns ``{producer_id: {date: database_name}}``. A candidate is a static
background database containing a node with the same ``(name, reference
product, location)`` as the producer. Several databases may share a date;
if two of them hold a match for the same producer, the model is ambiguous
and this raises.

As a side effect, ``self.market_producer_matches`` is filled with
``{producer_id: {database_name: node_id}}``, which is exactly what
``TimexLCA.add_interdatabase_activity_mapping_from_timeline`` needs.

<a id="bw_timex.timeline_builder.TimelineBuilder.add_column_temporal_market_shares_to_timeline"></a>

#### add\_column\_temporal\_market\_shares\_to\_timeline

```python
def add_column_temporal_market_shares_to_timeline(
        tl_df: pd.DataFrame,
        interpolation_type: str = "linear") -> pd.DataFrame
```

Add a column to a timeline with the weights for an interpolation between
the two nearest dates, from the list of dates of the available databases.

Parameters
----------
tl_df: pd.DataFrame
    Timeline as a DataFrame.
interpolation_type: str, optional
    Type of interpolation between the nearest lower and higher dates.
    Available options: "linear" and "nearest", defaulting to "linear".

Returns
-------
pd.DataFrame
    Timeline as a DataFrame with a column 'temporal_market_shares' added,
    this column looks like {database_name: weight, database_name: weight}.

<a id="bw_timex.timeline_builder.TimelineBuilder.find_closest_date"></a>

#### find\_closest\_date

```python
def find_closest_date(target: datetime, dates: tuple[datetime, ...]) -> dict
```

Find the closest date to the target in the dates list.

Parameters
----------
target : datetime.datetime
    Target datetime object.
dates : KeysView[datetime]
    List of datetime.datetime objects.

Returns
-------
dict
    Dictionary with the key as the closest datetime.datetime object from the list and a value of 1.

<a id="bw_timex.timeline_builder.TimelineBuilder.get_weights_for_interpolation_between_nearest_years"></a>

#### get\_weights\_for\_interpolation\_between\_nearest\_years

```python
def get_weights_for_interpolation_between_nearest_years(
        reference_date: datetime,
        dates_list: tuple[datetime, ...],
        interpolation_type: str | None = None) -> dict
```

Find the nearest dates (lower and higher) for a given date from a list of dates
and calculate the interpolation weights based on temporal proximity.

Parameters
----------
reference_date : datetime
    Target date.
dates_list : KeysView[datetime]
    List of datetime objects representing the temporal representativeness of the available databases.
interpolation_type : str, optional
    Type of interpolation between the nearest lower and higher dates. For now, only "linear" is available.

Returns
-------
dict
    Dictionary with datetimes of the available closest databases as keys and the weights for interpolation as values.

<a id="bw_timex.timeline_builder.TimelineBuilder.get_consumer_name"></a>

#### get\_consumer\_name

```python
def get_consumer_name(idx: int) -> str
```

Returns the name of consumer node.
If consuming node is the functional unit, returns -1.

Parameters
----------
idx : int
    Id of node.

Returns
-------
str
    Name of the node or -1
