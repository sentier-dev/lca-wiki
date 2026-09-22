**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.build_parameters` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.build_parameters cfg.yml > cli.build_parameters.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.build_parameters"></a>

# cli.build\_parameters

``dds-build-parameters`` — materialize the parameter/formula parquets.

Writes ``registry/parameters.parquet`` (per-process parameter definitions)
and ``registry/exchange_formulas.parquet`` (per-exchange formula table)
from the parsed CSV. These are the artifacts later ported packages
(bundle, public twin) consume, and the fast source for
``dds-list-parameters``. Rebuild after replacing the SimaPro CSV.

<a id="cli.build_parameters.BuildParametersCli"></a>

## BuildParametersCli Objects

```python
class BuildParametersCli(BaseCli)
```

<a id="cli.build_parameters.BuildParametersCli.PROG"></a>

#### PROG

<a id="cli.build_parameters.BuildParametersCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.build_parameters.BuildParametersCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.build_parameters.main"></a>

#### main

```python
def main() -> int
```
