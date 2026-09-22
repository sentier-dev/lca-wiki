**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.extractors.simapro_lcia_95project_csv` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.extractors.simapro_lcia_95project_csv cfg.yml > bw2io.extractors.simapro_lcia_95project_csv.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.extractors.simapro_lcia_95project_csv"></a>

# bw2io.extractors.simapro\_lcia\_95project\_csv

<a id="bw2io.extractors.simapro_lcia_95project_csv.EndOfDatasets"></a>

## EndOfDatasets Objects

```python
class EndOfDatasets(Exception)
```

<a id="bw2io.extractors.simapro_lcia_95project_csv.SimaProLCIA95ProjectCSVExtractor"></a>

## SimaProLCIA95ProjectCSVExtractor Objects

```python
class SimaProLCIA95ProjectCSVExtractor()
```

Extract data from SimaPro LCIA 9.5 Project CSV file format.

Differs from `SimaProLCIACSVExtractor` in that this format seems not to use
`End` at the end of sections.

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
    If the filepath does not exist or the file is not a valid SimaPro
    export file.

Returns
-------
list
    List of impact categories extracted from the SimaPro file.

<a id="bw2io.extractors.simapro_lcia_95project_csv.SimaProLCIA95ProjectCSVExtractor.extract"></a>

#### extract

```python
@classmethod
def extract(cls,
            filepath: Path,
            delimiter: str = ";",
            encoding: str = "cp1252")
```

<a id="bw2io.extractors.simapro_lcia_95project_csv.SimaProLCIA95ProjectCSVExtractor.clean_sections"></a>

#### clean\_sections

```python
@classmethod
def clean_sections(cls, sections: list) -> list
```

Remove empty sections, and empty lines from sections

<a id="bw2io.extractors.simapro_lcia_95project_csv.SimaProLCIA95ProjectCSVExtractor.split_into_sections"></a>

#### split\_into\_sections

```python
@classmethod
def split_into_sections(cls, data: list) -> list
```

Split the SimaPro file into sections using the blank line pattern

<a id="bw2io.extractors.simapro_lcia_95project_csv.SimaProLCIA95ProjectCSVExtractor.parse_cf"></a>

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
6. damage rate
