**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.searchengine.base` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.searchengine.base cfg.yml > activity_browser.bwutils.searchengine.base.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.searchengine.base"></a>

# activity\_browser.bwutils.searchengine.base

<a id="activity_browser.bwutils.searchengine.base.SearchEngine"></a>

## SearchEngine Objects

```python
class SearchEngine()
```

A Search Engine class, takes a dataframe and makes it searchable.

A search requires a string, and will return a list of unique identifiers in the dataframe.
There are three options for search:
    SearchEngine.literal_search(): searches for exact matches of the search query
    SearchEngine.fuzzy_search(): searches for approximate matches of search query, sorted by relevance
    SearchEngine.search(): combines both of the above, literal matches are returned first, next all fuzzy results,
    but subsets sorted by relevance.
It is recommended to always use searchEngine.search(), but the other options are there.

Initialization takes:
    df: Dataframe that needs to be searchable.
    identifier_name: values in this column will be returned as search results, all values in this column need to be unique.
    searchable_columns: these columns need to be searchable, if none are given, all columns will be made searchable.

Updating data is possible as well:
    add_identifier(): adds this identifier to the searchable data
    remove_identifier(): removes this identifier from the searchable data
    change_identifier(): changes this identifier (wrapper for remove_identifier and add_identifier)

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.__init__"></a>

#### \_\_init\_\_

```python
def __init__(df: pd.DataFrame,
             identifier_name: str,
             searchable_columns: list = [])
```

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.update_index"></a>

#### update\_index

```python
def update_index(update_df: pd.DataFrame) -> None
```

Update search index dicts and the df.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.clean_text"></a>

#### clean\_text

```python
def clean_text(text: str)
```

Clean a string so it doesn't contain weird characters or multiple spaces etc.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.text_to_positional_q_gram"></a>

#### text\_to\_positional\_q\_gram

```python
def text_to_positional_q_gram(text: str) -> list
```

Return a positional list of q-grams for the given string.

q-grams are n-grams on character level.
q-grams at q=2 of "word" would be "wo", "or" and "rd"
https://en.wikipedia.org/wiki/N-gram

Note: these are technically _positional_ q-grams, but we don't use their positions currently.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.df_clean"></a>

#### df\_clean

```python
def df_clean(df)
```

Clean the text in query_col.

apply multi-processing when the computer is able and its relevant

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.words_in_df"></a>

#### words\_in\_df

```python
def words_in_df(df: pd.DataFrame = None) -> tuple[dict, pd.DataFrame]
```

Return a dict of {identifier: word} for df.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.reverse_dict_many_to_one"></a>

#### reverse\_dict\_many\_to\_one

```python
def reverse_dict_many_to_one(dictionary: dict) -> dict
```

Reverse a dictionary of Counter objects.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.list_to_q_grams"></a>

#### list\_to\_q\_grams

```python
def list_to_q_grams(word_list: Iterable) -> dict
```

Convert a list of unique words to a dict with Counter objects.

Number will be the occurrences of that q-gram in that word.

return = {
    "word": Counter(
        "wo": 1
        "or": 1
        "rd": 1
        ),
    ...
    }

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.word_in_index"></a>

#### word\_in\_index

```python
def word_in_index(word: str) -> bool
```

Convenience function to check if a single word is in the search index.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.add_identifier"></a>

#### add\_identifier

```python
def add_identifier(data: pd.DataFrame) -> None
```

Add this data to the search index.

identifier column is REQUIRED to be present
ALL data in the given dataframe will be added, if columns should not be added, they should be removed before
calling this function

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.remove_identifier"></a>

#### remove\_identifier

```python
def remove_identifier(identifier, logging=True) -> None
```

Remove this identifier from self.df and the search index.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.remove_identifiers"></a>

#### remove\_identifiers

```python
def remove_identifiers(identifiers, logging=True) -> None
```

Remove many identifiers in one dataframe drop and a single inverted-index pass.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.change_identifier"></a>

#### change\_identifier

```python
def change_identifier(identifier, data: pd.DataFrame) -> None
```

Change this identifier.

identifier must be an identifier that is in use
data must be a dataframe of 1 row with all change data
data is overwritten with the new data in 'data', columns not given remain unchanged

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.filter_dataframe"></a>

#### filter\_dataframe

```python
def filter_dataframe(df: pd.DataFrame,
                     pattern: str,
                     search_columns: Optional[list] = None) -> pd.Series
```

Filter the search columns of a dataframe on a pattern.

Returns a mask (true/false) pd.Series with matching items.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.literal_search"></a>

#### literal\_search

```python
def literal_search(text, df: Optional[pd.DataFrame] = None) -> list
```

Do literal search of the text in all original columns that were given.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.osa_distance"></a>

#### osa\_distance

```python
def osa_distance(word1: str,
                 word2: str,
                 cutoff: int = 0,
                 cutoff_return: int = 1000) -> int
```

Calculate the Optimal String Alignment (OSA) edit distance between two strings, return edit distance.

Has additional cutoff variable, if cutoff is higher than 0 and if the words have
a larger edit distance, return a large number (note: cutoff <= edit_dist, not cutoff < edit_dist)

OSA is a restricted form of the Damerau–Levenshtein distance.
https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#Optimal_string_alignment_distance

The edit distance is how many operations (insert, delete, substitute or transpose a character) need to happen to convert one string to another.
insert and delete are obvious operations, but substitute and transpose are explained:
    substitute: replace one character with another: e.g. word1='cat' word2='cab', 't'->'b' substitution is 1 operation
    transpose: swap the places of two adjacent characters with each other: e.g. word1='coal' word2='cola' 'al' -> 'la' transposition is 1 operation

The minimum amount of edit operations (OSA edit distance) is returned.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.find_q_gram_matches"></a>

#### find\_q\_gram\_matches

```python
def find_q_gram_matches(q_grams: set) -> pd.DataFrame
```

Find which of the given q_grams exist in self.q_gram_to_word,
return a sorted dataframe of best matching words.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.spell_check"></a>

#### spell\_check

```python
def spell_check(text: str, skip_len=1) -> OrderedDict
```

Create an OrderedDict of each word in the text (space separated)
with as values possible alternatives.

Alternatives are first found with q-grams, then refined with string edit distance

We rank alternative words based on 1) edit distance 2) how often a word is used in an entry
If too many results are found, we only keep edit distance 1,
if we want more results, we keep with longer edit distance up to `never_accept_this`

word_results = OrderedDict(
    "word": [work]
    )

NOTE: only ALTERNATIVES are ever returned, this function returns empty list for item BOTH when
    1) the exact word is in the data
    2) when there are no suitable alternatives

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.build_queries"></a>

#### build\_queries

```python
def build_queries(query_text) -> list
```

Make all possible subsets of words in the query, including alternative words.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.weigh_identifiers"></a>

#### weigh\_identifiers

```python
def weigh_identifiers(identifiers: Counter, weight: int,
                      weighted_ids: Counter) -> Counter
```

Add weights to identifier counter for these identifiers times how often it occurs in identifier.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.search_size_1"></a>

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

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.fuzzy_search"></a>

#### fuzzy\_search

```python
def fuzzy_search(text: str, return_counter: bool = False) -> list
```

Search the dataframe, finding approximate matches and return a list of identifiers,
ranked by how well each identifier matches the search text.

1. First, identifiers matching single words (and spell-checked alternatives) are found and weighted.
2. If the search term consisted of multiple words, combinations of those words are checked next.
    2.1 Increasing in size (first two words, then three etc.), we look for identifiers that contain that set of
    words, these are also weighted, based on the sum of all one-word weights (from first step) and the length
    of the sequence.
    2.2 Next, we also look specifically for combinations occurring next to each other. And add more weight like
    the step above (2.1).
We multiply the weighting of step 2 by the sequence length, based on the assumption that finding more search
words will be a more relevant result than just finding a single word, and again if they are in the
correct order.

Finally, all found identifiers are sorted on their weight and returned.

<a id="activity_browser.bwutils.searchengine.base.SearchEngine.search"></a>

#### search

```python
def search(text) -> list
```

Search the dataframe on this text, return a sorted list of identifiers.
