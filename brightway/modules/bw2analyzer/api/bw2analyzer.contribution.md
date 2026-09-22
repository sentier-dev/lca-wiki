**Generated API reference** · package `bw2analyzer` 0.11.8 · module `bw2analyzer.contribution` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2analyzer.contribution cfg.yml > bw2analyzer.contribution.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2analyzer.contribution"></a>

# bw2analyzer.contribution

<a id="bw2analyzer.contribution.ContributionAnalysis"></a>

## ContributionAnalysis Objects

```python
class ContributionAnalysis()
```

<a id="bw2analyzer.contribution.ContributionAnalysis.sort_array"></a>

#### sort\_array

```python
def sort_array(data, limit=25, limit_type="number", total=None)
```

Common sorting function for all ``top`` methods. Sorts by highest value first.

Operates in either ``number`` or ``percent`` mode. In ``number`` mode, return ``limit`` values. In ``percent`` mode, return all values >= (total * limit); where ``0 < limit <= 1``.

Returns 2-d numpy array of sorted values and row indices, e.g.:

.. code-block:: python

ContributionAnalysis().sort_array((1., 3., 2.))

returns

.. code-block:: python

(
(3, 1),
(2, 2),
(1, 0)
)

**Arguments**:

  * *data* (numpy array): A 1-d array of values to sort.
  * *limit* (number, default=25): Number of values to return, or percentage cutoff.
  * *limit_type* (str, default=``number``): Either ``number`` or ``percent``.
  * *total* (number, default=None): Optional specification of summed data total.
  

**Returns**:

  2-d numpy array of values and row indices.

<a id="bw2analyzer.contribution.ContributionAnalysis.top_matrix"></a>

#### top\_matrix

```python
def top_matrix(matrix, rows=5, cols=5)
```

Find most important (i.e. highest summed) rows and columns in a matrix, as well as the most corresponding non-zero individual elements in the top rows and columns.

Only returns matrix values which are in the top rows and columns. Element values are returned as a tuple: ``(row, col, row index in top rows, col index in top cols, value)``.

**Example**:

  
  .. code-block:: python
  
  matrix = [
  [0, 0, 1, 0],
  [2, 0, 4, 0],
  [3, 0, 1, 1],
  [0, 7, 0, 1],
  ]
  
  In this matrix, the row sums are ``(1, 6, 5, 8)``, and the columns sums are ``(5, 7, 6, 2)``. Therefore, the top rows are ``(3, 1)`` and the top columns are ``(1, 2)``. The result would therefore be:
  
  .. code-block:: python
  
  (
  (
  (3, 1, 0, 0, 7),
  (3, 2, 0, 1, 1),
  (1, 2, 1, 1, 4)
  ),
  (3, 1),
  (1, 2)
  )
  

**Arguments**:

  * *matrix* (array or matrix): Any Python object that supports the ``.sum(axis=)`` syntax.
  * *rows* (int): Number of rows to select.
  * *cols* (int): Number of columns to select.
  

**Returns**:

  (elements, top rows, top columns)

<a id="bw2analyzer.contribution.ContributionAnalysis.hinton_matrix"></a>

#### hinton\_matrix

```python
def hinton_matrix(lca, rows=5, cols=5)
```

<a id="bw2analyzer.contribution.ContributionAnalysis.annotate"></a>

#### annotate

```python
def annotate(sorted_data, rev_mapping)
```

Reverse the mapping from database ids to array indices

<a id="bw2analyzer.contribution.ContributionAnalysis.top_processes"></a>

#### top\_processes

```python
def top_processes(matrix, **kwargs)
```

Return an array of [value, index] technosphere processes.

<a id="bw2analyzer.contribution.ContributionAnalysis.top_emissions"></a>

#### top\_emissions

```python
def top_emissions(matrix, **kwargs)
```

Return an array of [value, index] biosphere emissions.

<a id="bw2analyzer.contribution.ContributionAnalysis.annotated_top_processes"></a>

#### annotated\_top\_processes

```python
def annotated_top_processes(lca, names=True, **kwargs)
```

Get list of most damaging processes in an LCA, sorted by ``abs(direct impact)``.

Returns a list of tuples: ``(lca score, supply, activity)``. If ``names`` is False, they returns the process key as the last element.

<a id="bw2analyzer.contribution.ContributionAnalysis.annotated_top_emissions"></a>

#### annotated\_top\_emissions

```python
def annotated_top_emissions(lca, names=True, **kwargs)
```

Get list of most damaging biosphere flows in an LCA, sorted by ``abs(direct impact)``.

Returns a list of tuples: ``(lca score, inventory amount, activity)``. If ``names`` is False, they returns the process key as the last element.

<a id="bw2analyzer.contribution.ContributionAnalysis.get_name"></a>

#### get\_name

```python
def get_name(key)
```

<a id="bw2analyzer.contribution.ContributionAnalysis.d3_treemap"></a>

#### d3\_treemap

```python
def d3_treemap(matrix, rev_bio, rev_techno, limit=0.025, limit_type="percent")
```

Construct treemap input data structure for LCA result. Output like:

.. code-block:: python

    {
    "name": "LCA result",
    "children": [{
        "name": process 1,
        "children": [
            {"name": emission 1, "size": score},
            {"name": emission 2, "size": score},
            ],
        }]
    }
