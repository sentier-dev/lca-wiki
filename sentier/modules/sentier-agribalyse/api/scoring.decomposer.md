**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.decomposer` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-agribalyse repo && git -C repo checkout 3d0df56
SP=repo/src
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
  -I "$SP" -m scoring.decomposer cfg.yml > scoring.decomposer.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.decomposer"></a>

# scoring.decomposer

``ScoreDecomposer`` — explain why a product scores what it scores.

The native scorer answers ``what is the score?``; this class answers
``where does the score come from?``. Given a product key and a method,
it factors the canonical LCIA expression

.. math::

    \text{score} = Q B A^{-1} d

into three labelled tables that all sum back to the same scalar:

* :attr:`Decomposition.flow_contributions` — one row per characterised
  biosphere flow row in :math:`B`. Carries the inventory amount
  (``B @ supply`` for that flow), the CF, and ``cf * inventory`` as the
  per-flow contribution.
* :attr:`Decomposition.activity_contributions` — one row per non-zero
  ``supply[j]`` column. The contribution is ``(Q @ B)[j] * supply[j]``,
  i.e. how much the score moves if this single activity disappears
  from the supply chain.
* :attr:`Decomposition.edge_contributions` — one row per
  ``(flow, activity)`` pair where ``B[i, j] != 0`` and ``Q[i] != 0`` and
  ``supply[j] != 0``. Contribution is ``Q[i] * B[i, j] * supply[j]``.
  Use this to find ``which kg of CO2 from which activity is dominating
  the score?``

By design the decomposer is **read-only** — it does not modify the
package or the catalogs. It is built once per ``ScoringPackage`` and
``ProductCatalog`` and reused across products and methods, with the
LU factorisation cached on the underlying ``NativeLciaScorer``.

The biosphere catalog is required only to label rows by name and
sub-compartment; passing an empty DataFrame still produces correct
numbers but the ``flow_name`` / ``sub_compartment`` columns will be
filled with the bare flow id.

Construction is intentionally not lazy — pass instantiated
``ScoringPackage``, ``ProductCatalog``, and biosphere catalog
DataFrame so all I/O happens at the boundary and the decomposer
itself stays a pure (matrix → frame) function.

<a id="scoring.decomposer.Decomposition"></a>

## Decomposition Objects

```python
@dataclass(frozen=True)
class Decomposition()
```

Result of one ``decompose(product, method)`` call.

:attr:`score` matches :class:`~scoring.native_scorer.NativeLciaScorer`:
it is ``(Q @ inventory) + (correction @ supply)`` so regionalised
methods (water-use, ecotoxicity) reconcile with the backtest CSV.
:attr:`global_score` exposes the un-corrected ``Q @ inventory`` part
and :attr:`correction_score` the per-activity adjustment, so callers
can see what the regional correction shifted the number by.

The three contribution frames sum within float tolerance to
:attr:`global_score` for the flow / edge views (which only know
about the global ``Q`` row) and to :attr:`score` for the activity
view (which folds the correction into its ``contribution`` column).

<a id="scoring.decomposer.Decomposition.product_key"></a>

#### product\_key

<a id="scoring.decomposer.Decomposition.method"></a>

#### method

<a id="scoring.decomposer.Decomposition.score"></a>

#### score

<a id="scoring.decomposer.Decomposition.flow_contributions"></a>

#### flow\_contributions

<a id="scoring.decomposer.Decomposition.activity_contributions"></a>

#### activity\_contributions

<a id="scoring.decomposer.Decomposition.edge_contributions"></a>

#### edge\_contributions

<a id="scoring.decomposer.Decomposition.global_score"></a>

#### global\_score

<a id="scoring.decomposer.Decomposition.correction_score"></a>

#### correction\_score

<a id="scoring.decomposer.ScoreDecomposer"></a>

## ScoreDecomposer Objects

```python
@dataclass(frozen=True)
class ScoreDecomposer()
```

Decompose ``Q @ B @ A^{-1} @ d`` into per-flow / per-activity / per-edge contributions.

``package`` carries the matrices and id maps. ``product_catalog``
resolves a ``(database, code)`` request into the integer
``product_id`` that lives in the technosphere row map. The
biosphere and ecoinvent catalogs supply human-readable names for
the resulting tables; without them the decomposer still works but
the labels collapse to bare integer ids.

<a id="scoring.decomposer.ScoreDecomposer.package"></a>

#### package

<a id="scoring.decomposer.ScoreDecomposer.product_catalog"></a>

#### product\_catalog

<a id="scoring.decomposer.ScoreDecomposer.biosphere_catalog"></a>

#### biosphere\_catalog

<a id="scoring.decomposer.ScoreDecomposer.ecoinvent_catalog"></a>

#### ecoinvent\_catalog

<a id="scoring.decomposer.ScoreDecomposer.use_pardiso"></a>

#### use\_pardiso

<a id="scoring.decomposer.ScoreDecomposer.decompose"></a>

#### decompose

```python
def decompose(product_key: tuple[str, str],
              method: tuple[str, ...],
              *,
              top_n: int | None = None,
              flow_only: bool = False) -> Decomposition
```

Decompose the score for *product_key* under *method*.

``top_n`` truncates each contribution table to the *N* rows
with largest ``|contribution|``. ``None`` (default) keeps all
non-zero contributions.

``flow_only=True`` skips the activity and edge contribution
frames (they remain as empty DataFrames in the returned
:class:`Decomposition`). Use for batch flow-only callers like
:class:`reporting.flow_decomposition.FlowDecompositionEmitter`
where the edge view's per-flow × per-activity iteration is the
dominant cost.

<a id="scoring.decomposer.ScoreDecomposer.decompose_methods"></a>

#### decompose\_methods

```python
def decompose_methods(
        product_key: tuple[str, str],
        methods: list[tuple[str, ...]],
        *,
        top_n: int | None = None,
        flow_only: bool = False) -> dict[tuple[str, ...], Decomposition]
```

Decompose *product_key* under every method in *methods*.

Solves ``A^{-1} d`` once for the product and projects against
each method's ``Q`` row — same numeric result as 19 calls to
:meth:`decompose` but ~10× faster on the agribalyse matrix
where the linear solve dominates per-method projection.

Returns a ``{method_tuple → Decomposition}`` mapping. Methods
absent from ``package.methods`` are silently dropped (callers
like ``FlowDecompositionEmitter`` already log them upstream).

<a id="scoring.decomposer.ScoreDecomposer.inventory"></a>

#### inventory

```python
def inventory(product_key: tuple[str, str],
              *,
              method: tuple[str, ...] | None = None,
              top_n: int | None = None,
              nonzero_only: bool = True) -> pd.DataFrame
```

Return the full ``B @ supply`` inventory vector as a DataFrame.

One row per biosphere flow with ``inventory_amount != 0``.
When *method* is given the CF column is filled in from that
method's characterisation row (zero where uncharacterised), so
the caller can spot flows that are emitted but not scored —
the canonical signature of "right amount, wrong sub-compartment
in bio3 catalog so CF lookup misses".
