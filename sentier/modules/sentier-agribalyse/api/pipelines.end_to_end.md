**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `pipelines.end_to_end` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m pipelines.end_to_end cfg.yml > pipelines.end_to_end.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="pipelines.end_to_end"></a>

# pipelines.end\_to\_end

``EndToEndPipeline`` — link → register methods → score a sample of products.

<a id="pipelines.end_to_end.EndToEndOptions"></a>

## EndToEndOptions Objects

```python
@dataclass(frozen=True)
class EndToEndOptions()
```

<a id="pipelines.end_to_end.EndToEndOptions.skip_linking"></a>

#### skip\_linking

<a id="pipelines.end_to_end.EndToEndOptions.skip_ecoinvent"></a>

#### skip\_ecoinvent

<a id="pipelines.end_to_end.EndToEndOptions.solver"></a>

#### solver

<a id="pipelines.end_to_end.EndToEndOptions.n_sample_products"></a>

#### n\_sample\_products

<a id="pipelines.end_to_end.EndToEndPipeline"></a>

## EndToEndPipeline Objects

```python
@dataclass
class EndToEndPipeline()
```

<a id="pipelines.end_to_end.EndToEndPipeline.settings"></a>

#### settings

<a id="pipelines.end_to_end.EndToEndPipeline.options"></a>

#### options

<a id="pipelines.end_to_end.EndToEndPipeline.run"></a>

#### run

```python
def run() -> dict[str, Any]
```
