**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `readers.json_reader` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-agribalyse repo && git -C repo checkout 3d0df56
SP=repo/src
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
  -I "$SP" -m readers.json_reader cfg.yml > readers.json_reader.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="readers.json_reader"></a>

# readers.json\_reader

Plain-JSON and gzipped-JSON readers.

<a id="readers.json_reader.JsonReader"></a>

## JsonReader Objects

```python
@dataclass(frozen=True)
class JsonReader()
```

Read a UTF-8 JSON file. Stateless; reusable for any path.

<a id="readers.json_reader.JsonReader.read"></a>

#### read

```python
def read(path: Path) -> Any
```

<a id="readers.json_reader.GzJsonReader"></a>

## GzJsonReader Objects

```python
@dataclass(frozen=True)
class GzJsonReader()
```

Read a gzipped UTF-8 JSON file.

<a id="readers.json_reader.GzJsonReader.read"></a>

#### read

```python
def read(path: Path) -> Any
```

<a id="readers.json_reader.JsonOrGzJsonReader"></a>

## JsonOrGzJsonReader Objects

```python
@dataclass(frozen=True)
class JsonOrGzJsonReader()
```

Auto-dispatch by suffix: ``.json`` → plain, ``.gz`` → gzipped.

<a id="readers.json_reader.JsonOrGzJsonReader.plain"></a>

#### plain

<a id="readers.json_reader.JsonOrGzJsonReader.gzipped"></a>

#### gzipped

<a id="readers.json_reader.JsonOrGzJsonReader.read"></a>

#### read

```python
def read(path: Path) -> Any
```
