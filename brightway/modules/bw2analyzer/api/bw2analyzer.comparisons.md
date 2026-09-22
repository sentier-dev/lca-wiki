**Generated API reference** · package `bw2analyzer` 0.11.8 · module `bw2analyzer.comparisons` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2analyzer==0.11.8'
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
  -I "$SP" -m bw2analyzer.comparisons cfg.yml > bw2analyzer.comparisons.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2analyzer.comparisons"></a>

# bw2analyzer.comparisons

<a id="bw2analyzer.comparisons.aggregated_dict"></a>

#### aggregated\_dict

```python
def aggregated_dict(activity)
```

Return dictionary of inputs aggregated by input reference product.

<a id="bw2analyzer.comparisons.compare_dictionaries"></a>

#### compare\_dictionaries

```python
def compare_dictionaries(one, two, rel_tol=1e-4, abs_tol=1e-9)
```

Compare two dictionaries with form ``{str: float}``, and return a set of keys where differences where present.

Tolerance values are inputs to `math.isclose <https://docs.python.org/3/library/math.html#math.isclose>`__.

<a id="bw2analyzer.comparisons.find_differences_in_inputs"></a>

#### find\_differences\_in\_inputs

```python
def find_differences_in_inputs(activity,
                               rel_tol=1e-4,
                               abs_tol=1e-9,
                               locations=None,
                               as_dataframe=False)
```

Given an ``Activity``, try to see if other activities in the same database (with the same name and
reference product) have the same input levels.

Tolerance values are inputs to `math.isclose <https://docs.python.org/3/library/math.html#math.isclose>`__.

If differences are present, a difference dictionary is constructed, with the form:

.. code-block:: python

{Activity instance: [(name of input flow (str), amount)]}

Note that this doesn't reference a specific exchange, but rather sums **all exchanges with the same input reference product**.

Assumes that all similar activities produce the same amount of reference product.

``(x, y)``, where ``x`` is the number of similar activities, and ``y`` is a dictionary of the differences. This dictionary is empty if no differences are found.

**Arguments**:

- `activity` - ``Activity``. Activity to analyze.
- `rel_tol` - float. Relative tolerance to decide if two inputs are the same. See above.
- `abs_tol` - float. Absolute tolerance to decide if two inputs are the same. See above.
- `locations` - list, optional. Locations to restrict comparison to, if present.
- `as_dataframe` - bool. Return results as pandas DataFrame.
  

**Returns**:

  dict or ``pandas.DataFrame``.

<a id="bw2analyzer.comparisons.compare_activities_by_lcia_score"></a>

#### compare\_activities\_by\_lcia\_score

```python
def compare_activities_by_lcia_score(activities, lcia_method, band=0.1)
```

Compare selected activities to see if they are substantially different.

Substantially different means that all LCIA scores lie within a band of ``band * max_lcia_score``.

Inputs:

``activities``: List of ``Activity`` objects.
``lcia_method``: Tuple identifying a ``Method``

**Returns**:

  
  Nothing, but prints to stdout.

<a id="bw2analyzer.comparisons.find_leaves"></a>

#### find\_leaves

```python
def find_leaves(activity,
                lcia_method,
                results=None,
                lca_obj=None,
                amount=1,
                total_score=None,
                level=0,
                max_level=3,
                cutoff=2.5e-2)
```

Traverse the supply chain of an activity to find leaves - places where the impact of that
component falls below a threshold value.

Returns a list of ``(impact of this activity, amount consumed, Activity instance)`` tuples.

<a id="bw2analyzer.comparisons.get_cpc"></a>

#### get\_cpc

```python
def get_cpc(activity)
```

<a id="bw2analyzer.comparisons.get_value_for_cpc"></a>

#### get\_value\_for\_cpc

```python
def get_value_for_cpc(lst, label)
```

<a id="bw2analyzer.comparisons.group_leaves"></a>

#### group\_leaves

```python
def group_leaves(leaves)
```

Group elements in ``leaves`` by their `CPC (Central Product Classification) <https://unstats.un.org/unsd/classifications/Econ/cpc>`__ code.

Returns a list of ``(fraction of total impact, specific impact, amount, Activity instance)`` tuples.

<a id="bw2analyzer.comparisons.compare_activities_by_grouped_leaves"></a>

#### compare\_activities\_by\_grouped\_leaves

```python
def compare_activities_by_grouped_leaves(activities,
                                         lcia_method,
                                         mode="relative",
                                         max_level=4,
                                         cutoff=7.5e-3,
                                         output_format="list",
                                         str_length=50)
```

Compare activities by the impact of their different inputs, aggregated by the product classification of those inputs.

**Arguments**:

- `activities` - list of ``Activity`` instances.
- `lcia_method` - tuple. LCIA method to use when traversing supply chain graph.
- `mode` - str. If "relative" (default), results are returned as a fraction of total input. Otherwise, results are absolute impact per input exchange.
- `max_level` - int. Maximum level in supply chain to examine.
- `cutoff` - float. Fraction of total impact to cutoff supply chain graph traversal at.
- `output_format` - str. See below.
  str_length; int. If ``output_format`` is ``html``, this controls how many characters each column label can have.
  

**Raises**:

- `ValueError` - ``activities`` is malformed.
  

**Returns**:

  Depends on ``output_format``:
  
  * ``list``: Tuple of ``(column labels, data)``
  * ``html``: HTML string that will print nicely in Jupyter notebooks.
  * ``pandas``: a pandas ``DataFrame``.
