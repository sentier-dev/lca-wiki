**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.strategies.units` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.strategies.units cfg.yml > transforms.strategies.units.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.strategies.units"></a>

# transforms.strategies.units

Unit-related strategies: electricity unit fix, generic exchange rescale.

Lifted from ``bw2io.strategies`` (``change_electricity_unit_mj_to_kwh``)
and ``bw2io.utils.rescale_exchange``. Pure dict transforms — no bw2data
or bw2io dependency. The ``stats_arrays`` ids the rescaler branches on
are stable upstream and well-documented; we match them by integer
constant rather than re-importing the enum to keep the dependency graph
trivial.

<a id="transforms.strategies.units.RescaleExchange"></a>

## RescaleExchange Objects

```python
class RescaleExchange()
```

Rescale ``exc["amount"]`` (and uncertainty fields) by a constant factor.

Direct lift of ``bw2io.utils.rescale_exchange`` with the
``stats_arrays`` enum imports flattened to integer constants. The
behaviour is preserved: zero factor zeroes the loc/amount and clears
scale/shape; sign-flip on triangular/uniform swaps min/max bounds;
formulas get wrapped with the multiplier.

<a id="transforms.strategies.units.RescaleExchange.apply"></a>

#### apply

```python
@staticmethod
def apply(exc: dict, factor: float) -> dict
```

<a id="transforms.strategies.units.ChangeElectricityUnitMjToKwh"></a>

## ChangeElectricityUnitMjToKwh Objects

```python
@dataclass(frozen=True)
class ChangeElectricityUnitMjToKwh()
```

Change electricity exchanges from MJ to kWh, rescaling amount by 1/3.6.

Lifted from ``bw2io.strategies.change_electricity_unit_mj_to_kwh``.
Matches when the exchange name starts with ``electricity``,
``market for electricity``, or ``market group for electricity`` and
the unit is ``megajoule``.

<a id="transforms.strategies.units.ChangeElectricityUnitMjToKwh.name"></a>

#### name

<a id="transforms.strategies.units.ChangeElectricityUnitMjToKwh.__call__"></a>

#### \_\_call\_\_

```python
def __call__(data: list[dict]) -> list[dict]
```
