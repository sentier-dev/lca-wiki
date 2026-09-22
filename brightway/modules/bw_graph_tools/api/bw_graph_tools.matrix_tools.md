**Generated API reference** · package `bw_graph_tools` 0.10 · module `bw_graph_tools.matrix_tools` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_graph_tools==0.10'
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
  -I "$SP" -m bw_graph_tools.matrix_tools cfg.yml > bw_graph_tools.matrix_tools.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_graph_tools.matrix_tools"></a>

# bw\_graph\_tools.matrix\_tools

<a id="bw_graph_tools.matrix_tools.to_normalized_adjacency_matrix"></a>

#### to\_normalized\_adjacency\_matrix

```python
def to_normalized_adjacency_matrix(
        matrix: sparse.spmatrix,
        log_transform: bool = True) -> sparse.csr_matrix
```

Take a technosphere matrix constructed with Brightway conventions, and return a normalized adjacency matrix.

In the adjacency matrix A, `A[i,j]` indicates a directed edge **from** row `i` **to** column `j`. However,
this is the opposite of what we normally want, which is to find a path from the functional activity to
somewhere in its supply chain. In a Brightway technosphere matrix, `A[i,j]` means **activity** `j` consumes
the output of activity `i`. To go down the supply chain, however, we would need to go from ``j`` to ``i``.
Therefore, we take the transpose of the technosphere matrix.

Normalization is done to remove the effect of activities which don't produce one unit of their reference product.
For example, if activity `foo` produces two units of `bar` and consumes two units of `baz`, the weight of the
`baz` edge should be :math:`2 / 2 = 1`.

In addition to this normalization, we subtract the diagonal and flip the signs of all matrix values. Flipping
the sign is needed because we want to use a shortest path algorithm, but actually want the longest path. The
longest path is the path with the highest weight, i.e. the path where the most consumption occurs on.

By default, we also take the natural log of the data values. This is because our supply chain is multiplicative,
not additive, and :math:`a \cdot b = e^{\ln(a) + \ln(b)}`. The idea of using the log was borrowed from `David Richardby on Stack Overflow <https://cs.stackexchange.com/questions/83656/traverse-direct-graph-with-multiplicative-edges>`__.

Assumes that production amounts are on the diagonal.

<a id="bw_graph_tools.matrix_tools.gpe_zeroth_heuristic"></a>

#### gpe\_zeroth\_heuristic

```python
def gpe_zeroth_heuristic(mm: mu.MappedMatrix) -> Tuple[np.ndarray, np.ndarray]
```

Use explicit reference-exchange flags to find production exchange indices.

If a resource group carries a ``reference`` boolean array (stored in the
datapackage with ``kind="reference"``), the entries flagged ``True`` are the
production/reference exchanges declared by the modeller. This is
authoritative: it is used in preference to all the structural heuristics,
which can only guess and cannot disambiguate e.g. co-production columns.

Operates on the masked resource-group data, so the returned values are matrix
indices. Resource groups without a reference array are silently ignored via
``KeyError`` (mirroring ``gpe_second_heuristic``'s handling of ``flip``).

Returns a tuple of numpy integer matrix indices, rows by columns.

<a id="bw_graph_tools.matrix_tools.gpe_first_heuristic"></a>

#### gpe\_first\_heuristic

```python
def gpe_first_heuristic(mm: mu.MappedMatrix) -> Tuple[np.ndarray, np.ndarray]
```

Use first heuristic (same input and output ids) to find production exchange indices.

If we treat activities and products the same, then an exchange with the row and column id
is definitely a production exchange location. We don't care if there are duplicates (e.g.
production and some loss), we will return unique pairs.

If activities have different ids than products, this won't find anything.

Returns a tuple of numpy integer matrix indices, rows by columns.

<a id="bw_graph_tools.matrix_tools.gpe_second_heuristic"></a>

#### gpe\_second\_heuristic

```python
def gpe_second_heuristic(
        mm: mu.MappedMatrix, row_existing: np.ndarray,
        col_existing: np.ndarray) -> Tuple[np.ndarray, np.ndarray]
```

Use second heuristic (single non-flipped entry per column) to find production exchange indices.

In Brightway convention, consumption exchanges are stored as positive values with ``flip=True``
so they appear negative in the built matrix. Production exchanges normally have ``flip=False``.
If exactly one exchange in a column has ``flip=False`` and that column was not already identified
by the first heuristic, that exchange is the production exchange.

Operates on raw resource-group data before values are assembled into the matrix, so it is
unaffected by summing across packages. Columns whose production exchange was already found
(present in ``col_existing``) are skipped. Resource groups without a flip array are silently
ignored via ``KeyError``.

Takes row and column indices already found (``row_existing``, ``col_existing``) and appends any
new findings. Returns the combined arrays.

<a id="bw_graph_tools.matrix_tools.gpe_third_heuristic"></a>

#### gpe\_third\_heuristic

```python
def gpe_third_heuristic(
        mm: mu.MappedMatrix, row_existing: np.ndarray,
        col_existing: np.ndarray) -> Tuple[np.ndarray, np.ndarray]
```

Use third heuristic (single positive value per column) to find production exchange indices.

Operates on the assembled matrix rather than raw resource-group data. If a column has
exactly one positive entry and that column was not already identified by earlier heuristics,
that entry is the production exchange.

Takes row and column indices already found (``row_existing``, ``col_existing``) and appends
any new findings. Returns the combined arrays.

.. note::
    This heuristic can misidentify the production exchange for a waste treatment activity
    that also produces a co-product. If such a column has one positive entry (the co-product)
    and one negative entry (the waste being treated), this heuristic selects the co-product
    row rather than the waste row. The correct assignment would be found by
    :func:`gpe_fourth_heuristic`, but because this heuristic runs first it claims the column
    and the fourth heuristic never inspects it. This is a known ordering limitation.

<a id="bw_graph_tools.matrix_tools.gpe_fourth_heuristic"></a>

#### gpe\_fourth\_heuristic

```python
def gpe_fourth_heuristic(
        mm: mu.MappedMatrix, row_existing: np.ndarray,
        col_existing: np.ndarray) -> Tuple[np.ndarray, np.ndarray]
```

Use fourth heuristic (single negative value per column) to find waste-treatment production exchanges.

Waste treatment activities accept waste as their reference product. In the technosphere matrix
this appears as a negative entry (the activity consumes the waste flow). If a column has exactly
one negative entry and that column was not already identified by earlier heuristics, that entry
is the production exchange for a waste treatment activity.

Operates on the assembled matrix. Takes row and column indices already found
(``row_existing``, ``col_existing``) and appends any new findings. Returns the combined arrays.

<a id="bw_graph_tools.matrix_tools.gpe_fifth_heuristic"></a>

#### gpe\_fifth\_heuristic

```python
def gpe_fifth_heuristic(
        mm: mu.MappedMatrix, row_existing: np.ndarray,
        col_existing: np.ndarray) -> Tuple[np.ndarray, np.ndarray]
```

Use fifth heuristic (unique product across remaining columns) to find production exchange indices.

For each product (row) that appears in exactly one of the still-unidentified columns, that
column is unambiguously the producer or consumer of that product, so the entry is the
production exchange. To remain fully deterministic, a column is only assigned when exactly
one such uniquely-pointing row identifies it — if two different unique rows both point to the
same column we cannot choose between them and that column is left unassigned.

Operates on the assembled matrix. Takes row and column indices already found
(``row_existing``, ``col_existing``) and appends any new findings. Returns the combined arrays.

<a id="bw_graph_tools.matrix_tools.guess_production_exchanges"></a>

#### guess\_production\_exchanges

```python
def guess_production_exchanges(
        mm: mu.MappedMatrix) -> Tuple[np.ndarray, np.ndarray]
```

Try to guess productions exchanges in a mapped technosphere matrix using heuristics from the input data packages.

Try the following in order per activity (column):

* Explicit ``reference`` flag set by the modeller (authoritative)
* Same input and output index
* Single value where ``flip`` is negative
* Single positive value
* Single negative value (waste treatment)
* Unique product across remaining unidentified columns

The first step reads explicit reference-exchange flags from the input data
packages; any column it identifies is treated as authoritative and is not
revisited by the structural heuristics that follow.

Raises ``UnclearProductionExchange`` if these conditions are not met for any activity.

Returns integer arrays of the matrix row and column indices where production exchanges were found.
