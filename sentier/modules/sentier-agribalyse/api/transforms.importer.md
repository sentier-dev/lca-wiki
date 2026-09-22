**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.importer` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.importer cfg.yml > transforms.importer.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.importer"></a>

# transforms.importer

``SimaProImporter`` — wraps ``SimaProCsvParser`` with a pickle cache.

The parser itself lives in ``transforms/sp_csv_parser.py`` and uses
``bw_simapro_csv`` directly — bw2io is no longer imported here.

<a id="transforms.importer.SimaProImporter"></a>

## SimaProImporter Objects

```python
@dataclass(frozen=True)
class SimaProImporter()
```

Read AGB SimaPro CSV. Caches the parsed object to a pickle for re-runs.

<a id="transforms.importer.SimaProImporter.settings"></a>

#### settings

<a id="transforms.importer.SimaProImporter.load"></a>

#### load

```python
def load() -> ParsedSimaProCsv
```
