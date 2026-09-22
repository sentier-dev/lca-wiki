**Generated API reference** · package `pypardiso` 0.4.7 · module `pypardiso.pardiso_wrapper` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'pypardiso==0.4.7'
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
  -I "$SP" -m pypardiso.pardiso_wrapper cfg.yml > pypardiso.pardiso_wrapper.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="pypardiso.pardiso_wrapper"></a>

# pypardiso.pardiso\_wrapper

<a id="pypardiso.pardiso_wrapper.PyPardisoSolver"></a>

## PyPardisoSolver Objects

```python
class PyPardisoSolver()
```

Python interface to the Intel MKL PARDISO library for solving large sparse linear systems of equations Ax=b.

Pardiso documentation: https://software.intel.com/en-us/node/470282

--- Basic usage ---
matrix type: real (float64) and nonsymetric
methods: solve, factorize

- use the "solve(A,b)" method to solve Ax=b for x, where A is a sparse CSR (or CSC) matrix and b is a numpy array
- use the "factorize(A)" method first, if you intend to solve the system more than once for different right-hand
  sides, the factorization will be reused automatically afterwards


--- Advanced usage ---
methods: get_iparm, get_iparms, set_iparm, set_matrix_type, set_phase

- additional options can be accessed by setting the iparms (see Pardiso documentation for description)
- other matrix types can be chosen with the "set_matrix_type" method. complex matrix types are currently not
  supported. pypardiso is only teste for mtype=11 (real and nonsymetric)
- the solving phases can be set with the "set_phase" method
- The out-of-core (OOC) solver either fails or crashes my computer, be careful with iparm[60]


--- Statistical info ---
methods: set_statistical_info_on, set_statistical_info_off

- the Pardiso solver writes statistical info to the C stdout if desired
- if you use pypardiso from within a jupyter notebook you can turn the statistical info on and capture the output
  real-time by wrapping your call to "solve" with wurlitzer.sys_pipes() (https://github.com/minrk/wurlitzer,
  https://pypi.python.org/pypi/wurlitzer/)
- wurlitzer dosen't work on windows, info appears in notebook server console window if used from jupyter notebook


--- Memory usage ---
methods: remove_stored_factorization, free_memory

- remove_stored_factorization can be used to delete the wrapper's copy of matrix A
- free_memory releases the internal memory of the solver

<a id="pypardiso.pardiso_wrapper.PyPardisoSolver.__init__"></a>

#### \_\_init\_\_

```python
def __init__(mtype=11, phase=13, size_limit_storage=5e7)
```

<a id="pypardiso.pardiso_wrapper.PyPardisoSolver.factorize"></a>

#### factorize

```python
def factorize(A)
```

Factorize the matrix A, the factorization will automatically be used if the same matrix A is passed to the
solve method. This will drastically increase the speed of solve, if solve is called more than once for the
same matrix A

--- Parameters ---
A: sparse square CSR matrix (scipy.sparse.csr.csr_matrix), CSC matrix also possible

<a id="pypardiso.pardiso_wrapper.PyPardisoSolver.solve"></a>

#### solve

```python
def solve(A, b)
```

solve Ax=b for x

--- Parameters ---
A: sparse square CSR matrix (scipy.sparse.csr.csr_matrix), CSC matrix also possible
b: numpy ndarray
   right-hand side(s), b.shape[0] needs to be the same as A.shape[0]

--- Returns ---
x: numpy ndarray
   solution of the system of linear equations, same shape as input b

<a id="pypardiso.pardiso_wrapper.PyPardisoSolver.get_iparms"></a>

#### get\_iparms

```python
def get_iparms()
```

Returns a dictionary of iparms

<a id="pypardiso.pardiso_wrapper.PyPardisoSolver.get_iparm"></a>

#### get\_iparm

```python
def get_iparm(i)
```

Returns the i-th iparm (1-based indexing)

<a id="pypardiso.pardiso_wrapper.PyPardisoSolver.set_iparm"></a>

#### set\_iparm

```python
def set_iparm(i, value)
```

set the i-th iparm to 'value' (1-based indexing)

<a id="pypardiso.pardiso_wrapper.PyPardisoSolver.set_matrix_type"></a>

#### set\_matrix\_type

```python
def set_matrix_type(mtype)
```

Set the matrix type (see Pardiso documentation)

<a id="pypardiso.pardiso_wrapper.PyPardisoSolver.set_statistical_info_on"></a>

#### set\_statistical\_info\_on

```python
def set_statistical_info_on()
```

Display statistical info (appears in notebook server console window if pypardiso is
used from jupyter notebook, use wurlitzer to redirect info to the notebook)

<a id="pypardiso.pardiso_wrapper.PyPardisoSolver.set_statistical_info_off"></a>

#### set\_statistical\_info\_off

```python
def set_statistical_info_off()
```

Turns statistical info off

<a id="pypardiso.pardiso_wrapper.PyPardisoSolver.set_phase"></a>

#### set\_phase

```python
def set_phase(phase)
```

Set the phase(s) for the solver. See the Pardiso documentation for details.

<a id="pypardiso.pardiso_wrapper.PyPardisoSolver.remove_stored_factorization"></a>

#### remove\_stored\_factorization

```python
def remove_stored_factorization()
```

removes the stored factorization, this will free the memory in python, but the factorization in pardiso
is still accessible with a direct call to self._call_pardiso(A,b) with phase=33

<a id="pypardiso.pardiso_wrapper.PyPardisoSolver.free_memory"></a>

#### free\_memory

```python
def free_memory(everything=False)
```

release mkl's internal memory, either only for the factorization (ie the LU-decomposition) or all of
mkl's internal memory if everything=True

<a id="pypardiso.pardiso_wrapper.PyPardisoWarning"></a>

## PyPardisoWarning Objects

```python
class PyPardisoWarning(UserWarning)
```

<a id="pypardiso.pardiso_wrapper.PyPardisoError"></a>

## PyPardisoError Objects

```python
class PyPardisoError(Exception)
```

<a id="pypardiso.pardiso_wrapper.PyPardisoError.__init__"></a>

#### \_\_init\_\_

```python
def __init__(value)
```

<a id="pypardiso.pardiso_wrapper.PyPardisoError.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```
