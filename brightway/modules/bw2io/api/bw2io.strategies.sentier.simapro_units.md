**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.strategies.sentier.simapro_units` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.strategies.sentier.simapro_units cfg.yml > bw2io.strategies.sentier.simapro_units.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.strategies.sentier.simapro_units"></a>

# bw2io.strategies.sentier.simapro\_units

<a id="bw2io.strategies.sentier.simapro_units.logger"></a>

#### logger

<a id="bw2io.strategies.sentier.simapro_units.SimaProUnitConverter"></a>

## SimaProUnitConverter Objects

```python
class SimaProUnitConverter()
```

<a id="bw2io.strategies.sentier.simapro_units.SimaProUnitConverter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(sparql_url: str = "https://fuseki.d-d-s.ch/skosmos/query",
             simapro_graph: str = "https://vocab.sentier.dev/simapro/",
             qudt_graph: str = "https://vocab.sentier.dev/units/",
             ecoinvent_uri: str = "https://glossary.ecoinvent.org/",
             qk_uri: str = "https://vocab.sentier.dev/units/quantity-kind/")
```

<a id="bw2io.strategies.sentier.simapro_units.SimaProUnitConverter.uri_for_unit_string"></a>

#### uri\_for\_unit\_string

```python
def uri_for_unit_string(unit: str) -> str
```

<a id="bw2io.strategies.sentier.simapro_units.SimaProUnitConverter.unit_string_from_uri"></a>

#### unit\_string\_from\_uri

```python
def unit_string_from_uri(uri: str) -> str
```

<a id="bw2io.strategies.sentier.simapro_units.SimaProUnitConverter.get_simapro_conversions"></a>

#### get\_simapro\_conversions

```python
@lru_cache(maxsize=512)
def get_simapro_conversions(unit: str, qk: Optional[str] = None) -> list
```

<a id="bw2io.strategies.sentier.simapro_units.SimaProUnitConverter.populate_qudt_cache"></a>

#### populate\_qudt\_cache

```python
def populate_qudt_cache() -> None
```

<a id="bw2io.strategies.sentier.simapro_units.match_internal_simapro_simapro_with_unit_conversion"></a>

#### match\_internal\_simapro\_simapro\_with\_unit\_conversion

```python
def match_internal_simapro_simapro_with_unit_conversion(
        data: list,
        type: str = "technosphere",
        fields: Optional[List[str]] = None) -> list
```
