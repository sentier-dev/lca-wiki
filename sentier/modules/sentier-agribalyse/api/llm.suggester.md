**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `llm.suggester` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m llm.suggester cfg.yml > llm.suggester.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="llm.suggester"></a>

# llm.suggester

``LlmMappingSuggester`` — last-resort tier for residual unlinked AGB flows.

For each unlinked flow, builds a short list of plausible biosphere targets
via :class:`CandidatePool`, then asks the LLM (CLI or API) to pick one. The
LLM is constrained to the candidate list — it can never invent a flow ID.
Decisions are auto-accepted; output goes straight into the existing
``source/agribalyse-3.2-biosphere-residuals-llm-reviewed.xlsx`` with
``decision="accept"`` so the next ``dds-build-registry`` picks them up at
tier 10. No sidecar file, no human gate.

The ``client`` is constructor-injected and only needs an ``ask(system, user)``
method, so tests can pass a stub that returns canned text.

<a id="llm.suggester.Confidence"></a>

#### Confidence

<a id="llm.suggester.AgbUnlinkedFlow"></a>

## AgbUnlinkedFlow Objects

```python
@dataclass(frozen=True)
class AgbUnlinkedFlow()
```

One row from ``unlinked/biosphere_unlinked.xlsx`` ready for the LLM.

<a id="llm.suggester.AgbUnlinkedFlow.name"></a>

#### name

<a id="llm.suggester.AgbUnlinkedFlow.unit"></a>

#### unit

<a id="llm.suggester.AgbUnlinkedFlow.top_cat"></a>

#### top\_cat

<a id="llm.suggester.AgbUnlinkedFlow.sub_cat"></a>

#### sub\_cat

<a id="llm.suggester.AgbUnlinkedFlow.categories"></a>

#### categories

```python
@property
def categories() -> tuple[str, ...]
```

<a id="llm.suggester.AgbUnlinkedFlow.bucket"></a>

#### bucket

```python
@property
def bucket() -> Bucket
```

<a id="llm.suggester.Suggestion"></a>

## Suggestion Objects

```python
@dataclass(frozen=True)
class Suggestion()
```

LLM's verdict on one residual flow.

<a id="llm.suggester.Suggestion.source"></a>

#### source

<a id="llm.suggester.Suggestion.decision"></a>

#### decision

<a id="llm.suggester.Suggestion.target_db"></a>

#### target\_db

<a id="llm.suggester.Suggestion.target_code"></a>

#### target\_code

<a id="llm.suggester.Suggestion.target_name"></a>

#### target\_name

<a id="llm.suggester.Suggestion.target_categories"></a>

#### target\_categories

<a id="llm.suggester.Suggestion.target_unit"></a>

#### target\_unit

<a id="llm.suggester.Suggestion.confidence"></a>

#### confidence

<a id="llm.suggester.Suggestion.rationale"></a>

#### rationale

<a id="llm.suggester.UnlinkedReader"></a>

## UnlinkedReader Objects

```python
@dataclass(frozen=True)
class UnlinkedReader()
```

Read ``unlinked/biosphere_unlinked.xlsx`` and prepare residuals for the LLM.

Skips:

* Rows whose name is in ``unmatchable.parquet`` (we already know there's
  no mappable target — running the LLM is wasted compute).
* Rows whose name appears (with ``decision="accept"``) in the existing
  LLM-reviewed source xlsx — those will be picked up at tier 10 by the
  next registry build, so they're already in flight.

Crucially, we DO NOT skip names that have a mapping row in
``mappings_biosphere.parquet``. If a name is in unlinked.xlsx, its
mapping (if any) didn't fire — typically because the target name doesn't
exist in the exchange's compartment. The LLM's job is to find a target
that DOES exist there.

<a id="llm.suggester.UnlinkedReader.settings"></a>

#### settings

<a id="llm.suggester.UnlinkedReader.read"></a>

#### read

```python
def read(registry_unmatchable: pd.DataFrame,
         already_reviewed_xlsx: Path | None = None) -> list[AgbUnlinkedFlow]
```

<a id="llm.suggester.SYSTEM_PROMPT"></a>

#### SYSTEM\_PROMPT

<a id="llm.suggester.LlmMappingSuggester"></a>

## LlmMappingSuggester Objects

```python
@dataclass(frozen=True)
class LlmMappingSuggester()
```

Ask the LLM (CLI or API) to pick a target flow per residual.

<a id="llm.suggester.LlmMappingSuggester.settings"></a>

#### settings

<a id="llm.suggester.LlmMappingSuggester.candidate_pool"></a>

#### candidate\_pool

<a id="llm.suggester.LlmMappingSuggester.client"></a>

#### client

<a id="llm.suggester.LlmMappingSuggester.max_candidates"></a>

#### max\_candidates

<a id="llm.suggester.LlmMappingSuggester.system_prompt"></a>

#### system\_prompt

<a id="llm.suggester.LlmMappingSuggester.suggest"></a>

#### suggest

```python
def suggest(unlinked: list[AgbUnlinkedFlow]) -> list[Suggestion]
```
