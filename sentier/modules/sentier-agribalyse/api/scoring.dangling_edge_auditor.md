**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.dangling_edge_auditor` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.dangling_edge_auditor cfg.yml > scoring.dangling_edge_auditor.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.dangling_edge_auditor"></a>

# scoring.dangling\_edge\_auditor

``DanglingEdgeAuditor`` — explain matrix drops one row at a time.

The matrix-emit path in ``LinkAllPipeline._emit_scoring_package`` has
three destruction points after the long-form frame is concatenated:

1. ``Allocator`` rewrites every ``output_id`` to a synthetic id derived
   from ``(activity_id, product_id)`` and drops activities that have no
   production row. The original (parent) ``output_id`` disappears from
   the column space.
2. ``ProductDeduplicator`` keeps only the smallest ``output_id``
   producer per product — every other producer is dropped, taking its
   non-production edges with it.
3. ``DanglingEdgePruner`` drops zero-amount production rows, self-loops,
   and consumer edges whose input has no producer.

This class snapshots the (activity, product) universe before each step,
attributes every missing producer / dangling product to the first stage
that dropped it, and writes ``dashboard/dangling_edges.parquet``. One
row per dropped activity or dangling-consumed product, with stage,
database, code, name, location, and (for products) the count of
consumer edges that referenced it before the pruner ran.

The auditor is read-only: it does not modify the frames it inspects.

<a id="scoring.dangling_edge_auditor.IdNameResolver"></a>

## IdNameResolver Objects

```python
@dataclass(frozen=True)
class IdNameResolver()
```

Reverse map from hashed ``(database, code)`` ids to metadata.

Built once per run from ``sp.data`` (covers AGB activities + every
exchange input referenced by an AGB process) and
``registry/ecoinvent_catalog.parquet`` (covers the ecoinvent supply
chain). Lookup returns ``database / code / name / location / type``;
falls back to ``(unknown)`` with the integer id as code when the
resolver has no entry — typically a synthetic activity id minted by
``Allocator``.

<a id="scoring.dangling_edge_auditor.IdNameResolver.by_id"></a>

#### by\_id

<a id="scoring.dangling_edge_auditor.IdNameResolver.from_sources"></a>

#### from\_sources

```python
@classmethod
def from_sources(cls, sp_data: Iterable[Mapping[str, Any]],
                 ei_catalog: pd.DataFrame) -> IdNameResolver
```

<a id="scoring.dangling_edge_auditor.IdNameResolver.lookup"></a>

#### lookup

```python
def lookup(id_: int) -> Mapping[str, str]
```

<a id="scoring.dangling_edge_auditor.FrameSnapshot"></a>

## FrameSnapshot Objects

```python
@dataclass(frozen=True)
class FrameSnapshot()
```

Activity and product universe at one pipeline stage.

Only positive-production rows (amount > 0) contribute, matching the
matrix builder's definition of "really produced".

<a id="scoring.dangling_edge_auditor.FrameSnapshot.stage"></a>

#### stage

<a id="scoring.dangling_edge_auditor.FrameSnapshot.activity_ids"></a>

#### activity\_ids

<a id="scoring.dangling_edge_auditor.FrameSnapshot.product_ids"></a>

#### product\_ids

<a id="scoring.dangling_edge_auditor.DanglingEdgeAuditor"></a>

## DanglingEdgeAuditor Objects

```python
@dataclass
class DanglingEdgeAuditor()
```

Stateful: accumulate per-stage snapshots, emit a parquet at the end.

<a id="scoring.dangling_edge_auditor.DanglingEdgeAuditor.resolver"></a>

#### resolver

<a id="scoring.dangling_edge_auditor.DanglingEdgeAuditor.snapshots"></a>

#### snapshots

<a id="scoring.dangling_edge_auditor.DanglingEdgeAuditor.consumer_edges"></a>

#### consumer\_edges

<a id="scoring.dangling_edge_auditor.DanglingEdgeAuditor.snapshot"></a>

#### snapshot

```python
def snapshot(stage: str, frame: ExchangeFrame) -> None
```

<a id="scoring.dangling_edge_auditor.DanglingEdgeAuditor.capture_consumer_edges"></a>

#### capture\_consumer\_edges

```python
def capture_consumer_edges(frame: ExchangeFrame) -> None
```

Snapshot the technosphere edges right before ``DanglingEdgePruner``.

<a id="scoring.dangling_edge_auditor.DanglingEdgeAuditor.write"></a>

#### write

```python
def write(out_path: Path) -> dict[str, Any]
```
