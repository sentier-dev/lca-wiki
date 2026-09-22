**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `bw_export.correction_embedder` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_export.correction_embedder cfg.yml > bw_export.correction_embedder.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_export.correction_embedder"></a>

# bw\_export.correction\_embedder

``CorrectionEmbedder`` — fold per-activity corrections into the biosphere.

The bundle adds AWARE regional + consumption corrections as a per-method
row of shape ``(1, n_activities)`` applied to ``supply`` (see
``native_scorer``). A standard ``Q @ B @ supply`` cannot express that —
a per-flow CF is location-blind. We embed each correction as a synthetic
biosphere flow whose B-row equals the correction vector and whose CF is
``1.0`` in only that method's characterization. Then stock bw2calc
reproduces ``correction @ supply`` exactly.

Synthetic flow ids are allocated as small positive integers with an
explicit collision check against every existing id (real ids are 63-bit
SHA-256 hashes, so a small integer collision is astronomically unlikely
but we assert rather than assume).

<a id="bw_export.correction_embedder.EmbeddedInventory"></a>

## EmbeddedInventory Objects

```python
@dataclass(frozen=True)
class EmbeddedInventory()
```

Augmented matrices ready for datapackage emission.

``biosphere`` is the original B stacked with one extra row per
corrected method. ``method_cfs`` maps each method tuple to a
``{flow_id: cf}`` dict (real CFs from Q plus the synthetic CF=1.0).

<a id="bw_export.correction_embedder.EmbeddedInventory.technosphere"></a>

#### technosphere

<a id="bw_export.correction_embedder.EmbeddedInventory.technosphere_row_id_to_idx"></a>

#### technosphere\_row\_id\_to\_idx

<a id="bw_export.correction_embedder.EmbeddedInventory.technosphere_col_id_to_idx"></a>

#### technosphere\_col\_id\_to\_idx

<a id="bw_export.correction_embedder.EmbeddedInventory.biosphere"></a>

#### biosphere

<a id="bw_export.correction_embedder.EmbeddedInventory.biosphere_row_id_to_idx"></a>

#### biosphere\_row\_id\_to\_idx

<a id="bw_export.correction_embedder.EmbeddedInventory.method_cfs"></a>

#### method\_cfs

<a id="bw_export.correction_embedder.EmbeddedInventory.synthetic_flow_ids"></a>

#### synthetic\_flow\_ids

<a id="bw_export.correction_embedder.CorrectionEmbedder"></a>

## CorrectionEmbedder Objects

```python
@dataclass(frozen=True)
class CorrectionEmbedder()
```

Stateless. ``embed(package)`` returns an :class:`EmbeddedInventory`.

<a id="bw_export.correction_embedder.CorrectionEmbedder.embed"></a>

#### embed

```python
def embed(package: ScoringPackage) -> EmbeddedInventory
```
