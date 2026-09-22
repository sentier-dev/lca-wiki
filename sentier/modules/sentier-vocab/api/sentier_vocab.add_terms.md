**Generated API reference** · package `sentier-vocab` 0.0.2 · module `sentier_vocab.add_terms` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_vocab.add_terms cfg.yml > sentier_vocab.add_terms.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_vocab.add_terms"></a>

# sentier\_vocab.add\_terms

<a id="sentier_vocab.add_terms.VAEM"></a>

#### VAEM

<a id="sentier_vocab.add_terms.QUDTS"></a>

#### QUDTS

<a id="sentier_vocab.add_terms.QUDTV"></a>

#### QUDTV

<a id="sentier_vocab.add_terms.QK"></a>

#### QK

<a id="sentier_vocab.add_terms.COMMON_PREDICATES"></a>

#### COMMON\_PREDICATES

<a id="sentier_vocab.add_terms.OBJECT_TYPES_FOR_PREDICATES"></a>

#### OBJECT\_TYPES\_FOR\_PREDICATES

<a id="sentier_vocab.add_terms.COMMON_OBJECTS"></a>

#### COMMON\_OBJECTS

<a id="sentier_vocab.add_terms.add_custom_terms"></a>

#### add\_custom\_terms

```python
def add_custom_terms(data: list[dict], namespace: str, filename: str) -> Path
```

Add new `Concept` terms, validate them, and serialize the graph.

`data` is a list of dicts which define each triple. The dicts can have the following structure:

```python
{
    'subject': str, # required; will be combined with `namespace` and turned into a `URIRef`
    'predicate': str | URIRef, # required; see COMMON_PREDICATES for allowed strings
    'object': str | URIRef | Literal, # required; type inferred from predicate if possible
    'language': str  # optional; only for literal `object` values.
}
```

If given a string, and the `predicate` is `RDF.type`, `object` will use `COMMON_OBJECTS`
mapping if possible.
