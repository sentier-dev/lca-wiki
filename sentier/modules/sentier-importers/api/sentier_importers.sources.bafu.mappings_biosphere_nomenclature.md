**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.bafu.mappings_biosphere_nomenclature` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.bafu.mappings_biosphere_nomenclature cfg.yml > sentier_importers.sources.bafu.mappings_biosphere_nomenclature.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.bafu.mappings_biosphere_nomenclature"></a>

# sentier\_importers.sources.bafu.mappings\_biosphere\_nomenclature

bafu-2026-v1 -> EF 3.1 nomenclature bridge for uncharacterised targets (the
nomenclature package, biosphere-4-nomenclature).

For every BAFU-2026 v1 elementary flow that the curated, inferred and matched
packages leave uncovered, run the same ``matching.pipeline.default_pipeline``
matching/decision chain the matched package uses, but over the EF flow index built
with ``include_uncharacterised=True`` (``matching.ef_index.EfFlowIndex``): EF 3.1
vocab rows that exist in sentier-vocab but carry no characterization factor in any EF
3.1 method, placed via the Brightway context crosswalk (``matching.bw_context``)
rather than the CF table. Every entry this source emits asserts a nomenclature
alignment only -- impact is zero by construction, since the target carries no factor
at all -- and applies after the curated, inferred and matched packages.

Requires the sibling matched payload as the ``matched`` input: the nomenclature
package must skip exactly what the matched package itself mapped
(``ParsedInputs.matched_codes``), not just what the curated and inferred packages map,
or the two sources could both claim the same flow.

Round 5, decision 2026-09-14: a flow the matching/decision chain still cannot place at
all (``Unmatched(reason="no_ef_flow")``) gets one further try here, since this source's
own index is the inclusive one -- ``mappings_biosphere_matched._name_only_match``,
wired into ``_decide``, aligns it by name alone onto an uncharacterised EF namesake in
any bucket when every namesake the name has is itself uncharacterised. Such a ``Match``
carries ``tier="name-only"``/``placement="name_only"`` and reaches ``entry_for`` (and
this source's own never-a-characterised-match guard) exactly like any other
nomenclature-package match.

Round 6, decision 2026-09-14: an uncharacterised target has no separate JRC name to
weigh against its vocab pref_label (``ef_index.EfFlowIndex.from_tables``), so
``EfFlow.name`` and ``EfFlow.label`` are always equal here -- the matching-key/
display-name split ``entry_for`` relies on for the matched package's characterised
targets is a no-op for this source's own emitted rows.

<a id="sentier_importers.sources.bafu.mappings_biosphere_nomenclature.BafuEfNomenclatureSource"></a>

## BafuEfNomenclatureSource Objects

```python
class BafuEfNomenclatureSource(BafuEfMatchedSource)
```

Emit one entry per BAFU flow that resolves onto an uncharacterised EF target.

<a id="sentier_importers.sources.bafu.mappings_biosphere_nomenclature.BafuEfNomenclatureSource.include_uncharacterised"></a>

#### include\_uncharacterised

<a id="sentier_importers.sources.bafu.mappings_biosphere_nomenclature.BafuEfNomenclatureSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```

Emit one entry per BAFU flow ``outcomes`` resolves to an uncharacterised ``Match``.

A ``Match`` onto a *characterised* target reaching this source would mean the
inclusive index changed a characterised matched-package outcome -- it must
never happen, so it is a loud ``RuntimeError`` naming the flow rather than a
silently dropped or duplicated entry.
