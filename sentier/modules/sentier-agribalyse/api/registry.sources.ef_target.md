**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `registry.sources.ef_target` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m registry.sources.ef_target cfg.yml > registry.sources.ef_target.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="registry.sources.ef_target"></a>

# registry.sources.ef\_target

``EfCfTargetIndexSource`` — feeds ``target_index_ef.parquet``.

Reads the EF v3.1 CF parquet and emits one row per EF flow with: code,
name, unit, top bucket, categories, CAS. The index is consumed by the
matcher for tier-7 generic EF lookup and tier-5 CAS disambiguation
(fix 1.o).

<a id="registry.sources.ef_target.EfCfTargetIndexSource"></a>

## EfCfTargetIndexSource Objects

```python
@dataclass(frozen=True)
class EfCfTargetIndexSource()
```

Read the EF CF parquet and produce one row per distinct flow UUID.

<a id="registry.sources.ef_target.EfCfTargetIndexSource.path"></a>

#### path

<a id="registry.sources.ef_target.EfCfTargetIndexSource.parquet"></a>

#### parquet

type: ignore[assignment]

<a id="registry.sources.ef_target.EfCfTargetIndexSource.default_unit"></a>

#### default\_unit

<a id="registry.sources.ef_target.EfCfTargetIndexSource.provenance"></a>

#### provenance

<a id="registry.sources.ef_target.EfCfTargetIndexSource.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__() -> None
```

<a id="registry.sources.ef_target.EfCfTargetIndexSource.read"></a>

#### read

```python
def read() -> list[EfTargetIndexRow]
```
