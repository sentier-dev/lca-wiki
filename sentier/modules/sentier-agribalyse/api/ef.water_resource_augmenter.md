**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `ef.water_resource_augmenter` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ef.water_resource_augmenter cfg.yml > ef.water_resource_augmenter.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ef.water_resource_augmenter"></a>

# ef.water\_resource\_augmenter

``WaterResourceCfAugmenter`` — fill the bw2io snapshot's water-use gap.

The bw2io ``LCIA Implementation 3.9.1.xlsx`` mapping table inherits CFs
onto bio3 codes by name — it works fine for emission flows but skips
the *resource* side of EF v3.1's Water use method. Result: bio3
``Water, river [natural resource, in water]`` and friends carry **no**
water-use CF in our matrix, so AGB activities consuming water from
freshwater / groundwater / lakes / wells score 0 against ADEME's
non-zero references.

This class fills the gap with JRC's null-region (global) CF for each
mappable bio3 resource flow. It does NOT import SimaPro CFs (the
project pins to JRC EF v3.1 only) and it does NOT widen the CF on
flows JRC chose not to characterise (sea water, water in air).

The mapping is deliberately narrow — only six unambiguous JRC names
land on bio3 resource flows. Wider mappings would risk double-counting
against the inherited ``Water [air]`` rows (which the
``SimaProCfFilter.SKIP_FILTER_METHODS`` set keeps in place for the
water-use method).

<a id="ef.water_resource_augmenter.WaterResourceCfAugmenter"></a>

## WaterResourceCfAugmenter Objects

```python
@dataclass(frozen=True)
class WaterResourceCfAugmenter()
```

Emit JRC water-use CFs onto bio3 water resource codes.

<a id="ef.water_resource_augmenter.WaterResourceCfAugmenter.ef_cf_table"></a>

#### ef\_cf\_table

<a id="ef.water_resource_augmenter.WaterResourceCfAugmenter.biosphere_catalog_path"></a>

#### biosphere\_catalog\_path

<a id="ef.water_resource_augmenter.WaterResourceCfAugmenter.JRC_TO_BIO3_TARGETS"></a>

#### JRC\_TO\_BIO3\_TARGETS

<a id="ef.water_resource_augmenter.WaterResourceCfAugmenter.JRC_METHOD_NAME"></a>

#### JRC\_METHOD\_NAME

<a id="ef.water_resource_augmenter.WaterResourceCfAugmenter.SCORED_DATABASES"></a>

#### SCORED\_DATABASES

<a id="ef.water_resource_augmenter.WaterResourceCfAugmenter.cf_rows"></a>

#### cf\_rows

```python
def cf_rows() -> list[dict]
```

Return ``[{"database", "code", "amount"}, ...]`` for water-use augmentation.

One row per (database, code) target. Output is sorted by
``(database, code)`` for deterministic registry builds.
