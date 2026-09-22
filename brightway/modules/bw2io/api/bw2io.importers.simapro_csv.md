**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.simapro_csv` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.simapro_csv cfg.yml > bw2io.importers.simapro_csv.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.simapro_csv"></a>

# bw2io.importers.simapro\_csv

<a id="bw2io.importers.simapro_csv.SimaProCSVImporter"></a>

## SimaProCSVImporter Objects

```python
class SimaProCSVImporter(LCIImporter)
```

<a id="bw2io.importers.simapro_csv.SimaProCSVImporter.format"></a>

#### format

<a id="bw2io.importers.simapro_csv.SimaProCSVImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(filepath,
             name=None,
             delimiter=";",
             encoding="latin-1",
             normalize_biosphere=True,
             biosphere_db=None,
             extractor=SimaProCSVExtractor)
```

<a id="bw2io.importers.simapro_csv.SimaProCSVImporter.get_db_name"></a>

#### get\_db\_name

```python
def get_db_name()
```

<a id="bw2io.importers.simapro_csv.SimaProCSVImporter.write_database"></a>

#### write\_database

```python
def write_database(data=None, name=None, *args, **kwargs)
```

<a id="bw2io.importers.simapro_csv.SimaProCSVImporter.match_ecoinvent2"></a>

#### match\_ecoinvent2

```python
def match_ecoinvent2(db_name)
```
