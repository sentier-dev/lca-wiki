**Generated API reference** · package `sentier-vocab` 0.0.2 · module `sentier_vocab.importers.qudt` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_vocab.importers.qudt cfg.yml > sentier_vocab.importers.qudt.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_vocab.importers.qudt"></a>

# sentier\_vocab.importers.qudt

<a id="sentier_vocab.importers.qudt.VAEM"></a>

#### VAEM

<a id="sentier_vocab.importers.qudt.QUDTS"></a>

#### QUDTS

<a id="sentier_vocab.importers.qudt.QUDTV"></a>

#### QUDTV

<a id="sentier_vocab.importers.qudt.QK"></a>

#### QK

<a id="sentier_vocab.importers.qudt.vocab_data_dir"></a>

#### vocab\_data\_dir

<a id="sentier_vocab.importers.qudt.selected_fp"></a>

#### selected\_fp

<a id="sentier_vocab.importers.qudt.extra_concepts_data"></a>

#### extra\_concepts\_data

<a id="sentier_vocab.importers.qudt.qudt_patches_data"></a>

#### qudt\_patches\_data

<a id="sentier_vocab.importers.qudt.QUDT"></a>

## QUDT Objects

```python
class QUDT()
```

<a id="sentier_vocab.importers.qudt.QUDT.__init__"></a>

#### \_\_init\_\_

```python
def __init__(data_dir: Path = DEFAULT_DATA_DIR, default_lang: str = "en")
```

<a id="sentier_vocab.importers.qudt.QUDT.add"></a>

#### add

```python
def add(triple: tuple) -> None
```

<a id="sentier_vocab.importers.qudt.QUDT.get_latest_version"></a>

#### get\_latest\_version

```python
def get_latest_version(data_dir: Path) -> Path
```

<a id="sentier_vocab.importers.qudt.QUDT.get_zipfile_prefix"></a>

#### get\_zipfile\_prefix

```python
def get_zipfile_prefix() -> str
```

<a id="sentier_vocab.importers.qudt.QUDT.get_graph_for_file"></a>

#### get\_graph\_for\_file

```python
def get_graph_for_file(path: str) -> Graph
```

<a id="sentier_vocab.importers.qudt.QUDT.write_graph"></a>

#### write\_graph

```python
def write_graph(filename: str = "qudt-sentier-dev.ttl",
                dirpath: Path | None = None) -> Path
```

<a id="sentier_vocab.importers.qudt.QUDT.skosify_checks"></a>

#### skosify\_checks

```python
def skosify_checks()
```

<a id="sentier_vocab.importers.qudt.QUDT.add_concept_scheme"></a>

#### add\_concept\_scheme

```python
def add_concept_scheme() -> URIRef
```

<a id="sentier_vocab.importers.qudt.QUDT.as_language_aware_literal"></a>

#### as\_language\_aware\_literal

```python
def as_language_aware_literal(obj: Literal, en_title: bool = False) -> Literal
```

<a id="sentier_vocab.importers.qudt.QUDT.get_identifier"></a>

#### get\_identifier

```python
def get_identifier(uri: URIRef) -> str
```

<a id="sentier_vocab.importers.qudt.QUDT.deprecated"></a>

#### deprecated

```python
def deprecated(graph: Graph, key: URIRef) -> bool
```

<a id="sentier_vocab.importers.qudt.QUDT.check_that_deprecated_have_replaced_by"></a>

#### check\_that\_deprecated\_have\_replaced\_by

```python
def check_that_deprecated_have_replaced_by(graph: Graph, kind: str) -> bool
```

<a id="sentier_vocab.importers.qudt.QUDT.add_quantity_kinds"></a>

#### add\_quantity\_kinds

```python
def add_quantity_kinds(cs: URIRef) -> dict[URIRef, URIRef]
```

<a id="sentier_vocab.importers.qudt.QUDT.check_all_units_have_vector"></a>

#### check\_all\_units\_have\_vector

```python
def check_all_units_have_vector(graph: Graph) -> None
```

<a id="sentier_vocab.importers.qudt.QUDT.is_unitary"></a>

#### is\_unitary

```python
@lru_cache(maxsize=1024)
def is_unitary(graph: Graph, uri: URIRef) -> bool
```

<a id="sentier_vocab.importers.qudt.QUDT.fill_missing_attributes"></a>

#### fill\_missing\_attributes

```python
def fill_missing_attributes() -> None
```

Our custom concepts can be narrower than an existing QUDT unit. In these cases, we don't
copy over all the additional data from the "parent" concept, but add it automatically.

<a id="sentier_vocab.importers.qudt.QUDT.add_units"></a>

#### add\_units

```python
def add_units(cs: URIRef, qk_mapping: dict[URIRef, URIRef]) -> None
```

<a id="sentier_vocab.importers.qudt.QUDT.add_unit"></a>

#### add\_unit

```python
def add_unit(uri: URIRef, unit_graph: Graph, cs: URIRef,
             qudt_uri: URIRef) -> None
```

<a id="sentier_vocab.importers.qudt.add_quantity_kinds_to_graph"></a>

#### add\_quantity\_kinds\_to\_graph

```python
def add_quantity_kinds_to_graph(input_ttl: Path, qudt_ttl: Path) -> Path
```

The `input_ttl` concept scheme was written by hand (!), but we can make it more useful by
positioning each input concept in the QUDT quantity kind hierarchy.
