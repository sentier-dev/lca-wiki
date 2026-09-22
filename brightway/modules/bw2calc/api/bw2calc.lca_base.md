**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.lca_base` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2calc.lca_base cfg.yml > bw2calc.lca_base.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.lca_base"></a>

# bw2calc.lca\_base

<a id="bw2calc.lca_base.LCABase"></a>

## LCABase Objects

```python
class LCABase(Iterator)
```

Base class for single and multi LCA classes

<a id="bw2calc.lca_base.LCABase.keep_first_iteration"></a>

#### keep\_first\_iteration

```python
def keep_first_iteration()
```

Set a flag to use the current values as first element when
iterating.

When creating the class instance, we already use the first index. This
method allows us to use the values for the first index.

Note that the methods ``.lci_calculation()`` and
``.lcia_calculation()`` will be called on the current values, even if
these calculations have already been done.

<a id="bw2calc.lca_base.LCABase.check_selective_use"></a>

#### check\_selective\_use

```python
def check_selective_use(matrix_label: str) -> Tuple[bool, bool]
```

<a id="bw2calc.lca_base.LCABase.load_lci_data"></a>

#### load\_lci\_data

```python
def load_lci_data(nonsquare_ok=False) -> None
```

Load inventory data and create technosphere and biosphere matrices.

<a id="bw2calc.lca_base.LCABase.remap_inventory_dicts"></a>

#### remap\_inventory\_dicts

```python
def remap_inventory_dicts() -> None
```

Remap ``self.dicts.activity|product|biosphere`` and ``self.demand``
from database integer IDs to keys (``(database name, code)``).

Uses remapping dictionaries in ``self.remapping_dicts``.

<a id="bw2calc.lca_base.LCABase.decompose_technosphere"></a>

#### decompose\_technosphere

```python
def decompose_technosphere() -> None
```

Factorize the technosphere matrix into lower and upper triangular
matrices, :math:`A=LU`. Does not solve the linear system :math:`Ax=B`.

Doesn't return anything, but creates ``self.solver``.

.. warning:: Incorrect results could occur if a technosphere matrix was
factorized, and then a new technosphere matrix was constructed, as
``self.solver`` would still be the factorized older technosphere
matrix. You are responsible for deleting ``self.solver`` when doing
these types of advanced calculations.

<a id="bw2calc.lca_base.LCABase.solve_linear_system"></a>

#### solve\_linear\_system

```python
def solve_linear_system(demand: Optional[np.ndarray] = None) -> None
```

Master solution function for linear system :math:`Ax=B`.

    To most numerical analysts, matrix inversion is a sin.

    -- Nicolas Higham, Accuracy and Stability of Numerical Algorithms,
    Society for Industrial and Applied Mathematics, Philadelphia, PA,
    USA, 2002, p. 260.

We use `pypardiso <https://github.com/haasad/PyPardisoProject>`_ or
`UMFpack <http://www.cise.ufl.edu/research/sparse/umfpack/>`_, which is
a very fast solver for sparse matrices.

If the technosphere matrix has already been factorized, then the
decomposed technosphere (``self.solver``) is reused. Otherwise the
calculation is redone completely.

<a id="bw2calc.lca_base.LCABase.lci"></a>

#### lci

```python
def lci(demand: Optional[dict] = None, factorize: bool = False) -> None
```

Calculate a life cycle inventory.

#. Load LCI data, and construct the technosphere and biosphere
matrices.
#. Build the demand array
#. Solve the linear system to get the supply array and life cycle
inventory.

**Arguments**:

  * *factorize* (bool, optional): Factorize the technosphere matrix.
  Makes additional calculations with the same technosphere matrix
  much faster. Default is ``False``; not useful is only doing one LCI
  calculation.
  * *builder* (``MatrixBuilder`` object, optional): Default is
  ``bw2calc.matrices.MatrixBuilder``, which is fine for most cases.
  Custom matrix builders can be used to manipulate data in creative
  ways before building the matrices.
  
  Doesn't return anything, but creates ``self.supply_array`` and
  ``self.inventory``.

<a id="bw2calc.lca_base.LCABase.lcia"></a>

#### lcia

```python
def lcia(demand: Optional[dict] = None) -> None
```

Calculate the life cycle impact assessment.

#. Load and construct the characterization matrix
#. Multiply the characterization matrix by the life cycle inventory

Doesn't return anything, but creates ``self.characterized_inventory``.

<a id="bw2calc.lca_base.LCABase.normalize"></a>

#### normalize

```python
def normalize() -> None
```

Multiply characterized inventory by flow-specific normalization factors.

<a id="bw2calc.lca_base.LCABase.weight"></a>

#### weight

```python
def weight() -> None
```

Multiply characterized inventory by weighting value.

Can be done with or without normalization.

<a id="bw2calc.lca_base.LCABase.invert_technosphere_matrix"></a>

#### invert\_technosphere\_matrix

```python
def invert_technosphere_matrix()
```

Use one-shot approach to efficiently calculate the inverse of the
technosphere matrix by simultaneously solving ``Ax=b`` for all ``b``.

Technosphere matrix inversion is often not the most efficient approach.
See https://github.com/brightway-lca/brightway2-calc/issues/35

See `Intel forum <https://community.intel.com/t5/Intel-oneAPI-Math-Kernel-Library/ How-to-find-inverse-of-a-sparse-matrix-using-pardiso/m-p/1165970#M28249>`__
for a discussion on why we use this approach.

<a id="bw2calc.lca_base.LCABase.has"></a>

#### has

```python
def has(label: str) -> bool
```

Shortcut to find out if matrix data for type ``{label}_matrix`` is
present in the given data objects.

Returns a boolean. Will return ``True`` even if data for a
zero-dimensional matrix is given.

<a id="bw2calc.lca_base.LCABase.activity_dict"></a>

#### activity\_dict

```python
@property
def activity_dict()
```

<a id="bw2calc.lca_base.LCABase.product_dict"></a>

#### product\_dict

```python
@property
def product_dict()
```

<a id="bw2calc.lca_base.LCABase.biosphere_dict"></a>

#### biosphere\_dict

```python
@property
def biosphere_dict()
```

<a id="bw2calc.lca_base.LCABase.reverse_dict"></a>

#### reverse\_dict

```python
def reverse_dict()
```

<a id="bw2calc.lca_base.LCABase.redo_lci"></a>

#### redo\_lci

```python
def redo_lci(demand: Optional[dict] = None) -> None
```

Redo LCI with same databases but different demand.

**Arguments**:

  * *demand* (dict): A demand dictionary.
  
  Doesn't return anything, but overwrites ``self.demand_array``,
  ``self.supply_array``, and ``self.inventory``.
  
  .. warning:: If you want to redo the LCIA as well, use
  ``redo_lcia(demand)`` directly.

<a id="bw2calc.lca_base.LCABase.redo_lcia"></a>

#### redo\_lcia

```python
def redo_lcia(demand: Optional[dict] = None) -> None
```

Redo LCIA, optionally with new demand.

**Arguments**:

  * *demand* (dict, optional): New demand dictionary. Optional,
  defaults to ``self.demand``.
  
  Doesn't return anything, but overwrites
  ``self.characterized_inventory``. If ``demand`` is given, also
  overwrites ``self.demand_array``, ``self.supply_array``, and
  ``self.inventory``.

<a id="bw2calc.lca_base.LCABase.weighting"></a>

#### weighting

```python
def weighting() -> None
```

Backwards compatibility. Switching to verb form consistent with
``.normalize``.
