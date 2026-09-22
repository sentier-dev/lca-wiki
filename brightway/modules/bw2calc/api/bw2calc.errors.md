**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.errors` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2calc.errors cfg.yml > bw2calc.errors.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.errors"></a>

# bw2calc.errors

<a id="bw2calc.errors.BW2CalcError"></a>

## BW2CalcError Objects

```python
class BW2CalcError(Exception)
```

Base class for bw2calc errors

<a id="bw2calc.errors.OutsideTechnosphere"></a>

## OutsideTechnosphere Objects

```python
class OutsideTechnosphere(BW2CalcError)
```

The given demand array activity is not in the technosphere matrix

<a id="bw2calc.errors.EfficiencyWarning"></a>

## EfficiencyWarning Objects

```python
class EfficiencyWarning(RuntimeWarning)
```

Least squares is much less efficient than direct computation for square, full-rank
matrices

<a id="bw2calc.errors.NoSolutionFound"></a>

## NoSolutionFound Objects

```python
class NoSolutionFound(UserWarning)
```

No solution to set of linear equations found within given constraints

<a id="bw2calc.errors.NonsquareTechnosphere"></a>

## NonsquareTechnosphere Objects

```python
class NonsquareTechnosphere(BW2CalcError)
```

The given data do not form a square technosphere matrix

<a id="bw2calc.errors.MalformedFunctionalUnit"></a>

## MalformedFunctionalUnit Objects

```python
class MalformedFunctionalUnit(BW2CalcError)
```

The given functional unit cannot be understood

<a id="bw2calc.errors.EmptyBiosphere"></a>

## EmptyBiosphere Objects

```python
class EmptyBiosphere(BW2CalcError)
```

Can't do impact assessment with no biosphere flows

<a id="bw2calc.errors.AllArraysEmpty"></a>

## AllArraysEmpty Objects

```python
class AllArraysEmpty(BW2CalcError)
```

Can't load the numpy arrays if all of them are empty

<a id="bw2calc.errors.NoArrays"></a>

## NoArrays Objects

```python
class NoArrays(BW2CalcError)
```

No arrays for given matrix

<a id="bw2calc.errors.InconsistentGlobalIndex"></a>

## InconsistentGlobalIndex Objects

```python
class InconsistentGlobalIndex(BW2CalcError)
```

LCIA matrices are diagonal, and use the ``col`` field for regionalization. If multiple LCIA
datapackages are present, they must use the same value for ``GLO``, the global location, in
order for filtering for site-generic LCIA to work correctly.

<a id="bw2calc.errors.MultipleValues"></a>

## MultipleValues Objects

```python
class MultipleValues(BW2CalcError)
```

Multiple values are present, but only one value is expected

<a id="bw2calc.errors.InconsistentLCIA"></a>

## InconsistentLCIA Objects

```python
class InconsistentLCIA(BW2CalcError)
```

Provided weighting or normalization doesn't fit the impact category

<a id="bw2calc.errors.MissingDatabaseDependencies"></a>

## MissingDatabaseDependencies Objects

```python
class MissingDatabaseDependencies(BW2CalcError)
```

A datapackage is missing the 'database_dependencies' metadata field required for
partitioned Monte Carlo. Reprocess the database with bw2data >= 4.7.

<a id="bw2calc.errors.CyclicDependencyGraph"></a>

## CyclicDependencyGraph Objects

```python
class CyclicDependencyGraph(BW2CalcError)
```

The database dependency graph contains a cycle, making partitioned Monte Carlo impossible

<a id="bw2calc.errors.StaticDependsOnStochastic"></a>

## StaticDependsOnStochastic Objects

```python
class StaticDependsOnStochastic(BW2CalcError)
```

A database marked as static has a dependency on a database marked as stochastic.
Static databases must only depend on other static databases.

<a id="bw2calc.errors.DemandInStaticDatabase"></a>

## DemandInStaticDatabase Objects

```python
class DemandInStaticDatabase(BW2CalcError)
```

The functional unit demand points to an activity in a static database.
The demand must be in the stochastic (foreground) system.
