**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.clear_parameters` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.clear_parameters cfg.yml > cli.clear_parameters.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.clear_parameters"></a>

# cli.clear\_parameters

``dds-clear-parameters`` — remove parameter overrides.

No arguments clears every override (the file is deleted, restoring the
pristine baseline). ``--name``/``--product`` narrow the removal. Rerun
``dds-link-all`` + ``dds-backtest`` afterwards to rescore the baseline.

<a id="cli.clear_parameters.ClearParametersCli"></a>

## ClearParametersCli Objects

```python
class ClearParametersCli(BaseCli)
```

<a id="cli.clear_parameters.ClearParametersCli.PROG"></a>

#### PROG

<a id="cli.clear_parameters.ClearParametersCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.clear_parameters.ClearParametersCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.clear_parameters.ClearParametersCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.clear_parameters.main"></a>

#### main

```python
def main() -> int
```
