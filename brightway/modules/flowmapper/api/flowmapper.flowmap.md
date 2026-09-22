**Generated API reference** · package `flowmapper` 0.4 · module `flowmapper.flowmap` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m flowmapper.flowmap cfg.yml > flowmapper.flowmap.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="flowmapper.flowmap"></a>

# flowmapper.flowmap

<a id="flowmapper.flowmap.source_flow_id"></a>

#### source\_flow\_id

```python
def source_flow_id(obj: Flow, ensure_id: bool = False) -> str
```

<a id="flowmapper.flowmap.Flowmap"></a>

## Flowmap Objects

```python
class Flowmap()
```

Crosswalk of flows from a source flow list to a target flow list.

This class provides functionalities to map flows between different flow lists using a series of predefined match rules.

Attributes
----------
source_flows : list[Flow]
    The list of (unique) source flows to be mapped.
source_flows_nomatch : list[Flow]
    The list of (unique) source flows that do not match any rule.
target_flows : list[Flow]
    The list of target flows for mapping.
target_flows_nomatch : list[Flow]
    The list of target flows that do not match any rule.

<a id="flowmapper.flowmap.Flowmap.__init__"></a>

#### \_\_init\_\_

```python
def __init__(source_flows: list[Flow],
             target_flows: list[Flow],
             rules: list[Callable[..., bool]] = None,
             nomatch_rules: list[Callable[..., bool]] = None,
             disable_progress: bool = False)
```

Initializes the Flowmap with source and target flows, along with optional matching rules.

Duplicated flows are removed from both source and targets lists.

Parameters
----------
source_flows : list[Flow]
    The list of source flows to be mapped.
target_flows : list[Flow]
    The list of target flows for mapping.
rules : list[Callable[..., bool]], optional
    Custom rules for matching source flows to target flows. Default is the set of rules defined in `match_rules`.
nomatch_rules : list[Callable[..., bool]], optional
    Rules to identify flows that should not be matched.
disable_progress : bool, optional
    If True, progress bar display during the mapping process is disabled.

<a id="flowmapper.flowmap.Flowmap.get_single_match"></a>

#### get\_single\_match

```python
def get_single_match(source: Flow, target_flows: list,
                     rules: list) -> Union[dict, None]
```

Try to find a single match for `source` in `target_flows` using `rules`.

Adds to `all_mappings` if found.

<a id="flowmapper.flowmap.Flowmap.mappings"></a>

#### mappings

```python
@cached_property
def mappings()
```

Generates and returns a list of mappings from source flows to target flows based on the defined rules.

Each mapping includes the source flow, target flow, conversion factor, the rule that determined the match, and additional information.

A single match using the match rule with highest priority is returned for each source flow.

Returns
-------
list[dict]
    A list of dictionaries containing the mapping details.

<a id="flowmapper.flowmap.Flowmap.matched_source"></a>

#### matched\_source

```python
@cached_property
def matched_source()
```

Provides a list of source flows that have been successfully matched to target flows.

Returns
-------
list[Flow]
    A list of matched source flow objects.

<a id="flowmapper.flowmap.Flowmap.unmatched_source"></a>

#### unmatched\_source

```python
@cached_property
def unmatched_source()
```

Provides a list of source flows that have not been matched to any target flows.

Returns
-------
list[Flow]
    A list of unmatched source flow objects.

<a id="flowmapper.flowmap.Flowmap.matched_source_statistics"></a>

#### matched\_source\_statistics

```python
@cached_property
def matched_source_statistics()
```

Calculates statistics for matched source flows, including the number of matches and the matching percentage for each context.

Returns
-------
pandas.DataFrame
    A DataFrame containing matching statistics for source flows.

<a id="flowmapper.flowmap.Flowmap.matched_target"></a>

#### matched\_target

```python
@cached_property
def matched_target()
```

Provides a list of target flows that have been successfully matched to source flows.

Returns
-------
list[Flow]
    A list of matched target flow objects.

<a id="flowmapper.flowmap.Flowmap.unmatched_target"></a>

#### unmatched\_target

```python
@cached_property
def unmatched_target()
```

Provides a list of target flows that have not been matched to any source flows.

Returns
-------
list[Flow]
    A list of unmatched target flow objects.

<a id="flowmapper.flowmap.Flowmap.matched_target_statistics"></a>

#### matched\_target\_statistics

```python
@cached_property
def matched_target_statistics()
```

Calculates statistics for matched target flows, including the number of matches and the matching percentage for each context.

Returns
-------
pandas.DataFrame
    A DataFrame containing matching statistics for target flows.

<a id="flowmapper.flowmap.Flowmap.statistics"></a>

#### statistics

```python
def statistics()
```

Prints out summary statistics for the flow mapping process.

<a id="flowmapper.flowmap.Flowmap.to_randonneur"></a>

#### to\_randonneur

```python
def to_randonneur(source_id: str,
                  target_id: str,
                  contributors: list,
                  mapping_source: dict,
                  mapping_target: dict,
                  version: str = "1.0.0",
                  licenses: Optional[list] = None,
                  homepage: Optional[str] = None,
                  name: Optional[str] = None,
                  path: Optional[Path] = None) -> randonneur.Datapackage
```

Export mappings using randonneur data migration file format.

Parameters
----------
path : Path, optional
    If provided export the output file to disk.

Returns
-------
randonneur.Datapackage object.

<a id="flowmapper.flowmap.Flowmap.to_glad"></a>

#### to\_glad

```python
def to_glad(path: Optional[Path] = None,
            ensure_id: bool = False,
            missing_source: bool = False)
```

Export mappings using GLAD flow mapping format, optionally ensuring each flow has an identifier.

Formats the mapping results according to Global LCA Data Access (GLAD) network initiative flow mapping format.

Parameters
----------
path : Path, optional
    If provided export the output file to disk.
ensure_id : bool, optional
    If True, ensures each flow has an identifier, default is False.

Returns
-------
pandas.DataFrame
    A DataFrame containing the formatted mapping results in GLAD format.
