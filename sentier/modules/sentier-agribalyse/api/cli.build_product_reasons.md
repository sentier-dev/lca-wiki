**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.build_product_reasons` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.build_product_reasons cfg.yml > cli.build_product_reasons.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.build_product_reasons"></a>

# cli.build\_product\_reasons

``dds-build-product-reasons`` — author per-product outlier explanations.

Scans ``dashboard/backtest_pass1.csv`` for product × impact cells whose
|%diff| versus the ADEME reference clears ``--threshold``, then has an LLM
(local ``claude`` CLI by default) author a one- to two-sentence, product-
specific explanation for each, grounded in that product's flow decomposition
(``dashboard/decomp/<code>.json``) and the impact-level notes
(``dashboard/outlier_reasons.json``). Results are written to
``dashboard/product_reasons.json``.

Standalone and resumable — re-running skips products already covered (unless
``--force``); the output is checkpointed after every product so a long run
survives interruption. Re-run after a fresh backtest or decomposition.

Examples::

dds-build-product-reasons --limit 5          # sample run, validate quality
dds-build-product-reasons                    # full run (resumes)
dds-build-product-reasons --use-api --force  # rebuild from scratch via API

<a id="cli.build_product_reasons.BuildProductReasonsCli"></a>

## BuildProductReasonsCli Objects

```python
@dataclass
class BuildProductReasonsCli(BaseCli)
```

<a id="cli.build_product_reasons.BuildProductReasonsCli.PROG"></a>

#### PROG

<a id="cli.build_product_reasons.BuildProductReasonsCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.build_product_reasons.BuildProductReasonsCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.build_product_reasons.BuildProductReasonsCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.build_product_reasons.main"></a>

#### main

```python
def main() -> int
```
