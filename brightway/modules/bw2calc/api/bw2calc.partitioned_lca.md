**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.partitioned_lca` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2calc.partitioned_lca cfg.yml > bw2calc.partitioned_lca.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.partitioned_lca"></a>

# bw2calc.partitioned\_lca

<a id="bw2calc.partitioned_lca.PartitionedMonteCarloLCA"></a>

## PartitionedMonteCarloLCA Objects

```python
class PartitionedMonteCarloLCA(Iterator)
```

Monte Carlo LCA that pre-solves a static background system once.

Splits the full system into a static (background) part and a stochastic (foreground) part.
The static system is solved deterministically for each product demanded across the
static/stochastic boundary (interface products), producing aggregated biosphere vectors.
These are stored in an in-memory dynamic datapackage that is combined with the stochastic
packages for each Monte Carlo iteration.

This avoids rebuilding and solving the (typically large) background matrix on every
iteration — only the foreground matrix is resampled.

Parameters
----------
demand : dict
    Functional unit: ``{activity_or_product_id: amount}``. Must be in the stochastic system.
static_databases : list[str]
    Names of databases to treat as static (e.g. ``["biosphere3", "ecoinvent 3.10"]``).
data_objs : list
    All datapackages: stochastic LCI + static LCI + LCIA method. Packages for databases
    listed in ``static_databases`` are identified by their ``metadata["name"]`` field, which
    must equal ``bw_processing.clean_datapackage_name(database_name)``.
seed_override : int, optional
    RNG seed passed to the inner stochastic LCA.

Notes
-----
All LCI datapackages must contain a ``database_dependencies`` key in their metadata,
which is written by ``bw2data >= 4.7``.

Design note: composition vs. subclassing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This class uses **composition**: it builds an internal ``._lca`` instance from the
stochastic packages plus the pre-solved dynamic datapackage, and delegates properties
to it.  An alternative would be to subclass ``LCA`` and override ``load_lci_data()``
to perform the same partitioning — classify packages, pre-solve the static system,
inject the dynamic datapackage, replace ``self.packages``, then call
``super().load_lci_data()``.  That approach would give full inheritance of all current
and future ``LCA`` attributes without explicit delegation.

The reason composition was chosen instead:

* **Package list mutation.** The override would need to replace ``self.packages``
  (set from ``data_objs`` in ``__init__``) with the filtered stochastic+dynamic list
  mid-lifecycle, which is non-obvious and makes ``self.packages`` inconsistent with
  ``self.data_objs``.
* **Matrix semantics.**  Whether composed or subclassed, ``technosphere_matrix`` is
  the *reduced* aggregated-proxy matrix, not the full combined static+stochastic
  system.  Subclassing makes this less visible rather than resolving it.

<a id="bw2calc.partitioned_lca.PartitionedMonteCarloLCA.__init__"></a>

#### \_\_init\_\_

```python
def __init__(demand: dict[int, float],
             static_databases: list,
             data_objs: list,
             seed_override: Optional[int] = None)
```

<a id="bw2calc.partitioned_lca.PartitionedMonteCarloLCA.lci"></a>

#### lci

```python
def lci() -> None
```

Pre-solve the static system, build the dynamic datapackage, and run the first LCI.

<a id="bw2calc.partitioned_lca.PartitionedMonteCarloLCA.lcia"></a>

#### lcia

```python
def lcia() -> None
```

<a id="bw2calc.partitioned_lca.PartitionedMonteCarloLCA.keep_first_iteration"></a>

#### keep\_first\_iteration

```python
def keep_first_iteration() -> None
```

<a id="bw2calc.partitioned_lca.PartitionedMonteCarloLCA.__next__"></a>

#### \_\_next\_\_

```python
def __next__() -> None
```

<a id="bw2calc.partitioned_lca.PartitionedMonteCarloLCA.score"></a>

#### score

```python
@property
def score() -> float
```

<a id="bw2calc.partitioned_lca.PartitionedMonteCarloLCA.inventory"></a>

#### inventory

```python
@property
def inventory()
```

<a id="bw2calc.partitioned_lca.PartitionedMonteCarloLCA.supply_array"></a>

#### supply\_array

```python
@property
def supply_array()
```

<a id="bw2calc.partitioned_lca.PartitionedMonteCarloLCA.characterized_inventory"></a>

#### characterized\_inventory

```python
@property
def characterized_inventory()
```

<a id="bw2calc.partitioned_lca.PartitionedMonteCarloLCA.dicts"></a>

#### dicts

```python
@property
def dicts()
```

<a id="bw2calc.partitioned_lca.PartitionedMonteCarloLCA.technosphere_matrix"></a>

#### technosphere\_matrix

```python
@property
def technosphere_matrix()
```

<a id="bw2calc.partitioned_lca.PartitionedMonteCarloLCA.biosphere_matrix"></a>

#### biosphere\_matrix

```python
@property
def biosphere_matrix()
```

<a id="bw2calc.partitioned_lca.PartitionedMonteCarloLCA.characterization_matrix"></a>

#### characterization\_matrix

```python
@property
def characterization_matrix()
```
