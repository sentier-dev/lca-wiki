**Generated API reference** · package `bw2data` 4.7 · module `bw2data.method` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.method cfg.yml > bw2data.method.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.method"></a>

# bw2data.method

<a id="bw2data.method.Method"></a>

## Method Objects

```python
class Method(ImpactAssessmentDataStore)
```

A manager for an impact assessment method. This class can register or deregister methods, write intermediate data, process data to parameter arrays, validate, and copy methods.

The Method class never holds intermediate data, but it can load or write intermediate data. The only attribute is *name*, which is the name of the method being managed.

Instantiation does not load any data. If this method is not yet registered in the metadata store, a warning is written to ``stdout``.

Methods are hierarchally structured, and this structure is preserved in the method name. It is a tuple of strings, like ``('ecological scarcity 2006', 'total', 'natural resources')``.

The data schema for IA methods is:

.. code-block:: python

Schema([Any(
[valid_tuple, maybe_uncertainty],         # site-generic
[valid_tuple, maybe_uncertainty, object]  # regionalized
)])

where:
- *valid_tuple* (tuple): A dataset identifier, like ``("biosphere", "CO2")``.
- *maybe_uncertainty* (uncertainty dict or number): Either a number or an uncertainty dictionary.
- *object* (object, optional) is a location identifier, used only for regionalized LCIA.

**Arguments**:

  * *name* (tuple): Name of impact assessment method to manage.

<a id="bw2data.method.Method.validator"></a>

#### validator

<a id="bw2data.method.Method.matrix"></a>

#### matrix

<a id="bw2data.method.Method.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

Iterate over characterization factors and return `Node` instances with CFs and geo ids

<a id="bw2data.method.Method.add_geomappings"></a>

#### add\_geomappings

```python
def add_geomappings(data)
```

<a id="bw2data.method.Method.process_row"></a>

#### process\_row

```python
def process_row(row)
```

Given ``(flow, amount, maybe location)``, return a dictionary for array insertion.

<a id="bw2data.method.Method.write"></a>

#### write

```python
def write(data, process=True)
```

Serialize intermediate data to disk.

Sets the metadata key ``num_cfs`` automatically.

<a id="bw2data.method.Method.process"></a>

#### process

```python
def process(**extra_metadata)
```
