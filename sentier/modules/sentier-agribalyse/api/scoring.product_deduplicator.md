**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.product_deduplicator` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.product_deduplicator cfg.yml > scoring.product_deduplicator.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.product_deduplicator"></a>

# scoring.product\_deduplicator

``ProductDeduplicator`` — one producer per product in the technosphere.

When AGB has multiple activities producing the same product (a common
artefact of orphan-product relinking, market activities, etc.), the
matrix becomes non-square: one product row but several activity columns
all claiming a positive diagonal in it. The pre-refactor pipeline solved
this with ``MatrixPurger`` (a fixed-point loop that deleted excess
producers from SQLite); this class is the SQL-free equivalent.

Choice rule: keep the producer with the smallest ``output_id``. The
hash-derived ``output_id`` is stable across runs, so the dedup is
deterministic and re-runnable. Discarded activities take their non-
production edges with them — no dangling rows.

Runs *after* ``Allocator`` so the synthetic activity ids produced by
multifunctional splits are visible. Multifunctional split itself does
not introduce new product duplicates: each synthetic activity produces
a distinct product.

<a id="scoring.product_deduplicator.ProductDeduplicator"></a>

## ProductDeduplicator Objects

```python
@dataclass(frozen=True)
class ProductDeduplicator()
```

Stateless. ``deduplicate(frame)`` returns a frame with at most
one producer per product; the smallest ``output_id`` wins.

<a id="scoring.product_deduplicator.ProductDeduplicator.deduplicate"></a>

#### deduplicate

```python
def deduplicate(frame: ExchangeFrame) -> ExchangeFrame
```
