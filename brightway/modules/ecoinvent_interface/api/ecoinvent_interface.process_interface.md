**Generated API reference** · package `ecoinvent_interface` 3.1 · module `ecoinvent_interface.process_interface` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ecoinvent_interface.process_interface cfg.yml > ecoinvent_interface.process_interface.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ecoinvent_interface.process_interface"></a>

# ecoinvent\_interface.process\_interface

<a id="ecoinvent_interface.process_interface.DATA_DIR"></a>

#### DATA\_DIR

<a id="ecoinvent_interface.process_interface.logger"></a>

#### logger

<a id="ecoinvent_interface.process_interface.get_cached_mapping"></a>

#### get\_cached\_mapping

```python
@lru_cache(maxsize=4)
def get_cached_mapping(version: str, system_model: str) -> dict
```

<a id="ecoinvent_interface.process_interface.MissingProcess"></a>

## MissingProcess Objects

```python
class MissingProcess(BaseException)
```

Operation not possible because no process selected

<a id="ecoinvent_interface.process_interface.selected_process"></a>

#### selected\_process

```python
def selected_process(f)
```

<a id="ecoinvent_interface.process_interface.split_url"></a>

#### split\_url

```python
def split_url(url: str) -> Tuple[str, dict]
```

Split a URL with params into a base path and a params dict

<a id="ecoinvent_interface.process_interface.ProcessFileType"></a>

## ProcessFileType Objects

```python
class ProcessFileType(Enum)
```

<a id="ecoinvent_interface.process_interface.ProcessFileType.upr"></a>

#### upr

<a id="ecoinvent_interface.process_interface.ProcessFileType.lci"></a>

#### lci

<a id="ecoinvent_interface.process_interface.ProcessFileType.lcia"></a>

#### lcia

<a id="ecoinvent_interface.process_interface.ProcessFileType.pdf"></a>

#### pdf

<a id="ecoinvent_interface.process_interface.ProcessFileType.undefined"></a>

#### undefined

<a id="ecoinvent_interface.process_interface.ZIPPED_FILE_TYPES"></a>

#### ZIPPED\_FILE\_TYPES

<a id="ecoinvent_interface.process_interface.as_tuple"></a>

#### as\_tuple

```python
def as_tuple(version_string: str) -> Tuple[int, int]
```

<a id="ecoinvent_interface.process_interface.EcoinventProcess"></a>

## EcoinventProcess Objects

```python
class EcoinventProcess(InterfaceBase)
```

<a id="ecoinvent_interface.process_interface.EcoinventProcess.set_release"></a>

#### set\_release

```python
def set_release(version: str, system_model: str) -> None
```

<a id="ecoinvent_interface.process_interface.EcoinventProcess.select_process"></a>

#### select\_process

```python
def select_process(attributes: Optional[dict] = None,
                   filename: Optional[str] = None,
                   dataset_id: Optional[str] = None) -> None
```

<a id="ecoinvent_interface.process_interface.EcoinventProcess.get_basic_info"></a>

#### get\_basic\_info

```python
def get_basic_info() -> dict
```

<a id="ecoinvent_interface.process_interface.EcoinventProcess.get_documentation"></a>

#### get\_documentation

```python
def get_documentation() -> dict
```

<a id="ecoinvent_interface.process_interface.EcoinventProcess.get_file"></a>

#### get\_file

```python
def get_file(file_type: ProcessFileType, directory: Path) -> Path
```
