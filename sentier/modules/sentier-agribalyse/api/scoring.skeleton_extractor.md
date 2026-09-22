**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.skeleton_extractor` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.skeleton_extractor cfg.yml > scoring.skeleton_extractor.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.skeleton_extractor"></a>

# scoring.skeleton\_extractor

``SkeletonExtractor`` — produce the AGB-only scoring-package skeleton
shipped in ``sentier_agribalyse-bundle``.

BUNDLE.md §7 calls this out as the riskiest part of the bundling
pipeline. The extractor:

1. Reads an existing content-addressed scoring package
   (``cache/scoring_packages/<hash>/``).
2. Identifies which technosphere columns correspond to ecoinvent
   activities by hashing every (database, code) row of
   ``registry/ecoinvent_catalog.parquet`` through
   :meth:`ExchangeFrameBuilder.flow_id_for` and matching against the
   ``technosphere_col_id_to_idx`` map in ``ids.json``.
3. Zeros those columns in both the technosphere and the biosphere CSR
   matrices.
4. Leaves the characterization vectors and the corrections rows
   untouched — CFs are per-biosphere-flow (not per-activity), and the
   correction rows for ecoinvent cols are still licence-clean because
   they encode our derived per-activity correction, not ecoinvent's
   own exchange values.
5. Writes the AGB skeleton to ``<output_root>/<hash>/`` and emits
   ``ecoinvent_slot_index.parquet`` so the customer-side filler knows
   which col_idx ↔ ecoinvent activity to refill.

The output directory mirrors :class:`ScoringPackageStore`'s on-disk
layout — the runtime never has to know it loaded a skeleton vs a
fully-populated package.

<a id="scoring.skeleton_extractor.SkeletonExtractor"></a>

## SkeletonExtractor Objects

```python
@dataclass(frozen=True)
class SkeletonExtractor()
```

Strip ecoinvent IP out of a built scoring package, leaving an
AGB-only skeleton plus a slot-index for the customer-side filler.

<a id="scoring.skeleton_extractor.SkeletonExtractor.ECOINVENT_DATABASE"></a>

#### ECOINVENT\_DATABASE

<a id="scoring.skeleton_extractor.SkeletonExtractor.ecoinvent_catalog_path"></a>

#### ecoinvent\_catalog\_path

``registry/ecoinvent_catalog.parquet`` — source of truth for the
set of ecoinvent activities and their (code, location, ref-product).

<a id="scoring.skeleton_extractor.SkeletonExtractor.extract"></a>

#### extract

```python
def extract(source_dir: Path, output_dir: Path) -> Path
```
