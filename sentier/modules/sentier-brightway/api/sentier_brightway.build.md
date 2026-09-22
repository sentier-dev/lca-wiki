**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.build` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_brightway.build cfg.yml > sentier_brightway.build.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.build"></a>

# sentier\_brightway.build

Turn Sentier frames into the ``{(db, code): node}`` dicts ``bw2data.Database.write`` takes.

<a id="sentier_brightway.build.Key"></a>

#### Key

<a id="sentier_brightway.build.BoundMethod"></a>

## BoundMethod Objects

```python
@dataclass(frozen=True)
class BoundMethod()
```

<a id="sentier_brightway.build.BoundMethod.key"></a>

#### key

<a id="sentier_brightway.build.BoundMethod.unit"></a>

#### unit

<a id="sentier_brightway.build.BoundMethod.description"></a>

#### description

<a id="sentier_brightway.build.BoundMethod.method_id"></a>

#### method\_id

<a id="sentier_brightway.build.BoundMethod.cfs"></a>

#### cfs

<a id="sentier_brightway.build.BuildResult"></a>

## BuildResult Objects

```python
@dataclass(frozen=True)
class BuildResult()
```

<a id="sentier_brightway.build.BuildResult.biosphere"></a>

#### biosphere

<a id="sentier_brightway.build.BuildResult.residual"></a>

#### residual

<a id="sentier_brightway.build.BuildResult.inventory"></a>

#### inventory

<a id="sentier_brightway.build.BuildResult.methods"></a>

#### methods

<a id="sentier_brightway.build.BuildResult.coverage"></a>

#### coverage

<a id="sentier_brightway.build.build_biosphere"></a>

#### build\_biosphere

```python
def build_biosphere(ef_flows: pd.DataFrame, units: Mapping[str, str],
                    methods: tuple[MethodSpec, ...]) -> dict[Key, dict]
```

One node per EF flow known to vocab, to any CF table, or to any bridge target.

``units`` is the first normalised target unit per EF code, as computed once by
``_bridge_units`` in ``build()`` (conflict warnings are also ``build()``'s job).

<a id="sentier_brightway.build.build_residual"></a>

#### build\_residual

```python
def build_residual(unmapped_codes: set[str], bafu_flows: pd.DataFrame,
                   exchanges: pd.DataFrame) -> dict[Key, dict]
```

<a id="sentier_brightway.build.EXCHANGE_FIELDS"></a>

#### EXCHANGE\_FIELDS

<a id="sentier_brightway.build.build_inventory"></a>

#### build\_inventory

```python
def build_inventory(inventory: Inventory,
                    bridge: Mapping[str, BridgeEntry]) -> dict[Key, dict]
```

<a id="sentier_brightway.build.build"></a>

#### build

```python
def build(inventory: Inventory, ef_flows: pd.DataFrame,
          bafu_flows: pd.DataFrame, bridge: Mapping[str, BridgeEntry],
          methods: tuple[MethodSpec, ...]) -> BuildResult
```
