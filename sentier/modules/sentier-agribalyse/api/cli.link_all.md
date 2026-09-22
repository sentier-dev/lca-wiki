**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.link_all` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.link_all cfg.yml > cli.link_all.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.link_all"></a>

# cli.link\_all

``python -m cli.link_all`` — run the full link pipeline.

<a id="cli.link_all.LinkAllCli"></a>

## LinkAllCli Objects

```python
class LinkAllCli(BaseCli)
```

<a id="cli.link_all.LinkAllCli.PROG"></a>

#### PROG

<a id="cli.link_all.LinkAllCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.link_all.LinkAllCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.link_all.LinkAllCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.link_all.main"></a>

#### main

```python
def main() -> int
```
