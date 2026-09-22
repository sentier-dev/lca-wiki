**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.simapro_block_csv` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.simapro_block_csv cfg.yml > bw2io.importers.simapro_block_csv.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.simapro_block_csv"></a>

# bw2io.importers.simapro\_block\_csv

<a id="bw2io.importers.simapro_block_csv.SimaProBlockCSVImporter"></a>

## SimaProBlockCSVImporter Objects

```python
class SimaProBlockCSVImporter(LCIImporter)
```

<a id="bw2io.importers.simapro_block_csv.SimaProBlockCSVImporter.format"></a>

#### format

<a id="bw2io.importers.simapro_block_csv.SimaProBlockCSVImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(path_or_stream: Union[Path, StringIO],
             database_name: Optional[str] = None,
             biosphere_database_name: Optional[str] = None,
             separate_products: bool = True,
             shorten_names: bool = True)
```

<a id="bw2io.importers.simapro_block_csv.SimaProBlockCSVImporter.create_regionalized_biosphere_proxies"></a>

#### create\_regionalized\_biosphere\_proxies

```python
def create_regionalized_biosphere_proxies(database_name: str) -> None
```

Create proxy nodes for regionalized biosphere flows in a separate database.

In Brightway, regionalized biosphere flows get their locations from the processes which
produce them. In other systems, this isn't always the case. For example, in SimaPro, you
can have a flow like "Water, Europe".

This method aligns data imports with the Brightway ontology by getting or creating a new
proxy process for "Water", taking place in "Europe", in the database "database_name". This
process has a unitary production exchange, and a biosphere edge to an actual "Water" flow.

This method **assumes you have already found and linked** a suitable biosphere flow - we
need this during proxy node creation.

``database_name`` is the database to store the proxies; it can already exist. It will
use existing proxy nodes if possible.

<a id="bw2io.importers.simapro_block_csv.SimaProBlockCSVImporter.create_technosphere_placeholders"></a>

#### create\_technosphere\_placeholders

```python
def create_technosphere_placeholders(database_name: str)
```

Create new placeholder database from unlinked technosphere flows in ``self.data``

<a id="bw2io.importers.simapro_block_csv.SimaProBlockCSVImporter.use_ecoinvent_strategies"></a>

#### use\_ecoinvent\_strategies

```python
def use_ecoinvent_strategies() -> None
```

Switch strategy selection to normalize data to ecoinvent flow lists

<a id="bw2io.importers.simapro_block_csv.SimaProBlockCSVImporter.normalize_labels_to_brightway_standard"></a>

#### normalize\_labels\_to\_brightway\_standard

```python
def normalize_labels_to_brightway_standard() -> None
```

<a id="bw2io.importers.simapro_block_csv.SimaProBlockCSVImporter.write_database"></a>

#### write\_database

```python
def write_database(backend: Optional[str] = None,
                   activate_parameters: bool = True,
                   searchable: bool = True) -> Database
```
