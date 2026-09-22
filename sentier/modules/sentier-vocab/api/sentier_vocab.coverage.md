**Generated API reference** · package `sentier-vocab` 0.0.2 · module `sentier_vocab.coverage` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-vocab repo && git -C repo checkout ef440c6
SP=repo/app
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
  -I "$SP" -m sentier_vocab.coverage cfg.yml > sentier_vocab.coverage.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_vocab.coverage"></a>

# sentier\_vocab.coverage

Generate the living coverage matrix (docs/COVERAGE.md) from the ILCD catalog.

<a id="sentier_vocab.coverage.DataType"></a>

## DataType Objects

```python
@dataclass(frozen=True)
class DataType()
```

<a id="sentier_vocab.coverage.DataType.name"></a>

#### name

<a id="sentier_vocab.coverage.DataType.namespace"></a>

#### namespace

<a id="sentier_vocab.coverage.DataType.status"></a>

#### status

<a id="sentier_vocab.coverage.DataType.source_layer"></a>

#### source\_layer

<a id="sentier_vocab.coverage.DataType.folder"></a>

#### folder

<a id="sentier_vocab.coverage.DataType.notes"></a>

#### notes

<a id="sentier_vocab.coverage.DataType.layer"></a>

#### layer

<a id="sentier_vocab.coverage.CATALOG"></a>

#### CATALOG

<a id="sentier_vocab.coverage.count_terms"></a>

#### count\_terms

```python
def count_terms(folder: str | None) -> int
```

Count native source files (YAML or Parquet) in a category folder.

Returns 0 if the folder is absent or None. Counts files, not records — a single
bulk Parquet (e.g. FoodEx2) counts as one source.

<a id="sentier_vocab.coverage.render"></a>

#### render

```python
def render(catalog: list[DataType] = CATALOG) -> str
```

Render the coverage matrix as Markdown.

<a id="sentier_vocab.coverage.write"></a>

#### write

```python
def write(path: Path | str) -> Path
```

Write the rendered matrix to a file. Returns the path.
