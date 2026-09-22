**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.strategies.biosphere` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.strategies.biosphere cfg.yml > bw2io.strategies.biosphere.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.strategies.biosphere"></a>

# bw2io.strategies.biosphere

<a id="bw2io.strategies.biosphere.drop_unspecified_subcategories"></a>

#### drop\_unspecified\_subcategories

```python
def drop_unspecified_subcategories(db)
```

Drop subcategories if they are in the following:
* ``unspecified``
* ``(unspecified)``
* ``''`` (empty string)
* ``None``

Parameters
----------
db : list
    A list of datasets, each containing exchanges.

Returns
----------
list
    A modified list of datasets with unspecified subcategories removed.

Examples
----------
>>> db = [{"categories": ["A", "unspecified"]},
            {"exchanges": [{"categories": ["B", ""]}]},
            {"categories": ["C", None]}]
>>> new_db = drop_unspecified_subcategories(db)
>>> new_db
[{"categories": ["A"]}, {"exchanges": [{"categories": ["B"]}]}, {"categories": ["C"]}]

<a id="bw2io.strategies.biosphere.normalize_biosphere_names"></a>

#### normalize\_biosphere\_names

```python
def normalize_biosphere_names(db, lcia=False)
```

Normalize biosphere flow names to ecoinvent 3.1 standard in the given database.

Assumes that each dataset and each exchange have a ``name``. Will change names even if exchange is already linked.

Parameters
----------
db : list
    A list of datasets, each containing exchanges.
lcia : bool, optional
    If True, only normalize biosphere flow names in LCIA datasets. Default is False.

Returns
----------
list
    A modified list of datasets with normalized biosphere flow names.

Examples
----------
>>> db = [{"name": "old_biosphere_name"}]
>>> new_db = normalize_biosphere_names(db)
>>> new_db
[{"name": "new_biosphere_name"}]

<a id="bw2io.strategies.biosphere.normalize_biosphere_categories"></a>

#### normalize\_biosphere\_categories

```python
def normalize_biosphere_categories(db, lcia=False)
```

Normalize biosphere categories to ecoinvent 3.1 standard in the given database.

Parameters
----------
db : list
    A list of datasets, each containing exchanges.
lcia : bool, optional
    If True, only normalize biosphere categories in LCIA datasets. Defaults to False.

Returns
-------
list
    A modified list of datasets with normalized biosphere categories.

Examples
--------
>>> db = [{"categories": ["old_biosphere_category"]}]
>>> new_db = normalize_biosphere_categories(db)
>>> new_db
[{"categories": ["new_biosphere_category"]}]

<a id="bw2io.strategies.biosphere.strip_biosphere_exc_locations"></a>

#### strip\_biosphere\_exc\_locations

```python
def strip_biosphere_exc_locations(db)
```

Remove locations from biosphere exchanges in the given database, as biosphere exchanges are not geographically specific.

Parameters
-------
db : list
    A list of datasets, each containing exchanges.

Returns
-------
list
    A modified list of datasets with locations removed from biosphere exchanges.

Examples
--------
>>> db = [{"exchanges": [{"type": "biosphere", "location": "GLO"}]}]
>>> new_db = strip_biosphere_exc_locations(db)
>>> new_db
[{"exchanges": [{"type": "biosphere"}]}]

<a id="bw2io.strategies.biosphere.ensure_categories_are_tuples"></a>

#### ensure\_categories\_are\_tuples

```python
def ensure_categories_are_tuples(db)
```

Convert dataset categories to tuples in the given database, if they are not already tuples.

Parameters
----------
db : list
    A list of datasets, each containing exchanges.

Returns
-------
    A modified list of datasets with categories as tuples.

Examples
--------
>>> db = [{"categories": ["A", "B"]}, {"categories": ("C", "D")}]
>>> new_db = ensure_categories_are_tuples(db)
>>> new_db
[{"categories": ("A", "B")}, {"categories": ("C", "D")}]
