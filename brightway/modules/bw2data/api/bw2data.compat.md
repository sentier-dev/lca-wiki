**Generated API reference** · package `bw2data` 4.7 · module `bw2data.compat` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.compat cfg.yml > bw2data.compat.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.compat"></a>

# bw2data.compat

<a id="bw2data.compat.Mapping"></a>

## Mapping Objects

```python
class Mapping()
```

A dictionary that maps object ids, like ``("Ecoinvent 2.2", 42)``, to integers.

Used only for backwards compatibility; preferred method is now to look up the ids of activities directly in the SQlite database.

<a id="bw2data.compat.Mapping.add"></a>

#### add

```python
@deprecated("This method is no longer necessary, and does nothing.")
def add(keys)
```

<a id="bw2data.compat.Mapping.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(key)
```

<a id="bw2data.compat.Mapping.delete"></a>

#### delete

```python
@deprecated("This method is no longer necessary, and does nothing.")
def delete(keys)
```

<a id="bw2data.compat.Mapping.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```

<a id="bw2data.compat.Mapping.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```

<a id="bw2data.compat.unpack"></a>

#### unpack

```python
def unpack(dct) -> str
```

<a id="bw2data.compat.translate_key"></a>

#### translate\_key

```python
def translate_key(key)
```

<a id="bw2data.compat.prepare_lca_inputs"></a>

#### prepare\_lca\_inputs

```python
def prepare_lca_inputs(demand=None,
                       method=None,
                       weighting=None,
                       normalization=None,
                       demands=None,
                       remapping=True,
                       demand_database_last=True)
```

Prepare LCA input arguments in Brightway 2.5 style.

<a id="bw2data.compat.get_database_filepath"></a>

#### get\_database\_filepath

```python
def get_database_filepath(functional_unit)
```

Get filepaths for all databases in supply chain of `functional_unit`

<a id="bw2data.compat.get_multilca_data_objs"></a>

#### get\_multilca\_data\_objs

```python
def get_multilca_data_objs(
        functional_units=Dict[str, dict],
        method_config=Dict[str, Union[list, dict]]) -> List[DatapackageBase]
```

Get all the datapackages needed for a complete MultiLCA calculation.
