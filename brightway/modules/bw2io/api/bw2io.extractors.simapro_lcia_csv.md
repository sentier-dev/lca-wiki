**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.extractors.simapro_lcia_csv` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.extractors.simapro_lcia_csv cfg.yml > bw2io.extractors.simapro_lcia_csv.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.extractors.simapro_lcia_csv"></a>

# bw2io.extractors.simapro\_lcia\_csv

<a id="bw2io.extractors.simapro_lcia_csv.INTRODUCTION"></a>

#### INTRODUCTION

<a id="bw2io.extractors.simapro_lcia_csv.SKIPPABLE_SECTIONS"></a>

#### SKIPPABLE\_SECTIONS

<a id="bw2io.extractors.simapro_lcia_csv.EndOfDatasets"></a>

## EndOfDatasets Objects

```python
class EndOfDatasets(Exception)
```

<a id="bw2io.extractors.simapro_lcia_csv.strip_delete"></a>

#### strip\_delete

<a id="bw2io.extractors.simapro_lcia_csv.SimaProLCIACSVExtractor"></a>

## SimaProLCIACSVExtractor Objects

```python
class SimaProLCIACSVExtractor(object)
```

Extract data from SimaPro LCIACSV file format.

Parameters
----------
filepath: str
    Filepath of the SimaPro LCIACSV file.
delimiter: str, optional (default: ";")
    Delimiter used in the SimaPro LCIACSV file.
encoding: str, optional (default: "cp1252")
    Encoding of the SimaPro LCIACSV file.

Raises
------
AssertionError
    If the filepath does not exist or the file is not a valid SimaPro export file.

Returns
-------
list
    List of datasets extracted from the SimaPro LCIACSV file.

<a id="bw2io.extractors.simapro_lcia_csv.SimaProLCIACSVExtractor.extract"></a>

#### extract

```python
@classmethod
def extract(cls, filepath, delimiter=";", encoding="cp1252", **kwargs)
```

<a id="bw2io.extractors.simapro_lcia_csv.SimaProLCIACSVExtractor.get_next_method_index"></a>

#### get\_next\_method\_index

```python
@classmethod
def get_next_method_index(cls, data, index)
```

Find the index of the next "Method" in the given data starting from the
specified index, skipping any sections specified in SKIPPABLE_SECTIONS.

Parameters
----------
data : list of lists
    The nested list containing the data.
index : int
    The starting index to search for the next "Method".

Returns
-------
int
    The index of the next "Method" in the data.

Raises
------
EndOfDatasets
    If the file ends without extra metadata.

<a id="bw2io.extractors.simapro_lcia_csv.SimaProLCIACSVExtractor.skip_to_section_end"></a>

#### skip\_to\_section\_end

```python
@classmethod
def skip_to_section_end(cls, data, index)
```

Skip to the end of the current section in the data starting from the
specified index.

Parameters
----------
data : list of lists
    The nested list containing the data.
index : int
    The starting index to skip from.

Returns
-------
int
    The index of the end of the current section in the data.

<a id="bw2io.extractors.simapro_lcia_csv.SimaProLCIACSVExtractor.parse_cf"></a>

#### parse\_cf

```python
@classmethod
def parse_cf(cls, line)
```

Parse line in `Substances` section.

0. category
1. subcategory
2. flow
3. CAS number
4. CF
5. unit

<a id="bw2io.extractors.simapro_lcia_csv.SimaProLCIACSVExtractor.read_metadata"></a>

#### read\_metadata

```python
@classmethod
def read_metadata(cls, data, index)
```

Read metadata from `data` starting at `index`.

Parameters
----------
data : list
    A list of lists containing the data to be processed.
index : int
    The starting index to read metadata from.

Returns
-------
tuple
    A tuple containing a dictionary of metadata and the index where the metadata reading ended.

<a id="bw2io.extractors.simapro_lcia_csv.SimaProLCIACSVExtractor.read_method_data_set"></a>

#### read\_method\_data\_set

```python
@classmethod
def read_method_data_set(cls, data, index, filepath)
```

Read method data set from `data` starting at `index`.

Parameters
----------
data : list
    A list of lists containing the data to be processed.
index : int
    The starting index to read method data set from.
filepath : str
    The file path of the method data set.

Returns
-------
list
    A list of completed method data sets.
int
    The index where the method data set reading ended.

Raises
------
ValueError

<a id="bw2io.extractors.simapro_lcia_csv.SimaProLCIACSVExtractor.get_all_cfs"></a>

#### get\_all\_cfs

```python
@classmethod
def get_all_cfs(cls, nw_data, category_data)
```

Get all CFs from `nw_data` and `category_data`.

Parameters
----------
nw_data : list
    A list of tuples containing normalization-weighting (NW) set names and scales.
category_data : list
    A list of tuples containing impact category names, units, and CF data.
Returns
-------
list
    A list of all CFs.

<a id="bw2io.extractors.simapro_lcia_csv.SimaProLCIACSVExtractor.get_damage_exchanges"></a>

#### get\_damage\_exchanges

```python
@classmethod
def get_damage_exchanges(cls, damage_data, category_data)
```

Calculate the damage exchanges based on damage data and category data.

Parameters
----------
damage_data : list of tuples
    A list of tuples containing the name and scale of the damage
category_data : list of tuples
    A list of tuples containing the name, unit, and data of each impact category

Returns
-------
list of dictionaries
    A list of dictionaries with the calculated damage exchanges of each impact category

<a id="bw2io.extractors.simapro_lcia_csv.SimaProLCIACSVExtractor.get_category_data"></a>

#### get\_category\_data

```python
@classmethod
def get_category_data(cls, data, index)
```

Parse impact category data and return its name, unit, and data.

Parameters
----------
data : list of lists
    A list of lists with the data for all categories
index : int
    The index of the current impact category in the list

Returns
-------
tuple
    A tuple with the name, unit, and data for the impact category

<a id="bw2io.extractors.simapro_lcia_csv.SimaProLCIACSVExtractor.get_damage_category_data"></a>

#### get\_damage\_category\_data

```python
@classmethod
def get_damage_category_data(cls, data, index)
```

Parse damage category data and return the name, unit, and data of the category.

Parameters
----------
data : list of lists
    A list of lists with the data of the damage categories
index : int
    The index of the current damage category in the list

Returns
-------
tuple
    A tuple with the name, unit, and data for the damage category

<a id="bw2io.extractors.simapro_lcia_csv.SimaProLCIACSVExtractor.get_normalization_weighting_data"></a>

#### get\_normalization\_weighting\_data

```python
@classmethod
def get_normalization_weighting_data(cls, data, index)
```
