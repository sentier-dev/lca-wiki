**Generated API reference** · package `bw2data` 4.7 · module `bw2data.weighting_normalization` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.weighting_normalization cfg.yml > bw2data.weighting_normalization.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.weighting_normalization"></a>

# bw2data.weighting\_normalization

<a id="bw2data.weighting_normalization.Weighting"></a>

## Weighting Objects

```python
class Weighting(ImpactAssessmentDataStore)
```

LCIA weighting data - used to combine or compare different impact categories.

The data schema for weighting is a one-element list:

.. code-block:: python

        Schema(All(
            [uncertainty_dict],
            Length(min=1, max=1)
        ))

<a id="bw2data.weighting_normalization.Weighting.validator"></a>

#### validator

<a id="bw2data.weighting_normalization.Weighting.matrix"></a>

#### matrix

<a id="bw2data.weighting_normalization.Weighting.write"></a>

#### write

```python
def write(data)
```

Because of DataStore assumptions, need a one-element list

<a id="bw2data.weighting_normalization.Weighting.process_row"></a>

#### process\_row

```python
def process_row(row)
```

Return an empty tuple (as ``dtype_fields`` is empty), and the weighting uncertainty dictionary.

<a id="bw2data.weighting_normalization.Normalization"></a>

## Normalization Objects

```python
class Normalization(ImpactAssessmentDataStore)
```

LCIA normalization data - used to transform meaningful units, like mass or damage, into "person-equivalents" or some such thing.

The data schema for IA normalization is:

.. code-block:: python

        Schema([
            [valid_tuple, maybe_uncertainty]
        ])

where:
    * ``valid_tuple`` is a dataset identifier, like ``("biosphere", "CO2")``
    * ``maybe_uncertainty`` is either a number or an uncertainty dictionary

<a id="bw2data.weighting_normalization.Normalization.validator"></a>

#### validator

<a id="bw2data.weighting_normalization.Normalization.matrix"></a>

#### matrix

<a id="bw2data.weighting_normalization.Normalization.process_row"></a>

#### process\_row

```python
def process_row(row)
```

Given ``(flow key, amount)``, return a dictionary for array insertion.
