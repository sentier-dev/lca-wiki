**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.base_lci` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2io==0.9.17'
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
  -I "$SP" -m bw2io.importers.base_lci cfg.yml > bw2io.importers.base_lci.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.base_lci"></a>

# bw2io.importers.base\_lci

<a id="bw2io.importers.base_lci.EXCHANGE_SPECIFIC_KEYS"></a>

#### EXCHANGE\_SPECIFIC\_KEYS

<a id="bw2io.importers.base_lci.DEFAULT_TARGET_FIELDS"></a>

#### DEFAULT\_TARGET\_FIELDS

<a id="bw2io.importers.base_lci.LCIImporter"></a>

## LCIImporter Objects

```python
class LCIImporter(ImportBase)
```

Base class for format-specific importers.

Defines workflow for applying strategies.

Takes a database name (string) as initialization parameter.

<a id="bw2io.importers.base_lci.LCIImporter.format"></a>

#### format

<a id="bw2io.importers.base_lci.LCIImporter.project_parameters"></a>

#### project\_parameters

<a id="bw2io.importers.base_lci.LCIImporter.database_parameters"></a>

#### database\_parameters

<a id="bw2io.importers.base_lci.LCIImporter.metadata"></a>

#### metadata

<a id="bw2io.importers.base_lci.LCIImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(db_name: str)
```

<a id="bw2io.importers.base_lci.LCIImporter.all_linked"></a>

#### all\_linked

```python
@property
def all_linked() -> bool
```

<a id="bw2io.importers.base_lci.LCIImporter.needs_multifunctional_database"></a>

#### needs\_multifunctional\_database

```python
@property
def needs_multifunctional_database() -> bool
```

<a id="bw2io.importers.base_lci.LCIImporter.statistics"></a>

#### statistics

```python
def statistics(print_stats: bool = True) -> Tuple[int, int, int, int]
```

<a id="bw2io.importers.base_lci.LCIImporter.write_project_parameters"></a>

#### write\_project\_parameters

```python
def write_project_parameters(data: List[dict] = None,
                             delete_existing: bool = True) -> None
```

Write global parameters to ``ProjectParameter`` database table.

``delete_existing`` controls whether new parameters will delete_existing existing parameters, or just update values. The ``name`` field is used to determine if a parameter exists.

``data`` should be a list of dictionaries (``self.project_parameters`` is used by default):

.. code-block:: python

    [{
        'name': name of variable (unique),
        'amount': numeric value of variable (optional),
        'formula': formula in Python as string (optional),
        optional keys like uncertainty, etc. (no limitations)
    }]

<a id="bw2io.importers.base_lci.LCIImporter.write_database_parameters"></a>

#### write\_database\_parameters

```python
def write_database_parameters(activate_parameters: bool = False,
                              delete_existing: bool = True) -> None
```

<a id="bw2io.importers.base_lci.LCIImporter.database_class"></a>

#### database\_class

```python
def database_class(db_name: str,
                   requested_backend: str = "sqlite") -> ProcessedDataStore
```

<a id="bw2io.importers.base_lci.LCIImporter.write_database"></a>

#### write\_database

```python
def write_database(data: Optional[dict] = None,
                   delete_existing: bool = True,
                   backend: Optional[str] = None,
                   activate_parameters: bool = False,
                   db_name: Optional[str] = None,
                   searchable: bool = True,
                   check_typos: bool = False,
                   **kwargs) -> ProcessedDataStore
```

Write data to a ``Database``.

All arguments are optional, and are normally not specified.

``delete_existing`` effects both the existing database (it will be emptied prior to writing if True, which is the default), and, if ``activate_parameters`` is True, existing database and activity parameters. Database parameters will only be deleted if the import data specifies a new set of database parameters (i.e. ``database_parameters`` is not ``None``) - the same is true for activity parameters. If you need finer-grained control, please use the ``DatabaseParameter``, etc. objects directly.

**Arguments**:

  * *data* (dict, optional): The data to write to the ``Database``. Default is ``self.data``.
  * *delete_existing* (bool, default ``True``): See above.
  * *activate_parameters* (bool, default ``False``). Instead of storing parameters in ``Activity`` and other proxy objects, create ``ActivityParameter`` and other parameter objects, and evaluate all variables and formulas.
  * *backend* (string, optional): Storage backend to use when creating ``Database``. Default is the default backend.
  

**Returns**:

  ``Database`` instance.

<a id="bw2io.importers.base_lci.LCIImporter.write_excel"></a>

#### write\_excel

```python
def write_excel(only_unlinked: bool = False, only_names: bool = False) -> Path
```

Write database information to a spreadsheet.

If ``only_unlinked``, then only write unlinked exchanges.

If ``only_names``, then write only activity names, no exchange data.

Returns the filepath to the spreadsheet file.

<a id="bw2io.importers.base_lci.LCIImporter.match_database"></a>

#### match\_database

```python
def match_database(db_name: Optional[str] = None,
                   fields: Optional[List[str]] = None,
                   ignore_categories: bool = False,
                   relink: bool = False,
                   kind: Optional[Union[List[str], str]] = None,
                   edge_kinds: Optional[List[str]] = None,
                   this_node_kinds: Optional[List[str]] = None,
                   other_node_kinds: Optional[List[str]] = None,
                   processes_to_products: bool = False) -> None
```

Match current database against itself or another database.

If ``db_name`` is None, match against current data. Otherwise, ``db_name`` should be the name of an existing ``Database``.

``fields`` is a list of fields to use for matching. Field values are case-insensitive, but otherwise must match exactly for a link to be valid. If ``fields`` is ``None``, use the default fields of 'name', 'categories', 'unit', 'reference product', and 'location'.

If ``ignore_categories``, link based only on name, unit and location. ``ignore_categories`` conflicts with ``fields``.

If ``relink``, relink exchanges even if a link is already present.

``kind`` can be a string or a list of strings. Common values are "technosphere", "biosphere", "production", and "substitution".

Nothing is returned, but ``self.data`` is changed.

<a id="bw2io.importers.base_lci.LCIImporter.match_database_against_top_level_context"></a>

#### match\_database\_against\_top\_level\_context

```python
def match_database_against_top_level_context(
        other_db_name: str,
        fields: List[str] = ["name", "unit", "categories"],
        kinds: List[str] = labels.biosphere_edge_types) -> None
```

For unlinked edges with a `categories` context `('a', 'b', ...)`, try to match against flows
in `db_name` with `categories` context `('a',)`.

Parameters
----------
other_db_name : str
    The name of the database with flows to link to.
fields  : list[str]
    List of field names to use when determining if there is a match. Default is
    `["name", "unit", "categories"]`.
kinds : list[str]
    Try to match exchanges with these `type` values. Default is
    `bw2data.labels.biosphere_edge_types`.

<a id="bw2io.importers.base_lci.LCIImporter.match_database_against_only_available_in_given_context_tree"></a>

#### match\_database\_against\_only\_available\_in\_given\_context\_tree

```python
def match_database_against_only_available_in_given_context_tree(
        other_db_name: str,
        fields: List[str] = ["name", "unit", "categories"],
        kinds: List[str] = labels.biosphere_edge_types) -> None
```

For unlinked edges with a `categories` context `('a', 'b', ...)`, try to match against flows
in `other_db_name` with `categories` context `('a', 'c')` if that flow is the only one
available in `other_db_name` within the context tree `('a',)`.

Parameters
----------
other_db_name : str
    The name of the database with flows to link to.
fields  : list[str]
    List of field names to use when determining if there is a match. Default is
    `["name", "unit", "categories"]`.
kinds : list[str]
    Try to match exchanges with these `type` values. Default is
    `bw2data.labels.biosphere_edge_types`.

<a id="bw2io.importers.base_lci.LCIImporter.create_new_database_for_flows_with_missing_top_level_context"></a>

#### create\_new\_database\_for\_flows\_with\_missing\_top\_level\_context

```python
def create_new_database_for_flows_with_missing_top_level_context(
        target_db_name: str,
        placeholder_db_name: str,
        fields: List[str] = ["name", "unit", "categories"],
        kinds: List[str] = labels.biosphere_edge_types) -> None
```

Create proxy datasets for flows who have corresponding flows in another database, but not
with the given top-level context.

In other words, if we are trying to match `{'name': 'foo', 'categories': ['foo']}`, and
our corresponding database only has `{'name': 'foo', 'categories': ['bar']}`, then we can
create a placeholder dataset in a new database, as no amount of category manipulation will
result in a match in the given target database.

<a id="bw2io.importers.base_lci.LCIImporter.create_new_biosphere"></a>

#### create\_new\_biosphere

```python
def create_new_biosphere(biosphere_name: str) -> None
```

Create new biosphere database from unlinked biosphere flows in ``self.data``

<a id="bw2io.importers.base_lci.LCIImporter.add_unlinked_flows_to_biosphere_database"></a>

#### add\_unlinked\_flows\_to\_biosphere\_database

```python
def add_unlinked_flows_to_biosphere_database(
        biosphere_name: Optional[str] = None,
        fields: Set[str] = {"name", "unit", "categories"}) -> None
```

<a id="bw2io.importers.base_lci.LCIImporter.randonneur"></a>

#### randonneur

```python
def randonneur(label: Optional[str] = None,
               data_registry_path: Optional[Path] = None,
               datapackage: Optional[rn.Datapackage] = None,
               fields: Optional[list] = None,
               mapping: Optional[dict] = None,
               node_filter: Optional[Callable] = None,
               edge_filter: Optional[Callable] = None,
               verbose: bool = False,
               case_sensitive: bool = False,
               add_extra_attributes: bool = True,
               verbs: Optional[List[str]] = rn.utils.SAFE_VERBS,
               migrate_edges: bool = True,
               migrate_nodes: bool = False) -> None
```

Apply a stored transformation from `randonneur_data`. See the `randonneur`
[README](https://github.com/brightway-lca/randonneur/blob/main/README.md) and the
[current registry](https://github.com/brightway-lca/randonneur_data/blob/main/randonneur_data/data/registry.json)
for more information.

`label`: Label for the transformation if loading from the `randonneur_data` registry.

`data_registry_path`: Filepath for `randonneur_data` data registry. Default to the library data.

`datapackage`: In-memory `randonneur.Datapackage` object if not using the `randonneur_data`
registry.

`fields`: A list of object keys as strings, used when checking if the given transformation
matches the node or edge under consideration. In other words, only use the fields in `fields`
when checking the `source` values in each transformation for a match. Each field in `fields`
doesn't have to be in each transformation.

If you changed labels in `mapping`, use the changed labels, not the original key labels.

`mapping`: Change the labels in the `migrations` data to match your data schema. `mapping` can
change the labels in the migration `source` and `target` sections. The `mapping` input should be
a dict with keys "source" and "target", and have values of `{old_label: new_label}` pairs:

`node_filter`: A callable which determines whether or not the given node should be modified.
Applies to both verbs and edges, with the exception of node creation - it doesn't make sense to
filter existing nodes as we are creating new objects.

`node_filter` needs to be a callable which takes a node object and returns a boolean which tells
if the node *should* be modified. In this example, the filter returns `False` and the node isn't
modified:

`edge_filter`: A callable which determines whether or not the given edge should be modified.
Applies only to edge transformations, and does *not* apply to edge creation, as this function is
always called on the edge to modified, not on the transformation object.
Returns

`edge_filter` needs to be a callable which takes an edge object and returns a boolean which
indicates if the edge *should* be modified.

`verbose`: Display progress bars and more logging messages.

`case_sensitive`: Flag indicating whether to do case sensitive matching of transformations to
nodes or edges in the graph. Default is false, as practical experience has shown us that cases
get commonly changed by software developers or users. Only applies to string values.

`add_extra_attributes`: Flag indicating whether to include additional attributes when doing
replace, update, and disaggregate changes. Extra attributes are defined outside the "source" and
"target" transformation keys. Note that keys in `randonneur.utils.EXCLUDED_ATTRS` are never
added.

`verbs`: The list of transformation types from `migrations` to apply. Transformations are run
in the order as given in `verbs`, and in some complicated cases you may want to keep the same
verbs but change their order to get the desired output state. In general, such complicated
transformations should be broken down to smaller discrete and independent transformations
whenever possible, and logs checked carefully after their application.

The default value of `verbs` are the "safe" transformations - replace, update, and disaggregate.
To get create and delete you need to specify them in the configuration.

Only the verbs `create`, `disaggregate`, `replace`, `update`, and `delete` are used in our
functions, regardless of what is given in `verbs`, as we don't know how to handle custom verbs.
We need to write custom functions for each verb as they have difference behaviour.

`migrate_edges`: Flag on whether to apply this transformation to edges, if allowed by the
transformation metadata.

`migrate_nodes`: Flag on whether to apply this transformation to nodes, if allowed by the
transformation metadata.

<a id="bw2io.importers.base_lci.LCIImporter.migrate"></a>

#### migrate

```python
def migrate(migration_name: str) -> None
```

<a id="bw2io.importers.base_lci.LCIImporter.drop_unlinked"></a>

#### drop\_unlinked

```python
def drop_unlinked(i_am_reckless: bool = False) -> None
```

<a id="bw2io.importers.base_lci.LCIImporter.add_unlinked_activities"></a>

#### add\_unlinked\_activities

```python
def add_unlinked_activities() -> None
```

Add technosphere flows to ``self.data``.

<a id="bw2io.importers.base_lci.LCIImporter.all_source_fields_in_unlinked_data"></a>

#### all\_source\_fields\_in\_unlinked\_data

```python
def all_source_fields_in_unlinked_data() -> Set[str]
```

Return set of all field labels (dict keys) in unlinked edges.

<a id="bw2io.importers.base_lci.LCIImporter.create_randonneur_excel_template_for_unlinked"></a>

#### create\_randonneur\_excel\_template\_for\_unlinked

```python
def create_randonneur_excel_template_for_unlinked(
        target_fields: List[str] = DEFAULT_TARGET_FIELDS,
        source_fields: Optional[List[str]] = None,
        edge_filter: Optional[Callable] = None,
        filename: Optional[str] = None,
        output_dir: Optional[Path] = None,
        replace_existing: bool = False) -> Path
```

Create Excel template with source data in the `randonneur` format for unlinked exchanges.

Intended to be used with `read_randonneur_excel_template` to create a migration file, which
can then be applied to resolve unlinked data.

Should *only* use string values - no conversion for numbers, booleans, etc. if made in
either direction.

`target_fields` is a list of labels for the target fields, which must be filled by the
practitioner. Defaults to `["name", "location", "reference product", "unit"]`

`source_fields` is a list of string labels to include when defining the matchings. Defaults
to all available fields except for fields in `EXCHANGE_SPECIFIC_KEYS`. Use
`.all_source_fields_in_unlinked_data()` to get a list of fields to select from.

`edge_filter`: Optional function to reduce the number of unlinked edges to write to the
template. Takes the unlinked edge as input argument.

`output_dir`: Where to write the template file. Defaults to `bw2data.projects.output_dir`.

Returns the `Path` of the created file.
