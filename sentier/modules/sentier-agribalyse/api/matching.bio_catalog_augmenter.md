**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `matching.bio_catalog_augmenter` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matching.bio_catalog_augmenter cfg.yml > matching.bio_catalog_augmenter.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matching.bio_catalog_augmenter"></a>

# matching.bio\_catalog\_augmenter

``BiosphereCatalogAugmenter`` — extend the catalog with regional variants.

The runtime biosphere catalog (``registry/biosphere_catalog.parquet``) is
built from snapshots of biosphere3 and ecoinvent's biosphere database
plus the EF flow registry. It has no notion of *country of extraction*:
``Water, lake`` is a single row, not 248 country-coded variants.

After :class:`matching.biosphere.BiosphereMatcher` rewrites the
country-coded source flows (``Water, lake, FR``) onto synthetic codes
(``<base_uuid>@FR``), the catalog has a row for the base UUID but
nothing for any of the synthetic ``@region``-suffixed codes. This
augmenter scans the linked SimaPro inventory, collects the set of
synthetic codes actually used, and rewrites the catalog parquet with
matching synthetic rows appended.

Each synthetic row inherits the name / categories / unit / cas /
synonyms of its base row but carries the synthetic code in the ``code``
column, plus two new columns:

* ``base_code`` — the original (non-suffixed) UUID.
* ``region`` — the country / aggregate code (``"FR"``, ``"RoW"``, …).

For non-regional rows the new columns default to ``(code, "")`` so the
schema remains stable.

This is the single source of truth for "which regional codes the
matrix knows about". Downstream consumers (``MethodCfRegistryBuilder``,
inspection tools) read the augmented parquet and don't need access to
the linked SimaPro data themselves.

<a id="matching.bio_catalog_augmenter.BiosphereCatalogAugmenter"></a>

## BiosphereCatalogAugmenter Objects

```python
@dataclass(frozen=True)
class BiosphereCatalogAugmenter()
```

Rewrite ``biosphere_catalog.parquet`` with synthetic regional rows.

The augmenter is idempotent: running it twice over the same linked
inventory yields the same catalog (the base rows are detected and
re-used as the canonical source, never duplicated).

<a id="matching.bio_catalog_augmenter.BiosphereCatalogAugmenter.catalog_path"></a>

#### catalog\_path

<a id="matching.bio_catalog_augmenter.BiosphereCatalogAugmenter.REGIONAL_DB_ALLOWLIST"></a>

#### REGIONAL\_DB\_ALLOWLIST

<a id="matching.bio_catalog_augmenter.BiosphereCatalogAugmenter.SEPARATOR"></a>

#### SEPARATOR

<a id="matching.bio_catalog_augmenter.BiosphereCatalogAugmenter.augment_from_sp_data"></a>

#### augment\_from\_sp\_data

```python
def augment_from_sp_data(sp_data: list[dict]) -> int
```

Collect synthetic codes from ``sp_data`` and rewrite the catalog.

Returns the number of synthetic rows added (zero on idempotent
re-runs after the catalog already contains them).

<a id="matching.bio_catalog_augmenter.BiosphereCatalogAugmenter.augment"></a>

#### augment

```python
def augment(used: Iterable[tuple[str, str, str]]) -> int
```

``used`` is an iterable of ``(target_db, base_code, region)``
triples.

Returns the number of synthetic rows newly inserted.
