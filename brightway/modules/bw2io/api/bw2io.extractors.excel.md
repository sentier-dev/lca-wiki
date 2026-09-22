**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.extractors.excel` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.extractors.excel cfg.yml > bw2io.extractors.excel.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.extractors.excel"></a>

# bw2io.extractors.excel

<a id="bw2io.extractors.excel.get_cell_value_handle_error"></a>

#### get\_cell\_value\_handle\_error

```python
def get_cell_value_handle_error(cell: cell.cell.Cell)
```

Retrieve the value of a given cell and handle error types.

Parameters
----------
cell : openpyxl.cell.cell.Cell
    The cell to get the value from.

Returns
--------
object
    The value of the cell, or None if the cell has an error type.

Examples
---------
>>> from openpyxl import Workbook
>>> wb = Workbook()
>>> ws = wb.active
>>> ws["A1"] = "hello"
>>> assert get_cell_value_handle_error(ws["A1"]) == "hello"
>>> ws["B1"] = "=1/0"
>>> assert get_cell_value_handle_error(ws["B1"]) == None

<a id="bw2io.extractors.excel.ExcelExtractor"></a>

## ExcelExtractor Objects

```python
class ExcelExtractor()
```

A class used to extract data from an Excel file.

Parameters
----------
object : type
    The parent object for the ExcelExtractor class.

Returns
-------
object
    An instance of the class.

See Also
--------
openpyxl.load_workbook : Load a workbook from a file.

Notes
-----
This class requires the openpyxl package to be installed.

Raises
------
AssertionError
    If the file at 'filepath' does not exist.

Parameters
----------
filepath : str
    The path to the Excel file.

Returns
-------
list
    A list of tuples containing the name of each sheet in the file and the data from each sheet.

Examples
--------
>>> extractor = ExcelExtractor()
>>> filepath = 'example.xlsx'
>>> data = extractor.extract(filepath)

<a id="bw2io.extractors.excel.ExcelExtractor.extract"></a>

#### extract

```python
@classmethod
def extract(cls, filepath: Path, sheet_name=None, **kwargs)
```

Extract data from an Excel file.

Parameters
----------
filepath : str
    The path to the Excel file.
sheet_name : str or list of str or None
    If given, only extract the named sheet(s).  A single sheet name
    may be passed as a string; multiple sheets as a list or tuple.
    ``None`` (the default) extracts all sheets.

Returns
-------
list
    A list of tuples containing the name of each sheet in the file and the data from each sheet.

Raises
------
AssertionError
    If the file at 'filepath' does not exist.
ValueError
    If any requested sheet name is not present in the workbook.

<a id="bw2io.extractors.excel.ExcelExtractor.extract_sheet"></a>

#### extract\_sheet

```python
@classmethod
def extract_sheet(cls, wb: workbook.Workbook, name: str, strip: bool = True)
```

Extract data from a single sheet in an Excel workbook.

Parameters
----------
wb : openpyxl.workbook.Workbook
    The workbook object with the sheet to extract data from.
name : str
    The name of the sheet to extract data from.
strip : bool, optional
    If True, strip whitespace from cell values, by default True.

Returns
-------
list
    A list of lists containing the data from the sheet.

Notes
-----
This method is called by the 'extract' method to extract the data from each sheet in the workbook.

Examples
--------
>>> wb = openpyxl.load_workbook('example.xlsx')
>>> name = 'Sheet1'
>>> data = ExcelExtractor.extract_sheet(wb, sheetname)
