**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.json_ld_lcia` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.json_ld_lcia cfg.yml > bw2io.importers.json_ld_lcia.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.json_ld_lcia"></a>

# bw2io.importers.json\_ld\_lcia

<a id="bw2io.importers.json_ld_lcia.JSONLDLCIAImporter"></a>

## JSONLDLCIAImporter Objects

```python
class JSONLDLCIAImporter(LCIAImporter)
```

Importer for the `OLCD JSON-LD LCIA data format <https://github.com/GreenDelta/olca-schema>`__.

Parameters
----------
dirpath: str
    Directory path for the JSON-LD data.

Attributes
----------
format: str
    Data format description.
extractor: :class:`JSONLDExtractor`
    Extractor class for the JSON-LD data.
data: dict
    Extracted LCIA data.
strategies: list
    List of strategies to apply to the LCIA data.

Methods
-------
match_biosphere_by_id(database_name)
    Matches biosphere flows to a specified database by ID.

<a id="bw2io.importers.json_ld_lcia.JSONLDLCIAImporter.format"></a>

#### format

<a id="bw2io.importers.json_ld_lcia.JSONLDLCIAImporter.extractor"></a>

#### extractor

<a id="bw2io.importers.json_ld_lcia.JSONLDLCIAImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(dirpath)
```

Initialize the JSONLDLCIAImporter object.

Parameters
----------
dirpath: str
    Directory path for the JSON-LD data.

Returns
-------
None

<a id="bw2io.importers.json_ld_lcia.JSONLDLCIAImporter.match_biosphere_by_id"></a>

#### match\_biosphere\_by\_id

```python
def match_biosphere_by_id(database_name)
```

Matches biosphere flows to a specified database by ID.

Parameters
----------
database_name: str
    Name of the biosphere database.

Returns
-------
None
