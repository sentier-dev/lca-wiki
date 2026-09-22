**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.build_ecoinvent_catalog` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.build_ecoinvent_catalog cfg.yml > cli.build_ecoinvent_catalog.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.build_ecoinvent_catalog"></a>

# cli.build\_ecoinvent\_catalog

``dds-build-ecoinvent-catalog`` — emit ``registry/ecoinvent_catalog.parquet``.

After REFACTOR_FINAL F6 the builder reads from
``source/ecoinvent-3.9.1-cutoff-activities.json`` (a one-time bw2data
snapshot). No bw2data, no SQLite.

<a id="cli.build_ecoinvent_catalog.BuildEcoinventCatalogCli"></a>

## BuildEcoinventCatalogCli Objects

```python
class BuildEcoinventCatalogCli(BaseCli)
```

<a id="cli.build_ecoinvent_catalog.BuildEcoinventCatalogCli.PROG"></a>

#### PROG

<a id="cli.build_ecoinvent_catalog.BuildEcoinventCatalogCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.build_ecoinvent_catalog.BuildEcoinventCatalogCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.build_ecoinvent_catalog.main"></a>

#### main

```python
def main() -> int
```
