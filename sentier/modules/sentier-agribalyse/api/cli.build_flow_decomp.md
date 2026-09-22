**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.build_flow_decomp` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.build_flow_decomp cfg.yml > cli.build_flow_decomp.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.build_flow_decomp"></a>

# cli.build\_flow\_decomp

``dds-build-flow-decomp`` — one-shot build of per-product flow JSONs.

Loads the cached :class:`~scoring.scoring_package.ScoringPackage` (the
same one ``dds-backtest`` / ``dds-decompose-score`` consume) and the
backtest ``scores.parquet`` (filter ``mapped == True``), then walks
every product × every short-id method in
:class:`~reporting.backtest_dashboard_csv.BacktestPass1Emitter` and
writes one JSON per product to ``--out`` (default
``dashboard/decomp/``). The dashboard fetches these lazily on cell
click.

Standalone by design — not wired into ``dds-backtest`` so a backtest
run does not pay the 3-5 minute decomposition cost. Re-run this CLI
after the registry or scoring package changes.

<a id="cli.build_flow_decomp.BuildFlowDecompCli"></a>

## BuildFlowDecompCli Objects

```python
@dataclass
class BuildFlowDecompCli(BaseCli)
```

<a id="cli.build_flow_decomp.BuildFlowDecompCli.PROG"></a>

#### PROG

<a id="cli.build_flow_decomp.BuildFlowDecompCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.build_flow_decomp.BuildFlowDecompCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.build_flow_decomp.BuildFlowDecompCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.build_flow_decomp.main"></a>

#### main

```python
def main() -> int
```
