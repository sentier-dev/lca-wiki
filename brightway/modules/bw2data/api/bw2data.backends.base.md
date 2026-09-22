**Generated API reference** · package `bw2data` 4.7 · module `bw2data.backends.base` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2data==4.7'
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
  -I "$SP" -m bw2data.backends.base cfg.yml > bw2data.backends.base.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.backends.base"></a>

# bw2data.backends.base

<a id="bw2data.backends.base.tqdm_wrapper"></a>

#### tqdm\_wrapper

```python
def tqdm_wrapper(iterable, is_test)
```

<a id="bw2data.backends.base.get_technosphere_qs"></a>

#### get\_technosphere\_qs

```python
def get_technosphere_qs(database_name: str,
                        edge_types: Iterable[str]) -> Iterable
```

<a id="bw2data.backends.base.get_technosphere_positive_qs"></a>

#### get\_technosphere\_positive\_qs

<a id="bw2data.backends.base.get_technosphere_negative_qs"></a>

#### get\_technosphere\_negative\_qs

<a id="bw2data.backends.base.get_biosphere_qs"></a>

#### get\_biosphere\_qs

```python
def get_biosphere_qs(database_name: str) -> Iterable
```

<a id="bw2data.backends.base.SQLiteBackend"></a>

## SQLiteBackend Objects

```python
class SQLiteBackend(ProcessedDataStore)
```

A base class for SQLite backends.

Subclasses must support at least the following calls:

* ``load()``
* ``write(data)``

In addition, they should specify their backend with the ``backend`` attribute (a unicode string).

* ``rename``
* ``copy``
* ``find_dependents``
* ``random``
* ``process``

For new classes to be recognized by the ``DatabaseChooser``, they need to be registered with the ``config`` object, e.g.:

.. code-block:: python

config.backends['backend type string'] = BackendClass

Instantiation does not load any data. If this database is not yet registered in the metadata store, a warning is written to ``stdout``.

The data schema for databases in voluptuous is:

.. code-block:: python

exchange = {
Required("input"): valid_tuple,
Required("type"): basestring,
}
exchange.update(uncertainty_dict)
lci_dataset = {
Optional("categories"): Any(list, tuple),
Optional("location"): object,
Optional("unit"): basestring,
Optional("name"): basestring,
Optional("type"): basestring,
Optional("exchanges"): [exchange]
}
db_validator = Schema({valid_tuple: lci_dataset}, extra=True)

where:
* ``valid_tuple`` is a :ref:`dataset identifier <dataset-codes>`, like ``("ecoinvent", "super strong steel")``
* ``uncertainty_fields`` are fields from an :ref:`uncertainty dictionary <uncertainty-type>`.

Processing a Database actually produces two parameter arrays: one for the exchanges, which make up the technosphere and biosphere matrices, and a geomapping array which links activities to locations.

**Arguments**:

- `*name*` _unicode string_ - Name of the database to manage.

<a id="bw2data.backends.base.SQLiteBackend.validator"></a>

#### validator

<a id="bw2data.backends.base.SQLiteBackend.backend"></a>

#### backend

<a id="bw2data.backends.base.SQLiteBackend.node_class"></a>

#### node\_class

<a id="bw2data.backends.base.SQLiteBackend.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="bw2data.backends.base.SQLiteBackend.copy"></a>

#### copy

```python
def copy(name)
```

Make a copy of the database.

Internal links within the database will be updated to match the new database name, i.e. ``("old name", "some id")`` will be converted to ``("new name", "some id")`` for all exchanges.

**Arguments**:

  * *name* (str): Name of the new database. Must not already exist.

<a id="bw2data.backends.base.SQLiteBackend.copy_activities"></a>

#### copy\_activities

```python
def copy_activities(activities: List[Activity],
                    target_database: str,
                    signal: bool = True) -> List[Activity]
```

Copy multiple Activity instances and their exchanges to a new database.

This method copies the given activities and all their exchanges to the target database.
Edges (exchanges) always have an input and output. Edges from copied activities are
resolved to the new copied activities if they point to activities in the input list;
otherwise, they remain pointing to the original database.

If input activities have type "process" and have functional edges (input or output) to
"product" nodes, those product nodes are also copied to the new database. Product nodes
that will be copied are logged.

**Arguments**:

- `activities` - List of Activity instances to copy
- `target_database` - Name of the target database (must already exist)
- `signal` - Whether to emit signals during save operations
  

**Returns**:

  List of new Activity instances in the target database
  

**Raises**:

- `ValueError` - If target_database does not exist

<a id="bw2data.backends.base.SQLiteBackend.filepath_intermediate"></a>

#### filepath\_intermediate

```python
def filepath_intermediate()
```

<a id="bw2data.backends.base.SQLiteBackend.filepath_processed"></a>

#### filepath\_processed

```python
def filepath_processed()
```

<a id="bw2data.backends.base.SQLiteBackend.find_dependents"></a>

#### find\_dependents

```python
def find_dependents(data=None, ignore=None)
```

Get sorted list of direct dependent databases (databases linked from exchanges).

**Arguments**:

  * *data* (dict, optional): Inventory data
  * *ignore* (list): List of database names to ignore
  

**Returns**:

  List of database names

<a id="bw2data.backends.base.SQLiteBackend.find_graph_dependents"></a>

#### find\_graph\_dependents

```python
def find_graph_dependents()
```

Recursively get list of all dependent databases.

**Returns**:

  A set of database names

<a id="bw2data.backends.base.SQLiteBackend.query"></a>

#### query

```python
def query(*queries)
```

Search through the database.

<a id="bw2data.backends.base.SQLiteBackend.register"></a>

#### register

```python
def register(write_empty=True, **kwargs)
```

Register a database with the metadata store.

Databases must be registered before data can be written.

Writing data automatically sets the following metadata:
* *depends*: Names of the databases that this database references, e.g. "biosphere"
* *number*: Number of processes in this database.

**Arguments**:

  * *format* (str, optional): Format that the database was converted from, e.g. "Ecospold"

<a id="bw2data.backends.base.SQLiteBackend.relabel_data"></a>

#### relabel\_data

```python
def relabel_data(data: dict, old_name: str, new_name: str) -> dict
```

Relabel database keys and exchanges.

In a database which internally refer to the same database, update to new database name ``new_name``.

Needed to copy a database completely or cut out a section of a database.

For example:

.. code-block:: python

data = {
("old and boring", 1):
{"exchanges": [
{"input": ("old and boring", 42),
"amount": 1.0},
]
},
("old and boring", 2):
{"exchanges": [
{"input": ("old and boring", 1),
"amount": 4.0}
]
}
}
print(relabel_database(data, "shiny new"))
>> {
("shiny new", 1):
{"exchanges": [
{"input": ("old and boring", 42),
"amount": 1.0},
]
},
("shiny new", 2):
{"exchanges": [
{"input": ("shiny new", 1),
"amount": 4.0}
]
}
}

In the example, the exchange to ``("old and boring", 42)`` does not change, as this is not part of the updated data.

**Arguments**:

  * *data* (dict): The data to modify
  * *new_name* (str): The name of the modified database
  

**Returns**:

  The modified data

<a id="bw2data.backends.base.SQLiteBackend.rename"></a>

#### rename

```python
def rename(name)
```

Rename a database. Modifies exchanges to link to new name. Deregisters old database.

**Arguments**:

  * *name* (str): New name.
  

**Returns**:

  New ``Database`` object.

<a id="bw2data.backends.base.SQLiteBackend.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

<a id="bw2data.backends.base.SQLiteBackend.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```

<a id="bw2data.backends.base.SQLiteBackend.__contains__"></a>

#### \_\_contains\_\_

```python
def __contains__(obj)
```

<a id="bw2data.backends.base.SQLiteBackend.filters"></a>

#### filters

<a id="bw2data.backends.base.SQLiteBackend.order_by"></a>

#### order\_by

<a id="bw2data.backends.base.SQLiteBackend.random"></a>

#### random

```python
def random(filters=True, true_random=False)
```

True random requires loading and sorting data in SQLite, and can be resource-intensive.

<a id="bw2data.backends.base.SQLiteBackend.get"></a>

#### get

```python
def get(code=None, **kwargs)
```

<a id="bw2data.backends.base.SQLiteBackend.write"></a>

#### write

```python
def write(data: Union[dict, list],
          process: bool = True,
          searchable: bool = True,
          check_typos: bool = True,
          signal: Optional[bool] = None)
```

Write ``data`` to database.

``data`` must be a dictionary of the form::

    {
        ('database name', 'dataset code'): {dataset}
    }

Writing a database will first deletes all existing data.

<a id="bw2data.backends.base.SQLiteBackend.load"></a>

#### load

```python
def load(*args, **kwargs)
```

<a id="bw2data.backends.base.SQLiteBackend.new_activity"></a>

#### new\_activity

```python
def new_activity(code, **kwargs)
```

<a id="bw2data.backends.base.SQLiteBackend.new_node"></a>

#### new\_node

```python
def new_node(code: str = None, **kwargs)
```

Create a new activity node in this database.

Creates a new Activity object (node) in the current database. The node is not
automatically saved to the database; you must call ``save()`` on the returned object.

**Arguments**:

- `code` - Optional unique identifier for the node. If not provided, a random UUID
  will be generated. The code must be unique within the database.
- `**kwargs` - Additional attributes to set on the node. Common attributes include:
  - ``name``: Human-readable name for the activity
  - ``type``: Node type (e.g., "process", "product", "emission"). Must be a
  valid node type, not an edge type (a warning will be issued if an edge
  type is used).
  - ``unit``: Unit of measurement (e.g., "kg", "m3")
  - ``location``: Geographic location code (e.g., "GLO", "US"). If not
  provided, defaults to ``config.global_location``.
  - ``categories``: List or tuple of category classifications
  - Any other valid activity attributes
  

**Returns**:

- `Activity` - A new Activity proxy object with the specified attributes. The object
  is not yet saved to the database.
  

**Raises**:

- `ValueError` - If ``database`` is provided in kwargs and doesn't match this
  database's name, or if ``id`` is provided (ids are auto-generated).
- `DuplicateNode` - If a node with the same database/code combination already exists.
- `UserWarning` - If an edge type (e.g., "technosphere", "biosphere") is used for
  the ``type`` parameter instead of a node type.
  

**Examples**:

  Create a simple process node:
  
  >>> db = DatabaseChooser("my_db")
  >>> db.register()
  >>> activity = db.new_node(code="process_1", name="Steel production",
  ...                       type="process", unit="kg", location="GLO")
  >>> activity.save()
  
  Create a node with auto-generated code:
  
  >>> activity = db.new_node(name="Custom process", type="process")
  >>> print(activity["code"])  # Random UUID
  >>> activity.save()
  
  Create a product node:
  
  >>> product = db.new_node(code="steel", name="Steel", type="product",
  ...                      unit="kg", location="GLO")
  >>> product.save()

<a id="bw2data.backends.base.SQLiteBackend.make_searchable"></a>

#### make\_searchable

```python
def make_searchable(reset: bool = False, signal: bool = True)
```

<a id="bw2data.backends.base.SQLiteBackend.make_unsearchable"></a>

#### make\_unsearchable

```python
def make_unsearchable(signal: bool = True)
```

<a id="bw2data.backends.base.SQLiteBackend.delete"></a>

#### delete

```python
def delete(keep_params: bool = False,
           warn: bool = True,
           vacuum: bool = True,
           signal: bool = True)
```

Delete all data from SQLite database and search index

<a id="bw2data.backends.base.SQLiteBackend.exchange_data_iterator"></a>

#### exchange\_data\_iterator

```python
def exchange_data_iterator(qs_func, dependents, flip=False)
```

Iterate over exchanges and format for ``bw_processing`` arrays.

``dependents`` is a set of dependent database names.

``flip`` means flip the numeric sign; see ``bw_processing`` docs.

Uses raw sqlite3 to retrieve data for ~2x speed boost.

<a id="bw2data.backends.base.SQLiteBackend.process"></a>

#### process

```python
def process(csv=False)
```

Create structured arrays for the technosphere and biosphere matrices.

Uses ``bw_processing`` for array creation and metadata serialization.

Also creates a ``geomapping`` array, linking activities to locations. Used for regionalized calculations.

Use a raw SQLite3 cursor instead of Peewee for a ~2 times speed advantage.

<a id="bw2data.backends.base.SQLiteBackend.search"></a>

#### search

```python
def search(string, **kwargs)
```

Search this database for ``string``.

The searcher include the following fields:

* name
* comment
* categories
* location
* reference product

``string`` can include wild cards, e.g. ``"trans*"``.

By default, the ``name`` field is given the most weight. The full weighting set is called the ``boost`` dictionary, and the default weights are::

    {
        "name": 5,
        "comment": 1,
        "product": 3,
        "categories": 2,
        "location": 3
    }

Optional keyword arguments:

* ``limit``: Number of results to return.
* ``boosts``: Dictionary of field names and numeric boosts - see default boost values above. New values must be in the same format, but with different weights.
* ``filter``: Dictionary of criteria that search results must meet, e.g. ``{'categories': 'air'}``. Keys must be one of the above fields.
* ``mask``: Dictionary of criteria that exclude search results. Same format as ``filter``.
* ``facet``: Field to facet results. Must be one of ``name``, ``product``, ``categories``, ``location``, or ``database``.
* ``proxy``: Return ``Activity`` proxies instead of dictionary index Models. Default is ``True``.

Returns a list of ``Activity`` datasets.

<a id="bw2data.backends.base.SQLiteBackend.set_geocollections"></a>

#### set\_geocollections

```python
def set_geocollections()
```

Set ``geocollections`` attribute for databases which don't currently have it.

<a id="bw2data.backends.base.SQLiteBackend.graph_technosphere"></a>

#### graph\_technosphere

```python
def graph_technosphere(filename=None, **kwargs)
```

<a id="bw2data.backends.base.SQLiteBackend.delete_duplicate_exchanges"></a>

#### delete\_duplicate\_exchanges

```python
def delete_duplicate_exchanges(fields=["amount", "type"])
```

Delete exchanges which are exact duplicates. Useful if you accidentally ran your input data notebook twice.

To determine uniqueness, we look at the exchange input and output nodes, and at the exchanges values for fields ``fields``.

<a id="bw2data.backends.base.SQLiteBackend.nodes_to_dataframe"></a>

#### nodes\_to\_dataframe

```python
def nodes_to_dataframe(columns: Optional[List[str]] = None,
                       return_sorted: bool = True) -> pandas.DataFrame
```

Return a pandas DataFrame with all database nodes. Uses the provided node attributes by default,  such as name, unit, location.

By default, returns a DataFrame sorted by name, reference product, location, and unit. Set ``return_sorted`` to ``False`` to skip sorting.

Specify ``columns`` to get custom columns. You will need to write your own function to get more customization, there are endless possibilities here.

Returns a pandas ``DataFrame``.

<a id="bw2data.backends.base.SQLiteBackend.edges_to_dataframe"></a>

#### edges\_to\_dataframe

```python
def edges_to_dataframe(
        categorical: bool = True,
        formatters: Optional[List[Callable]] = None) -> pandas.DataFrame
```

Return a pandas DataFrame with all database exchanges. Standard DataFrame columns are:

target_id: int,
target_database: str,
target_code: str,
target_name: Optional[str],
target_reference_product: Optional[str],
target_location: Optional[str],
target_unit: Optional[str],
target_type: Optional[str]
source_id: int,
source_database: str,
source_code: str,
source_name: Optional[str],
source_product: Optional[str],  # Note different label
source_location: Optional[str],
source_unit: Optional[str],
source_categories: Optional[str]  # Tuple concatenated with "::" as in `bw2io`
edge_amount: float,
edge_type: str,

Target is the node consuming the edge, source is the node or flow being consumed. The terms target and source were chosen because they also work well for biosphere edges.

**Arguments**:

  
  ``categorical`` will turn each string column in a `pandas Categorical Series <https://pandas.pydata.org/docs/reference/api/pandas.Categorical.html>`__. This takes 1-2 extra seconds, but saves around 50% of the memory consumption.
  
  ``formatters`` is a list of callables that modify each row. These functions must take the following keyword arguments, and use the `Wurst internal data format <https://wurst.readthedocs.io/#internal-data-format>`__:
  
  * ``node``: The target node, as a dict
  * ``edge``: The edge, including attributes of the source node
  * ``row``: The current row dict being modified.
  
  The functions in ``formatters`` don't need to return anything, they modify ``row`` in place.
  
  Returns a pandas ``DataFrame``.
