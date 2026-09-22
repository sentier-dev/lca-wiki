**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.scorer` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.scorer cfg.yml > scoring.scorer.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.scorer"></a>

# scoring.scorer

``ScoringResult`` and ``split_chunks`` — shared primitives for LCIA scoring.

The legacy ``LciaScorer``, ``WorkerPayload``, ``run_score_worker``, and
``run_isolated_score_worker`` have been removed (REFACTOR_LINKING phase L4).
All runtime scoring now goes through ``NativeLciaScorer`` in
``scoring.native_scorer``.

<a id="scoring.scorer.ScoringResult"></a>

## ScoringResult Objects

```python
@dataclass(frozen=True)
class ScoringResult()
```

<a id="scoring.scorer.ScoringResult.process_key"></a>

#### process\_key

<a id="scoring.scorer.ScoringResult.scores"></a>

#### scores

<a id="scoring.scorer.ScoringResult.skip_reason"></a>

#### skip\_reason

<a id="scoring.scorer.ScoringResult.elapsed_s"></a>

#### elapsed\_s
