**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.orphan_activity_purger` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.orphan_activity_purger cfg.yml > transforms.orphan_activity_purger.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.orphan_activity_purger"></a>

# transforms.orphan\_activity\_purger

``OrphanActivityPurger`` — drop process activities that cannot produce a non-singular matrix column.

After ``ProductionReclassifier`` has flipped ``functional=False``
productions to technosphere, some datasets are left with **no
production exchange and no ``functional=True`` technosphere edge** —
meaning they have no functional output of any kind. In the technosphere
matrix these become a column of negative consumption entries with a
zero diagonal, which makes the matrix singular and the LU
factorization fail with ``MatrixRankWarning``.

These activities can't be solved by any LCA-side fix — there's no
producer to wire. The only safe option is to drop them before the
``ScoringPackage`` emit step so the matrix stays solvable.

This runs AFTER ``ProductionReclassifier`` (which is what creates this
state) and AFTER ``WasteTreatmentDummyFixer`` (which rescues the
waste-treatment stubs that would otherwise look like orphans).
Consumers of dropped activities become unlinked technosphere
exchanges, which the existing ``UnlinkedExporter`` will report —
nothing is silently lost.

``type='product'`` datasets are **explicitly excluded** from purge
candidacy. ``bw_simapro_csv`` materialises every SimaPro product as a
zero-exchange ``ActivityDataset`` whose only purpose is to be the
target of process exchanges' ``input`` tuples. Products don't
contribute matrix columns and don't need a production exchange — they
are vertices, not processes. Dropping them leaves dangling references
in surviving processes that survive ``drop_unlinked`` (the ``input``
field is set, so the strategy doesn't see them as unlinked) and then
fail in ``Database.process`` with
``UnknownObject: ... is invalid - one of these objects is unknown``.

When given a :class:`Settings`, the purger also writes
``dashboard/orphan_activities.parquet`` listing every dropped activity
with enough context (name, code, type, unit, exchange counts) to
decide which deserve a curated rescue (synthetic production / mapping
to ecoinvent) and which are genuine data artifacts to leave purged.

<a id="transforms.orphan_activity_purger.OrphanActivityPurger"></a>

## OrphanActivityPurger Objects

```python
@dataclass(frozen=True)
class OrphanActivityPurger()
```

<a id="transforms.orphan_activity_purger.OrphanActivityPurger.settings"></a>

#### settings

<a id="transforms.orphan_activity_purger.OrphanActivityPurger.apply"></a>

#### apply

```python
def apply(sp) -> dict[str, int]
```
