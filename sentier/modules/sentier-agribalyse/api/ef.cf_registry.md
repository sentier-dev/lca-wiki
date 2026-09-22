**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `ef.cf_registry` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ef.cf_registry cfg.yml > ef.cf_registry.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ef.cf_registry"></a>

# ef.cf\_registry

``MethodCfRegistryBuilder`` / ``MethodCfRegistryLoader`` — per-method CF parquets.

Reads two source-file inputs (REFACTOR_FINAL F6):

(a) augmented CFs from ``EfCfTable.global_cfs`` for the EF method name
    in ``EF_METHOD_MAP`` — keyed on ``(ef_db_name, FLOW_uuid)``.
(b) inherited CFs from ``source/ef-v31-methods.json`` — pre-snapshotted
    biosphere3 entries (db != ef_db_name) the legacy
    ``EfMethodAugmenter`` preserved via its ``keep`` filter.

No bw2data, no SQLite. Determinism + atomic write per file
(``<path>.partial`` + ``os.replace``).

<a id="ef.cf_registry.MethodCfRegistryBuilder"></a>

## MethodCfRegistryBuilder Objects

```python
@dataclass(frozen=True)
class MethodCfRegistryBuilder()
```

Build per-method CF parquets from the EF source CSV + the bw2data snapshot.

Optionally intersects the inherited CFs with the SimaPro EF 3.1
(adapted) reference method ADEME used for the AGRIBALYSE 3.2
synthesis (``simapro_filter`` argument). When set, every
biosphere3-coded inherited CF is dropped if SimaPro doesn't carry
a matching ``(name, top compartment)`` for that method, with a
biosphere-flowmap synonym fallback. See ``SimaProCfFilter`` and
FIX_DATA.md § 1.1 for why this is needed (Kaolin / Water[air] /
pesticide CFs were inherited from ecoinvent's LCIA xlsx but are
*not* in JRC's authoritative reference dataset).

<a id="ef.cf_registry.MethodCfRegistryBuilder.settings"></a>

#### settings

<a id="ef.cf_registry.MethodCfRegistryBuilder.cf_table"></a>

#### cf\_table

<a id="ef.cf_registry.MethodCfRegistryBuilder.simapro_filter"></a>

#### simapro\_filter

<a id="ef.cf_registry.MethodCfRegistryBuilder.water_resource_augmenter"></a>

#### water\_resource\_augmenter

<a id="ef.cf_registry.MethodCfRegistryBuilder.water_use_bio3_bridge"></a>

#### water\_use\_bio3\_bridge

<a id="ef.cf_registry.MethodCfRegistryBuilder.regional_water_cf_builder"></a>

#### regional\_water\_cf\_builder

<a id="ef.cf_registry.MethodCfRegistryBuilder.regional_cf_builder"></a>

#### regional\_cf\_builder

<a id="ef.cf_registry.MethodCfRegistryBuilder.sp_regional_water_cf_loader"></a>

#### sp\_regional\_water\_cf\_loader

<a id="ef.cf_registry.MethodCfRegistryBuilder.WATER_USE_KEY"></a>

#### WATER\_USE\_KEY

<a id="ef.cf_registry.MethodCfRegistryBuilder.EF_METHOD_MAP"></a>

#### EF\_METHOD\_MAP

<a id="ef.cf_registry.MethodCfRegistryBuilder.INDEX_VERSION"></a>

#### INDEX\_VERSION

<a id="ef.cf_registry.MethodCfRegistryBuilder.build"></a>

#### build

```python
def build() -> Path
```

<a id="ef.cf_registry.MethodCfRegistryLoader"></a>

## MethodCfRegistryLoader Objects

```python
@dataclass(frozen=True)
class MethodCfRegistryLoader()
```

Read ``registry/method_cfs/`` back into ``dict[method_tuple, DataFrame]``.

<a id="ef.cf_registry.MethodCfRegistryLoader.registry_dir"></a>

#### registry\_dir

<a id="ef.cf_registry.MethodCfRegistryLoader.INDEX_VERSION"></a>

#### INDEX\_VERSION

<a id="ef.cf_registry.MethodCfRegistryLoader.REGIONAL_FILENAME"></a>

#### REGIONAL\_FILENAME

<a id="ef.cf_registry.MethodCfRegistryLoader.load_all"></a>

#### load\_all

```python
def load_all() -> dict[tuple[str, ...], pd.DataFrame]
```

<a id="ef.cf_registry.MethodCfRegistryLoader.load_regional_all"></a>

#### load\_regional\_all

```python
def load_regional_all() -> dict[tuple[str, ...], pd.DataFrame]
```

Return per-method regional CF dataframes — keyed identically to
``load_all``. Methods without a ``regional_cfs.parquet`` sidecar
are simply absent from the returned dict (caller treats them as
"no regional correction"). Skipping callers can avoid loading
what doesn't exist by checking the ``n_regional_cfs`` count in
``_index.json``.
