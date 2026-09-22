**Generated API reference** · package `matrix_utils` 0.9 · module `matrix_utils.errors` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'matrix_utils==0.9'
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
  -I "$SP" -m matrix_utils.errors cfg.yml > matrix_utils.errors.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matrix_utils.errors"></a>

# matrix\_utils.errors

<a id="matrix_utils.errors.MatrixUtilsError"></a>

## MatrixUtilsError Objects

```python
class MatrixUtilsError(Exception)
```

Base class for bw2calc errors

<a id="matrix_utils.errors.AllArraysEmpty"></a>

## AllArraysEmpty Objects

```python
class AllArraysEmpty(MatrixUtilsError)
```

Can't load the numpy arrays if all of them are empty

<a id="matrix_utils.errors.NoArrays"></a>

## NoArrays Objects

```python
class NoArrays(MatrixUtilsError)
```

No arrays for given matrix

<a id="matrix_utils.errors.EmptyArray"></a>

## EmptyArray Objects

```python
class EmptyArray(MatrixUtilsError)
```

Empty array can't be used

<a id="matrix_utils.errors.EmptyInterface"></a>

## EmptyInterface Objects

```python
class EmptyInterface(MatrixUtilsError)
```

Calculation attempted with dehydrated interface.
