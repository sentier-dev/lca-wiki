**Generated API reference** · package `flowmapper` 0.4 · module `flowmapper.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m flowmapper.utils cfg.yml > flowmapper.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="flowmapper.utils"></a>

# flowmapper.utils

<a id="flowmapper.utils.RESULTS_DIR"></a>

#### RESULTS\_DIR

<a id="flowmapper.utils.ends_with_location"></a>

#### ends\_with\_location

<a id="flowmapper.utils.location_reverser"></a>

#### location\_reverser

<a id="flowmapper.utils.us_lci_ends_with_location"></a>

#### us\_lci\_ends\_with\_location

<a id="flowmapper.utils.load_standard_transformations"></a>

#### load\_standard\_transformations

```python
def load_standard_transformations() -> List
```

<a id="flowmapper.utils.generate_flow_id"></a>

#### generate\_flow\_id

```python
def generate_flow_id(flow: dict)
```

<a id="flowmapper.utils.read_migration_files"></a>

#### read\_migration\_files

```python
def read_migration_files(*filepaths: Union[str, Path]) -> List[dict]
```

Read and aggregate migration data from multiple JSON files.

This function opens and reads a series of JSON files, each containing migration data as a list of dicts without the change type.
It aggregates all changes into a single list and returns it wrapped in a dictionary
under the change type 'update'.

Parameters
----------
*filepaths : Path
    Variable length argument list of Path objects.

Returns
-------
dict
    A dictionary containing a single key 'update', which maps to a list. This list is
    an aggregation of the data from all the JSON files read.

<a id="flowmapper.utils.rm_parentheses_roman_numerals"></a>

#### rm\_parentheses\_roman\_numerals

```python
def rm_parentheses_roman_numerals(s: str)
```

<a id="flowmapper.utils.rm_roman_numerals_ionic_state"></a>

#### rm\_roman\_numerals\_ionic\_state

```python
def rm_roman_numerals_ionic_state(s: str)
```

<a id="flowmapper.utils.normalize_str"></a>

#### normalize\_str

```python
def normalize_str(s)
```

<a id="flowmapper.utils.transform_flow"></a>

#### transform\_flow

```python
def transform_flow(flow, transformation)
```

<a id="flowmapper.utils.matcher"></a>

#### matcher

```python
def matcher(source, target)
```

<a id="flowmapper.utils.rowercase"></a>

#### rowercase

```python
def rowercase(obj: Any) -> Any
```

Recursively transform everything to lower case recursively

<a id="flowmapper.utils.match_sort_order"></a>

#### match\_sort\_order

```python
def match_sort_order(obj: dict) -> tuple
```

<a id="flowmapper.utils.apply_transformations"></a>

#### apply\_transformations

```python
def apply_transformations(obj: dict,
                          transformations: List[dict] | None) -> dict
```
