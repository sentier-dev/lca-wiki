**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `core.parquet_io` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m core.parquet_io cfg.yml > core.parquet_io.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="core.parquet_io"></a>

# core.parquet\_io

``ParquetAtomicWriter`` — atomic ``DataFrame → parquet`` writes.

Three builders in this codebase emit parquet artifacts as their final
side effect (``BiosphereRegistryBuilder``, ``EfFlowsRegistryBuilder``,
``MethodCfRegistryBuilder``). All three need the same crash-safe
``<path>.partial`` + ``os.replace`` pattern so a SIGKILL mid-write never
leaves a half-finished file at the publish path. Centralising the helper
removes the drift hazard — a tweak to compression or engine lands once.

<a id="core.parquet_io.ParquetAtomicWriter"></a>

## ParquetAtomicWriter Objects

```python
class ParquetAtomicWriter()
```

Stateless writer. Use ``ParquetAtomicWriter.write(df, target)``.

<a id="core.parquet_io.ParquetAtomicWriter.write"></a>

#### write

```python
@staticmethod
def write(df: pd.DataFrame, target: Path) -> None
```

Write ``df`` to ``target`` atomically.

``compression=None`` keeps writes deterministic across pyarrow
versions — no codec metadata leakage between rebuilds.
