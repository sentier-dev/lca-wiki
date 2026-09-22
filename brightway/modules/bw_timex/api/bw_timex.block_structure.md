**Generated API reference** · package `bw_timex` 1.4.0 · module `bw_timex.block_structure` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_timex==1.4.0'
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
  -I "$SP" -m bw_timex.block_structure cfg.yml > bw_timex.block_structure.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_timex.block_structure"></a>

# bw\_timex.block\_structure

Block-triangular decomposition of a (time-explicit) technosphere matrix.

A time-explicit technosphere is a handful of new foreground, temporalized and
temporal-market columns sitting on top of several unmodified copies of a
background database. Background processes never consume from the foreground, and
one background vintage never consumes from another, so the matrix is block lower
triangular: solving it as one system factorizes hundreds of thousands of columns
that could have been solved - or skipped, or reused from a previous run - block
by block.

This module finds those blocks. It works on a matrix and a per-column label
(the source database), so it can be tested without Brightway.

<a id="bw_timex.block_structure.Block"></a>

## Block Objects

```python
@dataclass(frozen=True)
class Block()
```

One diagonal block: the columns solved together and their matrix rows.

<a id="bw_timex.block_structure.Block.columns"></a>

#### columns

<a id="bw_timex.block_structure.Block.rows"></a>

#### rows

<a id="bw_timex.block_structure.Block.labels"></a>

#### labels

<a id="bw_timex.block_structure.BlockStructure"></a>

## BlockStructure Objects

```python
class BlockStructure()
```

Diagonal blocks of a technosphere matrix, in the order they solve.

Blocks come back consumer first: a block's columns may carry entries in the
rows of *later* blocks only. Solving therefore goes

``A[block.rows][:, block.columns] x_block = d[block.rows] - A[block.rows][:, solved] x_solved``

for each block in turn, which reproduces the monolithic solve exactly.

<a id="bw_timex.block_structure.BlockStructure.__init__"></a>

#### \_\_init\_\_

```python
def __init__(blocks: list, is_degenerate: bool, n_columns: int)
```

<a id="bw_timex.block_structure.BlockStructure.__len__"></a>

#### \_\_len\_\_

```python
def __len__() -> int
```

<a id="bw_timex.block_structure.BlockStructure.detect"></a>

#### detect

```python
@classmethod
def detect(cls,
           matrix,
           column_labels: np.ndarray,
           row_labels: Optional[np.ndarray] = None) -> "BlockStructure"
```

Group the matrix into diagonal blocks by label.

Parameters
----------
matrix
    The technosphere matrix, square, in any scipy sparse format.
column_labels
    One label per column, e.g. the database a process comes from.
row_labels
    One label per row. Defaults to `column_labels`, which is right when
    rows and columns share an index space. Under the explicit
    process/product paradigm a product row can carry a different node id
    than its process column, but both belong to the same database.

Returns
-------
BlockStructure
    Blocks in consumer-first order. Labels that depend on each other in
    both directions are merged into a single block, so a cyclic topology
    stays correct - it just yields a bigger block. If no useful split
    exists, the structure holds one block covering everything and
    `is_degenerate` is True.
