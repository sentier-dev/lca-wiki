**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.matrix_entry` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_processing==1.6'
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
  -I "$SP" -m bw_processing.matrix_entry cfg.yml > bw_processing.matrix_entry.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.matrix_entry"></a>

# bw\_processing.matrix\_entry

<a id="bw_processing.matrix_entry.MatrixName"></a>

## MatrixName Objects

```python
class MatrixName(str, Enum)
```

Standard matrix names used in Brightway.

Because this is a ``str`` enum, members can be used anywhere a plain
string is accepted — no ``.value`` needed::

    MatrixEntry(row=1, col=4, amount=2.5)  # inside a dict keyed by MatrixName
    dp.add_entries(matrix=MatrixName.technosphere, entries=[...])

Derived libraries may define additional matrices as plain strings;
these three cover the core Brightway LCA workflow.

<a id="bw_processing.matrix_entry.MatrixName.technosphere"></a>

#### technosphere

<a id="bw_processing.matrix_entry.MatrixName.biosphere"></a>

#### biosphere

<a id="bw_processing.matrix_entry.MatrixName.characterization"></a>

#### characterization

<a id="bw_processing.matrix_entry.MatrixName.__str__"></a>

#### \_\_str\_\_

```python
def __str__() -> str
```

<a id="bw_processing.matrix_entry.MatrixEntry"></a>

## MatrixEntry Objects

```python
@dataclasses.dataclass(frozen=True)
class MatrixEntry()
```

A single entry destined for a matrix cell.

Multiple instances with the same (row, col) are summed during matrix
construction, so this is not necessarily the final cell value.

Field names and defaults match those expected by bw_processing's
``dictionary_formatter``. Convert to a plain dict with ``as_dict()``
before passing to bw_processing internals.

**Arguments**:

- `row` - Integer row index in the target matrix.
- `col` - Integer column index in the target matrix.
- `amount` - The numeric value to place at (row, col).
- `flip` - If True, multiply the value by -1 when building the matrix.
- `uncertainty_type` - Probability distribution type (0 = no uncertainty,
  2 = lognormal, 3 = normal, etc. — see stats_arrays for full list).
- `loc` - Distribution location parameter. For lognormal this is the log
  of the median; defaults to NaN (no uncertainty).
- `scale` - Distribution scale parameter (e.g. standard deviation).
- `shape` - Distribution shape parameter.
- `minimum` - Lower bound for distribution sampling.
- `maximum` - Upper bound for distribution sampling.
- `negative` - Whether the underlying value is negative.
- `rescale` - Per-exchange multiplicative factor applied before matrix
  insertion. ``1.0`` (the default) leaves the value unchanged.
  Stored as a ``rescale_array`` resource (``kind="rescale"``). Note
  that the Python ``float`` value is downcast to ``numpy.float32``
  when written to the structured array.
- `reference` - If True, this exchange is the reference (production) exchange
  for its activity/column. Consumers such as bw_graph_tools use this
  to identify production exchanges directly instead of guessing from
  matrix structure. Stored as a ``reference_array`` resource
  (``kind="reference"``) only when at least one entry is flagged;
  defaults to False.

<a id="bw_processing.matrix_entry.MatrixEntry.row"></a>

#### row

<a id="bw_processing.matrix_entry.MatrixEntry.col"></a>

#### col

<a id="bw_processing.matrix_entry.MatrixEntry.amount"></a>

#### amount

<a id="bw_processing.matrix_entry.MatrixEntry.flip"></a>

#### flip

<a id="bw_processing.matrix_entry.MatrixEntry.uncertainty_type"></a>

#### uncertainty\_type

<a id="bw_processing.matrix_entry.MatrixEntry.loc"></a>

#### loc

<a id="bw_processing.matrix_entry.MatrixEntry.scale"></a>

#### scale

<a id="bw_processing.matrix_entry.MatrixEntry.shape"></a>

#### shape

<a id="bw_processing.matrix_entry.MatrixEntry.minimum"></a>

#### minimum

<a id="bw_processing.matrix_entry.MatrixEntry.maximum"></a>

#### maximum

<a id="bw_processing.matrix_entry.MatrixEntry.negative"></a>

#### negative

<a id="bw_processing.matrix_entry.MatrixEntry.rescale"></a>

#### rescale

<a id="bw_processing.matrix_entry.MatrixEntry.reference"></a>

#### reference

<a id="bw_processing.matrix_entry.MatrixEntry.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__()
```

<a id="bw_processing.matrix_entry.MatrixEntry.as_dict"></a>

#### as\_dict

```python
def as_dict() -> dict
```

<a id="bw_processing.matrix_entry.ArrayEntry"></a>

## ArrayEntry Objects

```python
@dataclasses.dataclass
class ArrayEntry()
```

All index/flip metadata for one persistent-array resource group.

Unlike :class:`MatrixEntry`, which represents a single row, ``ArrayEntry``
holds every row of a resource group together so that the 2-D scenario
``data`` array can be supplied directly without decomposing and
reassembling it.

**Arguments**:

- `rows` - 1-D sequence of integer row indices, one per matrix entry.
- `cols` - 1-D sequence of integer column indices, one per matrix entry.
- `data` - 2-D array of shape ``(n_entries, n_scenarios)``.
- `flip` - Optional 1-D boolean sequence of length ``n_entries``.
- `rescale` - Optional 1-D float array of per-entry multiplicative factors
  (one per row). ``1.0`` leaves the value unchanged. Stored as a
  ``rescale_array`` resource (``kind="rescale"``).
- `reference` - Optional 1-D boolean sequence of length ``n_entries``.
  Where True, that entry is the reference (production) exchange for
  its column. Stored as a ``reference_array`` resource
  (``kind="reference"``) only when at least one entry is flagged.

<a id="bw_processing.matrix_entry.ArrayEntry.rows"></a>

#### rows

<a id="bw_processing.matrix_entry.ArrayEntry.cols"></a>

#### cols

<a id="bw_processing.matrix_entry.ArrayEntry.data"></a>

#### data

<a id="bw_processing.matrix_entry.ArrayEntry.flip"></a>

#### flip

<a id="bw_processing.matrix_entry.ArrayEntry.rescale"></a>

#### rescale

<a id="bw_processing.matrix_entry.ArrayEntry.reference"></a>

#### reference

<a id="bw_processing.matrix_entry.ArrayEntry.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__()
```

<a id="bw_processing.matrix_entry.create_datapackage_from_entries"></a>

#### create\_datapackage\_from\_entries

```python
def create_datapackage_from_entries(data: dict, fs=None, **metadata)
```

Create a datapackage from a dictionary of :class:`MatrixEntry` lists.

This is the recommended high-level entry point for building datapackages
without working directly with NumPy arrays.

**Arguments**:

- `data` - Dictionary mapping matrix names to lists of :class:`MatrixEntry`
  objects. Use :class:`MatrixName` members as keys for the standard
  Brightway matrices; derived libraries may use plain strings for
  additional matrices::
  
  {
- `MatrixName.technosphere` - [
  MatrixEntry(row=1, col=4, amount=2.5),
  MatrixEntry(row=2, col=5, amount=7.0, flip=True),
  ],
- `MatrixName.biosphere` - [
  MatrixEntry(row=10, col=4, amount=0.3),
  ],
  }
  
- `fs` - Optional filesystem. Defaults to an in-memory filesystem.
- `**metadata` - Additional keyword arguments passed to
  :func:`create_datapackage` (e.g. ``name``, ``id_``).
  

**Returns**:

  A :class:`Datapackage` instance.
