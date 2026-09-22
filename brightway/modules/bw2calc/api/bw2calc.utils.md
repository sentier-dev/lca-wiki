**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2calc==2.5.0'
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
  -I "$SP" -m bw2calc.utils cfg.yml > bw2calc.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.utils"></a>

# bw2calc.utils

<a id="bw2calc.utils.get_seed"></a>

#### get\_seed

```python
def get_seed(seed=None)
```

Get valid Numpy random seed value

<a id="bw2calc.utils.consistent_global_index"></a>

#### consistent\_global\_index

```python
def consistent_global_index(packages, matrix="characterization_matrix")
```

<a id="bw2calc.utils.convert_tuple_to_list"></a>

#### convert\_tuple\_to\_list

```python
def convert_tuple_to_list(obj: Any) -> Any
```

<a id="bw2calc.utils.wrap_functional_unit"></a>

#### wrap\_functional\_unit

```python
def wrap_functional_unit(dct)
```

Transform functional units for effective logging.
Turns ``Activity`` objects into their keys.

<a id="bw2calc.utils.get_datapackage"></a>

#### get\_datapackage

```python
def get_datapackage(obj)
```

<a id="bw2calc.utils.utc_now"></a>

#### utc\_now

```python
def utc_now() -> datetime.datetime
```

Get current datetime compatible with Py 3.8 to 3.12
