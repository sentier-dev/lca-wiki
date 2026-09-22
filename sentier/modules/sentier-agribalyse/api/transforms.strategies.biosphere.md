**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.strategies.biosphere` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.strategies.biosphere cfg.yml > transforms.strategies.biosphere.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.strategies.biosphere"></a>

# transforms.strategies.biosphere

Biosphere normalisation strategies — lifted from ``bw2io.strategies``.

Pure dict transforms. No bw2data, no bw2io. Each is callable
(``__call__(data)``) so the existing ``StrategyRunner.apply`` can drive it.

<a id="transforms.strategies.biosphere.StripBiosphereExchangeLocations"></a>

## StripBiosphereExchangeLocations Objects

```python
@dataclass(frozen=True)
class StripBiosphereExchangeLocations()
```

Drop the ``location`` field from biosphere exchanges (always non-spatial).

<a id="transforms.strategies.biosphere.StripBiosphereExchangeLocations.name"></a>

#### name

<a id="transforms.strategies.biosphere.StripBiosphereExchangeLocations.__call__"></a>

#### \_\_call\_\_

```python
def __call__(data: list[dict]) -> list[dict]
```

<a id="transforms.strategies.biosphere.DropUnspecifiedSubcategories"></a>

## DropUnspecifiedSubcategories Objects

```python
@dataclass(frozen=True)
class DropUnspecifiedSubcategories()
```

Drop trailing 'unspecified' / '' / None entries from category tuples.

Lifted from ``bw2io.strategies.drop_unspecified_subcategories``.
Mutates dataset-level ``categories`` and exchange-level ``categories``.

<a id="transforms.strategies.biosphere.DropUnspecifiedSubcategories.name"></a>

#### name

<a id="transforms.strategies.biosphere.DropUnspecifiedSubcategories.__call__"></a>

#### \_\_call\_\_

```python
def __call__(data: list[dict]) -> list[dict]
```

<a id="transforms.strategies.biosphere.NormalizeSimaproBiosphereCategories"></a>

## NormalizeSimaproBiosphereCategories Objects

```python
@dataclass(frozen=True)
class NormalizeSimaproBiosphereCategories()
```

Map SimaPro top-level categories ('Air', 'Resources', ...) to ecoinvent.

<a id="transforms.strategies.biosphere.NormalizeSimaproBiosphereCategories.name"></a>

#### name

<a id="transforms.strategies.biosphere.NormalizeSimaproBiosphereCategories.__call__"></a>

#### \_\_call\_\_

```python
def __call__(data: list[dict]) -> list[dict]
```

<a id="transforms.strategies.biosphere.NormalizeSimaproBiosphereNames"></a>

## NormalizeSimaproBiosphereNames Objects

```python
@dataclass(frozen=True)
class NormalizeSimaproBiosphereNames()
```

Map SimaPro flow names to ecoinvent names via the lifted JSON file.

<a id="transforms.strategies.biosphere.NormalizeSimaproBiosphereNames.json_path"></a>

#### json\_path

<a id="transforms.strategies.biosphere.NormalizeSimaproBiosphereNames.name"></a>

#### name

<a id="transforms.strategies.biosphere.NormalizeSimaproBiosphereNames.__call__"></a>

#### \_\_call\_\_

```python
def __call__(data: list[dict]) -> list[dict]
```

<a id="transforms.strategies.biosphere.NormalizeBiosphereCategories"></a>

## NormalizeBiosphereCategories Objects

```python
@dataclass(frozen=True)
class NormalizeBiosphereCategories()
```

Apply the ``biosphere-2-3-categories`` migration to exchanges + datasets.

<a id="transforms.strategies.biosphere.NormalizeBiosphereCategories.store"></a>

#### store

<a id="transforms.strategies.biosphere.NormalizeBiosphereCategories.name"></a>

#### name

<a id="transforms.strategies.biosphere.NormalizeBiosphereCategories.lcia"></a>

#### lcia

<a id="transforms.strategies.biosphere.NormalizeBiosphereCategories.migration_name"></a>

#### migration\_name

<a id="transforms.strategies.biosphere.NormalizeBiosphereCategories.__call__"></a>

#### \_\_call\_\_

```python
def __call__(data: list[dict]) -> list[dict]
```

<a id="transforms.strategies.biosphere.NormalizeBiosphereNames"></a>

## NormalizeBiosphereNames Objects

```python
@dataclass(frozen=True)
class NormalizeBiosphereNames()
```

Apply the ``biosphere-2-3-names`` migration to exchanges + datasets.

<a id="transforms.strategies.biosphere.NormalizeBiosphereNames.store"></a>

#### store

<a id="transforms.strategies.biosphere.NormalizeBiosphereNames.name"></a>

#### name

<a id="transforms.strategies.biosphere.NormalizeBiosphereNames.lcia"></a>

#### lcia

<a id="transforms.strategies.biosphere.NormalizeBiosphereNames.migration_name"></a>

#### migration\_name

<a id="transforms.strategies.biosphere.NormalizeBiosphereNames.__call__"></a>

#### \_\_call\_\_

```python
def __call__(data: list[dict]) -> list[dict]
```

<a id="transforms.strategies.biosphere.RemoveBiosphereLocationPrefixIfFlowInSameLocation"></a>

## RemoveBiosphereLocationPrefixIfFlowInSameLocation Objects

```python
@dataclass(frozen=True)
class RemoveBiosphereLocationPrefixIfFlowInSameLocation()
```

Drop ``, AR`` from a SimaPro-regionalised flow when process is in 'AR'.

Lifted from
``bw2io.strategies.remove_biosphere_location_prefix_if_flow_in_same_location``.

<a id="transforms.strategies.biosphere.RemoveBiosphereLocationPrefixIfFlowInSameLocation.name"></a>

#### name

<a id="transforms.strategies.biosphere.RemoveBiosphereLocationPrefixIfFlowInSameLocation.__call__"></a>

#### \_\_call\_\_

```python
def __call__(data: list[dict]) -> list[dict]
```

<a id="transforms.strategies.biosphere.BiosphereStrategyChain"></a>

## BiosphereStrategyChain Objects

```python
@dataclass
class BiosphereStrategyChain()
```

Run every biosphere normalisation strategy in canonical order.

Replaces ``BiosphereLabelNormaliser`` (which iterated over bw2io
callables). The chain is:

1. ``NormalizeSimaproBiosphereCategories``
2. ``NormalizeSimaproBiosphereNames``
3. ``NormalizeBiosphereCategories``
4. ``NormalizeBiosphereNames``
5. ``StripBiosphereExchangeLocations``
6. ``DropUnspecifiedSubcategories``

Each step is wrapped by the runner so exceptions surface in the
suppressed-strategy log rather than crashing the linker.

<a id="transforms.strategies.biosphere.BiosphereStrategyChain.strategies"></a>

#### strategies

<a id="transforms.strategies.biosphere.BiosphereStrategyChain.from_paths"></a>

#### from\_paths

```python
@classmethod
def from_paths(cls, bw2io_data_dir: Path) -> BiosphereStrategyChain
```

Build the canonical chain rooted at ``source/bw2io-data/``.

<a id="transforms.strategies.biosphere.BiosphereStrategyChain.apply"></a>

#### apply

```python
def apply(sp: Any, runner: Any | None = None) -> None
```

Run every strategy on ``sp.data``. ``runner`` is optional — when
passed, suppression is recorded; otherwise exceptions propagate.
