**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `registry.sources.randonneur_packages` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m registry.sources.randonneur_packages cfg.yml > registry.sources.randonneur_packages.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="registry.sources.randonneur_packages"></a>

# registry.sources.randonneur\_packages

Source ingesters for bundled randonneur datapackages.

One class per package. Each takes a ``RandonneurDataLoader`` and produces
the appropriate registry rows on ``read()``.

<a id="registry.sources.randonneur_packages.RandonneurAgribalyseBiosphereSource"></a>

## RandonneurAgribalyseBiosphereSource Objects

```python
@dataclass(frozen=True)
class RandonneurAgribalyseBiosphereSource()
```

``agribalyse-3.1.1-ecoinvent-3.10-biosphere-manual-matches`` (96 rows).

Replaces the residual hardcoded ``BIOSPHERE_SYNONYMS`` (fix 1.d).
Wired to tier 2.

<a id="registry.sources.randonneur_packages.RandonneurAgribalyseBiosphereSource.loader"></a>

#### loader

<a id="registry.sources.randonneur_packages.RandonneurAgribalyseBiosphereSource.label"></a>

#### label

<a id="registry.sources.randonneur_packages.RandonneurAgribalyseBiosphereSource.tier"></a>

#### tier

<a id="registry.sources.randonneur_packages.RandonneurAgribalyseBiosphereSource.provenance"></a>

#### provenance

<a id="registry.sources.randonneur_packages.RandonneurAgribalyseBiosphereSource.read"></a>

#### read

```python
def read() -> list[Mapping]
```

<a id="registry.sources.randonneur_packages.RandonneurSimaproBiosphereSource"></a>

## RandonneurSimaproBiosphereSource Objects

```python
@dataclass(frozen=True)
class RandonneurSimaproBiosphereSource()
```

``SimaPro-9-ecoinvent-3.9-biosphere-manual-matches`` (580 rows). Tier 3.

<a id="registry.sources.randonneur_packages.RandonneurSimaproBiosphereSource.loader"></a>

#### loader

<a id="registry.sources.randonneur_packages.RandonneurSimaproBiosphereSource.label"></a>

#### label

<a id="registry.sources.randonneur_packages.RandonneurSimaproBiosphereSource.tier"></a>

#### tier

<a id="registry.sources.randonneur_packages.RandonneurSimaproBiosphereSource.provenance"></a>

#### provenance

<a id="registry.sources.randonneur_packages.RandonneurSimaproBiosphereSource.read"></a>

#### read

```python
def read() -> list[Mapping]
```

<a id="registry.sources.randonneur_packages.RandonneurWaterSlashM3Source"></a>

## RandonneurWaterSlashM3Source Objects

```python
@dataclass(frozen=True)
class RandonneurWaterSlashM3Source()
```

``simapro-9-ecoinvent-3-water-slash-m3`` (~39 675 rows). Tier 5 (fix 1.c).

<a id="registry.sources.randonneur_packages.RandonneurWaterSlashM3Source.loader"></a>

#### loader

<a id="registry.sources.randonneur_packages.RandonneurWaterSlashM3Source.label"></a>

#### label

<a id="registry.sources.randonneur_packages.RandonneurWaterSlashM3Source.tier"></a>

#### tier

<a id="registry.sources.randonneur_packages.RandonneurWaterSlashM3Source.provenance"></a>

#### provenance

<a id="registry.sources.randonneur_packages.RandonneurWaterSlashM3Source.read"></a>

#### read

```python
def read() -> list[Mapping]
```

<a id="registry.sources.randonneur_packages.RandonneurSimaproContextSource"></a>

## RandonneurSimaproContextSource Objects

```python
@dataclass(frozen=True)
class RandonneurSimaproContextSource()
```

``simapro-9-ecoinvent-3-context`` (101 rows). Feeds context_normalisation.

<a id="registry.sources.randonneur_packages.RandonneurSimaproContextSource.loader"></a>

#### loader

<a id="registry.sources.randonneur_packages.RandonneurSimaproContextSource.label"></a>

#### label

<a id="registry.sources.randonneur_packages.RandonneurSimaproContextSource.provenance"></a>

#### provenance

<a id="registry.sources.randonneur_packages.RandonneurSimaproContextSource.read"></a>

#### read

```python
def read() -> list[ContextNorm]
```

<a id="registry.sources.randonneur_packages.RandonneurUnitAliasSource"></a>

## RandonneurUnitAliasSource Objects

```python
@dataclass(frozen=True)
class RandonneurUnitAliasSource()
```

``Flowmapper-standard-units-harmonization`` — case-insensitive unit aliases.

<a id="registry.sources.randonneur_packages.RandonneurUnitAliasSource.loader"></a>

#### loader

<a id="registry.sources.randonneur_packages.RandonneurUnitAliasSource.label"></a>

#### label

<a id="registry.sources.randonneur_packages.RandonneurUnitAliasSource.provenance"></a>

#### provenance

<a id="registry.sources.randonneur_packages.RandonneurUnitAliasSource.read"></a>

#### read

```python
def read() -> list[UnitAlias]
```

<a id="registry.sources.randonneur_packages.RandonneurUnitConversionSource"></a>

## RandonneurUnitConversionSource Objects

```python
@dataclass(frozen=True)
class RandonneurUnitConversionSource()
```

``generic-brightway-unit-conversions`` — replaces hardcoded ``UNIT_CONVERSIONS`` (fix 1.k).

<a id="registry.sources.randonneur_packages.RandonneurUnitConversionSource.loader"></a>

#### loader

<a id="registry.sources.randonneur_packages.RandonneurUnitConversionSource.label"></a>

#### label

<a id="registry.sources.randonneur_packages.RandonneurUnitConversionSource.provenance"></a>

#### provenance

<a id="registry.sources.randonneur_packages.RandonneurUnitConversionSource.read"></a>

#### read

```python
def read() -> list[UnitConversion]
```

<a id="registry.sources.randonneur_packages.RandonneurUnitNormalisationSource"></a>

## RandonneurUnitNormalisationSource Objects

```python
@dataclass(frozen=True)
class RandonneurUnitNormalisationSource()
```

``generic-brightway-units-normalization`` (46 rows) — also unit aliases.

<a id="registry.sources.randonneur_packages.RandonneurUnitNormalisationSource.loader"></a>

#### loader

<a id="registry.sources.randonneur_packages.RandonneurUnitNormalisationSource.label"></a>

#### label

<a id="registry.sources.randonneur_packages.RandonneurUnitNormalisationSource.provenance"></a>

#### provenance

<a id="registry.sources.randonneur_packages.RandonneurUnitNormalisationSource.read"></a>

#### read

```python
def read() -> list[UnitAlias]
```

<a id="registry.sources.randonneur_packages.RandonneurUnlinkedListSource"></a>

## RandonneurUnlinkedListSource Objects

```python
@dataclass(frozen=True)
class RandonneurUnlinkedListSource()
```

``agribalyse-3.1.1-biosphere-ecoinvent-3.8-biosphere`` — known-unmatchable list.

Same logical content as the on-disk
``agribalyse-3.1.1-unlinked-ecoinvent-3.8-biosphere.json`` (the
Registry uses a different label).

<a id="registry.sources.randonneur_packages.RandonneurUnlinkedListSource.loader"></a>

#### loader

<a id="registry.sources.randonneur_packages.RandonneurUnlinkedListSource.label"></a>

#### label

<a id="registry.sources.randonneur_packages.RandonneurUnlinkedListSource.tier"></a>

#### tier

<a id="registry.sources.randonneur_packages.RandonneurUnlinkedListSource.provenance"></a>

#### provenance

<a id="registry.sources.randonneur_packages.RandonneurUnlinkedListSource.read"></a>

#### read

```python
def read() -> list[Mapping]
```
