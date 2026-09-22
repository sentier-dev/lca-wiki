**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `domain.tier` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m domain.tier cfg.yml > domain.tier.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="domain.tier"></a>

# domain.tier

Priority tiers for mapping resolution. Lower number = higher priority.

Mirrors REFACTOR.md §0.3. The matcher walks tiers in ascending order and
selects the highest-priority row that satisfies type/unit/context
constraints. Tiers >= ``EF_GENERIC`` are *fill-only*: they may only place
links onto exchanges that have no prior link.

<a id="domain.tier.Tier"></a>

## Tier Objects

```python
class Tier(IntEnum)
```

Mapping priority tier (lower = higher priority).

<a id="domain.tier.Tier.CURATED_TARGETED"></a>

#### CURATED\_TARGETED

Curated AGB-specific overrides — placeholder 'match with ecoinvent v3.9.1'
sheet (806 rows) + the small dated ``curated_overrides.json``.

<a id="domain.tier.Tier.RANDONNEUR_AGB_SPECIFIC"></a>

#### RANDONNEUR\_AGB\_SPECIFIC

``agribalyse-3.1.1-ecoinvent-3.10-biosphere-manual-matches.json`` (96 rows).
Replaces the residual hardcoded ``BIOSPHERE_SYNONYMS``.

<a id="domain.tier.Tier.RANDONNEUR_SIMAPRO_BIO"></a>

#### RANDONNEUR\_SIMAPRO\_BIO

``simapro-9-ecoinvent-3.9-biosphere-manual-matches.json`` (580 rows).

<a id="domain.tier.Tier.AGRIBALYSE_EI_BIOSPHERE"></a>

#### AGRIBALYSE\_EI\_BIOSPHERE

``agribalyse-3.2-ecoinvent-3.10-biosphere.json`` — Flowmapper-generated
SimaPro-9 → ecoinvent-3.10-biosphere mappings (~4 039 rows). UUID-pinned.

<a id="domain.tier.Tier.HARMONISED_FLOWS"></a>

#### HARMONISED\_FLOWS

The brightway-style harmonised flow registry.

<a id="domain.tier.Tier.RANDONNEUR_WATER_M3"></a>

#### RANDONNEUR\_WATER\_M3

``simapro-9-ecoinvent-3-water-slash-m3.gz`` (~39 675 rows). Also the home
of CAS-derived index entries used for disambiguation (fix 1.o) — same
confidence band, distinguished by ``provenance``.

<a id="domain.tier.Tier.EF_PLACEHOLDER"></a>

#### EF\_PLACEHOLDER

Placeholder 'match with EF v3.1' sheet (643 rows). Override-capable.

<a id="domain.tier.Tier.EF_GENERIC"></a>

#### EF\_GENERIC

``(name, bucket, unit)`` lookup against the full EF parquet. Fill-only.

<a id="domain.tier.Tier.BIO3_MATCH_DATABASE"></a>

#### BIO3\_MATCH\_DATABASE

bw2io ``match_database`` chain against biosphere3. Fill-only.

<a id="domain.tier.Tier.CASE_INSENSITIVE_FALLBACK"></a>

#### CASE\_INSENSITIVE\_FALLBACK

``(name_lower, unit, bucket)`` fallback. Fill-only, deterministic
tie-breaker (fix 1.f).

<a id="domain.tier.Tier.LLM_OVERRIDES"></a>

#### LLM\_OVERRIDES

LLM-reviewed accept rows. Fill-only, gated by ``--no-llm`` (fix 1.j).

<a id="domain.tier.Tier.CURATED_SYNONYM_FALLBACK"></a>

#### CURATED\_SYNONYM\_FALLBACK

The legacy ``BIOSPHERE_SYNONYMS`` residue, now living in
``curated_overrides.json`` rows tagged as ``synonym``. Fill-only, same
``--no-llm`` gate as tier 11.

<a id="domain.tier.Tier.UNMATCHABLE"></a>

#### UNMATCHABLE

Known-unmatchable AGB flows. Never produces a link; suppresses warnings.

<a id="domain.tier.Tier.fill_only_tiers"></a>

#### fill\_only\_tiers

```python
@classmethod
def fill_only_tiers(cls) -> set[Tier]
```

Tiers that may only fill empty links — never override.

<a id="domain.tier.Tier.is_fill_only"></a>

#### is\_fill\_only

```python
def is_fill_only() -> bool
```

<a id="domain.tier.Tier.llm_gated_tiers"></a>

#### llm\_gated\_tiers

```python
@classmethod
def llm_gated_tiers(cls) -> set[Tier]
```

Tiers gated by ``Settings.apply_llm_overrides`` (fix 1.j).

<a id="domain.tier.Tier.is_llm_gated"></a>

#### is\_llm\_gated

```python
def is_llm_gated() -> bool
```
