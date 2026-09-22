**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.biosphere_prelinker` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.biosphere_prelinker cfg.yml > transforms.biosphere_prelinker.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.biosphere_prelinker"></a>

# transforms.biosphere\_prelinker

``BiosphereCatalogPrelinker`` — bw2data-free replacement for ``BioStrategyChain``.

Drives the same five-step biosphere link pre-pass the legacy chain did
against ``bw2data.Database(biosphere_db)``, but reads exclusively from
``BiosphereCatalog`` (parquet-backed). The resulting exchange ``input``
fields are the same; ``BiosphereMatcher`` then runs the registry tier
walk over whatever's left.

Steps:

1. Match by ``code`` — when an exchange already carries a code that
   exists in the catalog, link it directly.
2. Match by ``(name_lower, unit, categories)`` — exact lookup, ambiguous
   keys leave the exchange unlinked.
3. Top-level context fallback — for exchanges with categories
   ``(a, b, ...)``, try ``(a,)`` flows in the target DB.
4. Only-available-in-given-context-tree — if the target DB has exactly
   one flow under top-level context ``(a,)`` matching ``(name, unit)``,
   pick it regardless of subcat.
5. Strip a ``Name, AR`` location suffix when the dataset itself is in
   ``AR`` (delegated to ``RemoveBiosphereLocationPrefixIfFlowInSameLocation``).

<a id="transforms.biosphere_prelinker.BiosphereCatalogPrelinker"></a>

## BiosphereCatalogPrelinker Objects

```python
@dataclass(frozen=True)
class BiosphereCatalogPrelinker()
```

Match biosphere exchanges against the catalog before registry tiers run.

<a id="transforms.biosphere_prelinker.BiosphereCatalogPrelinker.bio_db_name"></a>

#### bio\_db\_name

<a id="transforms.biosphere_prelinker.BiosphereCatalogPrelinker.catalog"></a>

#### catalog

<a id="transforms.biosphere_prelinker.BiosphereCatalogPrelinker.name"></a>

#### name

<a id="transforms.biosphere_prelinker.BiosphereCatalogPrelinker.by_code"></a>

#### by\_code

```python
@property
def by_code() -> dict[str, Any]
```

<a id="transforms.biosphere_prelinker.BiosphereCatalogPrelinker.by_name_unit_categories"></a>

#### by\_name\_unit\_categories

```python
@property
def by_name_unit_categories(
) -> dict[tuple[str, str, tuple[str, ...]], list[Any]]
```

<a id="transforms.biosphere_prelinker.BiosphereCatalogPrelinker.by_top_context"></a>

#### by\_top\_context

```python
@property
def by_top_context() -> dict[tuple[str, str, str], list[Any]]
```

``(name_lower, unit, top_cat) → flows under that top-level context``.

<a id="transforms.biosphere_prelinker.BiosphereCatalogPrelinker.flows_under_top_cat"></a>

#### flows\_under\_top\_cat

```python
@property
def flows_under_top_cat() -> dict[tuple[str, str, str], list[Any]]
```

``(name_lower, unit, top_cat) → flows`` for the only-available-in-tree fallback.

<a id="transforms.biosphere_prelinker.BiosphereCatalogPrelinker.apply"></a>

#### apply

```python
def apply(sp_data: list[dict]) -> dict[str, int]
```
