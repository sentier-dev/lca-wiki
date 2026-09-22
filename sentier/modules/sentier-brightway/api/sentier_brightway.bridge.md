**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.bridge` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_brightway.bridge cfg.yml > sentier_brightway.bridge.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.bridge"></a>

# sentier\_brightway.bridge

Read the ordered ``bafu-2026-v1 -> ef-3.1`` randonneur packages from sentier-mappings.

Only ``replace`` entries relink a source flow to a different target flow. A randonneur
``update`` entry edits fields on the *same* flow (for example a unit-spelling
normalisation) and names no new target to relink to, so it is ignored here.

<a id="sentier_brightway.bridge.SUPPORTED_SCHEMA_MAJOR"></a>

#### SUPPORTED\_SCHEMA\_MAJOR

<a id="sentier_brightway.bridge.BridgeEntry"></a>

## BridgeEntry Objects

```python
@dataclass(frozen=True)
class BridgeEntry()
```

<a id="sentier_brightway.bridge.BridgeEntry.target_code"></a>

#### target\_code

<a id="sentier_brightway.bridge.BridgeEntry.target_unit"></a>

#### target\_unit

<a id="sentier_brightway.bridge.BridgeEntry.conversion_factor"></a>

#### conversion\_factor

<a id="sentier_brightway.bridge.BridgeEntry.nomenclature"></a>

#### nomenclature

target EF flow carries no factor in any EF 3.1 method

<a id="sentier_brightway.bridge.BridgeEntry.target_location"></a>

#### target\_location

<a id="sentier_brightway.bridge.applied_packages"></a>

#### applied\_packages

```python
def applied_packages(data_root: Path,
                     include_nomenclature: bool = True) -> tuple[str, ...]
```

File names of the packages ``load_bridge`` applies, in application order.

<a id="sentier_brightway.bridge.load_bridge"></a>

#### load\_bridge

```python
def load_bridge(
        data_root: Path,
        include_nomenclature: bool = True) -> Mapping[str, BridgeEntry]
```

``{bafu_flow_code: BridgeEntry}``; packages apply in ``metadata.json`` order, first wins.
