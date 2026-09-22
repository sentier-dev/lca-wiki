**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.exiobase3_monetary` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.exiobase3_monetary cfg.yml > bw2io.importers.exiobase3_monetary.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.exiobase3_monetary"></a>

# bw2io.importers.exiobase3\_monetary

<a id="bw2io.importers.exiobase3_monetary.Exiobase3MonetaryImporter"></a>

## Exiobase3MonetaryImporter Objects

```python
class Exiobase3MonetaryImporter(LCIImporter)
```

<a id="bw2io.importers.exiobase3_monetary.Exiobase3MonetaryImporter.format"></a>

#### format

<a id="bw2io.importers.exiobase3_monetary.Exiobase3MonetaryImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(dirpath, db_name, ignore_small_balancing_corrections=True)
```

<a id="bw2io.importers.exiobase3_monetary.Exiobase3MonetaryImporter.apply_strategy"></a>

#### apply\_strategy

```python
def apply_strategy(*args, **kwargs)
```

<a id="bw2io.importers.exiobase3_monetary.Exiobase3MonetaryImporter.add_unlinked_flows_to_new_biosphere_database"></a>

#### add\_unlinked\_flows\_to\_new\_biosphere\_database

```python
def add_unlinked_flows_to_new_biosphere_database(biosphere_name=None)
```

<a id="bw2io.importers.exiobase3_monetary.Exiobase3MonetaryImporter.write_activities_as_database"></a>

#### write\_activities\_as\_database

```python
def write_activities_as_database()
```

<a id="bw2io.importers.exiobase3_monetary.Exiobase3MonetaryImporter.patch_lcia_methods"></a>

#### patch\_lcia\_methods

```python
def patch_lcia_methods(new_biosphere)
```

<a id="bw2io.importers.exiobase3_monetary.Exiobase3MonetaryImporter.apply_strategies"></a>

#### apply\_strategies

```python
def apply_strategies(biosphere=None)
```

<a id="bw2io.importers.exiobase3_monetary.Exiobase3MonetaryImporter.write_database"></a>

#### write\_database

```python
def write_database(biosphere=None)
```
