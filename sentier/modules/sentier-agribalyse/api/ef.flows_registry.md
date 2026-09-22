**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `ef.flows_registry` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ef.flows_registry cfg.yml > ef.flows_registry.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ef.flows_registry"></a>

# ef.flows\_registry

``EfFlowsRegistryBuilder`` — emit ``registry/ef_flows.parquet``.

Replaces ``EfDatabase.install()``. Reads the EF flow universe from
``registry/target_index_ef.parquet`` and filters down to the UUIDs
referenced by:

(a) registry biosphere mappings whose ``target_db == ef_db_name``;
(b) EF v3.1 method definitions snapshotted at ``source/ef-v31-methods.json``
    (REFACTOR_FINAL F6 — bw2data is no longer queried at build time).

Determinism: rows sorted by ``code`` before write. Atomic write via
``ParquetAtomicWriter``.

<a id="ef.flows_registry.EfFlowsRegistryBuilder"></a>

## EfFlowsRegistryBuilder Objects

```python
@dataclass(frozen=True)
class EfFlowsRegistryBuilder()
```

Materialise the hygiene-filtered EF flow universe to a parquet.

<a id="ef.flows_registry.EfFlowsRegistryBuilder.settings"></a>

#### settings

<a id="ef.flows_registry.EfFlowsRegistryBuilder.registry"></a>

#### registry

<a id="ef.flows_registry.EfFlowsRegistryBuilder.build"></a>

#### build

```python
def build() -> Path
```
