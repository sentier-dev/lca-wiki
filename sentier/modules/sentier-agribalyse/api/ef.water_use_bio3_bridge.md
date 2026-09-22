**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `ef.water_use_bio3_bridge` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ef.water_use_bio3_bridge cfg.yml > ef.water_use_bio3_bridge.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ef.water_use_bio3_bridge"></a>

# ef.water\_use\_bio3\_bridge

``WaterUseBio3Bridge`` — curated EF v3.1 (adapted) CF mapping for water-use.

The bw2io snapshot at ``source/ef-v31-methods.json`` carries only 5 inherited
``Water [air, *]`` CFs on the ecoinvent biosphere side — none of the natural-
resource water inputs (lake / river / well / turbine / cooling) nor the
water-compartment releases get CFs. The result is the shrimp-class
under-scoring documented in the session log: pond water inputs of ~5 m³/kg
are unmapped, scoring 0 contribution against ADEME's ~220 m³_eq reference.

``SimaProCfFilter.augment_rows`` was an earlier attempt at this same gap.
It misbehaved (337× over-count) because it matched SimaPro names character-
for-character: SimaPro carries both ``Water`` (per-kg, CF=-0.042955) and
``Water/m3`` (per-m³, CF=-42.955). The bio3 catalog name is just
``Water``, so augment picked the per-kg variant and applied it to m³-unit
matrix entries — silently 1000× too small on releases while inputs got the
correct m³ value. The asymmetric magnitudes broke balanced flow
cancellation (turbine / cooling in & out) and detonated cumulative scores.

This class skips that pitfall by curating the mapping explicitly. Each
entry is a ``(bio3_code, cf)`` row with the CF normalised to m³ (the unit
the matrix uses). Both inputs (+CF) and matching releases (-CF) are
included so balanced flows cancel correctly. Pairs with disabling
``AwareConsumptionCorrectionBuilder`` — once the base CFs are complete on
the Q row, the per-activity asymmetric correction becomes a double-count.

The JSON file format::

    {
      "version": 1,
      "method_key": ["ecoinvent-3.9.1", "EF v3.1", "water use", "..."],
      "mappings": [
        {
          "code": "8c75e7ab-8ab8-41e4-b394-c166ff5b050d",
          "name": "Water, river",
          "compartment": "natural resource/in water",
          "cf": 42.95,
          "direction": "input",
          "rationale": "free-form note kept for human review"
        }
      ]
    }

Database is always ``ecoinvent-3.9.1-biosphere`` (the only biosphere
database the scoring matrix actually carries — see
``RegionalCfRegistryBuilder`` for the same precedent).

<a id="ef.water_use_bio3_bridge.WaterUseBio3Bridge"></a>

## WaterUseBio3Bridge Objects

```python
@dataclass(frozen=True)
class WaterUseBio3Bridge()
```

Frozen view of the curated EF v3.1 → bio3 water-use CF table.

<a id="ef.water_use_bio3_bridge.WaterUseBio3Bridge.SCHEMA_VERSION"></a>

#### SCHEMA\_VERSION

<a id="ef.water_use_bio3_bridge.WaterUseBio3Bridge.BIO3_DATABASE"></a>

#### BIO3\_DATABASE

<a id="ef.water_use_bio3_bridge.WaterUseBio3Bridge.empty"></a>

#### empty

```python
@classmethod
def empty(cls) -> WaterUseBio3Bridge
```

<a id="ef.water_use_bio3_bridge.WaterUseBio3Bridge.load"></a>

#### load

```python
@classmethod
def load(cls, path: Path) -> WaterUseBio3Bridge
```

Load the bridge from JSON; missing file → empty (no-op).

<a id="ef.water_use_bio3_bridge.WaterUseBio3Bridge.method_key"></a>

#### method\_key

```python
@property
def method_key() -> tuple[str, ...]
```

<a id="ef.water_use_bio3_bridge.WaterUseBio3Bridge.cf_rows"></a>

#### cf\_rows

```python
def cf_rows() -> list[dict]
```

Return ``[{"database", "code", "amount"}, ...]`` for registry merge.

Mirrors the shape ``WaterResourceCfAugmenter.cf_rows`` produces so
``MethodCfRegistryBuilder._merge_augmenter_rows`` consumes them
uniformly.

<a id="ef.water_use_bio3_bridge.WaterUseBio3Bridge.items"></a>

#### items

```python
def items() -> Iterator[tuple[str, float]]
```

<a id="ef.water_use_bio3_bridge.WaterUseBio3Bridge.__len__"></a>

#### \_\_len\_\_

```python
def __len__() -> int
```

<a id="ef.water_use_bio3_bridge.WaterUseBio3Bridge.__bool__"></a>

#### \_\_bool\_\_

```python
def __bool__() -> bool
```
