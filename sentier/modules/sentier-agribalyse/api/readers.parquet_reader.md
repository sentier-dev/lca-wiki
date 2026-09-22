**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `readers.parquet_reader` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m readers.parquet_reader cfg.yml > readers.parquet_reader.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="readers.parquet_reader"></a>

# readers.parquet\_reader

Parquet reader.

<a id="readers.parquet_reader.ParquetReader"></a>

## ParquetReader Objects

```python
@dataclass(frozen=True)
class ParquetReader()
```

Read a parquet file into a DataFrame.

<a id="readers.parquet_reader.ParquetReader.read"></a>

#### read

```python
def read(path: Path) -> pd.DataFrame
```
