**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.export.ecospold1` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2io==0.9.17'
SP="$(pkg/bin/python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
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
  -I "$SP" -m bw2io.export.ecospold1 cfg.yml > bw2io.export.ecospold1.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.export.ecospold1"></a>

# bw2io.export.ecospold1

<a id="bw2io.export.ecospold1.attr_qname"></a>

#### attr\_qname

<a id="bw2io.export.ecospold1.nsmap"></a>

#### nsmap

<a id="bw2io.export.ecospold1.bool_to_text"></a>

#### bool\_to\_text

```python
def bool_to_text(b: Union[bool, str]) -> str
```

<a id="bw2io.export.ecospold1.stripper"></a>

#### stripper

```python
def stripper(obj: str, prefix: str) -> str
```

<a id="bw2io.export.ecospold1.pretty_number"></a>

#### pretty\_number

```python
def pretty_number(val: float) -> str
```

<a id="bw2io.export.ecospold1.Ecospold1Exporter"></a>

## Ecospold1Exporter Objects

```python
class Ecospold1Exporter()
```

Export one or more datasets to Ecospold1 XML.

The combination of `Ecospold1DataExtractor` and `Ecospold1Exporter` does
not give prefect roundtrip data flow, especially if data if coming from
closed-source software with unspecified behaviour. The following
differences have been observed:

* This class uses an updated Ecospold1 set of XSDs from https://github.com/sami-m-g/pyecospold/tree/main/pyecospold/schemas/v1
* The dataset `generator` field is different (`bw2io`)
* The dataset `number` is not preserved
* Number formatting is different. We round numbers like `10.2000000000000011` to `10.2`, and always keep at least one decimal point.
* We always include an `uncertaintyType` for exchanges
* We always include an `infrastructureProcess` for exchanges (default `false`)
* The field `dataGeneratorAndPublication` is not used consistently - we always fill this with dummy data.
* We eliminate duplicate identical `person` elements
* `person` and `source` elements can be renumbered, but references are kept correct

<a id="bw2io.export.ecospold1.Ecospold1Exporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(schema_location: Union[str, None] = None)
```

<a id="bw2io.export.ecospold1.Ecospold1Exporter.add_dataset"></a>

#### add\_dataset

```python
def add_dataset(node: dict) -> None
```

<a id="bw2io.export.ecospold1.Ecospold1Exporter.bytes"></a>

#### bytes

```python
@property
def bytes() -> bytes
```

<a id="bw2io.export.ecospold1.Ecospold1Exporter.__repr__"></a>

#### \_\_repr\_\_

```python
def __repr__() -> str
```

<a id="bw2io.export.ecospold1.Ecospold1Exporter.write_to_file"></a>

#### write\_to\_file

```python
def write_to_file(filepath: Path) -> None
```
