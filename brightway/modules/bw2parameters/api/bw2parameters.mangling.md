**Generated API reference** · package `bw2parameters` 1.1.0 · module `bw2parameters.mangling` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2parameters.mangling cfg.yml > bw2parameters.mangling.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2parameters.mangling"></a>

# bw2parameters.mangling

<a id="bw2parameters.mangling.BUILTINS"></a>

#### BUILTINS

<a id="bw2parameters.mangling.PrefixNameAdder"></a>

## PrefixNameAdder Objects

```python
class PrefixNameAdder(NameFinder)
```

Change name of all symbols by adding a prefix, unless name already in ``context``.

<a id="bw2parameters.mangling.PrefixNameAdder.__init__"></a>

#### \_\_init\_\_

```python
def __init__(prefix, context=None)
```

<a id="bw2parameters.mangling.PrefixNameAdder.generic_visit"></a>

#### generic\_visit

```python
def generic_visit(node)
```

<a id="bw2parameters.mangling.OnlySelected"></a>

## OnlySelected Objects

```python
class OnlySelected(NameFinder)
```

Change name of all symbols already redefined in ``substitutes``.

<a id="bw2parameters.mangling.OnlySelected.__init__"></a>

#### \_\_init\_\_

```python
def __init__(substitutes=None)
```

<a id="bw2parameters.mangling.OnlySelected.generic_visit"></a>

#### generic\_visit

```python
def generic_visit(node)
```

<a id="bw2parameters.mangling.mangle_formula"></a>

#### mangle\_formula

```python
def mangle_formula(string, prefix, context=None)
```

Add ``prefix`` to all variable names in formula ``string``, except those in ``context`` or builtin to Python, ``math``, or ``numpy``.

Uses `asteval <https://newville.github.io/asteval/>`__ and `astunparse <http://astunparse.readthedocs.io/>`__.

Returns the formula as a string.

Example usage:

... code-block:: python

    >>> mangle_formula("log(foo * bar) + 7 / baz", "pre", ['bar'])
    '(log((pre__foo * bar)) + (7 / pre__baz))'

<a id="bw2parameters.mangling.prefix_parameter_dict"></a>

#### prefix\_parameter\_dict

```python
def prefix_parameter_dict(dct, prefix)
```

Add ``prefix`` to each key in ``dct``. Also updates the formulas, if present.

Adds ``original`` to each value in ``dct`` with the original key name.

Returns the new dictionary, and a dictionary of name substitutions like ``{old: new}``

<a id="bw2parameters.mangling.FormulaSubstitutor"></a>

## FormulaSubstitutor Objects

```python
class FormulaSubstitutor(object)
```

Callable class that will substitute symbol names using ``substitutions`` substitution dictionary.

<a id="bw2parameters.mangling.FormulaSubstitutor.__init__"></a>

#### \_\_init\_\_

```python
def __init__(substitutions)
```

<a id="bw2parameters.mangling.FormulaSubstitutor.__call__"></a>

#### \_\_call\_\_

```python
def __call__(formula)
```

<a id="bw2parameters.mangling.substitute_in_formulas"></a>

#### substitute\_in\_formulas

```python
def substitute_in_formulas(dct, substitutions)
```

Substitute symbol names in ``dct`` formulas following ``substitutions``.

Modifies in place. Returns the modified ``dct``.
