**Generated API reference** · package `bw2data` 4.7 · module `bw2data.backends.iotable.proxies` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.backends.iotable.proxies cfg.yml > bw2data.backends.iotable.proxies.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.backends.iotable.proxies"></a>

# bw2data.backends.iotable.proxies

<a id="bw2data.backends.iotable.proxies.ReadOnlyExchange"></a>

## ReadOnlyExchange Objects

```python
class ReadOnlyExchange(Mapping)
```

Non-mutable dictionary which mimics ``bw2data.proxies.Exchange``, but is read-only and doesn't link to a SQLite database row.

<a id="bw2data.backends.iotable.proxies.ReadOnlyExchange.__contains__"></a>

#### \_\_contains\_\_

<a id="bw2data.backends.iotable.proxies.ReadOnlyExchange.__iter__"></a>

#### \_\_iter\_\_

<a id="bw2data.backends.iotable.proxies.ReadOnlyExchange.__len__"></a>

#### \_\_len\_\_

<a id="bw2data.backends.iotable.proxies.ReadOnlyExchange.__getitem__"></a>

#### \_\_getitem\_\_

<a id="bw2data.backends.iotable.proxies.ReadOnlyExchange.__eq__"></a>

#### \_\_eq\_\_

<a id="bw2data.backends.iotable.proxies.ReadOnlyExchange.__hash__"></a>

#### \_\_hash\_\_

<a id="bw2data.backends.iotable.proxies.ReadOnlyExchange.unit"></a>

#### unit

<a id="bw2data.backends.iotable.proxies.ReadOnlyExchange.lca"></a>

#### lca

<a id="bw2data.backends.iotable.proxies.ReadOnlyExchange.as_dict"></a>

#### as\_dict

<a id="bw2data.backends.iotable.proxies.ReadOnlyExchange.__lt__"></a>

#### \_\_lt\_\_

```python
def __lt__(other)
```

<a id="bw2data.backends.iotable.proxies.ReadOnlyExchange.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```

<a id="bw2data.backends.iotable.proxies.ReadOnlyExchange.__init__"></a>

#### \_\_init\_\_

```python
def __init__(**kwargs)
```

<a id="bw2data.backends.iotable.proxies.ReadOnlyExchange.valid"></a>

#### valid

```python
def valid(dct: dict = None) -> None
```

<a id="bw2data.backends.iotable.proxies.IOTableExchanges"></a>

## IOTableExchanges Objects

```python
class IOTableExchanges(Iterable)
```

<a id="bw2data.backends.iotable.proxies.IOTableExchanges.to_dataframe"></a>

#### to\_dataframe

<a id="bw2data.backends.iotable.proxies.IOTableExchanges.__init__"></a>

#### \_\_init\_\_

```python
def __init__(datapackage: Datapackage,
             target: Optional[Activity] = None,
             biosphere: bool = True,
             technosphere: bool = True,
             production: bool = True)
```

Iterable of ``ReadOnlyExchange`` objects drawn from Datapackage arrays.

In the *technosphere matrix*, all positive exchanges are considered *production*, and all negative exchanges are *technosphere*, i.e. consumption, and we use this convention to label the edges. However, to be consistent with SQLite database results, we don't flip signs in the returned dataframe.

The order of returned edges are production, technosphere, biosphere.

This function will draw from all resources with the correct matrix types (i.e. ``'biosphere_matrix'``, ``'technosphere_matrix'``). Normally each IO Table database is stored in only one datapackage, and each datapackage only has one such database.

* ``datapackage``: The datapackage object.
* ``target``: Limit exchanges to those with the column index ``target``. Target must be an instance of ``IOTableActivity``.
* ``biosphere``, ``technosphere``, ``production``: Return these types of edges.

<a id="bw2data.backends.iotable.proxies.IOTableExchanges.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

<a id="bw2data.backends.iotable.proxies.IOTableExchanges.__next__"></a>

#### \_\_next\_\_

```python
def __next__()
```

<a id="bw2data.backends.iotable.proxies.IOTableExchanges.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```

<a id="bw2data.backends.iotable.proxies.IOTableActivity"></a>

## IOTableActivity Objects

```python
class IOTableActivity(Activity)
```

<a id="bw2data.backends.iotable.proxies.IOTableActivity.delete"></a>

#### delete

```python
def delete() -> None
```

<a id="bw2data.backends.iotable.proxies.IOTableActivity.rp_exchange"></a>

#### rp\_exchange

```python
def rp_exchange()
```

<a id="bw2data.backends.iotable.proxies.IOTableActivity.technosphere"></a>

#### technosphere

```python
def technosphere() -> IOTableExchanges
```

<a id="bw2data.backends.iotable.proxies.IOTableActivity.biosphere"></a>

#### biosphere

```python
def biosphere()
```

<a id="bw2data.backends.iotable.proxies.IOTableActivity.production"></a>

#### production

```python
def production()
```

<a id="bw2data.backends.iotable.proxies.IOTableActivity.exchanges"></a>

#### exchanges

```python
def exchanges()
```

<a id="bw2data.backends.iotable.proxies.IOTableActivity.substitution"></a>

#### substitution

```python
def substitution()
```
