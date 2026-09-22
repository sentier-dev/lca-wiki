**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.backtest` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.backtest cfg.yml > cli.backtest.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.backtest"></a>

# cli.backtest

``python -m cli.backtest`` — backtest LCIA scores against ADEME's reference.

<a id="cli.backtest.BacktestCli"></a>

## BacktestCli Objects

```python
class BacktestCli(BaseCli)
```

<a id="cli.backtest.BacktestCli.PROG"></a>

#### PROG

<a id="cli.backtest.BacktestCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.backtest.BacktestCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.backtest.BacktestCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.backtest.main"></a>

#### main

```python
def main() -> int
```
