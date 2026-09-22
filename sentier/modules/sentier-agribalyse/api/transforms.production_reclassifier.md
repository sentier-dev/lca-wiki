**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.production_reclassifier` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.production_reclassifier cfg.yml > transforms.production_reclassifier.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.production_reclassifier"></a>

# transforms.production\_reclassifier

``ProductionReclassifier`` — flips ``functional=False`` production rows to technosphere.

Agribalyse 3.2 SimaPro CSVs encode waste outputs and unallocated
co-products as ``production`` exchanges with ``functional: False``. In
the ecoinvent cutoff convention these belong on the technosphere side
(positive inputs into the corresponding waste-treatment activity), not
on the production side. Sign stays positive — the waste polluter is
also the consumer of the treatment activity.

<a id="transforms.production_reclassifier.ProductionReclassifier"></a>

## ProductionReclassifier Objects

```python
@dataclass(frozen=True)
class ProductionReclassifier()
```

<a id="transforms.production_reclassifier.ProductionReclassifier.apply"></a>

#### apply

```python
def apply(sp) -> dict[str, int]
```
