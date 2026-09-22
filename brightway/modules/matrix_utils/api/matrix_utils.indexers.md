**Generated API reference** · package `matrix_utils` 0.9 · module `matrix_utils.indexers` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matrix_utils.indexers cfg.yml > matrix_utils.indexers.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matrix_utils.indexers"></a>

# matrix\_utils.indexers

<a id="matrix_utils.indexers.MAX_SIGNED_32BIT_INT"></a>

#### MAX\_SIGNED\_32BIT\_INT

<a id="matrix_utils.indexers.MAX_SIGNED_64BIT_INT"></a>

#### MAX\_SIGNED\_64BIT\_INT

<a id="matrix_utils.indexers.Indexer"></a>

## Indexer Objects

```python
class Indexer()
```

Base class for indexers

<a id="matrix_utils.indexers.RandomIndexer"></a>

## RandomIndexer Objects

```python
class RandomIndexer(Generator, Indexer)
```

A (potentially) seeded integer RNG that remembers the generated index.

Returns indices for a sample array.

Because we are creating Python indices, and Python starts indices with zero, the value
`max_value` is never reached - the maximum generated index is `max_value - 1`.

max_value: Number of columns in the array for which a column index is returned.
seed: Seed for RNG. Optional.

<a id="matrix_utils.indexers.RandomIndexer.__init__"></a>

#### \_\_init\_\_

```python
def __init__(seed: Union[int, None] = None,
             max_value: int = MAX_SIGNED_64BIT_INT)
```

<a id="matrix_utils.indexers.RandomIndexer.__next__"></a>

#### \_\_next\_\_

```python
def __next__()
```

<a id="matrix_utils.indexers.RandomIndexer.reset"></a>

#### reset

```python
def reset()
```

<a id="matrix_utils.indexers.SequentialIndexer"></a>

## SequentialIndexer Objects

```python
class SequentialIndexer(Indexer)
```

<a id="matrix_utils.indexers.SequentialIndexer.__init__"></a>

#### \_\_init\_\_

```python
def __init__(offset: int = 0)
```

<a id="matrix_utils.indexers.SequentialIndexer.__next__"></a>

#### \_\_next\_\_

```python
def __next__()
```

<a id="matrix_utils.indexers.SequentialIndexer.reset"></a>

#### reset

```python
def reset(offset=0)
```

<a id="matrix_utils.indexers.CombinatorialIndexer"></a>

## CombinatorialIndexer Objects

```python
class CombinatorialIndexer(Indexer)
```

<a id="matrix_utils.indexers.CombinatorialIndexer.__init__"></a>

#### \_\_init\_\_

```python
def __init__(max_values: List[int])
```

<a id="matrix_utils.indexers.CombinatorialIndexer.__next__"></a>

#### \_\_next\_\_

```python
def __next__()
```

<a id="matrix_utils.indexers.CombinatorialIndexer.reset"></a>

#### reset

```python
def reset()
```

<a id="matrix_utils.indexers.Proxy"></a>

## Proxy Objects

```python
class Proxy()
```

Simple class that proxies access to a combinatorial indexer

<a id="matrix_utils.indexers.Proxy.__init__"></a>

#### \_\_init\_\_

```python
def __init__(indexer: CombinatorialIndexer, offset: int)
```

<a id="matrix_utils.indexers.Proxy.index"></a>

#### index

```python
@property
def index()
```

<a id="matrix_utils.indexers.Proxy.reset"></a>

#### reset

```python
def reset()
```
