**Generated API reference** · package `bw2data` 4.7 · module `bw2data.meta` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.meta cfg.yml > bw2data.meta.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.meta"></a>

# bw2data.meta

<a id="bw2data.meta.GeoMapping"></a>

## GeoMapping Objects

```python
class GeoMapping(PickledDict)
```

A dictionary that maps location codes to integers. Needed because parameter arrays have integer ``geo`` fields.

File data is stored in ``geomapping.pickle``.

This dictionary does not support setting items directly; instead, use the ``add`` method to add multiple keys.

<a id="bw2data.meta.GeoMapping.filename"></a>

#### filename

<a id="bw2data.meta.GeoMapping.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="bw2data.meta.GeoMapping.add"></a>

#### add

```python
def add(keys)
```

Add a set of keys. These keys can already be in the mapping; only new keys will be added.

**Arguments**:

  * *keys* (list): The keys to add.

<a id="bw2data.meta.GeoMapping.delete"></a>

#### delete

```python
def delete(keys)
```

Delete a set of keys.

**Arguments**:

- `*keys*` _list_ - The keys to delete.

<a id="bw2data.meta.GeoMapping.__setitem__"></a>

#### \_\_setitem\_\_

```python
def __setitem__(key, value)
```

<a id="bw2data.meta.GeoMapping.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```

<a id="bw2data.meta.GeoMapping.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```

<a id="bw2data.meta.Databases"></a>

## Databases Objects

```python
class Databases(SerializedDict)
```

A dictionary for database metadata. This class includes methods to manage database versions. File data is saved in ``databases.json``.

<a id="bw2data.meta.Databases.filename"></a>

#### filename

<a id="bw2data.meta.Databases.increment_version"></a>

#### increment\_version

```python
def increment_version(database, number=None)
```

Increment the ``database`` version. Returns the new version.

<a id="bw2data.meta.Databases.version"></a>

#### version

```python
def version(database)
```

Return the ``database`` version

<a id="bw2data.meta.Databases.set_modified"></a>

#### set\_modified

```python
def set_modified(database)
```

<a id="bw2data.meta.Databases.set_dirty"></a>

#### set\_dirty

```python
def set_dirty(database)
```

<a id="bw2data.meta.Databases.clean"></a>

#### clean

```python
def clean()
```

<a id="bw2data.meta.Databases.__delitem__"></a>

#### \_\_delitem\_\_

```python
def __delitem__(name: str, signal: bool = True)
```

<a id="bw2data.meta.CalculationSetups"></a>

## CalculationSetups Objects

```python
class CalculationSetups(PickledDict)
```

A dictionary for calculation setups.

Keys:
* `inv`: List of functional units, e.g. ``[{(key): amount}, {(key): amount}]``
* `ia`: List of LCIA methods, e.g. ``[(method), (method)]``.

<a id="bw2data.meta.CalculationSetups.filename"></a>

#### filename

<a id="bw2data.meta.DynamicCalculationSetups"></a>

## DynamicCalculationSetups Objects

```python
class DynamicCalculationSetups(PickledDict)
```

A dictionary for Dynamic calculation setups.

Keys:
* `inv`: List of functional units, e.g. ``[{(key): amount}, {(key): amount}]``
* `ia`: Dictionary of orst case LCIA method and the relative dynamic LCIA method, e.g. `` [{dLCIA_method_1_worstcase:dLCIA_method_1 , dLCIA_method_2_worstcase:dLCIA_method_2}]``.

<a id="bw2data.meta.DynamicCalculationSetups.filename"></a>

#### filename

<a id="bw2data.meta.Methods"></a>

## Methods Objects

```python
class Methods(CompoundJSONDict)
```

A dictionary for method metadata. File data is saved in ``methods.json``.

<a id="bw2data.meta.Methods.filename"></a>

#### filename

<a id="bw2data.meta.WeightingMeta"></a>

## WeightingMeta Objects

```python
class WeightingMeta(Methods)
```

A dictionary for weighting metadata. File data is saved in ``methods.json``.

<a id="bw2data.meta.WeightingMeta.filename"></a>

#### filename

<a id="bw2data.meta.NormalizationMeta"></a>

## NormalizationMeta Objects

```python
class NormalizationMeta(Methods)
```

A dictionary for normalization metadata. File data is saved in ``methods.json``.

<a id="bw2data.meta.NormalizationMeta.filename"></a>

#### filename

<a id="bw2data.meta.Preferences"></a>

## Preferences Objects

```python
class Preferences(PickledDict)
```

A dictionary of project-specific preferences.

<a id="bw2data.meta.Preferences.filename"></a>

#### filename

<a id="bw2data.meta.Preferences.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="bw2data.meta.databases"></a>

#### databases

<a id="bw2data.meta.geomapping"></a>

#### geomapping

<a id="bw2data.meta.methods"></a>

#### methods

<a id="bw2data.meta.normalizations"></a>

#### normalizations

<a id="bw2data.meta.preferences"></a>

#### preferences

<a id="bw2data.meta.weightings"></a>

#### weightings

<a id="bw2data.meta.calculation_setups"></a>

#### calculation\_setups

<a id="bw2data.meta.dynamic_calculation_setups"></a>

#### dynamic\_calculation\_setups
