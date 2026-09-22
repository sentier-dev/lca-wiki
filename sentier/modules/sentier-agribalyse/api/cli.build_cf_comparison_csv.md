**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.build_cf_comparison_csv` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.build_cf_comparison_csv cfg.yml > cli.build_cf_comparison_csv.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.build_cf_comparison_csv"></a>

# cli.build\_cf\_comparison\_csv

``dds-build-cf-comparison-csv`` — re-flatten the SimaPro-vs-registry CF
comparison join into the dashboard's ``cf_comparison.csv``.

Reads ``registry/cf_comparison_join.parquet`` (the complete per-flow join of
SimaPro adapted EF 3.1 CFs against our built registry CFs, written by
``dds-compare-cfs``) and re-serialises the matched rows as a flat CSV the static
dashboard fetches for its CF-comparison tab.

``dds-compare-cfs`` already writes ``cf_comparison.csv`` directly; this CLI is a
standalone re-flatten of an existing join parquet (e.g. after editing the row
filter). No comparison maths happen here — the parquet is the single source of
truth; this only projects the columns into a stable, comparison-first order.

<a id="cli.build_cf_comparison_csv.BuildCfComparisonCsvCli"></a>

## BuildCfComparisonCsvCli Objects

```python
class BuildCfComparisonCsvCli(BaseCli)
```

``dds-build-cf-comparison-csv`` entry point.

<a id="cli.build_cf_comparison_csv.BuildCfComparisonCsvCli.PROG"></a>

#### PROG

<a id="cli.build_cf_comparison_csv.BuildCfComparisonCsvCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.build_cf_comparison_csv.BuildCfComparisonCsvCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.build_cf_comparison_csv.BuildCfComparisonCsvCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.build_cf_comparison_csv.main"></a>

#### main

```python
def main() -> int
```
