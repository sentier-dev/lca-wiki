**Generated API reference** · package `bw2data` 4.7 · module `bw2data.search.search` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.search.search cfg.yml > bw2data.search.search.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.search.search"></a>

# bw2data.search.search

<a id="bw2data.search.search.keysplit"></a>

#### keysplit

```python
def keysplit(strng)
```

Split an activity key joined into a single string using the magic sequence `⊡|⊡`

<a id="bw2data.search.search.Searcher"></a>

## Searcher Objects

```python
class Searcher()
```

<a id="bw2data.search.search.Searcher.search_fields"></a>

#### search\_fields

<a id="bw2data.search.search.Searcher.__init__"></a>

#### \_\_init\_\_

```python
def __init__(database)
```

<a id="bw2data.search.search.Searcher.__enter__"></a>

#### \_\_enter\_\_

```python
def __enter__()
```

<a id="bw2data.search.search.Searcher.__exit__"></a>

#### \_\_exit\_\_

```python
def __exit__(type, value, traceback)
```

<a id="bw2data.search.search.Searcher.search"></a>

#### search

```python
def search(string,
           limit=25,
           facet=None,
           proxy=True,
           boosts=None,
           filter=None,
           mask=None,
           node_class=None)
```
