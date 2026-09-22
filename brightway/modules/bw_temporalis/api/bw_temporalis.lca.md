**Generated API reference** · package `bw_temporalis` 1.2.0 · module `bw_temporalis.lca` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_temporalis.lca cfg.yml > bw_temporalis.lca.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_temporalis.lca"></a>

# bw\_temporalis.lca

<a id="bw_temporalis.lca.MultipleTechnosphereExchanges"></a>

## MultipleTechnosphereExchanges Objects

```python
class MultipleTechnosphereExchanges(Exception)
```

<a id="bw_temporalis.lca.NoExchange"></a>

## NoExchange Objects

```python
class NoExchange()
```

The edge was created dynamically via a datapackage. There is no edge in the database.

<a id="bw_temporalis.lca.TemporalisLCA"></a>

## TemporalisLCA Objects

```python
class TemporalisLCA()
```

Calculate an LCA using graph traversal, with edges using temporal distributions.

Edges with temporal distributions should store this information using `"temporal_distributions"`:

```python
    exchange["temporal_distribution"] = bw_temporalis.TemporalDistribution(
        times=numpy.array([-2, -1, 0, 1, 2], dtype="timedelta64[s]"),
        values=numpy.ones(5)
    )
```

Temporal distribution times must always have the data type `timedelta64[s]`. Not all edges need to have temporal distributions.

Temporal distributions are **not density functions** - their values should sum to the exchange amount.

As graph traversal is much slower than matrix calculations, we can limit which nodes get traversed in several ways:

* All activities in a database marked as `static`
* Any activity ids passed in `static_activity_indices`
* Any activities whose cumulative impact is below the cutoff score

The output of a Temporalis LCA calculation is a `bw_temporalis.Timeline`, which can be characterized.

Parameters
----------
lca_object : bw2calc.LCA
    The already instantiated and calculated LCA class (i.e. `.lci()` and `.lcia()` have already been done)
starting_datetime : datetime.datetime | str
    When the functional unit happens. Must be a point in time. Normally something like `"now"` or `"2023-01-01"`.
cutoff : float
    The fraction of the total score below which graph traversal should stop. In range `(0, 1)`.
biosphere_cutoff : float
    The fraction of the total score below which we don't include separate biosphere nodes to be characterized in the `Timeline`. In range `(0, 1)`.
max_calc : int
    Total number of LCA inventory calculations to perform during graph traversal
static_activity_indices : set[int]
    Activity database node `id` values where graph traversal will stop
skip_coproducts : bool
    Should we also traverse edges for the other products in multioutput activities?
functional_unit_unique_id : int
    The unique id of the functional unit. Strongly recommended to leave as default.
graph_traversal : bw_graph_tools.NewNodeEachVisitGraphTraversal
    Optional subclass of `NewNodeEachVisitGraphTraversal` for advanced usage

<a id="bw_temporalis.lca.TemporalisLCA.__init__"></a>

#### \_\_init\_\_

```python
def __init__(lca_object: LCA,
             starting_datetime: datetime | str = "now",
             cutoff: float | None = 5e-4,
             biosphere_cutoff: float | None = 1e-6,
             max_calc: int | None = 2000,
             static_activity_indices: set[int] | None = None,
             skip_coproducts: bool | None = False,
             functional_unit_unique_id: int | None = -1,
             graph_traversal: (NewNodeEachVisitGraphTraversal
                               | None) = NewNodeEachVisitGraphTraversal)
```

<a id="bw_temporalis.lca.TemporalisLCA.build_timeline"></a>

#### build\_timeline

```python
def build_timeline(node_timeline: bool | None = False) -> Timeline
```

<a id="bw_temporalis.lca.TemporalisLCA.get_biosphere_exchanges"></a>

#### get\_biosphere\_exchanges

```python
def get_biosphere_exchanges(flow_id: int, activity_id: int) -> Iterable[ED]
```

<a id="bw_temporalis.lca.TemporalisLCA.get_technosphere_exchange"></a>

#### get\_technosphere\_exchange

```python
def get_technosphere_exchange(input_id: int, output_id: int) -> ED
```
