**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `readers.xlsx_reader` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m readers.xlsx_reader cfg.yml > readers.xlsx_reader.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="readers.xlsx_reader"></a>

# readers.xlsx\_reader

Cached xlsx reader. Composes ParquetCache from core/.

<a id="readers.xlsx_reader.XlsxReader"></a>

## XlsxReader Objects

```python
@dataclass(frozen=True)
class XlsxReader()
```

Read xlsx via parquet cache. Pass an instance of ``ParquetCache``.

A reader bound to one cache directory is reusable across many xlsx
files. The cache key is ``(xlsx_path, sheet_name)``.

<a id="readers.xlsx_reader.XlsxReader.cache"></a>

#### cache

<a id="readers.xlsx_reader.XlsxReader.read"></a>

#### read

```python
def read(path: Path,
         sheet_name: str | None = None,
         *,
         force_rebuild: bool = False) -> pd.DataFrame
```
