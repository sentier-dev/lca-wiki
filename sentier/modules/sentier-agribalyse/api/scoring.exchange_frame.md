**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.exchange_frame` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.exchange_frame cfg.yml > scoring.exchange_frame.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.exchange_frame"></a>

# scoring.exchange\_frame

``ExchangeFrame`` — long-form DataFrame of the linked exchange graph.

Schema (every row = one edge in the technosphere or biosphere)::

    output_id   int64    activity that owns this edge (the "from" node)
    input_id    int64    flow on the other end of this edge (the "to" node)
    amount      float64  signed exchange amount (per unit of output activity)
    edge_type   string   'production' | 'technosphere' | 'biosphere'
                         | 'substitution' | 'generic production' | ...
    is_biosphere bool    True iff input_id refers to a biosphere flow

Why long-form: every downstream builder (technosphere, biosphere, CF)
is a single pass + ``scipy.sparse.coo_matrix(...)`` from a 4-column
slice. No graph walk, no allocation, no SQLite. Pickling a parquet of
this frame is also the cheapest possible content-addressable cache key:
hash the parquet bytes once, key the matrices by that hash.

Compare with bw2data's editable graph: that one carries an Activity ⇆
Exchange ⇆ Activity object graph, an FTS5 search index, and a peewee
session that turns every read into a multifunctional-allocation
checkpoint. We don't need any of that to compute LCA scores.

<a id="scoring.exchange_frame.ExchangeFrame"></a>

## ExchangeFrame Objects

```python
@dataclass(frozen=True)
class ExchangeFrame()
```

Immutable wrapper around the long-form exchange table.

Validates schema once at construction. Every method returns a new
``ExchangeFrame`` (or a derived DataFrame) — never mutates the
underlying frame. This is what makes the data plane safe to share
across worker processes without locks: each worker can slice,
project, group; nothing they do can alter what another worker sees.

<a id="scoring.exchange_frame.ExchangeFrame.df"></a>

#### df

<a id="scoring.exchange_frame.ExchangeFrame.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__() -> None
```

<a id="scoring.exchange_frame.ExchangeFrame.production"></a>

#### production

```python
@property
def production() -> pd.DataFrame
```

Rows that define which activity produces which product.

<a id="scoring.exchange_frame.ExchangeFrame.technosphere"></a>

#### technosphere

```python
@property
def technosphere() -> pd.DataFrame
```

Production + technosphere consumption + substitution.

Everything that contributes to the technosphere matrix A.

<a id="scoring.exchange_frame.ExchangeFrame.biosphere"></a>

#### biosphere

```python
@property
def biosphere() -> pd.DataFrame
```

Rows feeding the biosphere matrix B.

<a id="scoring.exchange_frame.ExchangeFrame.n_rows"></a>

#### n\_rows

```python
@property
def n_rows() -> int
```

<a id="scoring.exchange_frame.ExchangeFrame.activities"></a>

#### activities

```python
@property
def activities() -> pd.Index
```

All distinct ``output_id`` values — one per activity column
of the technosphere.

<a id="scoring.exchange_frame.ExchangeFrame.products"></a>

#### products

```python
@property
def products() -> pd.Index
```

Distinct product ids — the inputs of production edges.

<a id="scoring.exchange_frame.ExchangeFrame.biosphere_flows"></a>

#### biosphere\_flows

```python
@property
def biosphere_flows() -> pd.Index
```

<a id="scoring.exchange_frame.ExchangeFrame.from_long"></a>

#### from\_long

```python
@classmethod
def from_long(cls, df: pd.DataFrame) -> ExchangeFrame
```

Coerce a partially-typed frame into the schema. The caller
is responsible for column presence; we only widen dtypes.
