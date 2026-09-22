**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.single_value_diagonal_matrix` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2calc==2.5.0'
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
  -I "$SP" -m bw2calc.single_value_diagonal_matrix cfg.yml > bw2calc.single_value_diagonal_matrix.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.single_value_diagonal_matrix"></a>

# bw2calc.single\_value\_diagonal\_matrix

<a id="bw2calc.single_value_diagonal_matrix.SingleValueDiagonalMatrix"></a>

## SingleValueDiagonalMatrix Objects

```python
class SingleValueDiagonalMatrix(MappedMatrix)
```

A scipy sparse matrix handler which takes in ``bw_processing`` data packages. Row and column
ids are mapped to matrix indices, and a matrix is constructed.

Use primarily in the weighting step of life cycle impact assessment.

`indexer_override` allows for custom indexer behaviour. Indexers should follow a simple API:
they must support `.__next__()`, and have the attribute `.index`, which returns an integer.

`custom_filter` allows you to remove some data based on their indices. It is applied to all
resource groups. If you need more fine-grained control, process the matrix after
construction/iteration. `custom_filter` should take the indices array as an input, and return a
Numpy boolean array with the same length as the indices array.

**Arguments**:

  
  * packages: A list of Ddatapackage objects.
  * matrix: The string identifying the matrix to be built.
  * use_vectors: Flag to use vector data from datapackages
  * use_arrays: Flag to use array data from datapackages
  * use_distributions: Flag to use `stats_arrays` distribution data from datapackages
  * row_mapper: Optional instance of `ArrayMapper`. Used when matrices must align.
  * col_mapper: Optional instance of `ArrayMapper`. Used when matrices must align.
  * seed_override: Optional integer. Overrides the RNG seed given in the datapackage, if any.
  * indexer_override: Parameter for custom indexers. See above.
  * diagonal: If True, only use the `row` indices to build a diagonal matrix.
  * custom_filter: Callable for function to filter data based on `indices` values. See above.
  * empty_ok: If False, raise `AllArraysEmpty` if the matrix would be empty

<a id="bw2calc.single_value_diagonal_matrix.SingleValueDiagonalMatrix.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*,
             packages: Sequence[Datapackage],
             matrix: str,
             dimension: int,
             use_vectors: bool = True,
             use_arrays: bool = True,
             use_distributions: bool = False,
             seed_override: Union[int, None] = None,
             indexer_override: Any = None,
             custom_filter: Union[Callable, None] = None,
             **kwargs)
```

<a id="bw2calc.single_value_diagonal_matrix.SingleValueDiagonalMatrix.rebuild_matrix"></a>

#### rebuild\_matrix

```python
def rebuild_matrix()
```
