**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `reporting.product_reasons` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m reporting.product_reasons cfg.yml > reporting.product_reasons.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="reporting.product_reasons"></a>

# reporting.product\_reasons

``product_reasons.py`` — author per-product × outlier-impact explanations.

The backtest dashboard already carries *per-impact* outlier notes
(``outlier_reasons.json``, one paragraph per impact category). This module
adds the *per-product* layer: for every product × impact cell whose |%diff|
versus the ADEME reference clears a threshold, an LLM authors a one- to
two-sentence, product-specific explanation grounded in that product's flow
decomposition. The dashboard renders these above the impact-level note in the
cell tooltip.

The pipeline is three deterministic classes plus one LLM-backed orchestrator:

* :class:`ProductOutlierScanner` — reads ``backtest_pass1.csv`` and groups the
  outlier cells by product.
* :class:`DecompEvidence` — pulls the top contributing flows for one
  product × method out of ``dashboard/decomp/<code>.json``.
* :class:`ProductReasonPrompt` — turns a product's outliers + decomp evidence
  + the impact-level notes into a ``(system, user)`` prompt pair and parses the
  model's JSON reply.
* :class:`ProductReasonGenerator` — walks the products, calls an
  :class:`~llm.client.LlmClient`, and writes ``product_reasons.json``.

The deterministic classes are unit-tested with a stub client; no network or
CLI calls happen in CI.

<a id="reporting.product_reasons.OutlierImpact"></a>

## OutlierImpact Objects

```python
class OutlierImpact(NamedTuple)
```

One product × impact cell that cleared the outlier threshold.

<a id="reporting.product_reasons.OutlierImpact.short"></a>

#### short

method short id, e.g. "ht_c"

<a id="reporting.product_reasons.OutlierImpact.label"></a>

#### label

human method name, e.g. "human toxicity: carcinogenic"

<a id="reporting.product_reasons.OutlierImpact.pct"></a>

#### pct

signed %diff (model vs ADEME reference)

<a id="reporting.product_reasons.OutlierImpact.direction"></a>

#### direction

```python
@property
def direction() -> str
```

<a id="reporting.product_reasons.ProductOutliers"></a>

## ProductOutliers Objects

```python
@dataclass(frozen=True)
class ProductOutliers()
```

A product and the outlier impacts found for it.

<a id="reporting.product_reasons.ProductOutliers.code"></a>

#### code

<a id="reporting.product_reasons.ProductOutliers.name"></a>

#### name

<a id="reporting.product_reasons.ProductOutliers.impacts"></a>

#### impacts

<a id="reporting.product_reasons.FlowLine"></a>

## FlowLine Objects

```python
@dataclass(frozen=True)
class FlowLine()
```

One contributing flow, distilled for the prompt.

<a id="reporting.product_reasons.FlowLine.flow_name"></a>

#### flow\_name

<a id="reporting.product_reasons.FlowLine.compartment"></a>

#### compartment

<a id="reporting.product_reasons.FlowLine.sub_compartment"></a>

#### sub\_compartment

<a id="reporting.product_reasons.FlowLine.cf"></a>

#### cf

<a id="reporting.product_reasons.FlowLine.sp_cf"></a>

#### sp\_cf

<a id="reporting.product_reasons.FlowLine.share_pct"></a>

#### share\_pct

<a id="reporting.product_reasons.FlowLine.provenance"></a>

#### provenance

<a id="reporting.product_reasons.FlowLine.contribution_sign"></a>

#### contribution\_sign

<a id="reporting.product_reasons.FlowLine.cf_delta_pct"></a>

#### cf\_delta\_pct

```python
@property
def cf_delta_pct() -> float | None
```

``(EF CF − SimaPro CF) / |SimaPro CF|`` as a percent, or ``None``.

<a id="reporting.product_reasons.FlowLine.render"></a>

#### render

```python
def render() -> str
```

<a id="reporting.product_reasons.ProductOutlierScanner"></a>

## ProductOutlierScanner Objects

```python
@dataclass(frozen=True)
class ProductOutlierScanner()
```

Group the backtest CSV's outlier cells by product.

``rows`` is the parsed ``backtest_pass1.csv`` (list of dict rows). Only
``resolution == 'mapped'`` rows are considered; cells whose |%diff| is at
or above ``threshold_pct`` become outliers.

<a id="reporting.product_reasons.ProductOutlierScanner.rows"></a>

#### rows

<a id="reporting.product_reasons.ProductOutlierScanner.threshold_pct"></a>

#### threshold\_pct

<a id="reporting.product_reasons.ProductOutlierScanner.scan"></a>

#### scan

```python
def scan() -> list[ProductOutliers]
```

<a id="reporting.product_reasons.ProductOutlierScanner.parse_csv"></a>

#### parse\_csv

```python
@staticmethod
def parse_csv(text: str) -> list[dict[str, str]]
```

Parse ``backtest_pass1.csv`` into row dicts using the stdlib reader.

<a id="reporting.product_reasons.DecompEvidence"></a>

## DecompEvidence Objects

```python
@dataclass(frozen=True)
class DecompEvidence()
```

Read top contributing flows for one product × method from its decomp JSON.

<a id="reporting.product_reasons.DecompEvidence.decomp_dir"></a>

#### decomp\_dir

<a id="reporting.product_reasons.DecompEvidence.top_n"></a>

#### top\_n

<a id="reporting.product_reasons.DecompEvidence.min_share_pct"></a>

#### min\_share\_pct

<a id="reporting.product_reasons.DecompEvidence.for_product"></a>

#### for\_product

```python
def for_product(code: str) -> dict | None
```

<a id="reporting.product_reasons.DecompEvidence.flows"></a>

#### flows

```python
def flows(decomp: dict, short: str) -> list[FlowLine]
```

<a id="reporting.product_reasons.ProductReasonPrompt"></a>

## ProductReasonPrompt Objects

```python
@dataclass(frozen=True)
class ProductReasonPrompt()
```

Build the ``(system, user)`` prompt for one product and parse the reply.

<a id="reporting.product_reasons.ProductReasonPrompt.impact_notes"></a>

#### impact\_notes

<a id="reporting.product_reasons.ProductReasonPrompt.evidence"></a>

#### evidence

<a id="reporting.product_reasons.ProductReasonPrompt.SYSTEM"></a>

#### SYSTEM

<a id="reporting.product_reasons.ProductReasonPrompt.user"></a>

#### user

```python
def user(product: ProductOutliers, decomp: dict | None) -> str
```

<a id="reporting.product_reasons.ProductReasonPrompt.parse"></a>

#### parse

```python
@staticmethod
def parse(reply: str, wanted: Sequence[str]) -> dict[str, str]
```

Pull the JSON object out of the model reply, keeping only wanted keys.

<a id="reporting.product_reasons.ProductReasonGenerator"></a>

## ProductReasonGenerator Objects

```python
@dataclass
class ProductReasonGenerator()
```

Author per-product notes for every outlier product and write the JSON.

Resumable: existing entries in ``out_path`` are kept and their products
skipped unless ``force`` is set.

<a id="reporting.product_reasons.ProductReasonGenerator.client"></a>

#### client

<a id="reporting.product_reasons.ProductReasonGenerator.prompt"></a>

#### prompt

<a id="reporting.product_reasons.ProductReasonGenerator.out_path"></a>

#### out\_path

<a id="reporting.product_reasons.ProductReasonGenerator.max_workers"></a>

#### max\_workers

<a id="reporting.product_reasons.ProductReasonGenerator.force"></a>

#### force

<a id="reporting.product_reasons.ProductReasonGenerator.run"></a>

#### run

```python
def run(products: Sequence[ProductOutliers]) -> dict[str, dict[str, str]]
```
