**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.metadata.metadata` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.metadata.metadata cfg.yml > activity_browser.bwutils.metadata.metadata.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.metadata.metadata"></a>

# activity\_browser.bwutils.metadata.metadata

<a id="activity_browser.bwutils.metadata.metadata.dataframe_for_pickle_cache"></a>

#### dataframe\_for\_pickle\_cache

```python
def dataframe_for_pickle_cache(df: pd.DataFrame) -> pd.DataFrame
```

Return a copy safe for ``to_pickle`` across pandas versions.

``StringDtype`` columns unpickle can raise ``NotImplementedError`` when the
cache was written with a different pandas build; plain ``object`` strings do not.

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore"></a>

## MetaDataStore Objects

```python
class MetaDataStore(QObject)
```

Singleton class to manage metadata storage, loading, updating, and searching.

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.__new__"></a>

#### \_\_new\_\_

```python
def __new__(cls, *args, **kwargs)
```

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.dataframe"></a>

#### dataframe

```python
@property
def dataframe() -> pd.DataFrame
```

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.dataframe"></a>

#### dataframe

```python
@dataframe.setter
def dataframe(df: pd.DataFrame) -> None
```

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.databases"></a>

#### databases

```python
@property
def databases()
```

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.keys"></a>

#### keys

```python
@property
def keys()
```

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.register_mutation"></a>

#### register\_mutation

```python
def register_mutation(key: tuple[str, str], action: Literal["add", "update",
                                                            "delete"])
```

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.flush_mutations"></a>

#### flush\_mutations

```python
def flush_mutations(
) -> tuple[set[tuple[str, str]], set[tuple[str, str]], set[tuple[str, str]]]
```

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.match"></a>

#### match

```python
def match(**kwargs: dict[str, str]) -> pd.DataFrame
```

Return a slice of the dataframe matching the criteria.

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.get_metadata"></a>

#### get\_metadata

```python
def get_metadata(keys: list = None, columns: list = None) -> pd.DataFrame
```

Return a slice of the dataframe matching row and column identifiers.

NOTE: https://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html#deprecate-loc-reindex-listlike
From pandas version 1.0 and onwards, attempting to select a column
with all NaN values will fail with a KeyError.

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.get_database_metadata"></a>

#### get\_database\_metadata

```python
def get_database_metadata(db_name: str, columns: list = None) -> pd.DataFrame
```

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.search"></a>

#### search

```python
def search(query: str, columns: list = None) -> pd.DataFrame
```

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.search_database"></a>

#### search\_database

```python
def search_database(query: str,
                    database: str,
                    columns: list = None) -> pd.DataFrame
```

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.auto_complete"></a>

#### auto\_complete

```python
def auto_complete(word: str,
                  context: Optional[set] = None,
                  database: Optional[str] = None)
```

<a id="activity_browser.bwutils.metadata.metadata.MetaDataStore.clear_cache"></a>

#### clear\_cache

```python
def clear_cache()
```

<a id="activity_browser.bwutils.metadata.metadata.get_query_parameters"></a>

#### get\_query\_parameters

```python
def get_query_parameters(query: str) -> tuple[dict[str, str], str]
```

Extract key-value pairs from a query string of the form 'key1:value1 key2:value2'.
