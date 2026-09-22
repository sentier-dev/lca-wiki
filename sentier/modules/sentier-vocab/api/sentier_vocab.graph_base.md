**Generated API reference** · package `sentier-vocab` 0.0.2 · module `sentier_vocab.graph_base` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_vocab.graph_base cfg.yml > sentier_vocab.graph_base.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_vocab.graph_base"></a>

# sentier\_vocab.graph\_base

<a id="sentier_vocab.graph_base.vocab_data_dir"></a>

#### vocab\_data\_dir

<a id="sentier_vocab.graph_base.GraphBase"></a>

## GraphBase Objects

```python
class GraphBase()
```

<a id="sentier_vocab.graph_base.GraphBase.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args,
             data_dir: Path = DEFAULT_DATA_DIR,
             default_lang: str = "en",
             **kwargs) -> None
```

<a id="sentier_vocab.graph_base.GraphBase.as_language_aware_literal"></a>

#### as\_language\_aware\_literal

```python
def as_language_aware_literal(obj: Literal | str,
                              en_title: bool = False) -> Literal
```

<a id="sentier_vocab.graph_base.GraphBase.get_graph_for_file"></a>

#### get\_graph\_for\_file

```python
def get_graph_for_file(filepath: str) -> Graph
```

<a id="sentier_vocab.graph_base.GraphBase.add"></a>

#### add

```python
def add(triple: tuple) -> None
```

<a id="sentier_vocab.graph_base.GraphBase.skosify_checks"></a>

#### skosify\_checks

```python
def skosify_checks()
```

<a id="sentier_vocab.graph_base.GraphBase.get_identifier"></a>

#### get\_identifier

```python
def get_identifier(uri: URIRef) -> str
```

<a id="sentier_vocab.graph_base.GraphBase.write_graph"></a>

#### write\_graph

```python
def write_graph(filename: str, dirpath: Path | None = None) -> Path
```
