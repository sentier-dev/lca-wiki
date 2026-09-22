**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.set_parameter` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.set_parameter cfg.yml > cli.set_parameter.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.set_parameter"></a>

# cli.set\_parameter

``dds-set-parameter`` — override a SimaPro input parameter and rescore.

Writes the override to ``source/parameter_overrides.csv`` (the single
source of override truth; gitignored, cleared by ``dds-reset``), prints
the directly changed exchange amounts, then reruns link + backtest so the
dashboard reflects the what-if. ``--no-rescore`` writes the file only.

Names are the SimaPro-facing ones (e.g. ``Packaging_Weight``), matched
case-insensitively. ``--product <code>`` targets one process;
``--all-products`` every process defining the parameter.

<a id="cli.set_parameter.SetParameterCli"></a>

## SetParameterCli Objects

```python
class SetParameterCli(BaseCli)
```

<a id="cli.set_parameter.SetParameterCli.PROG"></a>

#### PROG

<a id="cli.set_parameter.SetParameterCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.set_parameter.SetParameterCli.MAX_PREVIEW_ROWS"></a>

#### MAX\_PREVIEW\_ROWS

<a id="cli.set_parameter.SetParameterCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.set_parameter.SetParameterCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.set_parameter.main"></a>

#### main

```python
def main() -> int
```
