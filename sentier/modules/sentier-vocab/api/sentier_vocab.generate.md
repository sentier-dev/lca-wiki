**Generated API reference** · package `sentier-vocab` 0.0.2 · module `sentier_vocab.generate` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_vocab.generate cfg.yml > sentier_vocab.generate.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_vocab.generate"></a>

# sentier\_vocab.generate

Thin native-only pipeline: validate data/*.yaml -> emit output/*.ttl.

This does NOT merge importer output. Importers (app/sentier_vocab/importers/) are
independent and emit their own TTL separately.

<a id="sentier_vocab.generate.build_graph"></a>

#### build\_graph

```python
def build_graph(concepts: list[dict], scheme_uri: str, sv: SchemaView,
                class_name: str) -> Graph
```

Build an rdflib SKOS graph from a list of concept dicts using the schema engine.

<a id="sentier_vocab.generate.write_ttl"></a>

#### write\_ttl

```python
def write_ttl(graph: Graph, output_path: Path | str) -> Path
```

Serialize a graph to TTL using the stable, diff-friendly ordered serializer.

<a id="sentier_vocab.generate.generate_sources"></a>

#### generate\_sources

```python
def generate_sources(schema_path: Path | str, data_paths: list[Path | str],
                     output_path: Path | str) -> Path
```

Validate and merge one or more source files (YAML or Parquet) into one TTL.

Every source for a category must declare the same registered ``scheme``; their
records are concatenated into a single SKOS graph. Each source is validated against
the schema via :func:`validate_collection` (format-agnostic). Returns the output path.

<a id="sentier_vocab.generate.generate_category"></a>

#### generate\_category

```python
def generate_category(category: str, schema_path: Path | str,
                      data_path: Path | str, output_path: Path | str) -> Path
```

Validate one data file, build its graph, and write the TTL. Returns the output path.

Thin single-file wrapper over :func:`generate_sources`.
