**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.dictionary_manager` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2calc.dictionary_manager cfg.yml > bw2calc.dictionary_manager.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.dictionary_manager"></a>

# bw2calc.dictionary\_manager

<a id="bw2calc.dictionary_manager.resolved"></a>

#### resolved

```python
def resolved(f)
```

Decorator that resolves a ``partial`` function before it can be used

<a id="bw2calc.dictionary_manager.ReversibleRemappableDictionary"></a>

## ReversibleRemappableDictionary Objects

```python
class ReversibleRemappableDictionary(Mapping)
```

A dictionary that can be easily remapped or reversed.

Perhaps  overkill, but at the time it was easier than creating many dictionaries on the LCA
object itself.

Example usage::

    In [1]: from bw2calc.dictionary_manager import ReversibleRemappableDictionary

    In [2]: d = ReversibleRemappableDictionary({1: 2})

    In [3]: d.reverse
    Out[3]: {2: 1}

    In [4]: d.remap({1: "foo"})

    In [5]: d['foo']
    Out[5]: 2

    In [6]: d.original
    Out[6]: {1: 2}

    In [7]: d.reverse
    Out[7]: {2: 'foo'}

    In [8]: d.unmap()

    In [9]: d[1]
    Out[9]: 2

<a id="bw2calc.dictionary_manager.ReversibleRemappableDictionary.__init__"></a>

#### \_\_init\_\_

```python
def __init__(obj)
```

<a id="bw2calc.dictionary_manager.ReversibleRemappableDictionary.reversed"></a>

#### reversed

```python
@property
@resolved
def reversed()
```

<a id="bw2calc.dictionary_manager.ReversibleRemappableDictionary.original"></a>

#### original

```python
@property
@resolved
def original()
```

<a id="bw2calc.dictionary_manager.ReversibleRemappableDictionary.remap"></a>

#### remap

```python
@resolved
def remap(mapping)
```

Transform the keys based on the mapping dict ``mapping``.

``mapping`` doesn't need to cover every key in the original.

Example usage:

{1: 2}.remap({1: "foo"} >> {"foo": 2}

<a id="bw2calc.dictionary_manager.ReversibleRemappableDictionary.unmap"></a>

#### unmap

```python
@resolved
def unmap()
```

Restore dict to original state.

<a id="bw2calc.dictionary_manager.ReversibleRemappableDictionary.__getitem__"></a>

#### \_\_getitem\_\_

```python
@resolved
def __getitem__(key)
```

<a id="bw2calc.dictionary_manager.ReversibleRemappableDictionary.__iter__"></a>

#### \_\_iter\_\_

```python
@resolved
def __iter__()
```

<a id="bw2calc.dictionary_manager.ReversibleRemappableDictionary.__len__"></a>

#### \_\_len\_\_

```python
@resolved
def __len__()
```

<a id="bw2calc.dictionary_manager.ReversibleRemappableDictionary.__str__"></a>

#### \_\_str\_\_

```python
@resolved
def __str__()
```

<a id="bw2calc.dictionary_manager.DictionaryManager"></a>

## DictionaryManager Objects

```python
class DictionaryManager()
```

Class that handles dictionaries which can be remapped or reverse.

Usage::

    dm = DictionaryManager()
    dm.foo = {1: 2}
    dm.foo[1]
    >> 2

<a id="bw2calc.dictionary_manager.DictionaryManager.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="bw2calc.dictionary_manager.DictionaryManager.__getattr__"></a>

#### \_\_getattr\_\_

```python
def __getattr__(attr)
```

<a id="bw2calc.dictionary_manager.DictionaryManager.__setattr__"></a>

#### \_\_setattr\_\_

```python
def __setattr__(attr, value)
```

<a id="bw2calc.dictionary_manager.DictionaryManager.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```

<a id="bw2calc.dictionary_manager.DictionaryManager.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

<a id="bw2calc.dictionary_manager.DictionaryManager.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```
