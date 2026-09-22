**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.extractors.simapro_csv` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.extractors.simapro_csv cfg.yml > bw2io.extractors.simapro_csv.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.extractors.simapro_csv"></a>

# bw2io.extractors.simapro\_csv

<a id="bw2io.extractors.simapro_csv.INTRODUCTION"></a>

#### INTRODUCTION

<a id="bw2io.extractors.simapro_csv.SIMAPRO_TECHNOSPHERE"></a>

#### SIMAPRO\_TECHNOSPHERE

<a id="bw2io.extractors.simapro_csv.SIMAPRO_PRODUCTS"></a>

#### SIMAPRO\_PRODUCTS

<a id="bw2io.extractors.simapro_csv.SIMAPRO_END_OF_DATASETS"></a>

#### SIMAPRO\_END\_OF\_DATASETS

<a id="bw2io.extractors.simapro_csv.EndOfDatasets"></a>

## EndOfDatasets Objects

```python
class EndOfDatasets(Exception)
```

Raise exception when there are no more datasets to iterate.

<a id="bw2io.extractors.simapro_csv.to_number"></a>

#### to\_number

```python
def to_number(obj)
```

Convert a string to a number.

Parameters
----------
obj : str
    The string to be converted to a number

Returns
-------
float or str
    converted number as float, or the unchanged string if not successfully converted.

<a id="bw2io.extractors.simapro_csv.strip_whitespace_and_delete"></a>

#### strip\_whitespace\_and\_delete

<a id="bw2io.extractors.simapro_csv.uppercase_expression"></a>

#### uppercase\_expression

<a id="bw2io.extractors.simapro_csv.replace_with_uppercase"></a>

#### replace\_with\_uppercase

```python
def replace_with_uppercase(string, names, precompiled)
```

Replace all occurrences of elements of ``names`` in ``string`` with their uppercase equivalents.

Parameters
----------
string : str
    String to be modified.
names : list
    List of variable name strings that should already all be uppercase.
precompiled : dict
    Dictionary #TODO.

Returns
-------
    The modified string.

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor"></a>

## SimaProCSVExtractor Objects

```python
class SimaProCSVExtractor(object)
```

Extract datasets from SimaPro CSV export files.

The CSV file should be in a specific format, with row 1 containing either the string "SimaPro" or "CSV separator."

Parameters
----------
filepath : str
    The path to the SimaPro CSV export file.
delimiter : str, optional
    The delimiter in the CSV file. Default is ";".
name : str, optional
    The name of the project. If the name is not provided, it is extracted from the CSV file.
encoding: str, optional
    The character encoding in the SimaPro CSV file. Defaults to "cp1252".

Returns
-------
datasets : list
    The list of extracted datasets from the CSV file.
global_parameters : dict
    The dictionary of global parameters for the CSV file.
project_metadata : dict
    The dictionary of project metadata.

Raises
------
AssertionError:
    If the CSV file is not a valid Simapro export file.

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.extract"></a>

#### extract

```python
@classmethod
def extract(cls,
            filepath,
            delimiter=";",
            name=None,
            encoding="cp1252",
            **kwargs)
```

Extract data from a SimaPro export file (.csv) and returns a list of datasets, global parameters, and project metadata.

**Arguments**:

  -----------
  filepath : str
  The file path of the SimaPro export file to extract data from.
  delimiter : str, optional
  The delimiter used in the SimaPro export file. Defaults to ";".
  name : str, optional
  The name of the project. If not provided, the method will attempt to infer it from the SimaPro export file.
  encoding : str, optional
  The character encoding of the SimaPro export file. Defaults to "cp1252".
  

**Returns**:

  --------
  Tuple[List[Dict], Dict, Dict]
  A tuple containing:
  - a list of dictionaries representing each dataset extracted from the SimaPro export file,
  - a dictionary containing global parameters extracted from the SimaPro export file, and
  - a dictionary containing project metadata extracted from the SimaPro export file.

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.get_next_process_index"></a>

#### get\_next\_process\_index

```python
@classmethod
def get_next_process_index(cls, data, index)
```

Get the index of the next process in the given data.

**Arguments**:

  -----------
  data : List[List[str]]
  The data to search for the next process.
  index : int
  The index to start the search from.
  

**Returns**:

  --------
  int
  The index of the next process in the data.

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.get_project_metadata"></a>

#### get\_project\_metadata

```python
@classmethod
def get_project_metadata(cls, data)
```

Parse metadata from a list of strings and returns a dictionary of metadata key-value pairs.

Parameters
----------
data : list
    A list of strings containing metadata in the format "{key}: {value}".

Returns
-------
dict
    A dictionary of metadata key-value pairs extracted from the input `data` list.

Raises
------
ValueError
    If a line of metadata does not contain a colon `:` character, or if it contains multiple colons.
AssertionError
    If a line of metadata does not start and end with curly braces `{}`.

Notes
-----
This method assumes that each line in the input `data` list contains only one metadata key-value pair,
and that the key and value are separated by a single colon `:` character.

Examples
--------
>>> data = ["{name}: John Smith", "{age}: 25", "", "{country: UK}"]
>>> meta = get_project_metadata(data)
>>> print(meta)
{"name": "John Smith", "age": "25", "country": "UK"}

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.get_global_parameters"></a>

#### get\_global\_parameters

```python
@classmethod
def get_global_parameters(cls, data, pm)
```

Extract and return global parameters from a SimaPro export file.

**Arguments**:

- `data` _List[List[str]]_ - A list of lists containing the data read from the SimaPro export file.
- `pm` _Dict[str, str]_ - A dictionary containing project metadata extracted from the SimaPro export file.
  

**Returns**:

  A tuple containing:
  - parameters (Dict[str, Dict[str, Any]]): A dictionary containing global parameters extracted from the SimaPro export file. Each parameter is represented as a dictionary with keys 'name', 'unit', 'formula', and 'amount'.
  - global_precompiled (Dict[str, Pattern]): A dictionary containing compiled regular expression patterns used to search for parameter names in the SimaPro export file.
  

**Raises**:

- `ValueError` - If an invalid parameter is encountered in the SimaPro export file.

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.get_project_name"></a>

#### get\_project\_name

```python
@classmethod
def get_project_name(cls, data)
```

Extract the project name from the given data.

Parameters
----------
data : list
    A list of data, where each item is a list of strings representing a row of the data.

Returns
-------
str
    The project name.

Notes
-----
This method searches for a row in the data where the first item starts with "{Project:" or "{Projet:".
If such a row is found, the project name is extracted from that row and returned. Otherwise, `None` is returned.

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.invalid_uncertainty_data"></a>

#### invalid\_uncertainty\_data

```python
@classmethod
def invalid_uncertainty_data(cls, amount, kind, field1, field2, field3)
```

Determine if the uncertainty data is invalid.

Parameters
----------
amount : str
    The amount of uncertainty.
kind : str
    The kind of uncertainty.
field1 : str
    The first field of uncertainty data.
field2 : str
    The second field of uncertainty data.
field3 : str
    The third field of uncertainty data.

Returns
-------
bool
    `True` if the uncertainty data is invalid, `False` otherwise.

Notes
-----
This method checks if the given uncertainty data is invalid based on the kind of uncertainty.
If the kind is "Lognormal" and `amount` is empty or `field1` is "0" or "1", the uncertainty data is considered invalid.

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.create_distribution"></a>

#### create\_distribution

```python
@classmethod
def create_distribution(cls, amount, kind, field1, field2, field3)
```

Create a distribution based on the given uncertainty data.

Parameters
----------
amount : str
    The amount of uncertainty.
kind : str
    The kind of uncertainty.
field1 : str
    The first field of uncertainty data.
field2 : str
    The second field of uncertainty data.
field3 : str
    The third field of uncertainty data.

Returns
-------
dict
    A dictionary representing the distribution.

Raises
------
ValueError
    If the given uncertainty type is unknown.

Notes
-----
This method creates a distribution based on the given uncertainty data.
The distribution is returned as a dictionary with the following keys:
- "uncertainty type": the ID of the uncertainty type
- "loc": the location parameter of the distribution
- "amount": the amount of uncertainty
Depending on the kind of uncertainty, other keys may be included:
- "scale": the scale parameter of the distribution (for "Lognormal" and "Normal" uncertainties)
- "minimum": the minimum value of the distribution (for "Triangle" and "Uniform" uncertainties)
- "maximum": the maximum value of the distribution (for "Triangle" and "Uniform" uncertainties)
- "negative": `True` if the amount of uncertainty is negative, `False` otherwise.
If the kind of uncertainty is "Undefined", an undefined uncertainty distribution is created.
If the kind of uncertainty is "Lognormal", a lognormal uncertainty distribution is created.
If the kind of uncertainty is "Normal", a normal uncertainty distribution is created.
If the kind of uncertainty is "Triangle", a triangular uncertainty distribution is created.
If the kind of uncertainty is "Uniform", a uniform uncertainty distribution is created.
If the kind of uncertainty is unknown, a ValueError is raised.

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.parse_calculated_parameter"></a>

#### parse\_calculated\_parameter

```python
@classmethod
def parse_calculated_parameter(cls, line, pm)
```

Parse a line in the 'Calculated parameters' section of a SimaPro file and return a dictionary of its components.

Parameters
----------
line : List[str]
    The line to be parsed, with the first string being the name, the second string the formula, and
    subsequent strings comments associated with the parameter.
pm : Dict[str, float]
    A dictionary mapping variable names to their values in the context of the parameter.

Returns
-------
parsed_parameter : Dict[str, Union[str, List[str]]]
A dictionary with the following keys:
- 'name' : str
    The name of the parameter.
- 'formula' : str
    The formula used in the parameter, with variables replaced by their values according to `pm`.
- 'comment' : List[str]
    A list of comments on the parameter.
Examples
--------
#TODO

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.parse_input_parameter"></a>

#### parse\_input\_parameter

```python
@classmethod
def parse_input_parameter(cls, line)
```

Parse input parameters section of a SimaPro file.

0. name
1. value (not formula)
2. uncertainty type
3. uncert. param.
4. uncert. param.
5. uncert. param.
6. hidden ("Yes" or "No" - we ignore)
7. comment

Returns
-------
#TODO
Examples
--------
#TODO

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.parse_biosphere_flow"></a>

#### parse\_biosphere\_flow

```python
@classmethod
def parse_biosphere_flow(cls, line, category, pm)
```

Parse biosphere flow line.

0. name
1. subcategory
2. unit
3. value or formula
4. uncertainty type
5. uncert. param.
6. uncert. param.
7. uncert. param.
8. comment

However, sometimes the value is in index 2, and the unit in index 3. Because why not! We assume default ordering unless we find a number in index 2.

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.parse_input_line"></a>

#### parse\_input\_line

```python
@classmethod
def parse_input_line(cls, line, category, pm)
```

Parse technosphere input line.

0. name
1. unit
2. value or formula
3. uncertainty type
4. uncert. param.
5. uncert. param.
6. uncert. param.
7. comment

However, sometimes the value is in index 1, and the unit in index 2. Because why not! We assume default ordering unless we find a number in index 1.

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.parse_final_waste_flow"></a>

#### parse\_final\_waste\_flow

```python
@classmethod
def parse_final_waste_flow(cls, line, pm)
```

Parse final wate flow line.

0: name
1: subcategory?
2: unit
3. value or formula
4. uncertainty type
5. uncert. param.
6. uncert. param.
7. uncert. param.

However, sometimes the value is in index 2, and the unit in index 3. Because why not! We assume default ordering unless we find a number in index 2.

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.parse_reference_product"></a>

#### parse\_reference\_product

```python
@classmethod
def parse_reference_product(cls, line, pm)
```

Parse reference product line.

0. name
1. unit
2. value or formula
3. allocation
4. waste type
5. category (separated by \)
6. comment

However, sometimes the value is in index 1, and the unit in index 2. Because why not! We assume default ordering unless we find a number in index 1.

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.parse_waste_treatment"></a>

#### parse\_waste\_treatment

```python
@classmethod
def parse_waste_treatment(cls, line, pm)
```

Parse reference product line.

0. name
1. unit
2. value or formula
3. waste type
4. category (separated by \)
5. comment

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.read_dataset_metadata"></a>

#### read\_dataset\_metadata

```python
@classmethod
def read_dataset_metadata(cls, data, index)
```

Read metadata from a SIMAPRO dataset.

**Returns**:

  Tuple[Dict[str, str], int]: A tuple containing the metadata as a dictionary and the index of the next line
  after the metadata.
  

**Raises**:

- `IndexError` - If the index is out of range for the given dataset.

<a id="bw2io.extractors.simapro_csv.SimaProCSVExtractor.read_data_set"></a>

#### read\_data\_set

```python
@classmethod
def read_data_set(cls, data, index, db_name, filepath, gp, pm,
                  global_precompiled)
```
