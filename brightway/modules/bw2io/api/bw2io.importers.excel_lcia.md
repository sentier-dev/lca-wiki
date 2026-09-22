**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.excel_lcia` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.excel_lcia cfg.yml > bw2io.importers.excel_lcia.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.excel_lcia"></a>

# bw2io.importers.excel\_lcia

<a id="bw2io.importers.excel_lcia.as_dicts"></a>

#### as\_dicts

```python
def as_dicts(obj)
```

Converts a 2D list to a list of dictionaries.

**Arguments**:

- `obj` _list_ - The 2D list to be converted.
  

**Returns**:

- `list` - The list of dictionaries.

<a id="bw2io.importers.excel_lcia.ExcelLCIAImporter"></a>

## ExcelLCIAImporter Objects

```python
class ExcelLCIAImporter(LCIAImporter)
```

Generic Excel LCIA importer.

**Attributes**:

- `format` _str_ - The file format. The default format is CSV.
- `extractor` _class_ - The file extractor class.

<a id="bw2io.importers.excel_lcia.ExcelLCIAImporter.format"></a>

#### format

<a id="bw2io.importers.excel_lcia.ExcelLCIAImporter.extractor"></a>

#### extractor

<a id="bw2io.importers.excel_lcia.ExcelLCIAImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(filepath, name, description, unit, **metadata)
```

Initializes the ExcelLCIAImporter object.

**Arguments**:

- `filepath` _str_ - The path to the Excel file.
- `name` _tuple_ - The name of the LCIA method.
- `description` _str_ - The description of the LCIA method.
- `unit` _str_ - The unit of the LCIA method.
- `**metadata` - The metadata associated with the LCIA method.

<a id="bw2io.importers.excel_lcia.CSVLCIAImporter"></a>

## CSVLCIAImporter Objects

```python
class CSVLCIAImporter(ExcelLCIAImporter)
```

Generic CSV LCIA importer.

**Attributes**:

- `format` _str_ - The file format.
- `extractor` _class_ - The file extractor class.

<a id="bw2io.importers.excel_lcia.CSVLCIAImporter.format"></a>

#### format

<a id="bw2io.importers.excel_lcia.CSVLCIAImporter.extractor"></a>

#### extractor
