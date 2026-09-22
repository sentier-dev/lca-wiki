**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.ecospold1_lcia` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.ecospold1_lcia cfg.yml > bw2io.importers.ecospold1_lcia.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.ecospold1_lcia"></a>

# bw2io.importers.ecospold1\_lcia

<a id="bw2io.importers.ecospold1_lcia.Ecospold1LCIAImporter"></a>

## Ecospold1LCIAImporter Objects

```python
class Ecospold1LCIAImporter(LCIAImporter)
```

Importer for Ecospold1 LCIA format.

Attributes
----------
format : str
    The format of the LCIA data, which is "Ecospold1 LCIA".
data : dict
    The LCIA data extracted from the Ecospold1 LCIA file.

<a id="bw2io.importers.ecospold1_lcia.Ecospold1LCIAImporter.format"></a>

#### format

<a id="bw2io.importers.ecospold1_lcia.Ecospold1LCIAImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(filepath, biosphere=None)
```

Initialize the Ecospold1LCIAImporter instance.

Parameters
----------
filepath : str
    Path to the Ecospold1 LCIA file.
biosphere : bw2data.BiosphereDatabase, optional
    Biosphere database to use. If None, the default biosphere database will be used.
