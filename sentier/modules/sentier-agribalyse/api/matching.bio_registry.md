**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `matching.bio_registry` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matching.bio_registry cfg.yml > matching.bio_registry.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matching.bio_registry"></a>

# matching.bio\_registry

``BiosphereRegistryBuilder`` — assemble ``registry/biosphere_catalog.parquet``.

After REFACTOR_FINAL phase F6 the builder reads exclusively from
checked-in source files:

* ``source/biosphere3-flows.json`` — the bw2io-shipped biosphere3
  elementary-flow universe, snapshotted once (4709 flows for 3.9).
* ``source/ecoinvent-3.9.1-biosphere-flows.json`` — the ecoinvent
  biosphere database, snapshotted once after a fresh
  ``bw2io.import_ecoinvent_release`` (~4700 flows for 3.9.1).
* ``registry/ef_flows.parquet`` — the EF v3.1 universe materialised by
  ``EfFlowsRegistryBuilder`` (already SQLite-free since L2).

No bw2data, no SQLite, no `_vacuum`. Determinism + atomic write are
preserved (sorted by ``(database, code)``, ``ParquetAtomicWriter``).

<a id="matching.bio_registry.BiosphereRegistryBuilder"></a>

## BiosphereRegistryBuilder Objects

```python
@dataclass(frozen=True)
class BiosphereRegistryBuilder()
```

Materialise ``biosphere_catalog.parquet`` from source-file snapshots.

<a id="matching.bio_registry.BiosphereRegistryBuilder.settings"></a>

#### settings

<a id="matching.bio_registry.BiosphereRegistryBuilder.build"></a>

#### build

```python
def build() -> Path
```

Read every snapshot + the EF parquet, write the catalog parquet.
