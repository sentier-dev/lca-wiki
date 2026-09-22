**Generated API reference** · package `sentier-vocab` 0.0.2 · module `sentier_vocab.loaders` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_vocab.loaders cfg.yml > sentier_vocab.loaders.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_vocab.loaders"></a>

# sentier\_vocab.loaders

Load (and write) native data source files in a format-agnostic way.

A category's source data may be authored as YAML (small, hand-curated) or delivered
as Parquet (large, machine-imported — e.g. FoodEx2). Both reduce to the same shape:
a ``scheme`` IRI plus a list of concept records. The rest of the pipeline
(``generate``, validation, ``build_graph``) consumes records and never cares which
format produced them.

The Parquet contract (see docs spec 2026-06-17-foodex2-parquet-delivery):
- columns are the concept's snake_case slots; scalars are ``string``, ``multivalued``
  slots are ``list<string>``;
- ``scheme`` is NOT a column — it lives in the file's Arrow key-value metadata;
- a row missing an optional field stores null / null-list; readers MUST drop those
  keys so the record matches what ``yaml.safe_load`` produces (byte-identical TTL).

<a id="sentier_vocab.loaders.load_source"></a>

#### load\_source

```python
def load_source(path: Path | str, items_key: str) -> tuple[str, list[dict]]
```

Return ``(scheme, records)`` from a ``.yaml`` or ``.parquet`` source file.

``items_key`` is the collection's plural slot name (resolved from the schema's
tree-root); it is only needed to find the list inside a YAML collection mapping.

<a id="sentier_vocab.loaders.arrow_schema_for"></a>

#### arrow\_schema\_for

```python
def arrow_schema_for(sv: SchemaView, class_name: str)
```

Build an explicit Arrow schema for a concept class from its LinkML slots.

Scalar slot -> ``string``; ``multivalued`` slot -> ``list<string>``. Internal
slots (e.g. the collection ``scheme``) are excluded — ``scheme`` is stored as file
metadata, not a column. An explicit schema is mandatory: ``from_pylist`` infers
columns from the first row and silently drops optional columns absent there.

<a id="sentier_vocab.loaders.dump_parquet"></a>

#### dump\_parquet

```python
def dump_parquet(scheme: str, records: list[dict], schema: pa.Schema,
                 path: Path | str) -> Path
```

Write ``records`` to Parquet with an explicit Arrow ``schema`` and ``scheme`` metadata.

Rows are sorted by ``notation`` (fallback ``iri``) and compression is pinned, so the
file is content-stable across re-runs. Used by the one-shot YAML->Parquet migration
and any local export; routine delivery is produced by sentier-importers.
