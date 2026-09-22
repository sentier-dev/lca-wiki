**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.extractors.exiobase` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.extractors.exiobase cfg.yml > bw2io.extractors.exiobase.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.extractors.exiobase"></a>

# bw2io.extractors.exiobase

<a id="bw2io.extractors.exiobase.remove_numerics"></a>

#### remove\_numerics

```python
def remove_numerics(string)
```

Remove numeric values enclosed in parentheses from a given string, e.g. 'Tobacco products (16)' into 'Tobacco products'.

Parameters
----------
string : str
    The string to be processed

Returns
-------
str
    The processed string without numeric values enclosed in parentheses.

<a id="bw2io.extractors.exiobase.Exiobase3MonetaryDataExtractor"></a>

## Exiobase3MonetaryDataExtractor Objects

```python
class Exiobase3MonetaryDataExtractor(object)
```

<a id="bw2io.extractors.exiobase.Exiobase3MonetaryDataExtractor.get_flows"></a>

#### get\_flows

```python
@classmethod
def get_flows(cls, dirpath)
```

Extract flows from an EXIOBASE data file.

Parameters
----------
dirpath : str
    The path of the EXIOBASE data file or directory.

Returns
-------
dict
    A dictionary of flows from the EXIOBASE data file.

<a id="bw2io.extractors.exiobase.Exiobase3MonetaryDataExtractor.get_products"></a>

#### get\_products

```python
@classmethod
def get_products(cls, dirpath)
```

Get product information from a given directory.

Parameters
----------
dirpath : str
    The path to the directory with the product information.

Returns
-------
list
    A list of dictionaries with the following keys:
    - 'name': str
    The product name.
    - 'location': str
    The product location.
    - 'unit': str
    The product's unit of measure.
    - 'production volume': float
    The total production volume for the product.

<a id="bw2io.extractors.exiobase.Exiobase3MonetaryDataExtractor.get_technosphere_iterator"></a>

#### get\_technosphere\_iterator

```python
@classmethod
def get_technosphere_iterator(cls,
                              dirpath,
                              num_products,
                              ignore_small_balancing_corrections=True)
```

Get an iterator in a given directory.

Parameters
----------
dirpath : str
    The path to the directory with the data.
num_products : int
    The number of products.
ignore_small_balancing_corrections : bool, optional
    Ignore small balancing corrections. By default True.

<a id="bw2io.extractors.exiobase.Exiobase3MonetaryDataExtractor.get_biosphere_iterator"></a>

#### get\_biosphere\_iterator

```python
@classmethod
def get_biosphere_iterator(cls,
                           dirpath,
                           ignore_small_balancing_corrections=True)
```

Returns an iterator that yields tuples of flow names, locations, and amounts.

Parameters
----------
dirpath : str
    The path to the directory.
ignore_small_balancing_corrections : bool, optional
    Ignore small balancing corrections. By default True.
