**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.core.types` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.core.types cfg.yml > sentier_importers.core.types.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.core.types"></a>

# sentier\_importers.core.types

Shared data types passed between pipeline stages.

<a id="sentier_importers.core.types.Record"></a>

#### Record

<a id="sentier_importers.core.types.Records"></a>

#### Records

<a id="sentier_importers.core.types.Rows"></a>

#### Rows

<a id="sentier_importers.core.types.Collection"></a>

#### Collection

<a id="sentier_importers.core.types.Payload"></a>

#### Payload

<a id="sentier_importers.core.types.RawData"></a>

## RawData Objects

```python
@dataclass(frozen=True)
class RawData()
```

Raw bytes retrieved by a fetch stage, with provenance metadata.

<a id="sentier_importers.core.types.RawData.content"></a>

#### content

<a id="sentier_importers.core.types.RawData.source_url"></a>

#### source\_url

<a id="sentier_importers.core.types.RawData.media_type"></a>

#### media\_type
