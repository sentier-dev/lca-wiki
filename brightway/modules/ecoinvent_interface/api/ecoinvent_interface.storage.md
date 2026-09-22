**Generated API reference** · package `ecoinvent_interface` 3.1 · module `ecoinvent_interface.storage` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ecoinvent_interface.storage cfg.yml > ecoinvent_interface.storage.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ecoinvent_interface.storage"></a>

# ecoinvent\_interface.storage

<a id="ecoinvent_interface.storage.base_dir"></a>

#### base\_dir

<a id="ecoinvent_interface.storage.cache_dir_platformdirs"></a>

#### cache\_dir\_platformdirs

<a id="ecoinvent_interface.storage.secrets_dir"></a>

#### secrets\_dir

<a id="ecoinvent_interface.storage.Catalogue"></a>

## Catalogue Objects

```python
class Catalogue(MutableMapping)
```

Synchronous JSON dictionary

<a id="ecoinvent_interface.storage.Catalogue.__init__"></a>

#### \_\_init\_\_

```python
def __init__(filepath: Path)
```

<a id="ecoinvent_interface.storage.Catalogue.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(key: str) -> dict
```

<a id="ecoinvent_interface.storage.Catalogue.__setitem__"></a>

#### \_\_setitem\_\_

```python
def __setitem__(key: str, value: dict) -> None
```

<a id="ecoinvent_interface.storage.Catalogue.__delitem__"></a>

#### \_\_delitem\_\_

```python
def __delitem__(key: str) -> None
```

<a id="ecoinvent_interface.storage.Catalogue.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__() -> Iterable[str]
```

<a id="ecoinvent_interface.storage.Catalogue.__len__"></a>

#### \_\_len\_\_

```python
def __len__() -> int
```

<a id="ecoinvent_interface.storage.CachedStorage"></a>

## CachedStorage Objects

```python
class CachedStorage()
```

<a id="ecoinvent_interface.storage.CachedStorage.__init__"></a>

#### \_\_init\_\_

```python
def __init__(cache_dir: Union[None, Path, str] = None)
```

<a id="ecoinvent_interface.storage.CachedStorage.clear"></a>

#### clear

```python
def clear()
```

<a id="ecoinvent_interface.storage.md5"></a>

#### md5

```python
def md5(filepath: Union[str, Path], blocksize: int = 65536) -> str
```

Generate MD5 hash for file at `filepath`
