**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.extractors.csv` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.extractors.csv cfg.yml > bw2io.extractors.csv.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.extractors.csv"></a>

# bw2io.extractors.csv

<a id="bw2io.extractors.csv.CSVExtractor"></a>

## CSVExtractor Objects

```python
class CSVExtractor(object)
```

Extracts data from CSV files.

**See Also**:

  ---------
  - :class:`.ExcelExtractor`: Extracts data from Excel files.
  

**References**:

  -----------
  - https://docs.python.org/3/library/csv.html: Official documentation for the csv module in Python.

<a id="bw2io.extractors.csv.CSVExtractor.extract"></a>

#### extract

```python
@classmethod
def extract(cls, filepath, encoding="utf-8-sig", **kwargs)
```

Extracts CSV file data from the filepath.

**Arguments**:

  ----------
  filepath : str
  The path to the CSV file.
  encoding : str, optional
  The encoding of the CSV file, with default being "utf-8-sig".
  

**Returns**:

  -------
  list
  A list containing the filename and the contents of the CSV file.
  

**Raises**:

  ------
  AssertionError
  If the file does not exist.
  

**Examples**:

  --------
  >>> CSVExtractor.extract("example.csv")
  ["example.csv", [["1", "2", "3"], ["4", "5", "6"]]]
