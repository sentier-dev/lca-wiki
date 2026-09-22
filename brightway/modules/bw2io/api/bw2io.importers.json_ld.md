**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.json_ld` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.json_ld cfg.yml > bw2io.importers.json_ld.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.json_ld"></a>

# bw2io.importers.json\_ld

<a id="bw2io.importers.json_ld.JSONLDImporter"></a>

## JSONLDImporter Objects

```python
class JSONLDImporter(LCIImporter)
```

Importer for the `OLCD JSON-LD data format <https://github.com/GreenDelta/olca-schema>`__.

See `discussion with linked issues here <https://github.com/brightway-lca/brightway2-io/issues/15>`__.

<a id="bw2io.importers.json_ld.JSONLDImporter.format"></a>

#### format

<a id="bw2io.importers.json_ld.JSONLDImporter.extractor"></a>

#### extractor

<a id="bw2io.importers.json_ld.JSONLDImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(dirpath, database_name, preferred_allocation=None)
```

<a id="bw2io.importers.json_ld.JSONLDImporter.apply_strategies"></a>

#### apply\_strategies

```python
def apply_strategies(*args, **kwargs)
```

<a id="bw2io.importers.json_ld.JSONLDImporter.merge_biosphere_flows"></a>

#### merge\_biosphere\_flows

```python
def merge_biosphere_flows()
```

Add flows in ``self.biosphere_database`` to ``self.data``.

<a id="bw2io.importers.json_ld.JSONLDImporter.write_separate_biosphere_database"></a>

#### write\_separate\_biosphere\_database

```python
def write_separate_biosphere_database()
```

<a id="bw2io.importers.json_ld.JSONLDImporter.flows_as_biosphere_database"></a>

#### flows\_as\_biosphere\_database

```python
def flows_as_biosphere_database(data, database_name, suffix=" biosphere")
```

<a id="bw2io.importers.json_ld.JSONLDImporter.flows_as_products"></a>

#### flows\_as\_products

```python
def flows_as_products(data)
```
