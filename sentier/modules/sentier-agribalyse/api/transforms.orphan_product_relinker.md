**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.orphan_product_relinker` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.orphan_product_relinker cfg.yml > transforms.orphan_product_relinker.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.orphan_product_relinker"></a>

# transforms.orphan\_product\_relinker

``OrphanProductRelinker`` — re-route consumers of un-produced AGB products to ecoinvent.

bw_simapro_csv materialises every distinct ``input`` reference in the
CSV as an ``ActivityDataset`` with ``type='product'``. When the SimaPro
name has the canonical ecoinvent shape (``Display {LOC}| activity name |
Cut-off, S/U - Source``), the ``simapro-ecoinvent-3.9.1-cutoff``
randonneur datapackage normally rewrites the consumer-side exchange
name to the ecoinvent canonical so ``TechnosphereMatcher`` can link it.

A few dozen rows fall through that datapackage. The result is **orphan
products**: ``type='product'`` rows that nothing produces but are still
referenced by AGB activities. In the technosphere matrix each orphan
becomes a row with no diagonal entry, which silently NaNs the LU
factorisation under pardiso (and "failed to factorize" under scipy).

This transform parses each orphan's SimaPro-form name, looks it up in
``EcoinventCatalog`` (parquet-backed; no bw2data), and:

* When matched: rewrites every consumer ``input`` to point at the
  ecoinvent activity (and copies name / location / unit / reference
  product so downstream linking doesn't undo it).
* When unmatched: drops the consumer's ``input`` field so
  ``drop_unlinked`` removes the dangling exchange.
* In both cases: removes the now-unreferenced orphan product entry
  from ``sp.data`` before the ``ScoringPackage`` emit so it doesn't
  materialise as a singular matrix row.

Runs AFTER ``RestoreSimaproNamesTransform`` (so the simapro→ecoinvent
datapackage has already had its chance) and BEFORE
``TechnosphereMatcher`` (whose catalog match would otherwise try to
match against orphan names that no ecoinvent activity has).

<a id="transforms.orphan_product_relinker.OrphanProductRelinker"></a>

## OrphanProductRelinker Objects

```python
@dataclass(frozen=True)
class OrphanProductRelinker()
```

<a id="transforms.orphan_product_relinker.OrphanProductRelinker.settings"></a>

#### settings

<a id="transforms.orphan_product_relinker.OrphanProductRelinker.catalog"></a>

#### catalog

<a id="transforms.orphan_product_relinker.OrphanProductRelinker.apply"></a>

#### apply

```python
def apply(sp) -> dict[str, int]
```
