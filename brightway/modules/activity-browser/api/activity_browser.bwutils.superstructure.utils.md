**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.superstructure.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'activity-browser==3.0.0b202608291724'
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
  -I "$SP" -m activity_browser.bwutils.superstructure.utils cfg.yml > activity_browser.bwutils.superstructure.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.superstructure.utils"></a>

# activity\_browser.bwutils.superstructure.utils

<a id="activity_browser.bwutils.superstructure.utils.SUPERSTRUCTURE"></a>

#### SUPERSTRUCTURE

<a id="activity_browser.bwutils.superstructure.utils.SCENARIO_NAME_JOIN"></a>

#### SCENARIO\_NAME\_JOIN

<a id="activity_browser.bwutils.superstructure.utils.missing_superstructure_columns"></a>

#### missing\_superstructure\_columns

```python
def missing_superstructure_columns(columns) -> list[str]
```

Return required SDF header names absent from ``columns`` (stable order).

<a id="activity_browser.bwutils.superstructure.utils.is_flow_sdf_headers"></a>

#### is\_flow\_sdf\_headers

```python
def is_flow_sdf_headers(columns) -> bool
```

True when all SUPERSTRUCTURE columns are present (extra scenario cols OK).

<a id="activity_browser.bwutils.superstructure.utils.is_partial_flow_sdf_headers"></a>

#### is\_partial\_flow\_sdf\_headers

```python
def is_partial_flow_sdf_headers(columns, *, min_matches: int = 8) -> bool
```

True when headers look like an SDF attempt but are incomplete/misspelled.

<a id="activity_browser.bwutils.superstructure.utils.edit_superstructure_for_string"></a>

#### edit\_superstructure\_for\_string

```python
def edit_superstructure_for_string(superstructure=SUPERSTRUCTURE,
                                   sep="<br>",
                                   fhighlight="")
```

Produces a string format for the essential columns for the scenario difference files with html
style formatting. Allows for different defined structures.

Parameters
----------
superstructure: the list of superstructure column headers (by default set to the SUPERSTRUCTURE index,
this needs to have a defined __str__ operator
sep: a short string that defines the separator for the column headers, by default this is the html line
break <br>
fhighlight: this is provided as a means to highlight the fields, by default this is empty (SHOULD NOT BE
SET TO None), but could be set to "[]", where the first and last elements enclose the field

Returns
-------
A formatted strign with the required file fields

<a id="activity_browser.bwutils.superstructure.utils.guess_flow_type"></a>

#### guess\_flow\_type

```python
def guess_flow_type(row: pd.Series) -> str
```

Given a series of input- and output keys, make a guess on the flow type.

<a id="activity_browser.bwutils.superstructure.utils._time_it_"></a>

#### \_time\_it\_

```python
def _time_it_(func)
```

For use as a wrapper to time the execution of functions using the python time library

<a id="activity_browser.bwutils.superstructure.utils.parameters_to_sdf"></a>

#### parameters\_to\_sdf

```python
def parameters_to_sdf(parameter_scenarios: pd.DataFrame) -> pd.DataFrame
```
