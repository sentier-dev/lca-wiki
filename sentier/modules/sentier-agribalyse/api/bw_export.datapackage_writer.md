**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `bw_export.datapackage_writer` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-agribalyse repo && git -C repo checkout 3d0df56
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
  -I "$SP" -m bw_export.datapackage_writer cfg.yml > bw_export.datapackage_writer.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_export.datapackage_writer"></a>

# bw\_export.datapackage\_writer

``DatapackageWriter`` — EmbeddedInventory → bw_processing datapackages.

Writes one inventory datapackage (technosphere + biosphere) and one
characterization datapackage per method, each as a directory-filesystem
bw_processing datapackage. Matrix values are stored pre-signed with
``flip_array`` all-False so the matrices bw2calc assembles equal ``A``
and ``B`` exactly. Characterization is a diagonal on the biosphere flow
id. Demand is keyed by the product (row) id at calculation time.

<a id="bw_export.datapackage_writer.WriteResult"></a>

## WriteResult Objects

```python
@dataclass(frozen=True)
class WriteResult()
```

<a id="bw_export.datapackage_writer.WriteResult.inventory_path"></a>

#### inventory\_path

<a id="bw_export.datapackage_writer.WriteResult.method_paths"></a>

#### method\_paths

<a id="bw_export.datapackage_writer.WriteResult.product_ids"></a>

#### product\_ids

<a id="bw_export.datapackage_writer.DatapackageWriter"></a>

## DatapackageWriter Objects

```python
@dataclass(frozen=True)
class DatapackageWriter()
```

Stateless. ``write(embedded, out_root)`` lays out the datapackages.

<a id="bw_export.datapackage_writer.DatapackageWriter.write"></a>

#### write

```python
def write(embedded: EmbeddedInventory, out_root: Path) -> WriteResult
```
