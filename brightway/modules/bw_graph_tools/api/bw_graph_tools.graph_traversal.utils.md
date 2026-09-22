**Generated API reference** · package `bw_graph_tools` 0.10 · module `bw_graph_tools.graph_traversal.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_graph_tools==0.10'
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
  -I "$SP" -m bw_graph_tools.graph_traversal.utils cfg.yml > bw_graph_tools.graph_traversal.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_graph_tools.graph_traversal.utils"></a>

# bw\_graph\_tools.graph\_traversal.utils

<a id="bw_graph_tools.graph_traversal.utils.CachingSolver"></a>

## CachingSolver Objects

```python
class CachingSolver()
```

Class which caches cumulative LCA scores during graph traversal.

``_score_cache`` stores per-unit *cumulative LCA scores* (scalars) keyed by product index.
The graph traversal only needs cumulative scores, not full supply vectors, so the batched
``scores`` method solves for several products at once following the same strategy as
``bw2calc.FastSupplyArraysMixin``:

* With PARDISO (``pypardiso``), all requested products are solved in a single
  multi-right-hand-side ``spsolve`` call, which reuses the cached factorization and is much
  faster than solving one product at a time.
* Otherwise (UMFPACK / SuperLU), a single multi-right-hand-side solve is *slower* than reusing
  a cached factorization, so the LCA's technosphere matrix is decomposed once (via
  ``decompose_technosphere``) and each product is solved iteratively through ``lca.solver``.

<a id="bw_graph_tools.graph_traversal.utils.CachingSolver.__init__"></a>

#### \_\_init\_\_

```python
def __init__(lca: LCA)
```

<a id="bw_graph_tools.graph_traversal.utils.CachingSolver.in_cache"></a>

#### in\_cache

```python
def in_cache(indices: set[int]) -> set[int]
```

Return all `indices` values which already have a cached score.

<a id="bw_graph_tools.graph_traversal.utils.CachingSolver.add_to_cache"></a>

#### add\_to\_cache

```python
def add_to_cache(index: int, unit_score: float) -> None
```

Store a pre-computed per-unit cumulative score (for a demand amount of 1).

<a id="bw_graph_tools.graph_traversal.utils.CachingSolver.set_score_row"></a>

#### set\_score\_row

```python
def set_score_row(characterized_biosphere: spmatrix) -> None
```

Pre-compute the per-activity score row used to reduce supply vectors to scores.

``characterized_biosphere`` is the characterization-times-biosphere matrix (biosphere
flows by activities). Its column sums give, for each activity, the cumulative score per
unit of supply, so that ``score_row @ supply`` equals
``(characterized_biosphere * supply).sum()``.

<a id="bw_graph_tools.graph_traversal.utils.CachingSolver.scores"></a>

#### scores

```python
def scores(indices: list[int], amounts: list[float]) -> list[float]
```

Compute cumulative LCA scores for several products in a single batched solve.

Parameters
----------
indices : list[int]
    Product (technosphere row) indices to demand, one unit each.
amounts : list[float]
    Demanded amount for each product index, in the same order.

Returns
-------
list[float]
    Cumulative LCA score for each `(index, amount)` pair, in input order.

<a id="bw_graph_tools.graph_traversal.utils.Counter"></a>

## Counter Objects

```python
class Counter()
```

Custom counter to have easy access to current value

<a id="bw_graph_tools.graph_traversal.utils.Counter.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="bw_graph_tools.graph_traversal.utils.Counter.__next__"></a>

#### \_\_next\_\_

```python
def __next__()
```

<a id="bw_graph_tools.graph_traversal.utils.Counter.__gt__"></a>

#### \_\_gt\_\_

```python
def __gt__(other)
```

<a id="bw_graph_tools.graph_traversal.utils.get_demand_vector_for_activity"></a>

#### get\_demand\_vector\_for\_activity

```python
def get_demand_vector_for_activity(
        node: Node, skip_coproducts: bool,
        matrix: spmatrix) -> (list[int], list[float])
```

Get input matrix indices and amounts for a given activity. Ignores the reference production
exchanges and optionally other co-production exchanges.

Parameters
----------
node : `Node`
    Activity whose inputs we are iterating over
skip_coproducts : bool
    Whether or not to ignore positive production exchanges other than the reference
    product, which is always ignored
matrix : scipy.sparse.spmatrix
    Technosphere matrix

Returns
-------

row indices : list
    Integer row indices for products consumed by `Node`
amounts : list
    The amount of each product consumed, scaled to `Node.supply_amount`. Same order as row
    indices.
