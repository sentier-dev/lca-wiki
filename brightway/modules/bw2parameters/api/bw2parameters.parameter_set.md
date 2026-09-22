**Generated API reference** · package `bw2parameters` 1.1.0 · module `bw2parameters.parameter_set` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2parameters==1.1.0'
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
  -I "$SP" -m bw2parameters.parameter_set cfg.yml > bw2parameters.parameter_set.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2parameters.parameter_set"></a>

# bw2parameters.parameter\_set

<a id="bw2parameters.parameter_set.MC_ERROR_TEXT"></a>

#### MC\_ERROR\_TEXT

<a id="bw2parameters.parameter_set.ParameterSet"></a>

## ParameterSet Objects

```python
class ParameterSet(object)
```

<a id="bw2parameters.parameter_set.ParameterSet.__init__"></a>

#### \_\_init\_\_

```python
def __init__(params, global_params=None, interpreter=None)
```

<a id="bw2parameters.parameter_set.ParameterSet.get_order"></a>

#### get\_order

```python
def get_order()
```

Get a list of parameter name in an order that they can be safely evaluated

<a id="bw2parameters.parameter_set.ParameterSet.get_references"></a>

#### get\_references

```python
def get_references()
```

Create dictionary of parameter references

<a id="bw2parameters.parameter_set.ParameterSet.basic_validation"></a>

#### basic\_validation

```python
def basic_validation()
```

Basic validation needed to build ``references`` and ``order``

<a id="bw2parameters.parameter_set.ParameterSet.evaluate"></a>

#### evaluate

```python
def evaluate()
```

Evaluate each formula. Returns dictionary of parameter names and values.

<a id="bw2parameters.parameter_set.ParameterSet.evaluate_and_set_amount_field"></a>

#### evaluate\_and\_set\_amount\_field

```python
def evaluate_and_set_amount_field()
```

Evaluate each formula. Updates the ``amount`` field of each parameter.

<a id="bw2parameters.parameter_set.ParameterSet.evaluate_monte_carlo"></a>

#### evaluate\_monte\_carlo

```python
def evaluate_monte_carlo(iterations=1000)
```

Evaluate each formula using Monte Carlo and variable uncertainty data, if present.

Formulas **must** return a one-dimensional array, or ``BroadcastingError`` is raised.

Returns dictionary of ``{parameter name: numpy array}``.

<a id="bw2parameters.parameter_set.ParameterSet.__call__"></a>

#### \_\_call\_\_

```python
def __call__(ds=None)
```

Evaluate each formula, and update ``exchanges`` if they reference a ``parameter`` name.

<a id="bw2parameters.parameter_set.ParameterSet.get_interpreter"></a>

#### get\_interpreter

```python
def get_interpreter(evaluate_first=True)
```

Get an instance of ``asteval.Interpreter`` that is prepopulated with global and local         symbol names and values.

<a id="bw2parameters.parameter_set.PintParameterSet"></a>

## PintParameterSet Objects

```python
class PintParameterSet(ParameterSet)
```

<a id="bw2parameters.parameter_set.PintParameterSet.__init__"></a>

#### \_\_init\_\_

```python
def __init__(params, global_params=None, interpreter=None)
```

<a id="bw2parameters.parameter_set.PintParameterSet.get_references"></a>

#### get\_references

```python
def get_references()
```

Create dictionary of parameter references

<a id="bw2parameters.parameter_set.PintParameterSet.evaluate"></a>

#### evaluate

```python
def evaluate()
```

Evaluate each formula. Returns dictionary of parameter names and values.

<a id="bw2parameters.parameter_set.PintParameterSet.evaluate_and_set_amount_field"></a>

#### evaluate\_and\_set\_amount\_field

```python
def evaluate_and_set_amount_field()
```

Evaluate each formula. Updates the ``amount`` field of each parameter. Also updates the ``unit`` field
if no unit is given.
