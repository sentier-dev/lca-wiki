**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.units` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-brightway repo && git -C repo checkout a9dba75
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
  -I "$SP" -m sentier_brightway.units cfg.yml > sentier_brightway.units.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.units"></a>

# sentier\_brightway.units

Map BAFU and bridge unit spellings onto the names Brightway (bw2io) uses.

<a id="sentier_brightway.units.normalize_unit"></a>

#### normalize\_unit

```python
def normalize_unit(unit: str | None) -> str
```

Return the Brightway spelling of ``unit``; unknown spellings pass through unchanged.
