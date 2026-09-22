**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `exports.mappings_comparison` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m exports.mappings_comparison cfg.yml > exports.mappings_comparison.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="exports.mappings_comparison"></a>

# exports.mappings\_comparison

``MappingsComparisonExporter`` — write ``to_review/mappings_comparison.xlsx``.

Single-sheet review workbook splitting every mapping into two color-coded
bands so reviewers see, in one view, what is left to triage:

* RED ("in review") — new mappings produced by sentier_agribalyse for source
  flows whose name does not appear in
  ``placeholder_flow_classification.xlsx`` (ei + ef sheets). Includes
  Neither-sheet rescues and entirely novel flows.
* BLUE ("Already reviewed by Xiaojin and ADEME") — verbatim rows from the
  placeholder ei + ef sheets.

Columns are the unified placeholder schema with one extra ``status`` column.
RED rows render first, BLUE rows below, with a yellow banner separating them.

<a id="exports.mappings_comparison._SourceRecord"></a>

## \_SourceRecord Objects

```python
@dataclass(frozen=True)
class _SourceRecord()
```

One AGB biosphere source flow with its dominant linked target.

<a id="exports.mappings_comparison._SourceRecord.name"></a>

#### name

<a id="exports.mappings_comparison._SourceRecord.cats"></a>

#### cats

<a id="exports.mappings_comparison._SourceRecord.unit"></a>

#### unit

<a id="exports.mappings_comparison._SourceRecord.cas"></a>

#### cas

<a id="exports.mappings_comparison._SourceRecord.target"></a>

#### target

(target_db, target_code), or None if unlinked

<a id="exports.mappings_comparison._SourceRecord.n"></a>

#### n

<a id="exports.mappings_comparison.MappingsComparisonExporter"></a>

## MappingsComparisonExporter Objects

```python
@dataclass(frozen=True)
class MappingsComparisonExporter()
```

Generate ``mappings_comparison.xlsx`` from in-memory ``sp.data``.

<a id="exports.mappings_comparison.MappingsComparisonExporter.settings"></a>

#### settings

<a id="exports.mappings_comparison.MappingsComparisonExporter.sp_data"></a>

#### sp\_data

<a id="exports.mappings_comparison.MappingsComparisonExporter.COLUMNS"></a>

#### COLUMNS

<a id="exports.mappings_comparison.MappingsComparisonExporter.COLUMN_WIDTHS"></a>

#### COLUMN\_WIDTHS

<a id="exports.mappings_comparison.MappingsComparisonExporter.BANNER_FILL"></a>

#### BANNER\_FILL

<a id="exports.mappings_comparison.MappingsComparisonExporter.RED_FILL"></a>

#### RED\_FILL

<a id="exports.mappings_comparison.MappingsComparisonExporter.BLUE_FILL"></a>

#### BLUE\_FILL

<a id="exports.mappings_comparison.MappingsComparisonExporter.STATUS_REVIEWED"></a>

#### STATUS\_REVIEWED

<a id="exports.mappings_comparison.MappingsComparisonExporter.STATUS_IN_REVIEW"></a>

#### STATUS\_IN\_REVIEW

<a id="exports.mappings_comparison.MappingsComparisonExporter.REVIEW_SHEET_NAME"></a>

#### REVIEW\_SHEET\_NAME

<a id="exports.mappings_comparison.MappingsComparisonExporter.export"></a>

#### export

```python
def export() -> Path
```
