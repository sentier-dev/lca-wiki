**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.eaternity.inference` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-importers repo && git -C repo checkout dac2e67
SP=repo/app
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
  -I "$SP" -m sentier_importers.sources.eaternity.inference cfg.yml > sentier_importers.sources.eaternity.inference.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.eaternity.inference"></a>

# sentier\_importers.sources.eaternity.inference

Compose the ecoinvent-biosphere3 -> eaternity-bafu-ext bridge with CF identity into
bafu-2026-v1 -> ef-3.1.

For every ecoinvent-biosphere3 -> eaternity-bafu-ext entry the Eaternity target is
placed at BAFU sub-compartment level (:mod:`bridge`), and the biosphere3 source is
resolved to its EF twin (:mod:`cf_identity`). The composition asserts one thing per
entry: *this BAFU flow receives this EF characterization factor*. Flows the curated
package already maps are skipped, so the emitted package only fills gaps and the
curated package keeps precedence by construction; everything that cannot be asserted
goes to the review sidecar with a reason rather than being guessed at. That includes a
BAFU flow reached by several biosphere3 partners that resolve to different EF flows.

<a id="sentier_importers.sources.eaternity.inference.EF_UNIT"></a>

#### EF\_UNIT

BAFU unit -> the spelling the curated package uses on the EF side. EF ionising-
radiation factors are per kBq, so a Bq source lands on a kBq target (with the
``conversion_factor`` the resolver supplies). Unknown units keep the BAFU spelling.

<a id="sentier_importers.sources.eaternity.inference.Inputs"></a>

## Inputs Objects

```python
@dataclass(frozen=True)
class Inputs()
```

<a id="sentier_importers.sources.eaternity.inference.Inputs.eaternity_pairs"></a>

#### eaternity\_pairs

<a id="sentier_importers.sources.eaternity.inference.Inputs.curated_codes"></a>

#### curated\_codes

<a id="sentier_importers.sources.eaternity.inference.Inputs.bafu"></a>

#### bafu

<a id="sentier_importers.sources.eaternity.inference.Inputs.vectors"></a>

#### vectors

<a id="sentier_importers.sources.eaternity.inference.Inputs.labels"></a>

#### labels

<a id="sentier_importers.sources.eaternity.inference.Inference"></a>

## Inference Objects

```python
@dataclass
class Inference()
```

<a id="sentier_importers.sources.eaternity.inference.Inference.entries"></a>

#### entries

<a id="sentier_importers.sources.eaternity.inference.Inference.review"></a>

#### review

<a id="sentier_importers.sources.eaternity.inference.Inference.skipped_in_curated"></a>

#### skipped\_in\_curated

<a id="sentier_importers.sources.eaternity.inference.entry_for"></a>

#### entry\_for

```python
def entry_for(flow: BafuFlow, twin: Twin, factor: float,
              labels: EfLabels) -> Record
```

<a id="sentier_importers.sources.eaternity.inference.infer"></a>

#### infer

```python
def infer(inputs: Inputs) -> Inference
```

Entries for BAFU flows the curated package lacks, plus a review row per withheld pair.
