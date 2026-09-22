**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.decompose_score` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.decompose_score cfg.yml > cli.decompose_score.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.decompose_score"></a>

# cli.decompose\_score

``dds-decompose-score`` — explain why a product scores what it scores.

Loads the cached :class:`~scoring.scoring_package.ScoringPackage` (the
same one ``dds-backtest`` consumes) and prints the per-biosphere-flow
contributions for one ``(product_key, method)`` pair. Activity and
edge contributions are intentionally omitted: in practice the flow
view is the one diagnosis users reach for, and the others were noise.

Usage::

    dds-decompose-score \
        --database agribalyse-3.2 \
        --code 88b91d4e5a9d46b697fd350423bcd087 \
        --method climate \
        --top-n 15 \
        [--inventory]   # also dump uncharacterised inventory

``--method`` accepts the short name from the backtest CSV (``climate``,
``cc_bio``, ``ecotox``, ``water`` …) and resolves to the full
4-tuple via :class:`MethodAliases` so the user doesn't have to type
the verbose ``("ecoinvent-3.9.1", "EF v3.1", "climate change",
"global warming potential (GWP100)")`` form.

<a id="cli.decompose_score.MethodAliases"></a>

## MethodAliases Objects

```python
@dataclass(frozen=True)
class MethodAliases()
```

Map short names (used in backtest CSV headers) → full method tuples.

Single source of truth for the mapping ``BacktestPipeline`` already
encodes via :data:`BacktestPipeline.METHOD_TO_ADEME`. Duplicating
here keeps the decompose CLI from depending on the backtest
pipeline; the alias list is short and changes rarely.

<a id="cli.decompose_score.MethodAliases.SHORT_TO_FULL"></a>

#### SHORT\_TO\_FULL

<a id="cli.decompose_score.MethodAliases.resolve"></a>

#### resolve

```python
@classmethod
def resolve(cls, short_or_full: str) -> tuple[str, ...]
```

Resolve a short alias or accept a comma-separated full tuple.

<a id="cli.decompose_score.DecomposeScoreCli"></a>

## DecomposeScoreCli Objects

```python
@dataclass
class DecomposeScoreCli(BaseCli)
```

<a id="cli.decompose_score.DecomposeScoreCli.PROG"></a>

#### PROG

<a id="cli.decompose_score.DecomposeScoreCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.decompose_score.DecomposeScoreCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.decompose_score.DecomposeScoreCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.decompose_score.main"></a>

#### main

```python
def main() -> int
```
