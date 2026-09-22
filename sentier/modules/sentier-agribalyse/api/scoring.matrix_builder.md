**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.matrix_builder` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.matrix_builder cfg.yml > scoring.matrix_builder.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.matrix_builder"></a>

# scoring.matrix\_builder

``TechnosphereBuilder`` / ``BiosphereBuilder`` — pure DataFrame → CSR.

The builders take an :class:`~scoring.exchange_frame.ExchangeFrame` and
emit a sparse matrix plus the ``id → row/col`` dictionaries needed to
map a demand vector or a characterization vector back to integer
positions. No bw2data, no SQLite, no allocation.

Sign convention (matches Brightway / ``bw_processing``):

* Production edges contribute on the diagonal, positive: a 1-unit
  product output is encoded as ``A[product_row, activity_col] = +amount``.
* Technosphere consumption rows contribute negatively: a 1-unit input
  draw becomes ``A[input_row, activity_col] = -amount``.
* Substitution edges contribute *positively* — same sign as production.
  ``bw_simapro_csv`` (and AGB upstream) emit substitution amounts as
  positive numbers meaning "this activity displaces N units of the
  named product elsewhere"; the canonical bw_processing rule sets
  ``flip=False`` for substitution rows, so the matrix entry stays
  positive and the linear solve subtracts the avoided burden. Treating
  substitution as ``-amount`` (the original L4 implementation) flipped
  the credit into a debit and amplified upstream impacts — that was
  the dominant cause of the post-refactor score over-estimation.

Squareness is a precondition: the builder asserts
``len(product_id_to_row) == len(activity_id_to_col)`` before returning,
because ``bc.LCA`` would otherwise fall through to a least-squares
pseudo-solution whose impacts are physically meaningless. This is the
same invariant ``LciaScorer._assert_square_technosphere`` enforces at
the scoring boundary — but here we catch it earlier.

<a id="scoring.matrix_builder.BuiltMatrix"></a>

## BuiltMatrix Objects

```python
@dataclass(frozen=True)
class BuiltMatrix()
```

Result of one build pass — sparse CSR + id → index dicts.

<a id="scoring.matrix_builder.BuiltMatrix.matrix"></a>

#### matrix

<a id="scoring.matrix_builder.BuiltMatrix.row_id_to_idx"></a>

#### row\_id\_to\_idx

<a id="scoring.matrix_builder.BuiltMatrix.col_id_to_idx"></a>

#### col\_id\_to\_idx

<a id="scoring.matrix_builder.BuiltMatrix.shape"></a>

#### shape

```python
@property
def shape() -> tuple[int, int]
```

<a id="scoring.matrix_builder.TechnosphereBuilder"></a>

## TechnosphereBuilder Objects

```python
@dataclass(frozen=True)
class TechnosphereBuilder()
```

Builds the technosphere matrix A from production + consumption
edges. ``A`` is square: rows = products, cols = activities, and for
a square supply chain there is exactly one production edge per
activity (``A[i, i] > 0``).

Multifunctional activities (more production rows than activity
cols) MUST have been allocated upstream — the
:class:`~scoring.allocator.Allocator` is responsible for that. If
we receive an un-allocated frame, we raise rather than producing a
rank-deficient matrix.

<a id="scoring.matrix_builder.TechnosphereBuilder.build"></a>

#### build

```python
def build(frame: ExchangeFrame) -> BuiltMatrix
```

<a id="scoring.matrix_builder.BiosphereBuilder"></a>

## BiosphereBuilder Objects

```python
@dataclass(frozen=True)
class BiosphereBuilder()
```

Builds the biosphere matrix B. Rows = biosphere flows, cols =
activities. ``B[i, j]`` is the amount of biosphere flow ``i``
emitted (or consumed, if negative) per unit output of activity ``j``.

No squareness constraint here — B is rectangular by design (more
flows than activities, typically).

<a id="scoring.matrix_builder.BiosphereBuilder.build"></a>

#### build

```python
def build(frame: ExchangeFrame,
          col_id_to_idx: dict[int, int] | None = None) -> BuiltMatrix
```

Build B with columns indexed consistently with the technosphere.

``col_id_to_idx`` should be the technosphere's column map so the
product ``B @ supply`` is meaningful: ``supply`` comes out of
``A`` keyed by that column ordering. When omitted (e.g. unit
tests with no technosphere), we fall back to sorted-activities
which is fine in isolation but **not** combinable with a
separately-built A.

<a id="scoring.matrix_builder.CharacterizationBuilder"></a>

## CharacterizationBuilder Objects

```python
@dataclass(frozen=True)
class CharacterizationBuilder()
```

Builds a per-method characterization vector ``Q``.

For one method, ``Q`` is a 1×N row vector with one CF per
biosphere flow (and zeros for unmatched flows). The LCIA score is
``Q @ B @ supply``.

Input ``cf_df`` columns: ``flow_id (int)``, ``cf (float)``.

<a id="scoring.matrix_builder.CharacterizationBuilder.build"></a>

#### build

```python
def build(cf_df: pd.DataFrame, biosphere: BuiltMatrix) -> sp.csr_matrix
```
