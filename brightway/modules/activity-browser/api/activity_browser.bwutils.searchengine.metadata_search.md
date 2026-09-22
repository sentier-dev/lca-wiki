**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.searchengine.metadata_search` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.searchengine.metadata_search cfg.yml > activity_browser.bwutils.searchengine.metadata_search.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.searchengine.metadata_search"></a>

# activity\_browser.bwutils.searchengine.metadata\_search

<a id="activity_browser.bwutils.searchengine.metadata_search.log"></a>

#### log

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine"></a>

## MetaDataSearchEngine Objects

```python
class MetaDataSearchEngine(SearchEngine)
```

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.database_id_manager"></a>

#### database\_id\_manager

```python
def database_id_manager(database)
```

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.reset_database_id_manager"></a>

#### reset\_database\_id\_manager

```python
def reset_database_id_manager()
```

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.database_word_manager"></a>

#### database\_word\_manager

```python
def database_word_manager(database)
```

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.reset_database_word_manager"></a>

#### reset\_database\_word\_manager

```python
def reset_database_word_manager(database)
```

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.database_search_cache"></a>

#### database\_search\_cache

```python
def database_search_cache(database, query, result=None)
```

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.reset_search_cache"></a>

#### reset\_search\_cache

```python
def reset_search_cache(database)
```

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.reset_all_caches"></a>

#### reset\_all\_caches

```python
def reset_all_caches(databases)
```

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.add_identifier"></a>

#### add\_identifier

```python
def add_identifier(data: pd.DataFrame) -> None
```

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.remove_identifiers"></a>

#### remove\_identifiers

```python
def remove_identifiers(identifiers, logging=True) -> None
```

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.remove_database"></a>

#### remove\_database

```python
def remove_database(db_name: str, logging=True) -> None
```

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.change_identifier"></a>

#### change\_identifier

```python
def change_identifier(identifier, data: pd.DataFrame) -> None
```

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.auto_complete"></a>

#### auto\_complete

```python
def auto_complete(word: str,
                  context: Optional[set] = set(),
                  database: Optional[str] = None) -> list
```

Based on spellchecker, make more useful for autocompletions

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.find_q_gram_matches"></a>

#### find\_q\_gram\_matches

```python
def find_q_gram_matches(q_grams: set,
                        return_all: bool = False) -> pd.DataFrame
```

Overwritten for extra database specific reduction of results.

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.search_size_1"></a>

#### search\_size\_1

```python
def search_size_1(queries: list,
                  original_words: set,
                  orig_word_weight=5,
                  exact_word_weight=1) -> dict
```

Return a dict of {query_word: Counter(identifier)}.

queries: is a list of len 1 tuple/lists of words that are a searched word or a 'spell checked' similar word
original words: a list of words actually searched for (not including spellchecked)

orig_word_weight: additional weight to add to original words
exact_word_weight: additional weight to add to exact word matches (as opposed to be 'in' str)

First, we find all matching words, creating a dict of words in 'queries' as keys and words matching that query word as list of values
Next, we convert this to identifiers and add weights:
    Weight will be increased if matching 'orig_word_weight' or 'exact_word_weight'

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.fuzzy_search"></a>

#### fuzzy\_search

```python
def fuzzy_search(text: str,
                 database: Optional[str] = None,
                 return_counter: bool = False,
                 logging: bool = True) -> list
```

Overwritten for extra database specific reduction of results.

<a id="activity_browser.bwutils.searchengine.metadata_search.MetaDataSearchEngine.search"></a>

#### search

```python
def search(text, database: Optional[str] = None) -> list
```

Search the dataframe on this text, return a sorted list of identifiers.
