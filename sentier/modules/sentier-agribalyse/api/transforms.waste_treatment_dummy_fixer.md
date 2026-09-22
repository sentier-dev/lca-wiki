**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.waste_treatment_dummy_fixer` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.waste_treatment_dummy_fixer cfg.yml > transforms.waste_treatment_dummy_fixer.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.waste_treatment_dummy_fixer"></a>

# transforms.waste\_treatment\_dummy\_fixer

``WasteTreatmentDummyFixer`` — convert ``bw_simapro_csv`` waste-treatment stubs to real productions.

When a SimaPro CSV process has a ``Waste treatment`` block but no
``Products`` block, ``bw_simapro_csv.brightway.lci_to_brightway`` injects
a stub production exchange:

{"type": "production", "functional": False, "amount": 0,
"comment": "Dummy edge inserted to stop auto-generation of unitary production edge"}

The stub exists purely to suppress bw2io's auto-generated unitary edge.
Two downstream consequences cause a singular technosphere matrix:

* ``ProductionReclassifier`` flips every ``functional=False`` production
to ``technosphere``, so the activity loses its production exchange.
* ``drop_unlinked`` strips zero-amount exchanges, so the stub disappears
even if the reclassifier is bypassed.

Either way, the activity ends up with no production and a zero diagonal
in the technosphere matrix → ``MatrixRankWarning: Matrix is exactly
singular``. This transform identifies the stubs by their canonical
comment and rewrites them in-place to ``functional=True, amount=1``,
which makes them survive both the reclassifier and ``drop_unlinked``
and gives the matrix a +1 pivot on the diagonal.

Because ``bw_simapro_csv`` already marks the waste-input technosphere
exchange as ``functional=True`` (the SimaPro convention for waste
treatment), promoting the production to functional gives the dataset two
functional edges. ``multifunctional`` then classifies the dataset as
``type=multifunctional`` and walks every functional edge looking for a
``properties["manual_allocation"]`` value (the default allocation
property for SimaPro-derived imports). To satisfy that walk without
altering impacts (dummies are empty by construction), we attach
``manual_allocation: 1.0`` to the promoted production and
``manual_allocation: 0.0`` to every other functional edge in the same
dataset, sending 100% of the (zero) impacts to the dummy production.

<a id="transforms.waste_treatment_dummy_fixer.WasteTreatmentDummyFixer"></a>

## WasteTreatmentDummyFixer Objects

```python
@dataclass(frozen=True)
class WasteTreatmentDummyFixer()
```

<a id="transforms.waste_treatment_dummy_fixer.WasteTreatmentDummyFixer.apply"></a>

#### apply

```python
def apply(sp) -> dict[str, int]
```
