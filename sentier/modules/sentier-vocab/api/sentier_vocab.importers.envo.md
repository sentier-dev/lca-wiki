**Generated API reference** · package `sentier-vocab` 0.0.2 · module `sentier_vocab.importers.envo` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_vocab.importers.envo cfg.yml > sentier_vocab.importers.envo.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_vocab.importers.envo"></a>

# sentier\_vocab.importers.envo

<a id="sentier_vocab.importers.envo.EF_ISO"></a>

#### EF\_ISO

<a id="sentier_vocab.importers.envo.OBO"></a>

#### OBO

<a id="sentier_vocab.importers.envo.LANGUAGE_AWARE"></a>

#### LANGUAGE\_AWARE

<a id="sentier_vocab.importers.envo.VERB_MAPPING"></a>

#### VERB\_MAPPING

<a id="sentier_vocab.importers.envo.ENVO"></a>

## ENVO Objects

```python
class ENVO(GraphBase)
```

<a id="sentier_vocab.importers.envo.ENVO.REPO_URL"></a>

#### REPO\_URL

<a id="sentier_vocab.importers.envo.ENVO.BASE_URI"></a>

#### BASE\_URI

<a id="sentier_vocab.importers.envo.ENVO.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="sentier_vocab.importers.envo.ENVO.add_concept_scheme"></a>

#### add\_concept\_scheme

```python
def add_concept_scheme() -> URIRef
```

<a id="sentier_vocab.importers.envo.ENVO.add_water"></a>

#### add\_water

```python
def add_water() -> None
```

<a id="sentier_vocab.importers.envo.ENVO.recurse_relationship"></a>

#### recurse\_relationship

```python
def recurse_relationship(envo_uri: URIRef, sd_uri: URIRef) -> None
```

<a id="sentier_vocab.importers.envo.ENVO.write_graph"></a>

#### write\_graph

```python
def write_graph(filepath: str = "envo-sentier-dev.ttl",
                dirpath: Path | None = None) -> Path
```
