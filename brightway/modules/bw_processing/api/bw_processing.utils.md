**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_processing==1.6'
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
  -I "$SP" -m bw_processing.utils cfg.yml > bw_processing.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.utils"></a>

# bw\_processing.utils

<a id="bw_processing.utils.load_bytes"></a>

#### load\_bytes

```python
def load_bytes(obj: Any) -> Any
```

<a id="bw_processing.utils.check_name"></a>

#### check\_name

```python
def check_name(name: str) -> None
```

<a id="bw_processing.utils.check_suffix"></a>

#### check\_suffix

```python
def check_suffix(path: Union[str, Path], suffix=str) -> str
```

Add ``suffix``, if not already in ``path``.

<a id="bw_processing.utils.as_uncertainty_type"></a>

#### as\_uncertainty\_type

```python
def as_uncertainty_type(row: dict) -> int
```

<a id="bw_processing.utils.dictionary_formatter"></a>

#### dictionary\_formatter

```python
def dictionary_formatter(row: dict) -> tuple
```

Format processed array row from dictionary input

<a id="bw_processing.utils.resolve_dict_iterator"></a>

#### resolve\_dict\_iterator

```python
def resolve_dict_iterator(iterator: Any, nrows: int = None) -> tuple
```

Note that this function produces sorted arrays.

<a id="bw_processing.utils.utc_now"></a>

#### utc\_now

```python
def utc_now() -> datetime.datetime
```

Get current datetime compatible with Py 3.8 to 3.12
