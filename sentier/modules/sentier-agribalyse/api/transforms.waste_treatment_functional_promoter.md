**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.waste_treatment_functional_promoter` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.waste_treatment_functional_promoter cfg.yml > transforms.waste_treatment_functional_promoter.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.waste_treatment_functional_promoter"></a>

# transforms.waste\_treatment\_functional\_promoter

``WasteTreatmentFunctionalPromoter`` — flip ``functional=True`` technosphere rows to production.

SimaPro encodes waste-treatment activities backwards: the "functional
unit" of a treatment process is the waste being *consumed* (i.e., the
tonne of biowaste sent to compost), not a positive product output. The
CSV therefore carries the activity's reference flow as a
``type='technosphere'`` row with ``functional=True`` and a positive
amount, and either ships no production row at all or ships a stub
``production`` row with ``amount=0`` (sometimes labelled
``functional=False``) just to keep the parser happy.

`WasteTreatmentDummyFixer` (`waste_treatment_dummy_fixer.py`) already
rewrites the *commented* "Dummy edge inserted to stop auto-generation
of unitary production edge" stubs. Many AGB waste-treatment activities
(e.g. ``Compost, of biowaste (amendment) {RER}``,
``Treatment of biowaste, co-composting biowaste-greenwaste``,
``[Dummy] Composting grape marcs``, the various `[Dummy] Disposal …`
records — 421 cases in AGRIBALYSE 3.2) use the same pattern but lack
the canonical comment, so they slip past the fixer.

This transform handles the remainder. For any process whose only
``functional=True`` exchange sits on the technosphere side (and whose
production rows are absent or zero-amount), we promote that
technosphere row to ``type='production'`` in-place. The amount stays
positive, the ``functional`` flag stays ``True`` — the matrix builder
then puts the amount on the diagonal as a real production exchange,
preventing ``ProductionReclassifier`` and the dangling-edge pruner
from interpreting the activity as having no output.

Without this fix the activity sits in the matrix as a column with no
positive entry; downstream products that consume it can only satisfy
their demand by inverting an artificial loop through the unfixed
``technosphere`` edge, blowing up supply by 1000× or more (the
coconut-oil 54× backtest outlier was traced to AGB ``Compost, of
biowaste (amendment) {RER}`` here).

<a id="transforms.waste_treatment_functional_promoter.WasteTreatmentFunctionalPromoter"></a>

## WasteTreatmentFunctionalPromoter Objects

```python
@dataclass(frozen=True)
class WasteTreatmentFunctionalPromoter()
```

Flip ``functional=True`` technosphere rows to production rows
when the activity lacks a non-zero production exchange.

<a id="transforms.waste_treatment_functional_promoter.WasteTreatmentFunctionalPromoter.apply"></a>

#### apply

```python
def apply(sp: Any) -> dict[str, int]
```
