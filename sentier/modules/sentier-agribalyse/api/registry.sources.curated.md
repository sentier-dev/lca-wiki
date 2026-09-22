**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `registry.sources.curated` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m registry.sources.curated cfg.yml > registry.sources.curated.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="registry.sources.curated"></a>

# registry.sources.curated

``CuratedOverridesSource`` and ``LlmReviewedSource``.

The curated overrides JSON is the small, dated file that replaces the
residual portion of the legacy hardcoded ``BIOSPHERE_SYNONYMS``. Each
entry chooses its own tier (typically 1 or 11). The LLM-reviewed xlsx
contributes tier-10 fill-only rows.

``ExtraUnitConversionSource`` carries the small set of land/transport unit
conversions (m² → hectare, m → km) the upstream randonneur datapackage
doesn't ship; without these the GLO market-for tillage / fertilising tech
edges can't match ecoinvent (unit field mismatch).

<a id="registry.sources.curated.CuratedOverridesSource"></a>

## CuratedOverridesSource Objects

```python
@dataclass(frozen=True)
class CuratedOverridesSource()
```

Read ``source/curated_overrides.json``.

Schema (each entry)::

    {
        "source_name": "1,2-Dichloropropane",
        "source_unit": "kg",
        "source_context": ["Emissions to water", "river"],
        "target_db": "biosphere3",
        "target_code": "<uuid>",          # optional, else resolved by name
        "target_name": "Propane, 1,2-dichloro-",
        "target_unit": "kg",
        "unit_conversion": 1.0,
        "tier": "CURATED_TARGETED",       # or "CURATED_SYNONYM_FALLBACK"
        "is_unmatchable": false,          # optional; true → flow is acknowledged dead-end
        "notes": "fix 1,2-DCP → Propane regression",
    }

Set ``is_unmatchable: true`` for AGB flows that have no defensible target
in any biosphere DB (e.g. AGB-only resource concepts like "Inert rock").
Those rows are routed to ``unmatchable.parquet`` so the matcher counts
them as recognised dead-ends instead of unexplained residuals.

The file is allowed to not exist (then the source contributes zero rows).
The same JSON is read twice by the builder — once with
``select_unmatchable=False`` for ``mappings_biosphere``, once with
``select_unmatchable=True`` for ``unmatchable``.

<a id="registry.sources.curated.CuratedOverridesSource.path"></a>

#### path

<a id="registry.sources.curated.CuratedOverridesSource.json"></a>

#### json

<a id="registry.sources.curated.CuratedOverridesSource.provenance"></a>

#### provenance

<a id="registry.sources.curated.CuratedOverridesSource.select_unmatchable"></a>

#### select\_unmatchable

<a id="registry.sources.curated.CuratedOverridesSource.read"></a>

#### read

```python
def read() -> list[Mapping]
```

<a id="registry.sources.curated.ExtraUnitConversionSource"></a>

## ExtraUnitConversionSource Objects

```python
@dataclass(frozen=True)
class ExtraUnitConversionSource()
```

Read ``source/agribalyse-3.2-extra-unit-conversions.json``.

Plugs the gap left by upstream ``generic-brightway-unit-conversions``: AGB
SimaPro CSV emits tech edges in m²/m for land/transport markets that
ecoinvent stores in hectare/km. The legacy linker hardcoded these; here
they live next to the other registry sources.

Schema::

    {
      "entries": [
        {"source_unit": "square meter", "target_unit": "hectare", "multiplier": 0.0001}
      ]
    }

<a id="registry.sources.curated.ExtraUnitConversionSource.path"></a>

#### path

<a id="registry.sources.curated.ExtraUnitConversionSource.json"></a>

#### json

<a id="registry.sources.curated.ExtraUnitConversionSource.provenance"></a>

#### provenance

<a id="registry.sources.curated.ExtraUnitConversionSource.read"></a>

#### read

```python
def read() -> list[UnitConversion]
```

<a id="registry.sources.curated.LlmReviewedSource"></a>

## LlmReviewedSource Objects

```python
@dataclass(frozen=True)
class LlmReviewedSource()
```

Read the LLM-reviewed xlsx (only ``decision='accept'`` rows).

Tier 10, fill-only, gated by ``Settings.apply_llm_overrides``. The
matcher applies the gate at match time; the registry always carries
the rows so the data is auditable.

<a id="registry.sources.curated.LlmReviewedSource.path"></a>

#### path

<a id="registry.sources.curated.LlmReviewedSource.cache"></a>

#### cache

<a id="registry.sources.curated.LlmReviewedSource.target_db"></a>

#### target\_db

<a id="registry.sources.curated.LlmReviewedSource.tier"></a>

#### tier

<a id="registry.sources.curated.LlmReviewedSource.provenance"></a>

#### provenance

<a id="registry.sources.curated.LlmReviewedSource.read"></a>

#### read

```python
def read() -> list[Mapping]
```
