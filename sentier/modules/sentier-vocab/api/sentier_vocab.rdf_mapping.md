**Generated API reference** · package `sentier-vocab` 0.0.2 · module `sentier_vocab.rdf_mapping` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_vocab.rdf_mapping cfg.yml > sentier_vocab.rdf_mapping.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_vocab.rdf_mapping"></a>

# sentier\_vocab.rdf\_mapping

Schema-driven RDF serialization.

Turns a validated data record into RDF triples by reading each LinkML slot's
``slot_uri`` and ``range`` from the schema. Adding a data type never requires
touching this module.

<a id="sentier_vocab.rdf_mapping.schema_view"></a>

#### schema\_view

```python
@lru_cache(maxsize=None)
def schema_view(schema_path: str) -> SchemaView
```

Cached SchemaView for a schema file path.

<a id="sentier_vocab.rdf_mapping.member_slot_and_class"></a>

#### member\_slot\_and\_class

```python
def member_slot_and_class(sv: SchemaView) -> tuple[str, str]
```

Return (collection_list_slot_name, member_class_name) for the schema's tree_root.

<a id="sentier_vocab.rdf_mapping.concept_to_triples"></a>

#### concept\_to\_triples

```python
def concept_to_triples(record: dict, class_name: str, sv: SchemaView,
                       scheme: str) -> list
```

Top-level: rdf:type + skos:inScheme + all slot triples for one record.
