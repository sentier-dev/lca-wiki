**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `registry.sources.placeholder` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m registry.sources.placeholder cfg.yml > registry.sources.placeholder.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="registry.sources.placeholder"></a>

# registry.sources.placeholder

Source ingesters for ``placeholder_flow_classification.xlsx``.

Four sheets, each its own class:

* ``PlaceholderEcoinventSource`` — sheet ``match with ecoinvent v3.9.1`` (806
  rows). Wired into tier 1 (fix 1.a). Currently unused by the legacy linker.
* ``PlaceholderEfNativeSource`` — sheet ``match with EF v3.1`` (643 rows)
  → tier 6.
* ``PlaceholderUnmatchableSource`` — sheet ``Neither in ecoinvent nor EF``
  (193 rows) → ``is_unmatchable=True``.
* ``PlaceholderTransitiveSource`` — sheet ``ecoinvent flows - EF v3.1 map``
  (806 rows). Off by default; emitted only when
  ``Settings.apply_transitive_layer`` is true.

<a id="registry.sources.placeholder._PlaceholderSheetSource"></a>

## \_PlaceholderSheetSource Objects

```python
@dataclass(frozen=True)
class _PlaceholderSheetSource()
```

Base behaviour shared by all four placeholder source classes.

Not an ABC, not part of the public API — just a tiny shared helper for
the sheet-reading + DataFrame iteration. Concrete subclasses set the
sheet name + tier and implement ``_row_to_mapping``.

<a id="registry.sources.placeholder._PlaceholderSheetSource.xlsx"></a>

#### xlsx

<a id="registry.sources.placeholder._PlaceholderSheetSource.xlsx_path"></a>

#### xlsx\_path

<a id="registry.sources.placeholder._PlaceholderSheetSource.sheet_name"></a>

#### sheet\_name

<a id="registry.sources.placeholder._PlaceholderSheetSource.tier"></a>

#### tier

<a id="registry.sources.placeholder._PlaceholderSheetSource.provenance"></a>

#### provenance

<a id="registry.sources.placeholder._PlaceholderSheetSource.is_unmatchable"></a>

#### is\_unmatchable

<a id="registry.sources.placeholder._PlaceholderSheetSource.read"></a>

#### read

```python
def read() -> list[Mapping]
```

<a id="registry.sources.placeholder.PlaceholderEcoinventSource"></a>

## PlaceholderEcoinventSource Objects

```python
@dataclass(frozen=True)
class PlaceholderEcoinventSource(_PlaceholderSheetSource)
```

Sheet ``match with ecoinvent v3.9.1`` — AGB → ecoinvent biosphere flows.

Defaults the tier to ``CURATED_TARGETED`` (tier 1) per fix 1.a.

<a id="registry.sources.placeholder.PlaceholderEcoinventSource.sheet_name"></a>

#### sheet\_name

<a id="registry.sources.placeholder.PlaceholderEcoinventSource.tier"></a>

#### tier

<a id="registry.sources.placeholder.PlaceholderEcoinventSource.provenance"></a>

#### provenance

<a id="registry.sources.placeholder.PlaceholderEfNativeSource"></a>

## PlaceholderEfNativeSource Objects

```python
@dataclass(frozen=True)
class PlaceholderEfNativeSource(_PlaceholderSheetSource)
```

Sheet ``match with EF v3.1`` — AGB → EF flow UUIDs (resolved against the EF parquet).

<a id="registry.sources.placeholder.PlaceholderEfNativeSource.sheet_name"></a>

#### sheet\_name

<a id="registry.sources.placeholder.PlaceholderEfNativeSource.tier"></a>

#### tier

<a id="registry.sources.placeholder.PlaceholderEfNativeSource.provenance"></a>

#### provenance

<a id="registry.sources.placeholder.PlaceholderUnmatchableSource"></a>

## PlaceholderUnmatchableSource Objects

```python
@dataclass(frozen=True)
class PlaceholderUnmatchableSource(_PlaceholderSheetSource)
```

Sheet ``Neither in ecoinvent nor EF`` — known-unmatchable AGB flows.

<a id="registry.sources.placeholder.PlaceholderUnmatchableSource.sheet_name"></a>

#### sheet\_name

<a id="registry.sources.placeholder.PlaceholderUnmatchableSource.tier"></a>

#### tier

<a id="registry.sources.placeholder.PlaceholderUnmatchableSource.provenance"></a>

#### provenance

<a id="registry.sources.placeholder.PlaceholderUnmatchableSource.is_unmatchable"></a>

#### is\_unmatchable

<a id="registry.sources.placeholder.PlaceholderTransitiveSource"></a>

## PlaceholderTransitiveSource Objects

```python
@dataclass(frozen=True)
class PlaceholderTransitiveSource(_PlaceholderSheetSource)
```

Sheet ``ecoinvent flows - EF v3.1 map`` — transitive ecoinvent → EF map.

Off by default; emitted only when ``Settings.apply_transitive_layer`` is true.

<a id="registry.sources.placeholder.PlaceholderTransitiveSource.sheet_name"></a>

#### sheet\_name

<a id="registry.sources.placeholder.PlaceholderTransitiveSource.tier"></a>

#### tier

<a id="registry.sources.placeholder.PlaceholderTransitiveSource.provenance"></a>

#### provenance
