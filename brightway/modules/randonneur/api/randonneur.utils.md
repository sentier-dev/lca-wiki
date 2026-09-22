**Generated API reference** · package `randonneur` 0.7.2 · module `randonneur.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m randonneur.utils cfg.yml > randonneur.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="randonneur.utils"></a>

# randonneur.utils

<a id="randonneur.utils.ALL_VERBS"></a>

#### ALL\_VERBS

<a id="randonneur.utils.SAFE_VERBS"></a>

#### SAFE\_VERBS

<a id="randonneur.utils.EXCLUDED_ATTRS"></a>

#### EXCLUDED\_ATTRS

<a id="randonneur.utils.apply_mapping"></a>

#### apply\_mapping

```python
def apply_mapping(migrations: dict, mapping: dict, verbs: List[str]) -> dict
```

Apply the label changes in `mapping` to the transformations in `migrations`.

<a id="randonneur.utils.rescale_edge"></a>

#### rescale\_edge

```python
def rescale_edge(edge: dict, factor: Number) -> dict
```

Rescale edges, including formulas and uncertainty values, by a constant factor

<a id="randonneur.utils.right_case"></a>

#### right\_case

```python
def right_case(value: Any, case_sensitive: bool) -> Any
```

Convert strings to lower case, and lists to tuples.

<a id="randonneur.utils.FlexibleLookupDict"></a>

## FlexibleLookupDict Objects

```python
class FlexibleLookupDict(Mapping)
```

<a id="randonneur.utils.FlexibleLookupDict.__init__"></a>

#### \_\_init\_\_

```python
def __init__(input_data: Iterable[dict],
             fields_filter: Optional[List[str]] = None,
             case_sensitive: bool = False)
```

A dictionary that allow for more flexible matching of dictionaries against other dicts.

`input_data` is a dictionary like `{"foo": {"first": True, "bar": 42}}`. We want to match
this input against `{'first': True}` and get back `foo`. Here is an examples:

```python
fld = FlexibleLookupDict(
    input_data=[
        {"source": {"foo": "a", "bar": "b"}},
        {"source": {"foo": "b"}},
    ]
)
fld[{"foo": "b"}] == {"source": {"foo": "b"}}
>>> True
```

For real data we would have input data with both `source` and `target` (or `targets` for
disaggregation) keys. This class makes the **strong assumption** that `input_data` has
`source` and `target`/`targets` keys.

We need to match a dictionary against another dictionary, but the other dictionary doesn't
have a fixed set of keys - they can vary across all the possibilities. We therefore allow
matching based on each unique combination of keys present.

If `fields_filter` is given, then only consider keys present in that list.

```python
fld = FlexibleLookupDict(
    input_data=[
        {"source": {"foo": "a", "bar": "b"}},
        {"source": {"foo": "b"}},
    ],
    fields_filter=["foo"]
)
fld[{"foo": "b", "other": "whatever"}] == {"source": {"foo": "b"}}
>>> True
```

If `case_sensitive`, then do case-sensitive matching on values (not keys) when comparing
strings. Here is an example of a *case-insensitve* match:

```python
fld = FlexibleLookupDict(
    input_data=[
        {"source": {"foo": "a", "bar": "b"}},
        {"source": {"foo": "b"}},
    ],
    case_sensitive=False
)
fld[{"foo": "B"}] == {"source": {"foo": "b"}}
>>> True
```

<a id="randonneur.utils.FlexibleLookupDict.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(obj: dict) -> dict
```

<a id="randonneur.utils.FlexibleLookupDict.__len__"></a>

#### \_\_len\_\_

```python
def __len__() -> int
```

<a id="randonneur.utils.FlexibleLookupDict.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__() -> Iterable
```
