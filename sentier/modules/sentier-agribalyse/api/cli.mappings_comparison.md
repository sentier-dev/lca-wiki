**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.mappings_comparison` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.mappings_comparison cfg.yml > cli.mappings_comparison.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.mappings_comparison"></a>

# cli.mappings\_comparison

``python -m cli.mappings_comparison`` — regenerate ``to_review/mappings_comparison.xlsx``.

Standalone reader: re-runs ``MappingsComparisonExporter`` against an
already-linked ``sp.data`` cached from ``dds-link-all``. After
REFACTOR_FINAL F5 there's no bw2data project to bootstrap.

<a id="cli.mappings_comparison.MappingsComparisonCli"></a>

## MappingsComparisonCli Objects

```python
class MappingsComparisonCli(BaseCli)
```

<a id="cli.mappings_comparison.MappingsComparisonCli.PROG"></a>

#### PROG

<a id="cli.mappings_comparison.MappingsComparisonCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.mappings_comparison.MappingsComparisonCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.mappings_comparison.main"></a>

#### main

```python
def main() -> int
```
