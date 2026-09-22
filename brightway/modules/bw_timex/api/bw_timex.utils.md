**Generated API reference** · package `bw_timex` 1.4.0 · module `bw_timex.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_timex.utils cfg.yml > bw_timex.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_timex.utils"></a>

# bw\_timex.utils

<a id="bw_timex.utils.time_res_mapping_strftime"></a>

#### time\_res\_mapping\_strftime

<a id="bw_timex.utils.linear_interpolation_weights"></a>

#### linear\_interpolation\_weights

```python
def linear_interpolation_weights(date: datetime, sorted_dates: tuple) -> dict
```

Return ``{date: weight}`` linear-interpolation weights for ``date``.

``sorted_dates`` is an ascending tuple of the available (background-database)
dates. The weights are split between the two nearest bracketing dates,
proportional to temporal proximity. If ``date`` falls on or outside the
range of ``sorted_dates``, the single nearest in-range date gets weight 1.

Mirrors ``TimelineBuilder.get_weights_for_interpolation_between_nearest_years``
and is shared by both the timeline builder and the graph-traversal extractors.

<a id="bw_timex.utils.nearest_date_weight"></a>

#### nearest\_date\_weight

```python
def nearest_date_weight(date: datetime, sorted_dates: tuple) -> dict
```

Return ``{date: 1}`` for the single date in ``sorted_dates`` closest to
``date``.

``sorted_dates`` is an ascending tuple of available dates. Mirrors
``TimelineBuilder.find_closest_date`` and is shared by the timeline builder
and the graph-traversal extractors.

<a id="bw_timex.utils.get_reference_product_production_amount"></a>

#### get\_reference\_product\_production\_amount

```python
def get_reference_product_production_amount(node,
                                            *,
                                            reference_product=None,
                                            lca=None) -> float
```

Return a node's production amount in a paradigm-agnostic way.

Supports chimaera activities via ``rp_exchange`` and explicit process/product
setups via production exchanges.

<a id="bw_timex.utils.extract_date_as_integer"></a>

#### extract\_date\_as\_integer

```python
def extract_date_as_integer(dt_obj: datetime,
                            time_res: Optional[str] = "year") -> int
```

Converts a datetime object to an integer for a given temporal resolution `time_res`

Parameters
----------

dt_obj : Datetime object.
    Datetime object to be converted to an integer.

time_res : str, optional
    time resolution to be returned: year=YYYY, month=YYYYMM, day=YYYYMMDD, hour=YYYYMMDDHH

Returns
-------
date_as_integer : int
    Datetime object converted to an integer in the format of time_res

<a id="bw_timex.utils.extract_date_as_string"></a>

#### extract\_date\_as\_string

```python
def extract_date_as_string(timestamp: datetime, temporal_grouping: str) -> str
```

Extracts the grouping date as a string from a datetime object, based on the chosen temporal
grouping. E.g. for `temporal_grouping` = 'month', and `timestamp` = 2023-03-29T01:00:00, it
extracts the string '202303'.


Parameters
----------
timestamp : Datetime object
    Datetime object to be converted to a string.
temporal_grouping : str
    Temporal grouping for the date string. Options are: 'year', 'month', 'day', 'hour'


Returns
-------
date_as_string: str
    Date as a string in the format of the chosen temporal grouping.

<a id="bw_timex.utils.convert_date_string_to_datetime"></a>

#### convert\_date\_string\_to\_datetime

```python
@functools.lru_cache(maxsize=4096)
def convert_date_string_to_datetime(temporal_grouping,
                                    date_string) -> datetime
```

Converts the string of a date to datetime object.
e.g. for `temporal_grouping` = 'month', and `date_string` = '202303', it extracts 2023-03-01

Parameters
----------
temporal_grouping : str
    Temporal grouping for the date string. Options are: 'year', 'month', 'day', 'hour'
date_string : str
    Date as a string

Returns
-------
datetime
    Datetime object of the date string at the chosen temporal resolution.

<a id="bw_timex.utils.round_datetime"></a>

#### round\_datetime

```python
def round_datetime(date: datetime, resolution: str) -> datetime
```

Round a datetime object based on a given resolution

Parameters
----------
date : datetime
    datetime object to be rounded
resolution: str
    Temporal resolution to round the datetime object to. Options are: 'year', 'month', 'day' and
    'hour'.

Returns
-------
datetime
    rounded datetime object

<a id="bw_timex.utils.round_datetime_series_to_year"></a>

#### round\_datetime\_series\_to\_year

```python
def round_datetime_series_to_year(dates: pd.Series) -> pd.Series
```

Vectorized equivalent of ``round_datetime(..., resolution="year")`` for a Series.

Dates on/after July 1st round up to January 1st of the next year, otherwise
down to January 1st of the same year. Matches ``round_datetime`` exactly but
avoids the per-row Python ``apply``.

<a id="bw_timex.utils.add_flows_to_characterization_functions"></a>

#### add\_flows\_to\_characterization\_functions

```python
def add_flows_to_characterization_functions(
        flows: Union[str, List[str]],
        func: Callable,
        characterization_functions: Optional[dict] = None) -> dict
```

Add a new flow or a list of flows to the available characterization functions.

Parameters
----------
flows : Union[str, List[str]]
    Flow or list of flows to be added to the characterization function dictionary.
func : Callable
    Dynamic characterization function for flow.
characterization_functions : dict, optional
    Dictionary of flows and their corresponding characterization functions. Default is an empty
    dictionary.

Returns
-------
dict
    Updated characterization function dictionary with the new flow(s) and function(s).

<a id="bw_timex.utils.resolve_temporalized_node_name"></a>

#### resolve\_temporalized\_node\_name

```python
def resolve_temporalized_node_name(code: str) -> str
```

Getting the name of a node based on the code only.
Works for non-unique codes if the name is the same across all databases.

Parameters
----------
code: str
    Code of the node to resolve.

Returns
-------
str
    Name of the node.

<a id="bw_timex.utils.plot_characterized_inventory_as_waterfall"></a>

#### plot\_characterized\_inventory\_as\_waterfall

```python
def plot_characterized_inventory_as_waterfall(lca_obj,
                                              static_scores=None,
                                              prospective_scores=None,
                                              order_stacked_activities=None,
                                              xtick_interval=None)
```

Plot a stacked waterfall chart of characterized inventory data. As comparison,
static and prospective scores can be added. Only works for metric GWP at the moment.

Parameters
----------
lca_obj : TimexLCA
    LCA object with characterized inventory data.
static_scores : dict, optional
    Dictionary of static scores. Default is None.
prospective_scores : dict, optional
    Dictionary of prospective scores. Default is None.
order_stacked_activities : list, optional
    List of activities to order the stacked bars in the waterfall plot. Default is None.
xtick_interval : int, optional
    Label only every n-th time step, which keeps the axis readable when the inventory
    spans many of them. The `static` and `prospective` columns, if shown, keep their
    labels either way. Default is None, which labels every step.

Returns
-------
None
    plots the waterfall chart.

<a id="bw_timex.utils.get_exchange"></a>

#### get\_exchange

```python
def get_exchange(**kwargs) -> Exchange
```

Get an exchange from the database.

Parameters
----------
**kwargs :
    Arguments to specify an exchange.
        - input_node: Input node object
        - input_code: Input node code
        - input_database: Input node database
        - input_name: Input node name
        - input_location: Input node location (only used together with input_name)
        - input_product: Input node reference product (only used together with
          input_name)
        - output_node: Output node object
        - output_code: Output node code
        - output_database: Output node database
        - output_name: Output node name
        - output_location: Output node location (only used together with
          output_name)
        - output_product: Output node reference product (only used together with
          output_name)

Returns
-------
Exchange
    The exchange object matching the criteria.

Raises
------
MultipleResults
    If multiple exchanges (or, when searching by name, multiple nodes) match the
    criteria.
UnknownObject
    If no exchange (or, when searching by name, no node) matches the criteria.

<a id="bw_timex.utils.add_temporal_distribution_to_exchange"></a>

#### add\_temporal\_distribution\_to\_exchange

```python
def add_temporal_distribution_to_exchange(
        temporal_distribution: TemporalDistribution, **kwargs)
```

Adds a temporal distribution to an exchange specified by kwargs.

Parameters
----------
temporal_distribution : TemporalDistribution
    TemporalDistribution to be added to the exchange.
**kwargs :
    Arguments to specify an exchange (same as `get_exchange`).
        - input_node: Input node object
        - input_id: Input node database ID
        - input_code: Input node code
        - input_database: Input node database
        - input_name: Input node name
        - input_location: Input node location (only used together with input_name)
        - input_product: Input node reference product (only used together with
          input_name)
        - output_node: Output node object
        - output_id: Output node database ID
        - output_code: Output node code
        - output_database: Output node database
        - output_name: Output node name
        - output_location: Output node location (only used together with
          output_name)
        - output_product: Output node reference product (only used together with
          output_name)

Returns
-------
None
    The exchange is saved with the temporal distribution.

<a id="bw_timex.utils.add_temporal_evolution_to_exchange"></a>

#### add\_temporal\_evolution\_to\_exchange

```python
def add_temporal_evolution_to_exchange(
        temporal_evolution_factors: dict = None,
        temporal_evolution_amounts: dict = None,
        temporal_evolution_reference: str = "producer",
        **kwargs)
```

Add temporal evolution data to an exchange specified by kwargs.

Parameters
----------
temporal_evolution_factors : dict, optional
    Dictionary mapping datetime keys to scaling factors.
temporal_evolution_amounts : dict, optional
    Dictionary mapping datetime keys to absolute amounts.
temporal_evolution_reference : {"producer", "consumer"}, optional
    Whether temporal evolution is evaluated at producer or consumer timestamps.
**kwargs :
    Arguments to specify an exchange (same as get_exchange).

Returns
-------
None
    The exchange is saved with the temporal evolution data.

<a id="bw_timex.utils.interactive_td_widget"></a>

#### interactive\_td\_widget

```python
def interactive_td_widget()
```

Create an interactive ipywidget for drafting and visualizing temporal distributions and copying
them to the clipboard.

For use in jupyter notebooks.

Returns
-------
ipywidgets.VBox
    Interactive widget for drafting temporal distributions.

<a id="bw_timex.utils.get_temporal_evolution_factor"></a>

#### get\_temporal\_evolution\_factor

```python
def get_temporal_evolution_factor(temporal_evolution: dict,
                                  target_date: datetime) -> float
```

Linearly interpolate a scaling factor for a given date from a temporal evolution dict.

Parameters
----------
temporal_evolution : dict or None
    Dictionary mapping datetime keys to float scaling factors.
    If None or empty, returns 1.0 (no scaling).
target_date : datetime
    The calendar date to look up the factor for.

Returns
-------
float
    The interpolated scaling factor. Clamped to the nearest boundary
    value for dates outside the specified range.

<a id="bw_timex.utils.create_electric_vehicle_example"></a>

#### create\_electric\_vehicle\_example

```python
def create_electric_vehicle_example(
        background_database_name: str,
        foreground_database_name: str = "foreground",
        overwrite_existing: bool = False) -> None
```

Create a simple temporalized product system of an electric vehicle.

Parameters
----------
background_database_name : str
    The name of the background database.
foreground_database_name : str
    The name of the foreground database.

Returns
-------
None
    This function does not return a value, but creates a temporalized product system.
