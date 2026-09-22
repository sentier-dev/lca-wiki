**Generated API reference** · package `sentier-vocab` 0.0.2 · module `sentier_vocab.iris` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_vocab.iris cfg.yml > sentier_vocab.iris.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_vocab.iris"></a>

# sentier\_vocab.iris

Central registry of published Sentier.dev IRI namespaces.

This module is the single source of truth for every `https://vocab.sentier.dev/`
namespace and the stability contract for the published vocabulary. All term
generation and schema prefixes reference it; nothing should hardcode these
strings elsewhere.

<a id="sentier_vocab.iris.BASE"></a>

#### BASE

<a id="sentier_vocab.iris.ONTOLOGY"></a>

#### ONTOLOGY

<a id="sentier_vocab.iris.NAMESPACES"></a>

#### NAMESPACES

<a id="sentier_vocab.iris.namespace_for"></a>

#### namespace\_for

```python
def namespace_for(category: str) -> Namespace
```

Return the rdflib Namespace for a category key. Raises KeyError if unknown.

<a id="sentier_vocab.iris.iri_for"></a>

#### iri\_for

```python
def iri_for(category: str, identifier: str) -> URIRef
```

Build the full IRI for a term in a category.

<a id="sentier_vocab.iris.iri_for_cf"></a>

#### iri\_for\_cf

```python
def iri_for_cf(method_id: str, impact_id: str, flow_id: str) -> URIRef
```

Deterministic IRI for a characterization factor (method + impact category + flow).

<a id="sentier_vocab.iris.identifier_from"></a>

#### identifier\_from

```python
def identifier_from(iri: str | URIRef) -> str
```

Extract the trailing identifier from a Sentier.dev term IRI.

The *iri* argument must be a full **term** IRI — that is, a namespace IRI
with an identifier appended, e.g.
``https://vocab.sentier.dev/flows/ENVO_00002006``.  Passing a bare
namespace IRI (one that ends with ``/``) is undefined behaviour.
