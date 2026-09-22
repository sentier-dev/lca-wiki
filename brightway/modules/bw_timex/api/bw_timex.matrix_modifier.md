**Generated API reference** · package `bw_timex` 1.4.0 · module `bw_timex.matrix_modifier` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_timex.matrix_modifier cfg.yml > bw_timex.matrix_modifier.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_timex.matrix_modifier"></a>

# bw\_timex.matrix\_modifier

<a id="bw_timex.matrix_modifier.MatrixModifier"></a>

## MatrixModifier Objects

```python
class MatrixModifier()
```

Class for adding and re-linking time-explicit processes in the LCA matrices.

This is done by creating datapackages that add or change matrix entries in the technosphere and
biosphere matrices, based on a process timeline (from TimelineBuilder.build_timeline()).
"Temporal markets" are created for processes that are linked to background databases, temporally
distributing the amounts to time-explicit background databases.

<a id="bw_timex.matrix_modifier.MatrixModifier.__init__"></a>

#### \_\_init\_\_

```python
def __init__(timeline: pd.DataFrame,
             database_dates_static: dict,
             demand_timing: dict,
             nodes: dict,
             interdatabase_activity_mapping: InterDatabaseMapping,
             name: Optional[str] = None) -> None
```

Initializes the MatrixModifier object and creates empty sets to collect
the ids of temporalized processes and temporal markets.

Parameters
----------
timeline : pd.DataFrame
    A DataFrame of the timeline of exchanges
database_dates_static : dict
    A dictionary mapping the static background databases to dates.
demand_timing : dict
    A dictionary mapping the demand to its timing.
name : str, optional
    An optional name for the MatrixModifier instance. Default is None.

<a id="bw_timex.matrix_modifier.MatrixModifier.create_datapackage"></a>

#### create\_datapackage

```python
def create_datapackage() -> None
```

Creates a list of datapackages for the technosphere and biosphere matrices,
by calling the respective functions.

Returns
-------
list
    A list of the technosphere and biosphere datapackages.

<a id="bw_timex.matrix_modifier.MatrixModifier.create_technosphere_datapackage"></a>

#### create\_technosphere\_datapackage

```python
def create_technosphere_datapackage() -> bwp.Datapackage
```

Creates the modifications to the technosphere matrix in form of a datapackage.
Datapackages add or overwrite data points in the LCA matrices before LCA calculations.
The technosphere datapackage adds the temporalized processes from the timeline
to the technosphere matrix.

The heavy lifting of this method happens in the method `add_row_to_technosphere_datapackage()`.
Here, each node with a temporal distribution is "exploded", which means each occurrence
of this node (e.g. steel production on 2020-01-01 and steel production on 2015-01-01)
becomes a separate, time-explicit new node, by adding the new elements to the technosphere matrix.
For processes at the intersection with background databases, the timing of the exchanges
determines which background database to link to in so called "Temporal Markets".

Returns
-------
bwp.Datapackage
    A datapackage containing the modifications for the technosphere matrix.

<a id="bw_timex.matrix_modifier.MatrixModifier.create_biosphere_datapackage"></a>

#### create\_biosphere\_datapackage

```python
def create_biosphere_datapackage() -> bwp.Datapackage
```

Creates the modifications to the biosphere matrix in form of a datapackage.
Datapackages add or overwrite data points in the LCA matrices before LCA calculations.
It adds the biosphere flows to the exploded technosphere processes.

This function iterates over each unique producer, and for each biosphere exchange
of the original activity, it creates a new biosphere exchange for the new "temporalized" node.

Temporal markets have no biosphere exchanges, as they only divide the amount of
a technosphere exchange between the different databases.

Returns
-------
bwp.Datapackage
    A datapackage containing the modifications for the biosphere matrix.

<a id="bw_timex.matrix_modifier.MatrixModifier.add_row_to_technosphere_datapackage"></a>

#### add\_row\_to\_technosphere\_datapackage

```python
def add_row_to_technosphere_datapackage(row: pd.core.frame,
                                        datapackage: bwp.Datapackage,
                                        new_nodes: set) -> None
```

This adds the modifications to the technosphere matrix for each time-dependent exchange
as datapackage elements to a given `bwp.Datapackage`.


Modifications include:

1) Exploded processes: new matrix elements for time-explicit consumer and time-explicit
producer, representing the temporal edge between them.

2) Temporal markets: new matrix entries for "temporal markets" and links to the producers
in temporally matching background databases. Processes in the background databases are
matched on name, reference product and location.

3) Diagonal entries: ones on the diagonal for new nodes.

This function also collects the ids of new nodes, temporalized nodes and temporal markets.

Parameters
----------
row : pd.core.frame
    A row of the timeline DataFrame representing an temporalized edge
datapackage : bwp.Datapackage
    Append to this datapackage, if available. Otherwise create a new datapackage.
new_nodes : set
    Set of tuples (node_id, production_amount) to which new node ids are added.

Returns
-------
None
    Adds elements for this edge to the bwp.Datapackage and stores the ids of new nodes, temporalized nodes and temporal markets.
