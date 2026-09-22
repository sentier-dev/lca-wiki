**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.chemidplus` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.chemidplus cfg.yml > bw2io.chemidplus.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.chemidplus"></a>

# bw2io.chemidplus

<a id="bw2io.chemidplus.DIRPATH"></a>

#### DIRPATH

<a id="bw2io.chemidplus.canonical_cas"></a>

#### canonical\_cas

```python
def canonical_cas(s)
```

CAS numbers have up to ten digits; we remove zero padding and add hyphens where needed.

Parameters
----------
s : str
    CAS number.

Returns
-------
str
    Canonical CAS number.

<a id="bw2io.chemidplus.Multiple"></a>

## Multiple Objects

```python
class Multiple(Exception)
```

Multiple results for given search query.

Parameters
----------
exception : Exception
    Exception to raise.

<a id="bw2io.chemidplus.Missing"></a>

## Missing Objects

```python
class Missing(Exception)
```

404 or other error code returned.

Parameters
----------
exception : Exception
    Exception to raise.

<a id="bw2io.chemidplus.ChemIDPlus"></a>

## ChemIDPlus Objects

```python
class ChemIDPlus()
```

Use the `ChemIDPlus <https://chem.nlm.nih.gov/api/swagger-ui.html#/SubstanceController>`__ API to lookup synonyms for chemicals, including pesticides.

Always used to match against a master list. Seeded with names from ecoinvent.

Attributes
----------
api_cache : dict
    Dictionary with raw data from API, key is canonical name.
master_mapping : dict
    Dictionary from synonyms, including canonical names, to master flows.
forbidden_keys : set
    Identifiers that aren't unique in the ChemIDPlus system.

Methods
-------
match(synonym, search=True)
    Match a synonym to a master flow.
match_cas(number)
    Match a CAS number to a master flow.
process_request(request)
    Process a request to the ChemIDPlus API.
load_cache()
    Load the cache of API results.
save_cache()
    Save the cache of API results.

<a id="bw2io.chemidplus.ChemIDPlus.CAS_TEMPLATE"></a>

#### CAS\_TEMPLATE

<a id="bw2io.chemidplus.ChemIDPlus.NAME_TEMPLATE"></a>

#### NAME\_TEMPLATE

<a id="bw2io.chemidplus.ChemIDPlus.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="bw2io.chemidplus.ChemIDPlus.match"></a>

#### match

```python
def match(synonym, search=True)
```

<a id="bw2io.chemidplus.ChemIDPlus.match_cas"></a>

#### match\_cas

```python
def match_cas(number)
```

<a id="bw2io.chemidplus.ChemIDPlus.add_master_term"></a>

#### add\_master\_term

```python
def add_master_term(term, CAS)
```

<a id="bw2io.chemidplus.ChemIDPlus.save_cache"></a>

#### save\_cache

```python
def save_cache()
```

<a id="bw2io.chemidplus.ChemIDPlus.load_cache"></a>

#### load\_cache

```python
def load_cache()
```

<a id="bw2io.chemidplus.ChemIDPlus.process_request"></a>

#### process\_request

```python
def process_request(response)
```
