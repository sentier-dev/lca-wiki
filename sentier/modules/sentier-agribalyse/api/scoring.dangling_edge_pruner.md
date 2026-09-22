**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.dangling_edge_pruner` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.dangling_edge_pruner cfg.yml > scoring.dangling_edge_pruner.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.dangling_edge_pruner"></a>

# scoring.dangling\_edge\_pruner

``DanglingEdgePruner`` — drop technosphere edges with no producer.

A consumption edge that references a product no activity produces ends
up as a NaN row index in the technosphere matrix builder; ``bw2calc``
or ``scipy.sparse.linalg.spsolve`` then fail with
``LinAlgError: Factor is exactly singular`` (or worse, NaNs that
silently propagate). The pre-refactor pipeline solved this with
``MatrixPurger._orphan_products`` — a fixed-point loop that deleted
product rows with no positive diagonal. This class is the SQL-free
equivalent: drop the consumption edges whose ``input_id`` isn't in
the production set, log the count, return a clean frame.

The pruner runs *after* ``Allocator`` and ``ProductDeduplicator`` so
it sees the final activity / product universe. It deliberately does
NOT touch biosphere edges — biosphere flows aren't in the
technosphere row map and have their own (rectangular) matrix B.

<a id="scoring.dangling_edge_pruner.DanglingEdgePruner"></a>

## DanglingEdgePruner Objects

```python
@dataclass(frozen=True)
class DanglingEdgePruner()
```

Stateless. ``prune(frame)`` returns a frame with no dangling
technosphere edges plus a stats dict summarising what was dropped.

<a id="scoring.dangling_edge_pruner.DanglingEdgePruner.prune"></a>

#### prune

```python
def prune(frame: ExchangeFrame) -> tuple[ExchangeFrame, dict[str, int]]
```
