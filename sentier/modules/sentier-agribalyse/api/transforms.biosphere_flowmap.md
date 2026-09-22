**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.biosphere_flowmap` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.biosphere_flowmap cfg.yml > transforms.biosphere_flowmap.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.biosphere_flowmap"></a>

# transforms.biosphere\_flowmap

``BiosphereFlowmapApplier`` — applies ``agribalyse-3.2-ecoinvent-3.10-biosphere.json``.

Includes the upstream NaN-cf patch lifted out of the legacy linker
(``_patch_biosphere_randonneur_nan_cfs``). The randonneur datapackage
ships 7 entries with ``conversion_factor=NaN`` that break
``Database.process()`` downstream.

Also patches a small set of *inverted* ``conversion_factor`` entries on
``Energy, from <source> (MJ) → <fuel> (<mass-or-volume>)`` rows. Those
factors are stored as the fuel's heat content (MJ per kg or per Sm³),
when the convention everywhere else in the file is
``target = source × multiplier`` — i.e., the reciprocal. Without the
patch, 1 MJ of "Energy, from uranium" gets mapped to 560 000 kg of
"Uranium, in ground" instead of 1.79 × 10⁻⁶ kg, blowing up
non-renewable energy scores 3.1 × 10¹¹× for any product whose supply
chain touches AGB ``Sea cage``, fisheries, or other activities that
emit those energy-equivalent biosphere flows. (Backtest outliers like
"Bar rayé" 188 million× over were traced here.)

<a id="transforms.biosphere_flowmap.BiosphereFlowmapApplier"></a>

## BiosphereFlowmapApplier Objects

```python
@dataclass(frozen=True)
class BiosphereFlowmapApplier()
```

<a id="transforms.biosphere_flowmap.BiosphereFlowmapApplier.settings"></a>

#### settings

<a id="transforms.biosphere_flowmap.BiosphereFlowmapApplier.MN54_WATER_TARGET"></a>

#### MN54\_WATER\_TARGET

<a id="transforms.biosphere_flowmap.BiosphereFlowmapApplier.ENERGY_TO_MASS_INVERSIONS"></a>

#### ENERGY\_TO\_MASS\_INVERSIONS

<a id="transforms.biosphere_flowmap.BiosphereFlowmapApplier.apply"></a>

#### apply

```python
def apply(sp) -> dict[str, int]
```
