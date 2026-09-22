**Generated API reference** · package `sentier-vocab` 0.0.2 · module `sentier_vocab.ordered_serialization` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_vocab.ordered_serialization cfg.yml > sentier_vocab.ordered_serialization.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_vocab.ordered_serialization"></a>

# sentier\_vocab.ordered\_serialization

<a id="sentier_vocab.ordered_serialization.SD"></a>

#### SD

<a id="sentier_vocab.ordered_serialization.ISOTHES"></a>

#### ISOTHES

<a id="sentier_vocab.ordered_serialization.logger"></a>

#### logger

<a id="sentier_vocab.ordered_serialization.OrderedTurtleSerializer"></a>

## OrderedTurtleSerializer Objects

```python
class OrderedTurtleSerializer(TurtleSerializer)
```

<a id="sentier_vocab.ordered_serialization.OrderedTurtleSerializer.short_name"></a>

#### short\_name

<a id="sentier_vocab.ordered_serialization.OrderedTurtleSerializer.__init__"></a>

#### \_\_init\_\_

```python
def __init__(store)
```

<a id="sentier_vocab.ordered_serialization.OrderedTurtleSerializer.getSorters"></a>

#### getSorters

```python
def getSorters(class_uri)
```

<a id="sentier_vocab.ordered_serialization.OrderedTurtleSerializer.getSortKeyFunction"></a>

#### getSortKeyFunction

```python
def getSortKeyFunction(class_uri)
```

<a id="sentier_vocab.ordered_serialization.OrderedTurtleSerializer.orderSubjects"></a>

#### orderSubjects

```python
def orderSubjects()
```
