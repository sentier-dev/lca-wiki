**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.simapro_lcia_csv` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.simapro_lcia_csv cfg.yml > bw2io.importers.simapro_lcia_csv.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.simapro_lcia_csv"></a>

# bw2io.importers.simapro\_lcia\_csv

<a id="bw2io.importers.simapro_lcia_csv.SimaProLCIACSVImporter"></a>

## SimaProLCIACSVImporter Objects

```python
class SimaProLCIACSVImporter(LCIAImporter)
```

Importer for SimaPro CSV LCIA data format.

Parameters
----------
filepath : str
    Path to the SimaPro CSV LCIA file.
biosphere : str, optional
    Name of the biosphere database to use. Default is None, which uses the current
    project's default biosphere.
delimiter : str, optional
    Delimiter used in the CSV file. Default is ';'.
encoding : str, optional
    Character encoding used in the CSV file. Default is 'latin-1'.
normalize_biosphere : bool, optional
    Whether to normalize biosphere flows using the included strategies.
    Default is True.

Notes
-----
This importer extracts SimaPro CSV LCIA data.

If ``normalize_biosphere=True``, the following strategies are applied:

* ``normalize_units``
* ``set_biosphere_type``
* ``normalize_simapro_biosphere_categories``
* ``normalize_simapro_biosphere_names``

<a id="bw2io.importers.simapro_lcia_csv.SimaProLCIACSVImporter.format"></a>

#### format

<a id="bw2io.importers.simapro_lcia_csv.SimaProLCIACSVImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(filepath,
             biosphere=None,
             delimiter=";",
             encoding="latin-1",
             normalize_biosphere=True)
```
