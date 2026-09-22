**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.core.write` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-importers repo && git -C repo checkout dac2e67
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
  -I "$SP" -m sentier_importers.core.write cfg.yml > sentier_importers.core.write.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.core.write"></a>

# sentier\_importers.core.write

Registry of output writers: json | yaml | parquet. The framework never emits
TTL — RDF is an input concern only.

The Parquet writer is the bulk delivery format for large vocab imports (e.g. FoodEx2);
see the cross-repo spec docs/specs/2026-06-17-foodex2-parquet-delivery.md. Its contract:
columns are the item's snake_case slots (scalar -> string, multivalued -> list<string>);
``scheme`` is stored in Arrow key-value metadata, not a column; rows are sorted by
``notation`` (fallback ``iri``) for content-stability. The Arrow schema is explicit —
``from_pylist`` infers from the first row and silently drops optional columns absent there.

<a id="sentier_importers.core.write.WriterFn"></a>

#### WriterFn

<a id="sentier_importers.core.write.EXTENSIONS"></a>

#### EXTENSIONS

<a id="sentier_importers.core.write.register_writer"></a>

#### register\_writer

```python
def register_writer(fmt: str, fn: WriterFn) -> None
```

Register (or override) a writer for an output ``fmt`` string.

<a id="sentier_importers.core.write.write"></a>

#### write

```python
def write(payload: Payload,
          path: Path,
          fmt: str,
          arrow_schema: "pa.Schema | None" = None) -> Path
```

Write ``payload`` to ``path`` using the writer registered for ``fmt``.

``payload`` is a list of rows or a single assembled collection mapping. The
``json``/``yaml`` writers serialize either. ``parquet`` writes the items as a table
with ``scheme`` in metadata; pass ``arrow_schema`` (from :func:`arrow_schema_for`) so
optional columns are never dropped. Creates parent directories. Returns the path.

<a id="sentier_importers.core.write.arrow_schema_for"></a>

#### arrow\_schema\_for

```python
def arrow_schema_for(schema_path: Path | str, item_class: str) -> pa.Schema
```

Build an explicit Arrow schema for ``item_class`` from its LinkML slots.

Scalar slot -> ``string``; ``multivalued`` slot -> ``list<string>``. Column order is
the schema's slot order. The collection ``scheme`` is not an item slot, so it never
appears here (it is written as file metadata instead).
