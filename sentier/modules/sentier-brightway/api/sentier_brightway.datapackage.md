**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.datapackage` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-brightway repo && git -C repo checkout a9dba75
SP=repo/src
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
  -I "$SP" -m sentier_brightway.datapackage cfg.yml > sentier_brightway.datapackage.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.datapackage"></a>

# sentier\_brightway.datapackage

bw_processing datapackages from the ``Registry``, plus a bw2data-free scoring helper.

Layout under the ``bw_package`` folder::

    bw_package/bafu-2026/                 technosphere + biosphere vectors (one datapackage)
    bw_package/methods/<method_slug>/     one characterization datapackage per method

Semantics follow bw2calc: technosphere *inputs* carry ``flip=True`` (bw2calc negates them
when building the matrix); production, biosphere and characterization rows are not flipped
(no flip vector is written for those); characterization rows sit on the diagonal
``(flow_bw_id, flow_bw_id)``.

v0.1 exports static vectors only: the registry's ``uncertainty_type``/``loc``/``scale``/
``minimum``/``maximum``/``negative`` columns are NOT written, so Monte Carlo runs on these
datapackages see fixed amounts.

<a id="sentier_brightway.datapackage.INVENTORY_DIR"></a>

#### INVENTORY\_DIR

<a id="sentier_brightway.datapackage.METHODS_DIR"></a>

#### METHODS\_DIR

<a id="sentier_brightway.datapackage.REGISTRY_DIR"></a>

#### REGISTRY\_DIR

<a id="sentier_brightway.datapackage.PACKAGE_DIR"></a>

#### PACKAGE\_DIR

<a id="sentier_brightway.datapackage.TECHNOSPHERE_TYPES"></a>

#### TECHNOSPHERE\_TYPES

<a id="sentier_brightway.datapackage.DatapackagePaths"></a>

## DatapackagePaths Objects

```python
@dataclass(frozen=True)
class DatapackagePaths()
```

<a id="sentier_brightway.datapackage.DatapackagePaths.inventory"></a>

#### inventory

<a id="sentier_brightway.datapackage.DatapackagePaths.methods"></a>

#### methods

method_id -> folder

<a id="sentier_brightway.datapackage.method_slug"></a>

#### method\_slug

```python
def method_slug(method_id: str) -> str
```

``ef-3.1:climate-change`` -> ``ef-3.1__climate-change``; anything else outside
``[A-Za-z0-9._-]`` becomes ``_`` so the slug is a safe folder name.

<a id="sentier_brightway.datapackage.write_datapackages"></a>

#### write\_datapackages

```python
def write_datapackages(registry: Registry, root: Path) -> DatapackagePaths
```

Write the inventory datapackage and one per method under ``root`` (the ``bw_package``
folder). A rewrite replaces the whole ``bw_package`` content: the inventory and methods
folders are wiped first, so methods dropped from the registry do not linger on disk.
Raises ``ValueError`` before touching the disk if an exchange references a ``bw_id``
missing from the registry or a method has no characterization factors.

<a id="sentier_brightway.datapackage.load_inventory_datapackage"></a>

#### load\_inventory\_datapackage

```python
def load_inventory_datapackage(out_dir: Path) -> bwp.Datapackage
```

``out_dir`` is the folder holding ``bw_package/``.

<a id="sentier_brightway.datapackage.load_method_datapackage"></a>

#### load\_method\_datapackage

```python
def load_method_datapackage(out_dir: Path, method_id: str) -> bwp.Datapackage
```

Located by folder, not by the datapackage ``name``: bw_processing normalises ``name``
(``ef-3.1__climate-change`` becomes ``ef-3.1_climate-change``); the folder and ``id``
keep the slug.

<a id="sentier_brightway.datapackage.score"></a>

#### score

```python
def score(out_dir: Path, process_code: str, method_id: str) -> float
```

LCIA score of 1 unit of ``process_code`` with stock bw2calc; no bw2data project.

``out_dir`` is the folder holding ``registry/`` and ``bw_package/``.
