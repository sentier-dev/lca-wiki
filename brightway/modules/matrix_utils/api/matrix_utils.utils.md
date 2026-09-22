**Generated API reference** · package `matrix_utils` 0.9 · module `matrix_utils.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matrix_utils.utils cfg.yml > matrix_utils.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matrix_utils.utils"></a>

# matrix\_utils.utils

<a id="matrix_utils.utils.filter_groups_for_packages"></a>

#### filter\_groups\_for\_packages

```python
def filter_groups_for_packages(packages, matrix_label, use_vectors, use_arrays,
                               use_distributions) -> dict
```

<a id="matrix_utils.utils.has_relevant_data"></a>

#### has\_relevant\_data

```python
def has_relevant_data(group_label, package, use_vectors, use_arrays,
                      use_distributions) -> bool
```

<a id="matrix_utils.utils.safe_concatenate_indices"></a>

#### safe\_concatenate\_indices

```python
def safe_concatenate_indices(arrays: [np.ndarray],
                             empty_ok: bool = False) -> np.ndarray
```

<a id="matrix_utils.utils.unroll"></a>

#### unroll

```python
def unroll(a: tuple, b: tuple) -> tuple
```

Create a new tuple combining `a` and `b`, but inline `a` or `b` if they include tuples.

<a id="matrix_utils.utils.handle_all_arrays_empty"></a>

#### handle\_all\_arrays\_empty

```python
def handle_all_arrays_empty(packages: dict,
                            matrix_label: str,
                            identifier: Optional[str] = None) -> None
```

Format the error messages for `AllArraysEmpty` to make them understandable
