**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.bafu.mappings_biosphere_coverage` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.bafu.mappings_biosphere_coverage cfg.yml > sentier_importers.sources.bafu.mappings_biosphere_coverage.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.bafu.mappings_biosphere_coverage"></a>

# sentier\_importers.sources.bafu.mappings\_biosphere\_coverage

Coverage sidecar: one row per bafu-2026-v1 elementary flow, mapped (which package,
and for the matched/nomenclature packages which tier and placement) or unmapped (why).
Reports all four packages (biosphere-1-curated, biosphere-2-inferred,
biosphere-3-matched, biosphere-4-nomenclature), in two passes:

1. ``BafuEfMatchedSource.outcomes`` (inherited unchanged) over the characterised-only
   index -- exactly what ``bafu-ef-biosphere-matched`` itself runs -- for every flow
   the curated/inferred packages leave uncovered. A ``Match`` here is biosphere-3-matched.
2. For whatever pass 1 leaves ``Unmatched``, the same matching/decision chain
   (``mappings_biosphere_matched.outcome_for``) run again over the inclusive
   index/pipeline (``include_uncharacterised=True``) this source's own ``parse``
   override attaches to ``ParsedInputs`` (``inclusive_index``/``inclusive_pipeline``).
   A ``Match`` here onto an uncharacterised target is biosphere-4-nomenclature; onto a
   characterised one would mean the inclusive index changed a characterised
   biosphere-3-matched outcome -- a ``RuntimeError``, never silently reported. An
   ``Unmatched`` outcome is reported from this second pass, not the first: the
   inclusive index can refine the reason (e.g. a code the CF table has no context for
   at all). Round 5, decision 2026-09-14: ``outcome_for``'s own ``_decide`` step may
   also resolve a plain ``no_ef_flow`` here into a name-only alignment
   (``mappings_biosphere_matched._name_only_match``) -- reported the same as any other
   biosphere-4-nomenclature ``Match``, with ``tier="name-only"`` and
   ``placement="name_only"``; this source needs no code of its own for it.

``transform`` itself is pure (records in, rows out): it never touches ``self.inputs``
or ``self.config`` -- everything both passes need was already built in ``parse``.

Curated and inferred membership comes straight from ``ParsedInputs.curated_codes``/
``inferred_codes`` (kept apart there for exactly this reason -- the sibling's own
``excluded`` is their union and cannot tell them apart).

Round 6, decision 2026-09-14: ``parse`` logs the inclusive index's own naming
bookkeeping (``EfFlowIndex.multi_name_codes``/``suppressed_vocab_synonyms``/
``relabelled_count``) once, here, since this is the one place a full pipeline run
builds the fullest (inclusive) index -- these counters are not otherwise surfaced
anywhere in the emitted rows themselves.

<a id="sentier_importers.sources.bafu.mappings_biosphere_coverage.BafuEfCoverageSource"></a>

## BafuEfCoverageSource Objects

```python
class BafuEfCoverageSource(BafuEfMatchedSource)
```

Emit one coverage row per BAFU flow instead of the matched entries.

<a id="sentier_importers.sources.bafu.mappings_biosphere_coverage.BafuEfCoverageSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

``BafuEfMatchedSource.parse`` plus the inclusive index/pipeline pass 2 needs.

Built here, once, alongside the characterised-only pair the base ``parse``
already builds, so ``transform`` can stay a pure function of ``records``.

<a id="sentier_importers.sources.bafu.mappings_biosphere_coverage.BafuEfCoverageSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
