**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.allocator` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.allocator cfg.yml > scoring.allocator.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.allocator"></a>

# scoring.allocator

``Allocator`` — split multifunctional activities into single-product
synthetic activities, deterministically and without bw2data.

What it replaces:

    bw2data.Database.process()  →  multifunctional.allocation strategies
                                →  DELETE FROM exchangedataset; INSERT ...

That code path is the single biggest reason scoring workers serialise
on the SQLite write lock. Brightway re-runs allocation on every read of
the technosphere matrix unless the on-disk processed zip is hot — and
nothing in the linker pipeline guarantees that the zip stays hot. This
class moves allocation upstream into a pure DataFrame transform so the
zip can be content-addressable and read-only.

Strategy: SimaPro / AGB activities carry an ``allocation_factor`` per
production edge (written by ``WasteTreatmentDummyFixer`` and friends).
For each multifunctional activity we:

1. Enumerate its production rows and read their factors.
2. Emit one synthetic activity per production row.
3. Scale the activity's consumption + biosphere edges by the
   allocation factor and assign them to the synthetic activity.

Determinism: synthetic activity ids are derived from the parent activity
id and the product id (``hash`` of the pair, taken modulo a large
prime). That means re-running the allocator on the same frame gives
the same ids — important for content-addressable caching of the
downstream ``ScoringPackage``.

Conservation: factors are normalised per parent activity so they sum
to 1.0 before scaling. The input scale is unspecified — SimaPro
``manual_allocation`` is conventionally in per-cent (sum 100), other
upstreams emit fractions (sum 1.0). Both are accepted; a sum of zero
or any NaN is treated as a configuration bug and raises rather than
silently dropping the activity from the technosphere. This mirrors
the legacy ``bw2data`` ``manual_allocation`` strategy, which divided
by the row sum without asserting a particular scale.

<a id="scoring.allocator.Allocator"></a>

## Allocator Objects

```python
@dataclass(frozen=True)
class Allocator()
```

Pure DataFrame allocator. Stateless — every call to ``allocate``
is independent of prior calls.

<a id="scoring.allocator.Allocator.allocate"></a>

#### allocate

```python
def allocate(frame: ExchangeFrame) -> ExchangeFrame
```

Split multifunctional activities; return only the frame.

Thin wrapper over :meth:`allocate_with_provenance` for callers
that don't need the synthetic-id provenance map.

<a id="scoring.allocator.Allocator.allocate_with_provenance"></a>

#### allocate\_with\_provenance

```python
def allocate_with_provenance(
        frame: ExchangeFrame
) -> tuple[ExchangeFrame, dict[int, tuple[int, int]]]
```

Allocate and also return the synthetic-activity provenance.

The provenance maps every synthetic ``output_id`` this call
minted to the ``(parent_activity_id, product_id)`` pair it was
derived from. Catalog builders use it to label synthetic columns
(whose ids are *not* ``flow_id_for((database, code))`` hashes and
therefore resolve against no source ``(database, code)``).
