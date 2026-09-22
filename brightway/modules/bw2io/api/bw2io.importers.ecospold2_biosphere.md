**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.ecospold2_biosphere` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.ecospold2_biosphere cfg.yml > bw2io.importers.ecospold2_biosphere.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.ecospold2_biosphere"></a>

# bw2io.importers.ecospold2\_biosphere

<a id="bw2io.importers.ecospold2_biosphere.EMISSIONS_CATEGORIES"></a>

#### EMISSIONS\_CATEGORIES

<a id="bw2io.importers.ecospold2_biosphere.Ecospold2BiosphereImporter"></a>

## Ecospold2BiosphereImporter Objects

```python
class Ecospold2BiosphereImporter(LCIImporter)
```

Import elementary flows from ecoinvent xml format.

Attributes
----------
format : str
    Format of the data: "Ecoinvent XML".
db_name : str
    Name of the database.
data : list
    Extracted data from the xml file.
strategies : list
    List of functions to apply to the extracted data.

See Also
--------
https://github.com/brightway-lca/brightway2-io/tree/main/bw2io/strategies

<a id="bw2io.importers.ecospold2_biosphere.Ecospold2BiosphereImporter.format"></a>

#### format

<a id="bw2io.importers.ecospold2_biosphere.Ecospold2BiosphereImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(name: str = "biosphere3",
             version: str = "3.9",
             filepath: Optional[Path] = None)
```

Initialize the importer.

Parameters
----------
name : str, optional
    Name of the database, by default "biosphere3".
version : str, optional
    Version of the database, by default "3.9".

<a id="bw2io.importers.ecospold2_biosphere.Ecospold2BiosphereImporter.extract"></a>

#### extract

```python
def extract(version: Optional[str] = None, filepath: Optional[Path] = None)
```

Extract elementary flows from the xml file.

Parameters
----------
version
    Version of the database if using default data.
filepath
    File path of user-specified data file

Returns
-------
list
    Extracted data from the xml file.
