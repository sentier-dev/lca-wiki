**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `matching.biosphere` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matching.biosphere cfg.yml > matching.biosphere.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matching.biosphere"></a>

# matching.biosphere

``BiosphereMatcher`` — registry-driven, deterministic, OOP.

Walks the ``MappingRegistry`` tier ladder for every AGB biosphere
exchange. Closes fixes 1.a–1.l and 1.o:

* tier-ordered candidates from the registry (no procedural pyramid);
* CAS-based lookup as a tier-5-equivalent fallback (1.o);
* unit equality enforced; rescale via ``UnitConverter`` or reject (1.e, 1.k);
* fill-only tiers cannot displace existing links (1.l);
* deterministic tie-break: tier ASC, provenance ASC, target_code ASC (1.f);
* every override goes into ``AuditLog``; every drop goes into ``DropTallyTracker``;
* ``--no-llm`` symmetric (1.j) via ``Settings.apply_llm_overrides``.

<a id="matching.biosphere.SubCompartmentNormaliser"></a>

## SubCompartmentNormaliser Objects

```python
@dataclass(frozen=True)
class SubCompartmentNormaliser()
```

Map heterogeneous sub-compartment labels to a small canonical key set.

Sources mix AGB-style labels (``ocean``, ``low. pop.``, ``river``),
biosphere3 labels (``surface water``, ``urban air close to ground``),
and ILCD/EF labels (``Emissions to sea water``, ``Emissions to
non-urban air or from high stacks``). When a registry candidate has
multiple target codes covering different sub-compartments — typical
of the harmonised-flows-simple ingestion which produces N water-bucket
entries for ``Phosphorus, Total`` (one each for fresh/sea/unspecified)
— the matcher uses this normaliser to pick the candidate whose target
sub-compartment matches the exchange's. Without that tie-break ocean
P silently routes to ``Emissions to water, unspecified`` (CF=1.0 for
freshwater eutrophication) instead of ``Emissions to sea water``
(CF=0), inflating sea-cage fish products by ~160× on freshwater
eutrophication. See FIX_DATA.md § 3.

<a id="matching.biosphere.SubCompartmentNormaliser.group"></a>

#### group

```python
@classmethod
def group(cls, label: str | None) -> str
```

Return the canonical group key for a raw sub-compartment label.

Returns ``"unspecified"`` for empty / missing labels and the empty
string for unrecognised labels (caller can treat that as "no
opinion" and fall back to the lex tie-break).

<a id="matching.biosphere.BiosphereMatchStats"></a>

## BiosphereMatchStats Objects

```python
@dataclass(frozen=True)
class BiosphereMatchStats()
```

<a id="matching.biosphere.BiosphereMatchStats.n_total"></a>

#### n\_total

<a id="matching.biosphere.BiosphereMatchStats.n_linked"></a>

#### n\_linked

<a id="matching.biosphere.BiosphereMatchStats.by_tier"></a>

#### by\_tier

<a id="matching.biosphere.BiosphereMatchStats.n_unit_rejected"></a>

#### n\_unit\_rejected

<a id="matching.biosphere.BiosphereMatchStats.n_ambiguous_skipped"></a>

#### n\_ambiguous\_skipped

<a id="matching.biosphere.BiosphereMatchStats.n_unmatchable_recognised"></a>

#### n\_unmatchable\_recognised

<a id="matching.biosphere.BiosphereMatchStats.n_regional_suffixed"></a>

#### n\_regional\_suffixed

<a id="matching.biosphere.BiosphereMatcher"></a>

## BiosphereMatcher Objects

```python
@dataclass
class BiosphereMatcher()
```

Apply registry-driven biosphere linking to a SimaPro importer's exchanges.

<a id="matching.biosphere.BiosphereMatcher.settings"></a>

#### settings

<a id="matching.biosphere.BiosphereMatcher.registry"></a>

#### registry

<a id="matching.biosphere.BiosphereMatcher.catalog"></a>

#### catalog

<a id="matching.biosphere.BiosphereMatcher.audit"></a>

#### audit

<a id="matching.biosphere.BiosphereMatcher.drops"></a>

#### drops

<a id="matching.biosphere.BiosphereMatcher.regional_parser"></a>

#### regional\_parser

<a id="matching.biosphere.BiosphereMatcher.REGIONAL_DB_ALLOWLIST"></a>

#### REGIONAL\_DB\_ALLOWLIST

<a id="matching.biosphere.BiosphereMatcher.REGIONAL_TARGET_NAME_ALLOWLIST_PREFIXES"></a>

#### REGIONAL\_TARGET\_NAME\_ALLOWLIST\_PREFIXES

<a id="matching.biosphere.BiosphereMatcher.match"></a>

#### match

```python
def match(sp_data: list[dict]) -> BiosphereMatchStats
```
