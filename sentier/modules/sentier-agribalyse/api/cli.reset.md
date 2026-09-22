**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.reset` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.reset cfg.yml > cli.reset.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.reset"></a>

# cli.reset

``dds-reset`` — restore the pristine baseline state.

Deletes ``cache/scoring_packages/``, ``cache/importer_cache.pkl``,
``cache/linked_cache.pkl``, and ``source/parameter_overrides.csv`` so the
next ``dds-link-all`` run re-parses the SimaPro CSV and regenerates all
matrices from it, with no parameter what-ifs applied. The biosphere catalog, EF flows, and
method-CF registries are NOT cleared — they are source-derived parquets
that only change when you re-run ``dds-build-*``.

Use this when:
- You modified ``source/AGB32_final.CSV`` — the importer pickle carries
  no hash of the CSV, so without a reset the old parse is silently reused.
- You want to force a full re-link without changing the mappings.
- You suspect the scoring package is stale (e.g. after a code refactor).
- You want to drop all parameter overrides (``--keep-overrides`` opts out;
  ``dds-clear-parameters`` removes them without touching the caches).

<a id="cli.reset.ResetCli"></a>

## ResetCli Objects

```python
class ResetCli(BaseCli)
```

<a id="cli.reset.ResetCli.PROG"></a>

#### PROG

<a id="cli.reset.ResetCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.reset.ResetCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.reset.ResetCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.reset.main"></a>

#### main

```python
def main() -> int
```
