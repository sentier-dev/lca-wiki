**Generated API reference** · package `matrix_utils` 0.9 · module `matrix_utils.array_mapper` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matrix_utils.array_mapper cfg.yml > matrix_utils.array_mapper.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matrix_utils.array_mapper"></a>

# matrix\_utils.array\_mapper

<a id="matrix_utils.array_mapper.ArrayMapper"></a>

## ArrayMapper Objects

```python
class ArrayMapper()
```

Map an array of values to integer indices ascending from 0, and store this mapping for application to other arrays of floats.

This code improves on previous approaches (see e.g. https://github.com/brightway-lca/brightway2-calc/blob/114c272a0fde9301ff5e250e2773c01c28d7fd99/bw2calc/indexing.py) by:

* Not using ``np.searchsorted``, which appears to be always slower than ``index_with_arrays`` (see ``dev`` folder).
* Keeping the indexing arrays in memory, avoiding their creation each time they are applied to a new matrix.

.. code-block:: python

    In [1]: from matrix_utils import ArrayMapper
       ...: import numpy as np

    In [2]: am = ArrayMapper(array=np.array([0, 4, 6]))

    In [3]: am.map_array(np.array([6, 6, 3, 0]))
    Out[3]: array([ 2,  2, -1,  0])

<a id="matrix_utils.array_mapper.ArrayMapper.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*,
             array: np.ndarray,
             sparse_cutoff: int = 50000,
             empty_ok: bool = False)
```

<a id="matrix_utils.array_mapper.ArrayMapper.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```

<a id="matrix_utils.array_mapper.ArrayMapper.map_array"></a>

#### map\_array

```python
def map_array(array: np.ndarray) -> np.ndarray
```

<a id="matrix_utils.array_mapper.ArrayMapper.to_dict"></a>

#### to\_dict

```python
def to_dict() -> dict
```

Turn the mapping arrays into a Python dict. This is only useful for
human examination, the normal implementation uses Numpy functions on the
arrays directly.

<a id="matrix_utils.array_mapper.ArrayMapper.reverse_dict"></a>

#### reverse\_dict

```python
def reverse_dict() -> dict
```
