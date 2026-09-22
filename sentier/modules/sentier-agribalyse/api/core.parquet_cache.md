**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `core.parquet_cache` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m core.parquet_cache cfg.yml > core.parquet_cache.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="core.parquet_cache"></a>

# core.parquet\_cache

Parquet-cached xlsx reader. Class-based, takes ``cache_dir`` in constructor.

<a id="core.parquet_cache.ParquetCache"></a>

## ParquetCache Objects

```python
@dataclass(frozen=True)
class ParquetCache()
```

Read xlsx files via a sibling parquet cache.

``cache_dir=None`` → caches sit next to the source xlsx (legacy behaviour).

<a id="core.parquet_cache.ParquetCache.cache_dir"></a>

#### cache\_dir

<a id="core.parquet_cache.ParquetCache.parquet_path_for"></a>

#### parquet\_path\_for

```python
def parquet_path_for(xlsx_path: Path, sheet_name: str | None = None) -> Path
```

<a id="core.parquet_cache.ParquetCache.read_excel"></a>

#### read\_excel

```python
def read_excel(xlsx_path: Path,
               *,
               sheet_name: str | None = None,
               force_rebuild: bool = False) -> pd.DataFrame
```
