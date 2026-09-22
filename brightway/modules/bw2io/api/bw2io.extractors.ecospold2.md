**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.extractors.ecospold2` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.extractors.ecospold2 cfg.yml > bw2io.extractors.ecospold2.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.extractors.ecospold2"></a>

# bw2io.extractors.ecospold2

<a id="bw2io.extractors.ecospold2.PM_MAPPING"></a>

#### PM\_MAPPING

<a id="bw2io.extractors.ecospold2.ACTIVITY_TYPES"></a>

#### ACTIVITY\_TYPES

<a id="bw2io.extractors.ecospold2.getattr2"></a>

#### getattr2

```python
def getattr2(obj, attr)
```

Get attribute of an object; return empty dict if AttributeError occurs.

Parameters
----------
obj : object
    The object to get attribute from.
attr : str
    The name of the attribute to get.

Returns
-------
dict
    The attribute value if it exists, else an empty dict.

<a id="bw2io.extractors.ecospold2.TOO_LOW"></a>

#### TOO\_LOW

<a id="bw2io.extractors.ecospold2.TOO_HIGH"></a>

#### TOO\_HIGH

<a id="bw2io.extractors.ecospold2.Ecospold2DataExtractor"></a>

## Ecospold2DataExtractor Objects

```python
class Ecospold2DataExtractor(object)
```

<a id="bw2io.extractors.ecospold2.Ecospold2DataExtractor.extract_technosphere_metadata"></a>

#### extract\_technosphere\_metadata

```python
@classmethod
def extract_technosphere_metadata(cls, dirpath: Path)
```

Extract technosphere metadata from ecospold2 directory.

Parameters
----------
dirpath : str
    The path to the ecospold2 directory.

Returns
-------
List of dict
    List of names, units, and IDs

<a id="bw2io.extractors.ecospold2.Ecospold2DataExtractor.extract"></a>

#### extract

```python
@classmethod
def extract(cls,
            dirpath: Path,
            db_name: str,
            use_mp: bool = True,
            cache: bool = False,
            collapse_comments: bool = True)
```

Extract data from all ecospold2 files in a directory.

Parameters
----------
dirpath : str
    The path to the directory containing the ecospold2 files.
db_name : str
    The name of the database to create.
use_mp : bool, optional
    Whether to use multiprocessing to extract the data (default is True).
cache : bool, optional
    Cache extracted datasets as `.json.gz` files alongside the source `.spold`
    files for faster re-imports (default is False).
collapse_comments : bool, optional
    If True (default), combine all comment fields into a single string. If False,
    return ``comment`` as a dict with keys ``general``, ``included activities
    start``, ``included activities end``, ``geography``, ``technology``, and
    ``time period`` (only non-empty keys are included).

Returns
-------
list
    A list of the extracted data from the ecospold2 files.

Raises
------
FileNotFoundError
    If no .spold files are found in the directory.

<a id="bw2io.extractors.ecospold2.Ecospold2DataExtractor.condense_multiline_comment"></a>

#### condense\_multiline\_comment

```python
@classmethod
def condense_multiline_comment(cls, element)
```

Concatenate the text of all child elements with the tag
"{http://www.EcoInvent.org/EcoSpold02}text" and the text of all child
elements with the tag "{http://www.EcoInvent.org/EcoSpold02}imageUrl"
in the given `element` XML element.

 Args
 ----
    cls (type): The class object.
    element (lxml.etree.Element): The XML element.

Returns
-------
    str: The concatenated text of all child elements with the tag
    "{http://www.EcoInvent.org/EcoSpold02}text" and the text of all child
    elements with the tag "{http://www.EcoInvent.org/EcoSpold02}imageUrl".
    If an error occurs, an empty string is returned.

<a id="bw2io.extractors.ecospold2.Ecospold2DataExtractor.extract_activity"></a>

#### extract\_activity

```python
@classmethod
def extract_activity(cls,
                     dirpath,
                     filename,
                     db_name,
                     cache: bool = False,
                     collapse_comments: bool = True)
```

Extract and return the data of an activity from an XML file with the given
`filename` in the directory with the path `dirpath`.

 Args
 ----
    cls (type): The class object.
    dirpath (str): The path of the directory containing the XML file.
    filename (str): The name of the XML file.
    db_name (str): The name of the database.
    cache (bool): Whether to read/write a `.json.gz` cache file (default False).

Returns
-------
dict: The dictionary of data for the activity. The keys and values are as
    follows:
        - "comment": str. The condensed multiline comment.
        - "classifications": list of tuples. The classification systems and
          values of the activity.
        - "activity type": str. The type of the activity.
        - "activity": str. The ID of the activity.
        - "database": str. The name of the database.
        - "exchanges": list of dicts. The exchanges of the activity.
        - "filename": str. The name of the XML file.
        - "location": str. The short name of the location of the activity.
        - "name": str. The name of the activity.
        - "synonyms": list of str. The synonyms of the activity.
        - "parameters": dict. The parameters of the activity.
        - "authors": dict of dicts. The authors of the activity. The keys and
          values of the inner dicts are as follows:
            - "name": str. The name of the author.
            - "email": str. The email of the author.
        - "type": str. The type of the activity.

<a id="bw2io.extractors.ecospold2.Ecospold2DataExtractor.abort_exchange"></a>

#### abort\_exchange

```python
@classmethod
def abort_exchange(cls, exc, comment=None)
```

Set the uncertainty type of the input exchange to UndefinedUncertainty.id. Remove the keys "scale", "shape", "minimum", and "maximum" from the dictionary.
Update the "loc" key to "amount". Append "comment" to "exc['comment']" if "comment" is not None,
otherwise append "Invalid parameters - set to undefined uncertainty." to "exc['comment']".

**Arguments**:

- `exc` _dict_ - The input exchange.
- `comment` _str, optional_ - A string to append to "exc['comment']". Defaults to None.
  

**Returns**:

  None

<a id="bw2io.extractors.ecospold2.Ecospold2DataExtractor.extract_uncertainty_dict"></a>

#### extract\_uncertainty\_dict

```python
@classmethod
def extract_uncertainty_dict(cls, obj)
```

Extract uncertainty information from "obj" and return it as a dictionary.

**Arguments**:

- `obj` - The input object.
  

**Returns**:

- `dict` - The extracted uncertainty information.

<a id="bw2io.extractors.ecospold2.Ecospold2DataExtractor.extract_parameter"></a>

#### extract\_parameter

```python
@classmethod
def extract_parameter(cls, exc)
```

Extract parameter information from "exc" and return it as a tuple.

**Arguments**:

- `exc` _dict_ - The input exchange.
  

**Returns**:

- `tuple` - A tuple containing the parameter name and a dictionary containing the parameter information.

<a id="bw2io.extractors.ecospold2.Ecospold2DataExtractor.extract_properties"></a>

#### extract\_properties

```python
@classmethod
def extract_properties(cls, exc)
```

Extract the properties of an exchange.

Parameters
----------
exc : lxml.etree.Element
    An XML element representing an exchange.

Returns
-------
dict
    A dictionary of the properties of the exchange. Each key in the dictionary
    is a string representing the name of a property, and the corresponding value
    is a dictionary with the following keys:

    - "amount" (float): The numerical value of the property.
    - "comment" (str, optional): A comment describing the property, if available.
    - "unit" (str, optional): The unit of the property, if available.
    - "variable name" (str, optional): The name of the variable associated with
    the property, if available.

<a id="bw2io.extractors.ecospold2.Ecospold2DataExtractor.extract_exchange"></a>

#### extract\_exchange

```python
@classmethod
def extract_exchange(cls, exc)
```

Process exchange.

Input groups are:

    1. Materials/fuels
    2. Electricity/Heat
    3. Services
    4. From environment (elementary exchange only)
    5. FromTechnosphere

Output groups are:

    0. ReferenceProduct
    2. By-product
    3. MaterialForTreatment
    4. To environment (elementary exchange only)
    5. Stock addition
