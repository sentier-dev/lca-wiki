**Generated API reference** · package `bw2analyzer` 0.11.8 · module `bw2analyzer.page_rank` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2analyzer==0.11.8'
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
  -I "$SP" -m bw2analyzer.page_rank cfg.yml > bw2analyzer.page_rank.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2analyzer.page_rank"></a>

# bw2analyzer.page\_rank

<a id="bw2analyzer.page_rank.ConvergenceError"></a>

## ConvergenceError Objects

```python
class ConvergenceError(Exception)
```

<a id="bw2analyzer.page_rank.PageRank"></a>

## PageRank Objects

```python
class PageRank()
```

<a id="bw2analyzer.page_rank.PageRank.__init__"></a>

#### \_\_init\_\_

```python
def __init__(database)
```

<a id="bw2analyzer.page_rank.PageRank.calculate"></a>

#### calculate

```python
def calculate()
```

<a id="bw2analyzer.page_rank.PageRank.page_rank"></a>

#### page\_rank

```python
def page_rank(technosphere, alpha=0.85, max_iter=100, tol=1e-6)
```

Return the PageRank of the nodes in the graph.

Adapted from http://networkx.lanl.gov/svn/networkx/trunk/networkx/algorithms/link_analysis/pagerank_alg.py

PageRank computes a ranking of the nodes in the graph G based on
the structure of the incoming links. It was originally designed as
an algorithm to rank web pages.

The eigenvector calculation uses power iteration with a SciPy
sparse matrix representation.

**Arguments**:

  * *technosphere* (scipy sparse matrix): The technosphere matrix.
  * *alpha* (float, optional): Damping parameter for PageRank, default=0.85
  

**Returns**:

  * Dictionary of nodes (activity codes) with value as PageRank
  
  
  References
  
  .. [1] A. Langville and C. Meyer,
  "A survey of eigenvector methods of web information retrieval."
  http://citeseer.ist.psu.edu/713792.html
  .. [2] Page, Lawrence; Brin, Sergey; Motwani, Rajeev and Winograd, Terry,
  The PageRank citation ranking: Bringing order to the Web. 1999
  http://dbpubs.stanford.edu:8090/pub/showDoc.Fulltext?lang=en&doc=1999-66&format=pdf
