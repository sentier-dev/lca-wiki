**Generated API reference** · package `flowmapper` 0.4 · module `flowmapper.transformation_mapping` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'flowmapper==0.4'
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
  -I "$SP" -m flowmapper.transformation_mapping cfg.yml > flowmapper.transformation_mapping.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="flowmapper.transformation_mapping"></a>

# flowmapper.transformation\_mapping

<a id="flowmapper.transformation_mapping.ATTRIBUTE_MAPPING"></a>

#### ATTRIBUTE\_MAPPING

<a id="flowmapper.transformation_mapping.ComparableFlowMapping"></a>

## ComparableFlowMapping Objects

```python
class ComparableFlowMapping(UserDict)
```

<a id="flowmapper.transformation_mapping.ComparableFlowMapping.__init__"></a>

#### \_\_init\_\_

```python
def __init__(initialdata: dict)
```

<a id="flowmapper.transformation_mapping.ComparableFlowMapping.__setitem__"></a>

#### \_\_setitem\_\_

```python
def __setitem__(key: Any, value: Any) -> None
```

<a id="flowmapper.transformation_mapping.ComparableFlowMapping.__eq__"></a>

#### \_\_eq\_\_

```python
def __eq__(other: Any) -> bool
```

<a id="flowmapper.transformation_mapping.prepare_transformations"></a>

#### prepare\_transformations

```python
def prepare_transformations(transformations: List[dict] | None) -> List[dict]
```
