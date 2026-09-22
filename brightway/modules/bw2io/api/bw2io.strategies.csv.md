**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.strategies.csv` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2io==0.9.17'
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
  -I "$SP" -m bw2io.strategies.csv cfg.yml > bw2io.strategies.csv.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.strategies.csv"></a>

# bw2io.strategies.csv

<a id="bw2io.strategies.csv.csv_restore_tuples"></a>

#### csv\_restore\_tuples

```python
def csv_restore_tuples(data)
```

Convert tuple-like strings to actual tuples.

Parameters
----------
data : list of dict
    A list of datasets.

Returns
-------
list of dict
    A list of datasets with tuples restored from string.

Examples
--------
>>> data = [{'categories': 'category1::category2'}, {'exchanges': [{'categories': 'category3::category4', 'amount': '10.0'}]}]
>>> csv_restore_tuples(data)
[{'categories': ('category1', 'category2')}, {'exchanges': [{'categories': ('category3', 'category4'), 'amount': '10.0'}]}]

<a id="bw2io.strategies.csv.csv_restore_booleans"></a>

#### csv\_restore\_booleans

```python
def csv_restore_booleans(data)
```

Convert boolean-like strings to booleans where possible.

Parameters
----------
data : list of dict
    A list of datasets.

Returns
-------
list of dict
    A list of datasets with booleans restored.

Examples
--------
>>> data = [{'categories': 'category1', 'is_animal': 'true'}, {'exchanges': [{'categories': 'category2', 'amount': '10.0', 'uncertainty type': 'undefined', 'is_biomass': 'False'}]}]
>>> csv_restore_booleans(data)
[{'categories': 'category1', 'is_animal': True}, {'exchanges': [{'categories': 'category2', 'amount': '10.0', 'uncertainty type': 'undefined', 'is_biomass': False}]}]

<a id="bw2io.strategies.csv.csv_numerize"></a>

#### csv\_numerize

```python
def csv_numerize(data)
```

Convert string values to float or int where possible

Parameters
----------
data : list of dict
    A list of datasets.

Returns
-------
list of dict
    A list of datasets with string values converted to float or int where possible.

Examples
--------
>>> data = [{'amount': '10.0'}, {'exchanges': [{'amount': '20', 'uncertainty type': 'undefined'}]}]
>>> csv_numerize(data)
[{'amount': 10.0}, {'exchanges': [{'amount': 20, 'uncertainty type': 'undefined'}]}]

<a id="bw2io.strategies.csv.csv_drop_unknown"></a>

#### csv\_drop\_unknown

```python
def csv_drop_unknown(data)
```

Remove any keys whose values are `(Unknown)`.

Parameters
----------
data : list[dict]
    A list of dictionaries, where each dictionary represents a row of data.

Returns
-------
list[dict]
    The updated list of dictionaries with `(Unknown)` values removed from the keys.

Examples
--------
>>> data = [
        {"name": "John", "age": 30, "gender": "(Unknown)"},
        {"name": "Alice", "age": 25, "gender": "Female"},
        {"name": "Bob", "age": 40, "gender": "Male"}
    ]
>>> csv_drop_unknown(data)
    [
        {"name": "Alice", "age": 25, "gender": "Female"},
        {"name": "Bob", "age": 40, "gender": "Male"}
    ]

<a id="bw2io.strategies.csv.csv_add_missing_exchanges_section"></a>

#### csv\_add\_missing\_exchanges\_section

```python
def csv_add_missing_exchanges_section(data)
```

Add an empty `exchanges` section to any dictionary in `data` that doesn't already have one.

Parameters
----------
data: list of dict
    A list of dictionaries, where each dictionary represents a row of data.

Returns
-------
list[dict]
    The updated list of dictionaries with an empty `exchanges` section added to any dictionary that doesn't already have one.

Examples
--------
>>> data = [
        {"name": "John", "age": 30},
        {"name": "Alice", "age": 25, "exchanges": []},
        {"name": "Bob", "age": 40, "exchanges": [{"name": "NYSE"}]}
    ]
>>> csv_add_missing_exchanges_section(data)
    [
        {"name": "John", "age": 30, "exchanges": []},
        {"name": "Alice", "age": 25, "exchanges": []},
        {"name": "Bob", "age": 40, "exchanges": [{"name": "NYSE"}]}
    ]

<a id="bw2io.strategies.csv.csv_restore_temporal_distributions"></a>

#### csv\_restore\_temporal\_distributions

```python
def csv_restore_temporal_distributions(data)
```

Reconstruct TemporalDistribution objects from exchange row columns.

Accepts both ``temporal_distribution`` (underscore) and
``temporal distribution`` (space) as the key name; the underscore form
takes precedence when both are present.

Expected exchange fields:

- ``temporal_distribution``: one of ``delta`` / ``relative`` /
  ``timedelta64``, ``abs`` / ``absolute`` / ``datetime64``,
  ``easy_timedelta_distribution`` (aliases: ``easy_timedelta``,
  ``easy_td``), or ``easy_datetime_distribution`` (aliases:
  ``easy_datetime``, ``easy_dt``).
- ``date``: list/tuple or comma-separated string of offsets (delta) or
  formatted date strings (abs).
- ``value``: list/tuple or comma-separated string of floats.  Rescaled to
  sum to 1 if necessary.
- ``resolution``: numpy time-unit code such as ``Y``, ``M``, ``D``,
  ``h``, ``m``, ``s``.  Case is significant for ``m`` (minutes) vs
  ``M`` (months); all other single-letter codes are case-insensitive.
- For ``easy_timedelta_distribution``: also ``start``, ``end``,
  ``steps``, ``resolution``; and optionally ``td_kind``, ``td_param``.
- For ``easy_datetime_distribution``: also ``start``, ``end``, ``steps``.

Raises
------
StrategyError
    On any validation failure (unknown kind, missing fields, bad values,
    mismatched lengths, zero-sum amounts).
StrategyError
    If ``bw_temporalis`` is not installed and a temporal distribution is
    encountered.
