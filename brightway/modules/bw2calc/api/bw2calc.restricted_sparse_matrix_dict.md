**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.restricted_sparse_matrix_dict` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2calc.restricted_sparse_matrix_dict cfg.yml > bw2calc.restricted_sparse_matrix_dict.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.restricted_sparse_matrix_dict"></a>

# bw2calc.restricted\_sparse\_matrix\_dict

<a id="bw2calc.restricted_sparse_matrix_dict.RestrictionsValidator"></a>

## RestrictionsValidator Objects

```python
class RestrictionsValidator(BaseModel)
```

<a id="bw2calc.restricted_sparse_matrix_dict.RestrictionsValidator.restrictions"></a>

#### restrictions

<a id="bw2calc.restricted_sparse_matrix_dict.RestrictedSparseMatrixDict"></a>

## RestrictedSparseMatrixDict Objects

```python
class RestrictedSparseMatrixDict(SparseMatrixDict)
```

<a id="bw2calc.restricted_sparse_matrix_dict.RestrictedSparseMatrixDict.__init__"></a>

#### \_\_init\_\_

```python
def __init__(restrictions: dict, *args, **kwargs)
```

Like SparseMatrixDict, but follows `restrictions` on what can be multiplied.

Only for use with normalization and weighting.

<a id="bw2calc.restricted_sparse_matrix_dict.RestrictedSparseMatrixDict.__matmul__"></a>

#### \_\_matmul\_\_

```python
def __matmul__(other: Any) -> SparseMatrixDict
```

Define logic for `@` matrix multiplication operator.

Note that the sparse matrix dict must come first, i.e. `self @ other`.
