**Generated API reference** · package `bw2data` 4.7 · module `bw2data.backends.proxies` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.backends.proxies cfg.yml > bw2data.backends.proxies.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.backends.proxies"></a>

# bw2data.backends.proxies

<a id="bw2data.backends.proxies.Exchanges"></a>

## Exchanges Objects

```python
class Exchanges(Iterable)
```

Iterator for exchanges with some additional methods.

This is not a generator; ``next()`` is not supported. Everything time you start to iterate over the object you get a new list starting from the beginning. However, to get a single item you can do ``next(iter(foo))``.

Ordering is by database row id.

Supports the following:

.. code-block:: python

    exchanges = activity.exchanges()

    # Iterate
    for exc in exchanges:
        pass

    # Length
    len(exchanges)

    # Delete all
    exchanges.delete()

<a id="bw2data.backends.proxies.Exchanges.__init__"></a>

#### \_\_init\_\_

```python
def __init__(key, kinds=None, reverse=False)
```

<a id="bw2data.backends.proxies.Exchanges.filter"></a>

#### filter

```python
def filter(expr)
```

<a id="bw2data.backends.proxies.Exchanges.delete"></a>

#### delete

```python
def delete(allow_in_sourced_project: bool = False)
```

<a id="bw2data.backends.proxies.Exchanges.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

<a id="bw2data.backends.proxies.Exchanges.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```

<a id="bw2data.backends.proxies.Exchanges.to_dataframe"></a>

#### to\_dataframe

```python
def to_dataframe(categorical: bool = True,
                 formatters: Optional[List[Callable]] = None) -> pd.DataFrame
```

Return a pandas DataFrame with all node exchanges. Standard DataFrame columns are:

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

<a id="bw2data.backends.proxies.Activity"></a>

## Activity Objects

```python
class Activity(ActivityProxyBase)
```

<a id="bw2data.backends.proxies.Activity.ORMDataset"></a>

#### ORMDataset

<a id="bw2data.backends.proxies.Activity.__init__"></a>

#### \_\_init\_\_

```python
def __init__(document=None, **kwargs)
```

Create an `Activity` proxy object.

If this is a new activity, can pass `kwargs`.

If the activity exists in the database, `document` should be an `ActivityDataset`.

<a id="bw2data.backends.proxies.Activity.id"></a>

#### id

```python
@property
def id()
```

<a id="bw2data.backends.proxies.Activity.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(key)
```

<a id="bw2data.backends.proxies.Activity.__setitem__"></a>

#### \_\_setitem\_\_

```python
def __setitem__(key, value)
```

<a id="bw2data.backends.proxies.Activity.key"></a>

#### key

```python
@property
def key()
```

<a id="bw2data.backends.proxies.Activity.delete"></a>

#### delete

```python
def delete(signal: bool = True)
```

<a id="bw2data.backends.proxies.Activity.save"></a>

#### save

```python
def save(signal: bool = True,
         data_already_set: bool = False,
         force_insert: bool = False)
```

Saves the current activity to the database after performing various checks.
This method validates the activity, updates the database status, and handles
geographical and indexing updates. It raises an error if the activity is
not valid and updates relevant data in the database.

Raises
------
ValidityError
    If the activity is not valid, an error is raised detailing the reasons.

Notes
-----
The method performs the following operations:
- Checks if the activity is valid.
- Marks the database as 'dirty', indicating changes.
- Checks for type and key validity of the activity.
- Updates the activity's associated document in the database.
- Updates the geographical mapping if needed.
- Updates the index if the database is searchable.

Examples
--------
>>> activity.save()

Saves the activity if it's valid, otherwise raises ValidityError.

<a id="bw2data.backends.proxies.Activity.exchanges"></a>

#### exchanges

```python
def exchanges(exchanges_class=Exchanges)
```

<a id="bw2data.backends.proxies.Activity.edges"></a>

#### edges

```python
def edges()
```

<a id="bw2data.backends.proxies.Activity.technosphere"></a>

#### technosphere

```python
def technosphere(exchanges_class=Exchanges)
```

<a id="bw2data.backends.proxies.Activity.biosphere"></a>

#### biosphere

```python
def biosphere(exchanges_class=Exchanges)
```

<a id="bw2data.backends.proxies.Activity.production"></a>

#### production

```python
def production(include_substitution=False, exchanges_class=Exchanges)
```

<a id="bw2data.backends.proxies.Activity.rp_exchange"></a>

#### rp\_exchange

```python
def rp_exchange()
```

Return an ``Exchange`` object corresponding to the reference production. Uses the following in order:

* The ``production`` exchange, if only one is present
* The ``production`` exchange with the same name as the activity ``reference product``.

Raises ``ValueError`` if no suitable exchange is found.

<a id="bw2data.backends.proxies.Activity.producers"></a>

#### producers

```python
def producers()
```

<a id="bw2data.backends.proxies.Activity.substitution"></a>

#### substitution

```python
def substitution(exchanges_class=Exchanges)
```

<a id="bw2data.backends.proxies.Activity.upstream"></a>

#### upstream

```python
def upstream(kinds=labels.technosphere_negative_edge_types,
             exchanges_class=Exchanges)
```

<a id="bw2data.backends.proxies.Activity.consumers"></a>

#### consumers

```python
def consumers(kinds=labels.technosphere_negative_edge_types)
```

<a id="bw2data.backends.proxies.Activity.new_exchange"></a>

#### new\_exchange

```python
def new_exchange(**kwargs)
```

<a id="bw2data.backends.proxies.Activity.new_edge"></a>

#### new\_edge

```python
def new_edge(**kwargs)
```

Create a new exchange linked to this activity

<a id="bw2data.backends.proxies.Activity.create_aggregated_process"></a>

#### create\_aggregated\_process

```python
def create_aggregated_process(database: Optional[str] = None,
                              signal: bool = True,
                              **kwargs) -> tuple[Self, Self]
```

Create a new aggregated process representing the life cycle inventory of this process.

This method performs a life cycle inventory (LCI) calculation for the reference product
of this process and creates a new aggregated process node with all biosphere exchanges
from the upstream supply chain. The aggregated process represents the cumulative
environmental impacts of producing the reference product.

The method:
1. Performs an LCA calculation for the reference product
2. Creates a copy of this process (and optionally the product node if different)
3. Creates a production exchange linking the new process to the new product
4. Creates biosphere exchanges for all non-zero inventory flows

**Arguments**:

- `database` - Name of the target database where the new process will be created.
  If ``None``, uses the current process's database. The database must already
  exist. Defaults to ``None``.
- `signal` - Whether to emit database signals during save operations. Defaults to ``True``.
- `**kwargs` - Additional keyword arguments passed to ``_create_activity_copy()`` to
  customize the new process attributes (e.g., ``name``, ``location``, etc.).
  

**Returns**:

  tuple[Activity, Activity]: A tuple containing:
  - The new aggregated process node
  - The new product node (or the same as the process if the process produces itself)
  

**Raises**:

- `ValueError` - If ``database`` is provided and doesn't exist, or if this activity
  is not a process node type (must be "process" or "processwithreferenceproduct").
- `ImportError` - If ``bw2calc`` is not installed (required for LCA calculations).
  

**Examples**:

  Create an aggregated process in the same database:
  
  >>> process = Database("my_db").get("process_code")
  >>> new_process, new_product = process.create_aggregated_process()
  
  Create an aggregated process in a different database with custom attributes:
  
  >>> new_process, new_product = process.create_aggregated_process(
  ...     database="aggregated_db",
  ...     name="Aggregated Steel Production",
  ...     location="GLO"
  ... )
  
  The new process will contain all biosphere exchanges from the upstream supply chain:
  
  >>> for exc in new_process.exchanges():
  ...     if exc["type"] == "biosphere":
  ...         print(f"{exc['input'][1]}: {exc['amount']}")

<a id="bw2data.backends.proxies.Activity.copy"></a>

#### copy

```python
def copy(code: Optional[str] = None, signal: bool = True, **kwargs)
```

Copy the activity. Returns a new `Activity`.

`code` is the new activity code; if not given, a UUID is used.

`kwargs` are additional new fields and field values, e.g. name='foo'

<a id="bw2data.backends.proxies.Exchange"></a>

## Exchange Objects

```python
class Exchange(ExchangeProxyBase)
```

<a id="bw2data.backends.proxies.Exchange.ORMDataset"></a>

#### ORMDataset

<a id="bw2data.backends.proxies.Exchange.__init__"></a>

#### \_\_init\_\_

```python
def __init__(document=None, **kwargs)
```

Create an `Exchange` proxy object.

If this is a new exchange, can pass `kwargs`.

If the exchange exists in the database, `document` should be an `ExchangeDataset`.

<a id="bw2data.backends.proxies.Exchange.id"></a>

#### id

```python
@property
def id()
```

<a id="bw2data.backends.proxies.Exchange.save"></a>

#### save

```python
def save(signal: bool = True,
         data_already_set: bool = False,
         force_insert: bool = False)
```

<a id="bw2data.backends.proxies.Exchange.delete"></a>

#### delete

```python
def delete(signal: bool = True)
```
