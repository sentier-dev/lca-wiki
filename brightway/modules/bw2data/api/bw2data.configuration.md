**Generated API reference** · package `bw2data` 4.7 · module `bw2data.configuration` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2data==4.7'
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
  -I "$SP" -m bw2data.configuration cfg.yml > bw2data.configuration.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.configuration"></a>

# bw2data.configuration

<a id="bw2data.configuration.MatrixLabels"></a>

## MatrixLabels Objects

```python
class MatrixLabels(BaseSettings)
```

<a id="bw2data.configuration.MatrixLabels.lci_node_types"></a>

#### lci\_node\_types

<a id="bw2data.configuration.MatrixLabels.other_node_types"></a>

#### other\_node\_types

<a id="bw2data.configuration.MatrixLabels.process_node_types"></a>

#### process\_node\_types

<a id="bw2data.configuration.MatrixLabels.product_node_types"></a>

#### product\_node\_types

<a id="bw2data.configuration.MatrixLabels.process_node_default"></a>

#### process\_node\_default

<a id="bw2data.configuration.MatrixLabels.multifunctional_node_default"></a>

#### multifunctional\_node\_default

<a id="bw2data.configuration.MatrixLabels.chimaera_node_default"></a>

#### chimaera\_node\_default

<a id="bw2data.configuration.MatrixLabels.product_node_default"></a>

#### product\_node\_default

<a id="bw2data.configuration.MatrixLabels.biosphere_node_default"></a>

#### biosphere\_node\_default

<a id="bw2data.configuration.MatrixLabels.biosphere_edge_types"></a>

#### biosphere\_edge\_types

<a id="bw2data.configuration.MatrixLabels.technosphere_negative_edge_types"></a>

#### technosphere\_negative\_edge\_types

<a id="bw2data.configuration.MatrixLabels.technosphere_positive_edge_types"></a>

#### technosphere\_positive\_edge\_types

<a id="bw2data.configuration.MatrixLabels.substitution_edge_types"></a>

#### substitution\_edge\_types

<a id="bw2data.configuration.MatrixLabels.other_edge_types"></a>

#### other\_edge\_types

<a id="bw2data.configuration.MatrixLabels.production_edge_default"></a>

#### production\_edge\_default

<a id="bw2data.configuration.MatrixLabels.consumption_edge_default"></a>

#### consumption\_edge\_default

<a id="bw2data.configuration.MatrixLabels.biosphere_edge_default"></a>

#### biosphere\_edge\_default

<a id="bw2data.configuration.MatrixLabels.substitution_edge_default"></a>

#### substitution\_edge\_default

<a id="bw2data.configuration.MatrixLabels.implicit_production_allowed_node_types"></a>

#### implicit\_production\_allowed\_node\_types

```python
@property
def implicit_production_allowed_node_types()
```

<a id="bw2data.configuration.MatrixLabels.lci_edge_types"></a>

#### lci\_edge\_types

```python
@property
def lci_edge_types() -> List[str]
```

<a id="bw2data.configuration.MatrixLabels.edge_types"></a>

#### edge\_types

```python
@property
def edge_types() -> List[str]
```

<a id="bw2data.configuration.MatrixLabels.node_types"></a>

#### node\_types

```python
@property
def node_types() -> List[str]
```

<a id="bw2data.configuration.MatrixLabels.model_config"></a>

#### model\_config

<a id="bw2data.configuration.MatrixLabels.reload"></a>

#### reload

```python
def reload(fp: Path) -> None
```

Load new `.env` file and overwrite settings

<a id="bw2data.configuration.TypoSettings"></a>

## TypoSettings Objects

```python
class TypoSettings(BaseSettings)
```

<a id="bw2data.configuration.TypoSettings.node_types"></a>

#### node\_types

<a id="bw2data.configuration.TypoSettings.edge_types"></a>

#### edge\_types

<a id="bw2data.configuration.TypoSettings.node_keys"></a>

#### node\_keys

<a id="bw2data.configuration.TypoSettings.edge_keys"></a>

#### edge\_keys

<a id="bw2data.configuration.TypoSettings.model_config"></a>

#### model\_config

<a id="bw2data.configuration.Config"></a>

## Config Objects

```python
class Config(BaseSettings)
```

<a id="bw2data.configuration.Config.version"></a>

#### version

<a id="bw2data.configuration.Config.backends"></a>

#### backends

<a id="bw2data.configuration.Config.cache"></a>

#### cache

<a id="bw2data.configuration.Config.metadata"></a>

#### metadata

<a id="bw2data.configuration.Config.sqlite3_databases"></a>

#### sqlite3\_databases

<a id="bw2data.configuration.Config.model_config"></a>

#### model\_config

<a id="bw2data.configuration.Config.biosphere"></a>

#### biosphere

```python
@property
def biosphere()
```

Get name for ``biosphere`` database from user preferences.

Default name is ``biosphere3``; change this by changing ``config.p["biosphere_database"]``.

<a id="bw2data.configuration.Config.global_location"></a>

#### global\_location

```python
@property
def global_location()
```

Get name for global location from user preferences.

Default name is ``GLO``; change this by changing ``config.p["global_location"]``.

<a id="bw2data.configuration.labels"></a>

#### labels

<a id="bw2data.configuration.typo_settings"></a>

#### typo\_settings

<a id="bw2data.configuration.config"></a>

#### config
