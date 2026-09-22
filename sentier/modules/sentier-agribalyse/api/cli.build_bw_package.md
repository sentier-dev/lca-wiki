**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.build_bw_package` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.build_bw_package cfg.yml > cli.build_bw_package.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.build_bw_package"></a>

# cli.build\_bw\_package

``dds-build-bw-package`` — export Brightway-ready datapackages.

End-to-end: load the ScoringPackage recorded by the last ``dds-link-all`` run,
embed the AWARE corrections as synthetic biosphere flows, write the
bw_processing datapackages + importer-sufficient metadata, copy in the
standalone ``import_into_brightway.py``, and verify parity before declaring
success.

The output contains ecoinvent LCI amounts composed from the locally
regenerated ``source/`` artifacts — it is licence-gated like ``source/``
itself: gitignored, blocked by the pre-commit EULA guard, never redistributed.

<a id="cli.build_bw_package.BuildBwPackageCli"></a>

## BuildBwPackageCli Objects

```python
@dataclass
class BuildBwPackageCli(BaseCli)
```

<a id="cli.build_bw_package.BuildBwPackageCli.PROG"></a>

#### PROG

<a id="cli.build_bw_package.BuildBwPackageCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.build_bw_package.BuildBwPackageCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.build_bw_package.BuildBwPackageCli.sample_product_ids"></a>

#### sample\_product\_ids

```python
def sample_product_ids(package: ScoringPackage,
                       n: int | None,
                       full: bool = False) -> list[int]
```

<a id="cli.build_bw_package.BuildBwPackageCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.build_bw_package.main"></a>

#### main

```python
def main() -> int
```
