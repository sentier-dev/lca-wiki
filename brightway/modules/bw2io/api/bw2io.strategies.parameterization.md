**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.strategies.parameterization` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.strategies.parameterization cfg.yml > bw2io.strategies.parameterization.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.strategies.parameterization"></a>

# bw2io.strategies.parameterization

<a id="bw2io.strategies.parameterization.RESERVED"></a>

#### RESERVED

<a id="bw2io.strategies.parameterization.ReservedVariableNameSubstitutor"></a>

## ReservedVariableNameSubstitutor Objects

```python
class ReservedVariableNameSubstitutor()
```

A class to substitute reserved variable names in formulas with their uppercase versions.

This class replaces reserved Python keywords, as well as built-in function names,
with their uppercase versions in a given formula string.

Attributes
----------
symbols : set
    A set of reserved Python keywords and built-in function names.
matches : list
    A list of tuples, where each tuple contains a compiled regular expression pattern
    and a substitution string for each reserved symbol.

Examples
--------
>>> variable_substitutor = ReservedVariableNameSubstitutor()
>>> formula = "sum = a + b + max(1, 2)"
>>> variable_substitutor.fix_formula(formula)
'SUM = a + b + MAX(1, 2)'

>>> variable_name = "sum"
>>> variable_substitutor.fix_variable_name(variable_name)
'SUM'

<a id="bw2io.strategies.parameterization.ReservedVariableNameSubstitutor.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="bw2io.strategies.parameterization.ReservedVariableNameSubstitutor.fix_formula"></a>

#### fix\_formula

```python
def fix_formula(string)
```

Substitute reserved variable names in a formula with their uppercase versions.

Parameters
----------
string : str
    The formula containing reserved variable names to be replaced.

Returns
-------
str
    The updated formula with reserved variable names replaced with their uppercase versions.

<a id="bw2io.strategies.parameterization.ReservedVariableNameSubstitutor.fix_variable_name"></a>

#### fix\_variable\_name

```python
def fix_variable_name(string)
```

Substitute a reserved variable name with its uppercase version if necessary.

Parameters
----------
string : str
    The variable name to be checked and possibly replaced.

Returns
-------
str
    The updated variable name, replaced with its uppercase version if it was a reserved variable name.

<a id="bw2io.strategies.parameterization.variable_subtitutor"></a>

#### variable\_subtitutor
