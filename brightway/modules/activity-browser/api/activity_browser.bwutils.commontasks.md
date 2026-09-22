**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.commontasks` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.commontasks cfg.yml > activity_browser.bwutils.commontasks.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.commontasks"></a>

# activity\_browser.bwutils.commontasks

<a id="activity_browser.bwutils.commontasks.wrap_text"></a>

#### wrap\_text

```python
def wrap_text(string: str, max_length: int = 80) -> str
```

Wrap the label making sure that key and name are in 2 rows.

idea from https://stackoverflow.com/a/39134215/4929813

<a id="activity_browser.bwutils.commontasks.shorten_label"></a>

#### shorten\_label

```python
def shorten_label(text: str, max_length: int = 40) -> str
```

Single-line label for axes/legends; use a tooltip for the full string.

<a id="activity_browser.bwutils.commontasks.reference_flow_parts"></a>

#### reference\_flow\_parts

```python
def reference_flow_parts(act) -> tuple[str, str, str, str]
```

Return ``(product, process, location, database)`` for a reference-flow activity.

<a id="activity_browser.bwutils.commontasks.get_fu_label"></a>

#### get\_fu\_label

```python
def get_fu_label(act,
                 amount: float | None = None,
                 *,
                 separator: str = " | ") -> str
```

AB convention: product | process | location | database.

<a id="activity_browser.bwutils.commontasks.get_method_label"></a>

#### get\_method\_label

```python
def get_method_label(method, *, separator: str = ", ") -> str
```

AB convention: joined Brightway method tuple parts.

<a id="activity_browser.bwutils.commontasks.exchange_part_label"></a>

#### exchange\_part\_label

```python
def exchange_part_label(node, *, include_database: bool = True) -> str
```

Human-readable label for one exchange end (input or output part).

For technosphere nodes: ``product | process [location] (database)``.
For biosphere nodes: ``flow | categories (database)``.

<a id="activity_browser.bwutils.commontasks.exchange_label"></a>

#### exchange\_label

```python
def exchange_label(input_node,
                   output_node,
                   *,
                   include_database: bool = True) -> str
```

Full exchange label ``input --> output`` for tooltips and GSA metadata.

<a id="activity_browser.bwutils.commontasks.exchange_product_name"></a>

#### exchange\_product\_name

```python
def exchange_product_name(input_node) -> str
```

Reference product or flow name for the exchange input side.

<a id="activity_browser.bwutils.commontasks.exchange_consumer_parts"></a>

#### exchange\_consumer\_parts

```python
def exchange_consumer_parts(output_node) -> tuple[str, str, str]
```

Return ``(process, location, database)`` for the exchange consumer (output).

<a id="activity_browser.bwutils.commontasks.cleanup_deleted_bw_projects"></a>

#### cleanup\_deleted\_bw\_projects

```python
def cleanup_deleted_bw_projects() -> None
```

Clean up the deleted projects from disk.

NOTE: This cannot be done from within the AB.

<a id="activity_browser.bwutils.commontasks.projects_by_last_opened"></a>

#### projects\_by\_last\_opened

```python
def projects_by_last_opened()
```

<a id="activity_browser.bwutils.commontasks.get_database_metadata"></a>

#### get\_database\_metadata

```python
def get_database_metadata(name)
```

Returns a dictionary with database meta-information.

<a id="activity_browser.bwutils.commontasks.database_is_locked"></a>

#### database\_is\_locked

```python
def database_is_locked(name: str) -> bool
```

Returns True if the database is locked (or missing / unknown).

Missing databases are treated as locked so UI sync during delete does not
raise when leftover parameter rows still reference a just-removed database.

<a id="activity_browser.bwutils.commontasks.database_is_legacy"></a>

#### database\_is\_legacy

```python
def database_is_legacy(name: str) -> bool
```

Returns True if the database is sqlite.

<a id="activity_browser.bwutils.commontasks.is_technosphere_db"></a>

#### is\_technosphere\_db

```python
def is_technosphere_db(db_name: str) -> bool
```

Returns True if database describes the technosphere, False if it describes a biosphere.

<a id="activity_browser.bwutils.commontasks.get_writable_databases"></a>

#### get\_writable\_databases

```python
def get_writable_databases() -> list[str]
```

Get the list of databases that are not locked.

<a id="activity_browser.bwutils.commontasks.count_database_records"></a>

#### count\_database\_records

```python
def count_database_records(name: str) -> int
```

To account for possible brightway database types that do not implement
the __len__ method.

<a id="activity_browser.bwutils.commontasks.AB_names_to_bw_keys"></a>

#### AB\_names\_to\_bw\_keys

<a id="activity_browser.bwutils.commontasks.bw_keys_to_AB_names"></a>

#### bw\_keys\_to\_AB\_names

<a id="activity_browser.bwutils.commontasks.get_activity_name"></a>

#### get\_activity\_name

```python
def get_activity_name(key, str_length=22)
```

<a id="activity_browser.bwutils.commontasks.biosphere_node_types"></a>

#### biosphere\_node\_types

```python
@lru_cache(maxsize=1)
def biosphere_node_types() -> frozenset[str]
```

Elementary-flow node types from Brightway ``typo_settings`` vs ``labels.lci_node_types``.

<a id="activity_browser.bwutils.commontasks.is_node_product_or_waste"></a>

#### is\_node\_product\_or\_waste

```python
def is_node_product_or_waste(node: tuple | int | bd.Node) -> bool
```

<a id="activity_browser.bwutils.commontasks.is_node_product"></a>

#### is\_node\_product

```python
def is_node_product(node: tuple | int | bd.Node) -> bool
```

<a id="activity_browser.bwutils.commontasks.is_node_waste"></a>

#### is\_node\_waste

```python
def is_node_waste(node: tuple | int | bd.Node) -> bool
```

<a id="activity_browser.bwutils.commontasks.is_node_biosphere"></a>

#### is\_node\_biosphere

```python
def is_node_biosphere(node: tuple | int | bd.Node) -> bool
```

True if *node* is an elementary flow (biosphere node, not technosphere).

<a id="activity_browser.bwutils.commontasks.get_exchange_type"></a>

#### get\_exchange\_type

```python
def get_exchange_type(activity_key: tuple, output: bool = False) -> str | None
```

Exchange type (and optional leading ``-`` for negative amount) when dropping
*activity_key* onto an activity's Output (*output*=True) or Input table.

<a id="activity_browser.bwutils.commontasks.classify_dragged_nodes"></a>

#### classify\_dragged\_nodes

```python
def classify_dragged_nodes(keys: list) -> str
```

Overlay / drop action for a set of dragged node keys.

``ProductModel.mimeData`` includes both product/waste keys and their processor
process keys; process nodes are ignored so a product+processor drag stays
``product`` (same idea as discarding process types from metadata).

<a id="activity_browser.bwutils.commontasks.is_node_process"></a>

#### is\_node\_process

```python
def is_node_process(node: tuple | int | bd.Node) -> bool
```

<a id="activity_browser.bwutils.commontasks.refresh_node"></a>

#### refresh\_node

```python
def refresh_node(node: tuple | int | np.int64 | bd.Node) -> bd.Node
```

<a id="activity_browser.bwutils.commontasks.refresh_node_or_none"></a>

#### refresh\_node\_or\_none

```python
def refresh_node_or_none(node: tuple | int | bd.Node) -> bd.Node | None
```

<a id="activity_browser.bwutils.commontasks.refresh_parameter"></a>

#### refresh\_parameter

```python
def refresh_parameter(parameter: tuple | Parameter | ParameterBase)
```

<a id="activity_browser.bwutils.commontasks.parameters_in_scope"></a>

#### parameters\_in\_scope

```python
def parameters_in_scope(
    node: tuple | int | bd.Node = None,
    parameter: tuple | Parameter | ParameterBase = None
) -> dict[str, Parameter]
```

<a id="activity_browser.bwutils.commontasks.node_group"></a>

#### node\_group

```python
def node_group(node: tuple | int | bd.Node) -> str | None
```

Returns the group of the node, or None if it does not have a group.

<a id="activity_browser.bwutils.commontasks.clean_activity_name"></a>

#### clean\_activity\_name

```python
def clean_activity_name(activity_name: str) -> str
```

Takes a given activity name and remove or replace all characters
not allowed to be in there.

Use this when creating parameters, as there are specific characters not
allowed to be in parameter names.

These are ' -,.%[]'
Integers are also removed aggressively, there are allowed, but not
at the start of a parameter name.

<a id="activity_browser.bwutils.commontasks.build_activity_group_name"></a>

#### build\_activity\_group\_name

```python
def build_activity_group_name(key: tuple, name: str = None) -> str
```

Constructs a group name unique to a given bw activity.

If given a `name`, use that instead of looking up the activity name.

NOTE: The created group name is not easy for users to understand, so hide
it from them where possible.

<a id="activity_browser.bwutils.commontasks.identify_activity_type"></a>

#### identify\_activity\_type

```python
@lru_cache(maxsize=2048)
def identify_activity_type(activity)
```

Return the activity type based on its naming.

<a id="activity_browser.bwutils.commontasks.generate_copy_code"></a>

#### generate\_copy\_code

```python
def generate_copy_code(key: tuple) -> str
```

Generate a new code to use when copying an activity

<a id="activity_browser.bwutils.commontasks.refresh_edge"></a>

#### refresh\_edge

```python
def refresh_edge(edge: int | bd.Edge) -> bd.Edge
```

<a id="activity_browser.bwutils.commontasks.refresh_edge_or_none"></a>

#### refresh\_edge\_or\_none

```python
def refresh_edge_or_none(edge: int | bd.Edge) -> bd.Edge | None
```

<a id="activity_browser.bwutils.commontasks.get_exchanges_in_scenario_difference_file_notation"></a>

#### get\_exchanges\_in\_scenario\_difference\_file\_notation

```python
def get_exchanges_in_scenario_difference_file_notation(exchanges)
```

From a list of exchanges get the information needed for the scenario difference (SDF) file that is used in
conjunction with the superstructure approach. This is a convenience function to export data from the AB in a format
suitable for the SDF.

<a id="activity_browser.bwutils.commontasks.exchanges_to_sdf"></a>

#### exchanges\_to\_sdf

```python
def exchanges_to_sdf(exchanges: list[dict]) -> pd.DataFrame
```

<a id="activity_browser.bwutils.commontasks.get_exchanges_from_a_list_of_activities"></a>

#### get\_exchanges\_from\_a\_list\_of\_activities

```python
def get_exchanges_from_a_list_of_activities(activities: list,
                                            as_keys: bool = False) -> list
```

Get all exchanges in a list of activities.

<a id="activity_browser.bwutils.commontasks.unit_of_method"></a>

#### unit\_of\_method

```python
def unit_of_method(method: tuple) -> str
```

Attempt to return the unit of the given method.

<a id="activity_browser.bwutils.commontasks.get_LCIA_method_name_dict"></a>

#### get\_LCIA\_method\_name\_dict

```python
def get_LCIA_method_name_dict(keys: list) -> dict
```

Impact categories in brightway2 are stored in tuples, which is
unpractical for display in, e.g. dropdown menus.

Returns a dictionary with
    keys: comma separated strings
    values: brightway2 method tuples

<a id="activity_browser.bwutils.commontasks.savefilepath"></a>

#### savefilepath

```python
def savefilepath(default_file_name: str = "AB_file",
                 file_filter: str = "All Files (*.*)")
```

A central function to get a safe file path.

<a id="activity_browser.bwutils.commontasks.get_templates"></a>

#### get\_templates

```python
def get_templates() -> dict
```

<a id="activity_browser.bwutils.commontasks.fetch_remote_projects"></a>

#### fetch\_remote\_projects

```python
def fetch_remote_projects() -> dict
```

Remote template catalogue from ``bw2io``; empty dict if unreachable.

<a id="activity_browser.bwutils.commontasks.nodes_to_excel"></a>

#### nodes\_to\_excel

```python
def nodes_to_excel(nodes: list[tuple | int | bd.Node]) -> str
```

Convert a list of nodes to an HTML table suitable for Excel.
