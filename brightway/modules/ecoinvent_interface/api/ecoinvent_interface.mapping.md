**Generated API reference** · package `ecoinvent_interface` 3.1 · module `ecoinvent_interface.mapping` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'ecoinvent_interface==3.1'
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
  -I "$SP" -m ecoinvent_interface.mapping cfg.yml > ecoinvent_interface.mapping.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ecoinvent_interface.mapping"></a>

# ecoinvent\_interface.mapping

<a id="ecoinvent_interface.mapping.DATA_DIR"></a>

#### DATA\_DIR

<a id="ecoinvent_interface.mapping.get_rp_text"></a>

#### get\_rp\_text

```python
def get_rp_text(exchanges: list) -> str
```

<a id="ecoinvent_interface.mapping.ProcessMapping"></a>

## ProcessMapping Objects

```python
class ProcessMapping()
```

<a id="ecoinvent_interface.mapping.ProcessMapping.__init__"></a>

#### \_\_init\_\_

```python
def __init__(settings: Settings,
             storage: Optional[CachedStorage] = None) -> None
```

<a id="ecoinvent_interface.mapping.ProcessMapping.create_remote_mapping"></a>

#### create\_remote\_mapping

```python
def create_remote_mapping(version: str, system_model: str,
                          max_id: int) -> list
```

<a id="ecoinvent_interface.mapping.ProcessMapping.create_local_mapping"></a>

#### create\_local\_mapping

```python
def create_local_mapping(version: str, system_model: str) -> None
```

<a id="ecoinvent_interface.mapping.ProcessMapping.add_mapping"></a>

#### add\_mapping

```python
def add_mapping(data: List[dict], version: str, system_model: str) -> Path
```
