**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `llm.exporter` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m llm.exporter cfg.yml > llm.exporter.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="llm.exporter"></a>

# llm.exporter

``LlmReviewedXlsxAppender`` — merge fresh LLM proposals into the existing source xlsx.

There is no human-in-the-loop. The LLM's proposals are written directly to
``source/agribalyse-3.2-biosphere-residuals-llm-reviewed.xlsx`` with
``decision="accept"`` so the next ``dds-build-registry`` run picks them up
at tier 10. Existing rows in the file are preserved (we don't overwrite a
human-flipped ``"reject"``); only source names not yet present are added.

Schema follows what :class:`LlmReviewedSource` reads — ``source_name`` /
``source_unit`` / ``source_top_cat`` / ``source_sub_cat`` / ``target_name``
/ ``target_top_cat`` / ``target_sub_cat`` / ``decision`` / ``reviewer_note``
plus ``multiplier``. The reader ignores extra columns, so we also tack on
``llm_confidence`` and ``llm_rationale`` for traceability.

<a id="llm.exporter.LlmReviewedXlsxAppender"></a>

## LlmReviewedXlsxAppender Objects

```python
@dataclass(frozen=True)
class LlmReviewedXlsxAppender()
```

Merge proposed mappings into the canonical LLM-reviewed source xlsx.

<a id="llm.exporter.LlmReviewedXlsxAppender.output_path"></a>

#### output\_path

<a id="llm.exporter.LlmReviewedXlsxAppender.COLUMNS"></a>

#### COLUMNS

<a id="llm.exporter.LlmReviewedXlsxAppender.append"></a>

#### append

```python
def append(suggestions: list[Suggestion]) -> dict[str, int]
```
