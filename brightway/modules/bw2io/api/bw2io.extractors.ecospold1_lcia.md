**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.extractors.ecospold1_lcia` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.extractors.ecospold1_lcia cfg.yml > bw2io.extractors.ecospold1_lcia.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.extractors.ecospold1_lcia"></a>

# bw2io.extractors.ecospold1\_lcia

<a id="bw2io.extractors.ecospold1_lcia.Ecospold1LCIAExtractor"></a>

## Ecospold1LCIAExtractor Objects

```python
class Ecospold1LCIAExtractor(object)
```

Extract impact assessment methods and weightings data from ecospold XML format.

**Attributes**:

  None
  

**Methods**:

- `extract` - Extracts data from an ecospold XML file.
- `parse_method` - Parses the ecospold XML dataset to extract information.
- `parse_cf` - Parses an ecospold XML data element to extract characterization factor information.

<a id="bw2io.extractors.ecospold1_lcia.Ecospold1LCIAExtractor.extract"></a>

#### extract

```python
@classmethod
def extract(cls, path, **kwargs)
```

Extracts ecospold XML file data.

Parameters
----------
path : str
    The path to the ecospold XML file or directory.

Returns
-------
list
    A list of dictionaries with the extracted information.

<a id="bw2io.extractors.ecospold1_lcia.Ecospold1LCIAExtractor.parse_method"></a>

#### parse\_method

```python
@classmethod
def parse_method(cls, ds, filepath)
```

Parse and extract information from an ecospold XML dataset.

Parameters
----------
ds : object
    The XML dataset.
filepath : str
    The path to the XML file.

Returns
-------
dict
    A dictionary of the information extracted from the ecospold XML dataset.

<a id="bw2io.extractors.ecospold1_lcia.Ecospold1LCIAExtractor.parse_cf"></a>

#### parse\_cf

```python
@classmethod
def parse_cf(cls, cf)
```

Parse a cf object and extract relevant data.

Parameters
----------
cf : dict
    A dictionary of cf data.

Returns
-------
dict
    A dictionary of parsed cf data.

Raises
------
TypeError
    If 'cf' is not a dictionary.

Notes
-----
This method expects 'cf' to contain the following keys:
- meanValue (float): the amount
- category (str): the category
- subCategory (str, optional): the subcategory, if any
- name (str): the name
- unit (str): the unit of the amount

If `subCategory` is not provided, it will default to `None`.
