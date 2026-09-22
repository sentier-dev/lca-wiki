**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `llm.candidates` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m llm.candidates cfg.yml > llm.candidates.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="llm.candidates"></a>

# llm.candidates

``CandidatePool`` — pre-filter biosphere flows down to a short list per query.

The catalog holds ~80k flows across biosphere3 / ecoinvent-bio / ef. Sending
that many to an LLM per residual is wasteful and exceeds context. We pre-rank
by tokenized name overlap within the exchange's compartment bucket (the LLM
must respect compartment, so off-bucket hits are dropped up front).

Ranking is deterministic: token-overlap score descending, name length ascending
(prefer shorter, more generic names on ties), then lex by (db, code).

<a id="llm.candidates.CandidatePool"></a>

## CandidatePool Objects

```python
@dataclass(frozen=True)
class CandidatePool()
```

Score-and-rank biosphere flows from a catalog by lexical similarity.

<a id="llm.candidates.CandidatePool.catalog"></a>

#### catalog

<a id="llm.candidates.CandidatePool.max_candidates"></a>

#### max\_candidates

<a id="llm.candidates.CandidatePool.candidates_for"></a>

#### candidates\_for

```python
def candidates_for(source_name: str,
                   bucket: Bucket | str,
                   max_n: int | None = None) -> list[BioFlowRef]
```

Return up to ``max_n`` candidates ordered by similarity to ``source_name``.
