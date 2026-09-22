**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.eaternity.inference_review` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-importers repo && git -C repo checkout dac2e67
SP=repo/app
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
  -I "$SP" -m sentier_importers.sources.eaternity.inference_review cfg.yml > sentier_importers.sources.eaternity.inference_review.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.eaternity.inference_review"></a>

# sentier\_importers.sources.eaternity.inference\_review

Review sidecar for the inferred ``bafu-2026-v1 -> ef-3.1`` bridge.

Same inputs and computation as :mod:`mappings_biosphere`; emits the pairs that were
withheld, one row per BAFU flow (or unresolved Eaternity target) with a ``reason``:
``target_unresolved``, ``uncharacterised``, ``compartment_mismatch``,
``no_cf_compatible_ef_flow``, ``superset_candidates_disagree``. Emitted as
``inference_review.json`` with the package verb ``review`` — a non-normative sidecar
in the shape of the other ``*_review.json`` files in sentier-mappings, invisible to
its CI validator by design.

<a id="sentier_importers.sources.eaternity.inference_review.EaternityInferenceReviewSource"></a>

## EaternityInferenceReviewSource Objects

```python
class EaternityInferenceReviewSource(EaternityInferredBafuEfSource)
```

Emit the withheld pairs instead of the entries.

<a id="sentier_importers.sources.eaternity.inference_review.EaternityInferenceReviewSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
