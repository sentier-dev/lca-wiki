**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.core.randonneur` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-importers repo && git -C repo checkout dac2e67
SP=repo/app
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
  -I "$SP" -m sentier_importers.core.randonneur cfg.yml > sentier_importers.core.randonneur.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.core.randonneur"></a>

# sentier\_importers.core.randonneur

Helpers over randonneur mapping packages.

<a id="sentier_importers.core.randonneur.codes_of"></a>

#### codes\_of

```python
def codes_of(package: dict) -> set[str]
```

Source codes named by every ``replace``/``update`` entry in a mapping package.
