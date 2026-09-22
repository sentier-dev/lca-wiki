**Generated API reference** · package `bw2data` 4.7 · module `bw2data.serialization` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2data==4.7'
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
  -I "$SP" -m bw2data.serialization cfg.yml > bw2data.serialization.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.serialization"></a>

# bw2data.serialization

<a id="bw2data.serialization.JsonWrapper"></a>

## JsonWrapper Objects

```python
class JsonWrapper()
```

<a id="bw2data.serialization.JsonWrapper.dump"></a>

#### dump

```python
@classmethod
def dump(data, filepath)
```

<a id="bw2data.serialization.JsonWrapper.dump_bz2"></a>

#### dump\_bz2

```python
@classmethod
def dump_bz2(data, filepath)
```

<a id="bw2data.serialization.JsonWrapper.load"></a>

#### load

```python
@classmethod
def load(file)
```

<a id="bw2data.serialization.JsonWrapper.load_bz2"></a>

#### load\_bz2

```python
@classmethod
def load_bz2(filepath)
```

<a id="bw2data.serialization.JsonWrapper.dumps"></a>

#### dumps

```python
@classmethod
def dumps(data)
```

<a id="bw2data.serialization.JsonWrapper.loads"></a>

#### loads

```python
@classmethod
def loads(data)
```

<a id="bw2data.serialization.JsonSanitizer"></a>

## JsonSanitizer Objects

```python
class JsonSanitizer()
```

<a id="bw2data.serialization.JsonSanitizer.sanitize"></a>

#### sanitize

```python
@classmethod
def sanitize(cls, data)
```

<a id="bw2data.serialization.JsonSanitizer.load"></a>

#### load

```python
@classmethod
def load(cls, data)
```

<a id="bw2data.serialization.SerializedDict"></a>

## SerializedDict Objects

```python
class SerializedDict(MutableMapping)
```

Base class for dictionary that can be `serialized <http://en.wikipedia.org/wiki/Serialization>`_ to or unserialized from disk. Uses JSON as its storage format. Has most of the methods of a dictionary.

Upon instantiation, the serialized dictionary is read from disk.

<a id="bw2data.serialization.SerializedDict.__init__"></a>

#### \_\_init\_\_

```python
def __init__(dirpath=None)
```

<a id="bw2data.serialization.SerializedDict.load"></a>

#### load

```python
def load()
```

Load the serialized data. Creates the file if not yet present.

<a id="bw2data.serialization.SerializedDict.flush"></a>

#### flush

```python
def flush(signal: bool = True)
```

Serialize the current data to disk.

<a id="bw2data.serialization.SerializedDict.list"></a>

#### list

```python
@property
def list()
```

List the keys of the dictionary. This is a property, and does not need to be called.

<a id="bw2data.serialization.SerializedDict.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(key)
```

<a id="bw2data.serialization.SerializedDict.__setitem__"></a>

#### \_\_setitem\_\_

```python
def __setitem__(key, value)
```

<a id="bw2data.serialization.SerializedDict.__contains__"></a>

#### \_\_contains\_\_

```python
def __contains__(key)
```

<a id="bw2data.serialization.SerializedDict.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```

<a id="bw2data.serialization.SerializedDict.__repr__"></a>

#### \_\_repr\_\_

<a id="bw2data.serialization.SerializedDict.__delitem__"></a>

#### \_\_delitem\_\_

```python
def __delitem__(name: str, signal: bool = True)
```

<a id="bw2data.serialization.SerializedDict.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```

<a id="bw2data.serialization.SerializedDict.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

<a id="bw2data.serialization.SerializedDict.__hash__"></a>

#### \_\_hash\_\_

```python
def __hash__()
```

<a id="bw2data.serialization.SerializedDict.keys"></a>

#### keys

```python
def keys()
```

<a id="bw2data.serialization.SerializedDict.values"></a>

#### values

```python
def values()
```

<a id="bw2data.serialization.SerializedDict.serialize"></a>

#### serialize

```python
def serialize(filepath: Union[str, Path] = None, signal: bool = True)
```

Method to do the actual serialization. Can be replaced with other serialization formats.

**Arguments**:

  * *filepath* (str, optional): Provide an alternate filepath (e.g. for backup).

<a id="bw2data.serialization.SerializedDict.deserialize"></a>

#### deserialize

```python
def deserialize()
```

Load the serialized data. Can be replaced with other serialization formats.

<a id="bw2data.serialization.SerializedDict.pack"></a>

#### pack

```python
def pack(data)
```

Transform the data, if necessary. Needed because JSON must have strings as dictionary keys.

<a id="bw2data.serialization.SerializedDict.unpack"></a>

#### unpack

```python
def unpack(data)
```

Return serialized data to true form.

<a id="bw2data.serialization.SerializedDict.random"></a>

#### random

```python
def random()
```

Return a random key.

<a id="bw2data.serialization.SerializedDict.backup"></a>

#### backup

```python
def backup()
```

Write a backup version of the data to the ``backups`` directory.

<a id="bw2data.serialization.PickledDict"></a>

## PickledDict Objects

```python
class PickledDict(SerializedDict)
```

Subclass of ``SerializedDict`` that uses the pickle format instead of JSON.

<a id="bw2data.serialization.PickledDict.serialize"></a>

#### serialize

```python
def serialize(signal: bool = True)
```

<a id="bw2data.serialization.PickledDict.deserialize"></a>

#### deserialize

```python
def deserialize()
```

<a id="bw2data.serialization.CompoundJSONDict"></a>

## CompoundJSONDict Objects

```python
class CompoundJSONDict(SerializedDict)
```

Subclass of ``SerializedDict`` that allows tuples as dictionary keys (not allowed in JSON).

<a id="bw2data.serialization.CompoundJSONDict.pack"></a>

#### pack

```python
def pack(data)
```

Transform the dictionary to a list because JSON can't handle lists as keys

<a id="bw2data.serialization.CompoundJSONDict.unpack"></a>

#### unpack

```python
def unpack(data)
```

Transform data back to a dictionary
