**Generated API reference** · package `bw_temporalis` 1.2.0 · module `bw_temporalis.timeline` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_temporalis==1.2.0'
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
  -I "$SP" -m bw_temporalis.timeline cfg.yml > bw_temporalis.timeline.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_temporalis.timeline"></a>

# bw\_temporalis.timeline

<a id="bw_temporalis.timeline.EmptyTimeline"></a>

## EmptyTimeline Objects

```python
class EmptyTimeline(Exception)
```

Operation on empty timeline

<a id="bw_temporalis.timeline.FlowTD"></a>

## FlowTD Objects

```python
@dataclass
class FlowTD()
```

Class for storing a temporal distribution associated with a flow and activity.

Attributes
----------
distribution : TemporalDistribution
flow : int
activity : int

See Also
--------
bw_temporalis.temporal_distribution.TemporalDistribution: A container for a series of values spread over time.

<a id="bw_temporalis.timeline.FlowTD.distribution"></a>

#### distribution

<a id="bw_temporalis.timeline.FlowTD.flow"></a>

#### flow

<a id="bw_temporalis.timeline.FlowTD.activity"></a>

#### activity

<a id="bw_temporalis.timeline.NodeTD"></a>

## NodeTD Objects

```python
@dataclass
class NodeTD()
```

Class for storing a temporal distribution associated only with an activity.

Attributes
----------
distribution : TemporalDistribution
flow : int. Only included for compatibility with `FlowTD`. Always -1.
activity : int
num_flows : int. Number of biosphere flow edges from this node.
num_flows_td : int. Number of biosphere flow edges from this node with temporal distributions.

See Also
--------
bw_temporalis.temporal_distribution.TemporalDistribution: A container for a series of values spread over time.

<a id="bw_temporalis.timeline.NodeTD.distribution"></a>

#### distribution

<a id="bw_temporalis.timeline.NodeTD.flow"></a>

#### flow

<a id="bw_temporalis.timeline.NodeTD.activity"></a>

#### activity

<a id="bw_temporalis.timeline.NodeTD.num_flows"></a>

#### num\_flows

<a id="bw_temporalis.timeline.NodeTD.num_flows_td"></a>

#### num\_flows\_td

<a id="bw_temporalis.timeline.Timeline"></a>

## Timeline Objects

```python
class Timeline()
```

Sum and group elements over time.
Timeline calculations produce a list of [(datetime, amount)] tuples.

Attributes
----------
self.data : list[FlowTD]

<a id="bw_temporalis.timeline.Timeline.__init__"></a>

#### \_\_init\_\_

```python
def __init__(data: list[FlowTD] | None = None)
```

<a id="bw_temporalis.timeline.Timeline.add_flow_temporal_distribution"></a>

#### add\_flow\_temporal\_distribution

```python
def add_flow_temporal_distribution(td: TemporalDistribution, flow: int,
                                   activity: int) -> None
```

Append a TemporalDistribution object to the Timeline.data object.

Parameters
----------
td : TemporalDistribution
    Temporal distribution to add.
flow : int
    Associated flow.
activity : int
    Associated activity.

See Also
--------
bw_temporalis.temporal_distribution.TemporalDistribution: A container for a series of values spread over time.

<a id="bw_temporalis.timeline.Timeline.add_node_temporal_distribution"></a>

#### add\_node\_temporal\_distribution

```python
def add_node_temporal_distribution(td: TemporalDistribution, activity: int,
                                   num_flows: int, num_flows_td: int) -> None
```

Append a TemporalDistribution object to the Timeline.data object.

Parameters
----------
td : TemporalDistribution
    Temporal distribution to add.
activity : int
    Associated activity.
num_flows : int
    Number of biosphere flow edges from this node.
num_flows_td : int
    Number of biosphere flow edges from this node with temporal distributions.

See Also
--------
bw_temporalis.temporal_distribution.TemporalDistribution: A container for a series of values spread over time.

<a id="bw_temporalis.timeline.Timeline.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```

<a id="bw_temporalis.timeline.Timeline.build_dataframe"></a>

#### build\_dataframe

```python
def build_dataframe() -> None
```

Build a Pandas DataFrame from the Timeline.data object and store it as a Timeline.pd object.

Returns
-------
None, creates class attribute Pandas DataFrame `df` with the following columns:
- date: datetime64[s]
- amount: float64
- flow: int
- activity: int

<a id="bw_temporalis.timeline.Timeline.characterize_dataframe"></a>

#### characterize\_dataframe

```python
def characterize_dataframe(characterization_function: Callable,
                           flow: set[int] | None = None,
                           activity: set[int] | None = None,
                           cumsum: bool | None = True) -> pd.DataFrame
```

Applies a characterization function to a Timeline Pandas DataFrame.

The characterization function is expected to take a row from the input Timeline of the form

| date | amount | flow | activity |
|-------|-------|------|----------|
| 101   | 33    | 1    | 2        |
| 312   | 21    | 4    | 2        |

and transform it for a given time period. The output for a very simple function could look like:

| date | amount | flow | activity |
|------|--------|------|----------|
| 101  | 33     | 1    | 2        |
| 102  | 31     | 1    | 2        |
| 103  | 31     | 1    | 2        |
| 312  | 21     | 4    | 2        |
| 313  | 20     | 4    | 2        |
| 314  | 19     | 4    | 2        |

Each row of the input Timeline corresponds to a single day (`date`) and the associated value (`amount`).
The `characterization_function` is applied to each row of the input Timeline for a given `period` of days.
The new rows are appended to the Timeline Pandas DataFrame.

Parameters
----------
characterization_function : Callable
    Characterization function to apply to the values Timeline Pandas DataFrame.
period : int
    Period in days.
flow : int
activity : int

Returns
-------
A Pandas DataFrame with the following columns:
- date: datetime64[s]
- amount: float64
- flow: int
- activity: int

<a id="bw_temporalis.timeline.Timeline.sum_days_to_years"></a>

#### sum\_days\_to\_years

```python
def sum_days_to_years() -> pd.DataFrame
```

Sums the day-resolution `amount` of the Timeline Pandas DataFrame to years.

An input Timeline of the form

| date | amount | flow | activity |
|------|--------|------|----------|
| 101  | 33     | 1    | 2        |
| 102  | 32     | 1    | 2        |
| 103  | 31     | 1    | 2        |
| 412  | 21     | 4    | 2        |
| 413  | 20     | 4    | 2        |
| 514  | 19     | 4    | 2        |

is transformed into

| year | amount | flow | activity |
|------|--------|------|----------|
| 1    | 96     | 1    | 2        |
| 2    | 60     | 4    | 2        |

Returns
-------
A Pandas DataFrame with the following columns:
- year: int
- amount: float64
- flow: int
- activity: int

<a id="bw_temporalis.timeline.Timeline.add_metadata_to_dataframe"></a>

#### add\_metadata\_to\_dataframe

```python
def add_metadata_to_dataframe(
    database_labels: list[str],
    fields: List[str] = ["name", "unit", "location", "categories"]
) -> pd.DataFrame
```

Add additional columns with metadata to the dataframe. Returns a new dataframe.

Parameters
----------
database_labels : list[str]
    List of all databases to load and add metadata from
fields : list[str]
    Metadata fields to add.
