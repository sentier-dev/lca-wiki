**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.build_registry` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.build_registry cfg.yml > cli.build_registry.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.build_registry"></a>

# cli.build\_registry

``python -m cli.build_registry`` — build the ``registry/*.parquet`` files.

<a id="cli.build_registry.BuildRegistryCli"></a>

## BuildRegistryCli Objects

```python
class BuildRegistryCli(BaseCli)
```

<a id="cli.build_registry.BuildRegistryCli.PROG"></a>

#### PROG

<a id="cli.build_registry.BuildRegistryCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.build_registry.BuildRegistryCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.build_registry.main"></a>

#### main

```python
def main() -> int
```
