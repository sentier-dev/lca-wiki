**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.list_parameters` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.list_parameters cfg.yml > cli.list_parameters.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.list_parameters"></a>

# cli.list\_parameters

``dds-list-parameters`` — browse SimaPro parameters and active overrides.

Aggregates the process-local parameter definitions by SimaPro-facing name
(577 distinct in AGB 3.2). Reads ``registry/parameters.parquet`` when
``dds-build-parameters`` has materialized it, otherwise falls back to the
importer cache (which re-parses the CSV when absent).

<a id="cli.list_parameters.ListParametersCli"></a>

## ListParametersCli Objects

```python
class ListParametersCli(BaseCli)
```

<a id="cli.list_parameters.ListParametersCli.PROG"></a>

#### PROG

<a id="cli.list_parameters.ListParametersCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.list_parameters.ListParametersCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.list_parameters.ListParametersCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.list_parameters.main"></a>

#### main

```python
def main() -> int
```
