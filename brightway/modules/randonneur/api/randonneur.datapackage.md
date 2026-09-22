**Generated API reference** · package `randonneur` 0.7.2 · module `randonneur.datapackage` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'randonneur==0.7.2'
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
  -I "$SP" -m randonneur.datapackage cfg.yml > randonneur.datapackage.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="randonneur.datapackage"></a>

# randonneur.datapackage

<a id="randonneur.datapackage.Datapackage"></a>

## Datapackage Objects

```python
class Datapackage()
```

<a id="randonneur.datapackage.Datapackage.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*,
             name: str,
             description: str,
             contributors: list,
             mapping_source: dict,
             mapping_target: dict,
             source_id: Optional[str] = None,
             target_id: Optional[str] = None,
             homepage: Optional[str] = None,
             created: Optional[datetime] = None,
             version: str = "1.0.0",
             licenses: Optional[list] = None,
             graph_context: Optional[list] = None)
```

<a id="randonneur.datapackage.Datapackage.metadata"></a>

#### metadata

```python
def metadata() -> dict
```

<a id="randonneur.datapackage.Datapackage.add_data"></a>

#### add\_data

```python
def add_data(verb: str, data: list) -> None
```

<a id="randonneur.datapackage.Datapackage.to_json"></a>

#### to\_json

```python
def to_json(filepath: Optional[Path] = None) -> Union[Path, str]
```

<a id="randonneur.datapackage.Datapackage.from_json"></a>

#### from\_json

```python
@staticmethod
def from_json(filepath: Path) -> "Datapackage"
```
