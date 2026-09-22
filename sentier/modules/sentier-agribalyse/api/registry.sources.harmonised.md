**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `registry.sources.harmonised` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m registry.sources.harmonised cfg.yml > registry.sources.harmonised.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="registry.sources.harmonised"></a>

# registry.sources.harmonised

``HarmonisedFlowsSource`` — Sentier/Brightway harmonised flow registry → tier 4.

<a id="registry.sources.harmonised.HarmonisedFlowsSource"></a>

## HarmonisedFlowsSource Objects

```python
@dataclass(frozen=True)
class HarmonisedFlowsSource()
```

Read ``harmonised-flows-simple.json.gz`` and emit one mapping per altLabel.

When ``valid_uuids`` is provided, flows whose ``identifier`` is not in the
set are skipped — these UUIDs have no CF data and would silently zero out
at LCIA time, matching pre-refactor behavior (≈4k of 79k harmonised entries).

<a id="registry.sources.harmonised.HarmonisedFlowsSource.path"></a>

#### path

<a id="registry.sources.harmonised.HarmonisedFlowsSource.target_db"></a>

#### target\_db

<a id="registry.sources.harmonised.HarmonisedFlowsSource.tier"></a>

#### tier

<a id="registry.sources.harmonised.HarmonisedFlowsSource.provenance"></a>

#### provenance

<a id="registry.sources.harmonised.HarmonisedFlowsSource.valid_uuids"></a>

#### valid\_uuids

<a id="registry.sources.harmonised.HarmonisedFlowsSource.gz"></a>

#### gz

type: ignore[assignment]

<a id="registry.sources.harmonised.HarmonisedFlowsSource.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__() -> None
```

<a id="registry.sources.harmonised.HarmonisedFlowsSource.read"></a>

#### read

```python
def read() -> list[Mapping]
```
