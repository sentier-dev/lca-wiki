**Generated API reference** · package `bw2parameters` 1.1.0 · module `bw2parameters.interpreter` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2parameters.interpreter cfg.yml > bw2parameters.interpreter.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2parameters.interpreter"></a>

# bw2parameters.interpreter

<a id="bw2parameters.interpreter.Interpreter"></a>

## Interpreter Objects

```python
class Interpreter(ASTInterpreter)
```

<a id="bw2parameters.interpreter.Interpreter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="bw2parameters.interpreter.Interpreter.is_numeric"></a>

#### is\_numeric

```python
@classmethod
def is_numeric(cls, value)
```

<a id="bw2parameters.interpreter.Interpreter.get_symbols"></a>

#### get\_symbols

```python
@_raise_missing_name
def get_symbols(text)
```

Parses an expression and returns all symbols.

<a id="bw2parameters.interpreter.Interpreter.get_unknown_symbols"></a>

#### get\_unknown\_symbols

```python
def get_unknown_symbols(text,
                        known_symbols=None,
                        ignore_symtable=False,
                        no_pint_units=None)
```

Parses an expression and returns all symbols which are neither in the symtable nor passed via known_symbols.

<a id="bw2parameters.interpreter.Interpreter.add_symbols"></a>

#### add\_symbols

```python
def add_symbols(symbols)
```

Adds symbols to the symtable.

<a id="bw2parameters.interpreter.Interpreter.remove_symbols"></a>

#### remove\_symbols

```python
def remove_symbols(symbols)
```

Removes symbols from the symtable.

<a id="bw2parameters.interpreter.Interpreter.user_defined_symbols"></a>

#### user\_defined\_symbols

```python
def user_defined_symbols()
```

<a id="bw2parameters.interpreter.Interpreter.eval"></a>

#### eval

```python
@_raise_missing_name
def eval(expr, *args, known_symbols=None, raise_errors=True, **kwargs)
```

<a id="bw2parameters.interpreter.Interpreter.parameter_list_to_dict"></a>

#### parameter\_list\_to\_dict

```python
@classmethod
def parameter_list_to_dict(cls, param_list)
```

<a id="bw2parameters.interpreter.Interpreter.is_quantity"></a>

#### is\_quantity

```python
@classmethod
def is_quantity(cls, value)
```

<a id="bw2parameters.interpreter.Interpreter.is_quantity_from_same_registry"></a>

#### is\_quantity\_from\_same\_registry

```python
@classmethod
def is_quantity_from_same_registry(cls, value)
```

<a id="bw2parameters.interpreter.Interpreter.get_unit_dimensionality"></a>

#### get\_unit\_dimensionality

```python
@classmethod
def get_unit_dimensionality(cls, unit_name=None)
```

<a id="bw2parameters.interpreter.Interpreter.set_amount_and_unit"></a>

#### set\_amount\_and\_unit

```python
@classmethod
def set_amount_and_unit(cls, obj, quantity, to_unit=None)
```

<a id="bw2parameters.interpreter.PintInterpreter"></a>

## PintInterpreter Objects

```python
class PintInterpreter(Interpreter)
```

<a id="bw2parameters.interpreter.PintInterpreter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, units=None, **kwargs)
```

<a id="bw2parameters.interpreter.PintInterpreter.is_numeric"></a>

#### is\_numeric

```python
@classmethod
def is_numeric(cls, value)
```

<a id="bw2parameters.interpreter.PintInterpreter.parse"></a>

#### parse

```python
def parse(text)
```

<a id="bw2parameters.interpreter.PintInterpreter.get_unknown_symbols"></a>

#### get\_unknown\_symbols

```python
def get_unknown_symbols(text,
                        known_symbols=None,
                        ignore_symtable=False,
                        include_pint_units=False,
                        no_pint_units=None)
```

Parses the given expression and returns a list of symbols, which are neither contained in the symtable,
nor in known_symbols, nor can be interpreted as pint units

<a id="bw2parameters.interpreter.PintInterpreter.get_pint_symbols"></a>

#### get\_pint\_symbols

```python
def get_pint_symbols(text, known_symbols=None, ignore_symtable=True)
```

Parses an expression and returns all symbols which can be interpreted as pint units.

<a id="bw2parameters.interpreter.PintInterpreter.is_quantity"></a>

#### is\_quantity

```python
@classmethod
def is_quantity(cls, value)
```

<a id="bw2parameters.interpreter.PintInterpreter.is_quantity_from_same_registry"></a>

#### is\_quantity\_from\_same\_registry

```python
@classmethod
def is_quantity_from_same_registry(cls, value)
```

<a id="bw2parameters.interpreter.PintInterpreter.get_unit_dimensionality"></a>

#### get\_unit\_dimensionality

```python
@classmethod
def get_unit_dimensionality(cls, unit_name=None)
```

<a id="bw2parameters.interpreter.PintInterpreter.add_symbols"></a>

#### add\_symbols

```python
def add_symbols(symbols)
```

Adds symbols to symtable while making sure that pint Quantities are from same registry as self.ureg
(otherwise self.eval will fail).

<a id="bw2parameters.interpreter.PintInterpreter.eval"></a>

#### eval

```python
@_raise_proper_pint_exception
def eval(expr, *args, known_symbols=None, **kwargs)
```

<a id="bw2parameters.interpreter.PintInterpreter.parameter_list_to_dict"></a>

#### parameter\_list\_to\_dict

```python
@classmethod
def parameter_list_to_dict(cls, param_list)
```

Takes a list of parameter objects and returns a dict where keys are the parameter names and values
are the interpreted pint.Quantities (or float where no unit is defined).

<a id="bw2parameters.interpreter.PintInterpreter.set_amount_and_unit"></a>

#### set\_amount\_and\_unit

```python
@classmethod
def set_amount_and_unit(cls, obj, quantity=None, to_unit=None)
```

Takes an arbitrary object and tries to set it's `amount` and `unit` fields. `amount` field is the magnitude of
the pint.Quantity after conversion to `to_unit`.         If no `to_unit` is given, the quantity's own unit will be used. If the input is not a pint.Quantity then
`obj['unit']` will be used. If no quantity is given, then `obj['amount']` and `obj['unit']` are used.
