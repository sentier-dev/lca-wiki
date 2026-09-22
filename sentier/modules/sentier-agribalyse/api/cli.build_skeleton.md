**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.build_skeleton` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.build_skeleton cfg.yml > cli.build_skeleton.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.build_skeleton"></a>

# cli.build\_skeleton

``dds-build-skeleton`` — produce the AGB-only skeleton for the bundle.

Wraps :class:`SkeletonExtractor`. Reads an existing scoring package
from ``cache/scoring_packages/<hash>/``, writes the skeleton (with
ecoinvent columns zeroed and ``ecoinvent_slot_index.parquet`` emitted)
to ``<bundle-root>/skeleton/<hash>/``.

Run AFTER ``dds-link-all`` produced a verified scoring package.

<a id="cli.build_skeleton.BuildSkeletonCli"></a>

## BuildSkeletonCli Objects

```python
@dataclass
class BuildSkeletonCli(BaseCli)
```

CLI that extracts a skeleton + slot-index from a cached scoring
package and writes it under the customer-bundle's ``skeleton/`` root.

<a id="cli.build_skeleton.BuildSkeletonCli.PROG"></a>

#### PROG

<a id="cli.build_skeleton.BuildSkeletonCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.build_skeleton.BuildSkeletonCli.settings"></a>

#### settings

<a id="cli.build_skeleton.BuildSkeletonCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.build_skeleton.BuildSkeletonCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.build_skeleton.main"></a>

#### main

```python
def main() -> int
```
