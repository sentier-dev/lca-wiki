**Generated API reference** · package `bw_timex` 1.4.0 · module `bw_timex.background_solver` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_timex.background_solver cfg.yml > bw_timex.background_solver.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_timex.background_solver"></a>

# bw\_timex.background\_solver

Per-block background solving with a supply-column cache.

`bw_timex.block_structure` finds the diagonal blocks of a time-explicit
technosphere. This module solves them: a unit demand for a background
activity is placed on its product row, solved within the owning block only,
and the resulting supply column - not the inventory matrix a naive
`redo_lci` would build - is what gets cached.

Caching supply columns instead of `B @ diag(x)` is the point of this module.
An inventory matrix is one column per activity in the technosphere times the
number of biosphere flows it touches; a supply column is one number per
background activity actually produced along the way. On a premise-sized
background that difference is the gap between ~5.5 MB and ~0.35 MB per
cached entry, and it is what keeps `lci()` from running out of memory.

Cache payloads are node-id keyed, not index keyed: a `(node_ids, values)`
pair of 1-D arrays holding only the nonzero entries, translated back into a
consuming solver's local index space with `np.searchsorted` over a sorted id
array. That indirection is what lets the *same* cache entry serve solvers
built over different lca_obj index spaces (different timelines, expand
modes, or - for the module-level `shared_cache` - different `TimexLCA`
objects in one session).

<a id="bw_timex.background_solver.DEFAULT_MAX_BATCH_BYTES"></a>

#### DEFAULT\_MAX\_BATCH\_BYTES

<a id="bw_timex.background_solver.UnitSupply"></a>

## UnitSupply Objects

```python
@dataclass(frozen=True, eq=False)
class UnitSupply()
```

A unit supply column, dense over every column of the technosphere.

An activity's own block can be a pure consumer - solved first, with no
footprint of its own - while its actual impact lives in a block further
down the chain that its demand cascades into (a small hand-modified
database referencing the real background it draws materials from, for
instance). So a unit demand is not confined to the block that owns the
requested activity: it is solved there, then propagated into every
later block (consumer-first order, so a later block can depend on an
earlier one but never the reverse) whose right-hand side comes out
nonzero as a result, and so on until nothing new is touched.

`touched_blocks` names which blocks actually received a solve, so a
caller (`unit_aggregate`) can multiply only those blocks' biosphere
columns instead of the full-width matrix.

<a id="bw_timex.background_solver.UnitSupply.values"></a>

#### values

<a id="bw_timex.background_solver.UnitSupply.touched_blocks"></a>

#### touched\_blocks

<a id="bw_timex.background_solver.BackgroundSolver"></a>

## BackgroundSolver Objects

```python
class BackgroundSolver()
```

Solves unit background LCIs block by block, caching supply columns.

Parameters
----------
technosphere_matrix
    The (square) technosphere matrix, in any scipy sparse format.
biosphere_matrix
    The biosphere matrix, rows are elementary flows, columns line up
    with `technosphere_matrix`'s columns.
activity_dict
    Maps activity/process node id -> technosphere column index (a
    `bw2calc` `ReversibleRemappableDictionary`, e.g. `lca.dicts.activity`).
product_dict
    Maps product node id -> technosphere row index
    (`lca.dicts.product`). A unit demand for a background activity is
    placed here, not on its column - this is how `bw2calc.LCA` builds a
    demand array.
biosphere_dict
    Maps biosphere flow node id -> biosphere matrix row index
    (`lca.dicts.biosphere`).
structure
    The `BlockStructure` describing how `technosphere_matrix` splits
    into diagonal blocks.
max_batch_bytes
    Budget for the two persistent dense buffers one batched cascade
    holds, in bytes; `chunk_size()` divides it to decide how many
    right-hand side columns `prepare()` may carry at once. See
    `DEFAULT_MAX_BATCH_BYTES` for what it does and does not cover.

Attributes
----------
allow_iterative : bool
    Whether blocks may be solved by Neumann series instead of an LU
    factorization. `backend_name` stays the fallback either way.
backend_name : str
    The LU backend this instance falls back to
    (`"pardiso"`, `"umfpack"` or `"superlu"`), chosen once in
    `__init__` by `solvers.select_backend`. Read it to find out what a
    run actually used; set `BW_TIMEX_BLOCK_SOLVER` to force it.

<a id="bw_timex.background_solver.BackgroundSolver.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*,
             technosphere_matrix,
             biosphere_matrix,
             activity_dict,
             product_dict,
             biosphere_dict,
             structure: BlockStructure,
             max_batch_bytes: int = DEFAULT_MAX_BATCH_BYTES,
             allow_iterative: bool = True) -> None
```

<a id="bw_timex.background_solver.BackgroundSolver.block_index_for"></a>

#### block\_index\_for

```python
def block_index_for(activity_id) -> int
```

The block that solving a unit demand for `activity_id` lands in.

<a id="bw_timex.background_solver.BackgroundSolver.unit_supply"></a>

#### unit\_supply

```python
def unit_supply(activity_id) -> UnitSupply
```

Unit supply column for `activity_id`, from cache or a fresh solve.

`values` is a fresh array on every call - callers are free to write
into it without disturbing the memo behind it.

<a id="bw_timex.background_solver.BackgroundSolver.unit_aggregate"></a>

#### unit\_aggregate

```python
def unit_aggregate(activity_id) -> np.ndarray
```

Unit LCI aggregated over biosphere rows: `B[:, cols] @ x`.

Dense, over *all* biosphere rows (not block-scoped, unlike
`unit_supply`) - a background LCI touches a small fraction of a
large biosphere, but which fraction depends on the activity, not
the block. A fresh array on every call, so callers may write into it.

<a id="bw_timex.background_solver.BackgroundSolver.aggregate_for_demand"></a>

#### aggregate\_for\_demand

```python
def aggregate_for_demand(demand: dict) -> np.ndarray
```

Biosphere aggregate of a *combined* demand `{activity_id: amount}`.

Equal to `sum(unit_aggregate(act) * amount)` by linearity, but reached
with one solve per block the demand touches instead of one per
activity. That is the whole point: a caller that has already summed
many timeline rows into one demand pays for the blocks, not the rows.

A temporal market interpolates between vintages living in different
background databases - different diagonal blocks - so a demand
routinely spans more than one, and each block is solved separately;
so can any block a seeded activity's demand cascades into further
downstream (see `_cascading_solve`), and those are included too.

Nothing is cached here. The demand is a sum specific to one caller's
grouping, so it has no stable identity to key on, unlike the per
activity unit LCIs of `unit_supply` / `unit_aggregate`.

<a id="bw_timex.background_solver.BackgroundSolver.solve_block"></a>

#### solve\_block

```python
def solve_block(block_index: int, rhs: np.ndarray) -> np.ndarray
```

Solve `A[block.rows][:, block.columns] x = rhs` for one block.

`rhs` is `(n_rows,)` or `(n_rows, k)`; the result matches its rank.
A block's solver is built on first use and kept in `_block_solvers`,
so every backend factorizes a given block at most once per instance -
except pardiso, whose factorization lives in MKL's single global slot
and is rebuilt whenever another block has been solved since. Callers
that will revisit blocks one right-hand side at a time ask for a
persistent factorization first, via `prepare_blocks`.

<a id="bw_timex.background_solver.BackgroundSolver.chunk_size"></a>

#### chunk\_size

```python
def chunk_size() -> int
```

How many right-hand sides one cascade may carry.

A cascade holds a dense `(n_columns, k)` supply AND a dense
`(n_biosphere_rows, k)` aggregate at the same time, so `k` is capped
against their combined per-column cost. At least one, or a batch
could never run.

`max_batch_bytes` bounds exactly those two persistent buffers, and
nothing else. While a block is being solved, the cascade also holds
`(n_block_rows, k)` transients - the cascade product, the negated
right-hand side, the sliced live columns, the returned solution - and
the backend may hold more of that shape internally (`pypardiso`
copies the matrix and keeps its own right-hand side and solution
arrays). Those are block-sized and transient rather than
accumulating, but a run's true peak is above this budget, not at it.

<a id="bw_timex.background_solver.BackgroundSolver.prepare"></a>

#### prepare

```python
def prepare(activity_ids, n_jobs: Optional[int] = None) -> None
```

Solve every uncached activity in `activity_ids`, in one batch.

Ids are counted by identity, not occurrence: callers collect them per
temporal market, and distinct markets of the same process demand the
very same background vintages, so repeats are the norm.

The batch is cut into chunks of `chunk_size()` and each chunk is one
`_cascading_solve` with that many right-hand side columns. Every
block a chunk reaches is therefore factorized once and solved for all
of its columns in a single call - on pardiso, one MKL analysis plus
one numeric factorization plus `k` triangular solves. Each chunk is
reduced to sparse cache payloads before the next is solved, so the two
persistent dense buffers stay inside `max_batch_bytes` (per-block
transients and solver-internal copies are on top of it - see
`chunk_size`).

Both the supply and the aggregate cache are filled, because the
aggregate is one `B[:, block.columns] @ chunk` matmul per touched
block rather than one per activity.

`n_jobs` is accepted for a future parallel implementation and
ignored here.

<a id="bw_timex.background_solver.BackgroundSolver.prepare_blocks"></a>

#### prepare\_blocks

```python
def prepare_blocks(block_indices) -> None
```

Pre-factorize every block that will be solved more than once.

The counterpart of `prepare` for callers that solve combined demands
(`aggregate_for_demand`) rather than per-activity unit LCIs: they know
which blocks they will hit and how often, but not which activities.

This is the access pattern a single global factorization slot is
worst at. Each grouped solve is one time step's demand, which
routinely spans several blocks (see `aggregate_for_demand`), so the
blocks are revisited in rotation with a separate right-hand side every
time. On pardiso that means MKL re-analyses and re-factorizes on every
hop - T time steps over B blocks costs T*B factorizations. So the
solver built here is a persistent one (`make_persistent_block_solver`)
regardless of the active backend: B factorizations, then triangular
solves. `prepare`'s batched path is untouched and still gets pardiso's
multi-RHS win, where one call carries every column of a chunk.

The `count > 1` guard is not vestigial. A block that the whole grouped
build solves exactly once gains nothing from a persistent LU - it
would be one factorization either way - and forcing SuperLU on it
would take that single solve away from a faster backend. Such a block
is left to `solve_block`, which builds the active backend's own solver
lazily.
