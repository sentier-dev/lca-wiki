**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `reporting.simapro_cf_lookup` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m reporting.simapro_cf_lookup cfg.yml > reporting.simapro_cf_lookup.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="reporting.simapro_cf_lookup"></a>

# reporting.simapro\_cf\_lookup

``SimaProCfLookup`` — per-flow SimaPro CF lookup for the flow panel.

Wraps ``registry/cf_comparison_by_code.parquet`` (produced by ``dds-compare-cfs``
via :class:`reporting.CfComparisonByCodeBuilder`: one row per registry biosphere
``code`` × method, carrying SimaPro's properly-matched characterization factor
``cf_simapro``) as an in-memory map keyed by ``(biosphere code, method
category)``. The flow decomposition emitter consults it to put SimaPro's CF
beside our EF CF for every characterised flow it serialises.

The comparison is a deterministic per-flow 1:1 join (``FlowLevelCfJoiner``):
every registry biosphere ``code`` resolves to exactly one SimaPro CF via full
``(name, compartment, sub_compartment)`` identity, so the SimaPro CF shown is the
value SimaPro/ADEME actually applied to that flow — not a name-heuristic match
(and not one of several "candidates"). The sidecar's ``method`` column is the
registry *category* (e.g.
``"acidification"``), which uniquely identifies a method, so a
``(code, category)`` pair resolves to a single SimaPro CF. Only flows for which
SimaPro has a comparable CF are stored; a miss returns ``None`` and the
dashboard renders an em-dash.

OOP-only per ``CLAUDE.md``: frozen dataclasses, dependencies injected,
no module-level helpers.

<a id="reporting.simapro_cf_lookup.SimaProCfEntry"></a>

## SimaProCfEntry Objects

```python
@dataclass(frozen=True)
class SimaProCfEntry()
```

SimaPro's CF for one flow under one method, plus how it was matched.

``sp_name`` / ``ef_name`` are the comparison's matched molecule names on the
SimaPro and registry sides — surfaced in the flow panel so a reviewer can see
*which* molecule each CF came from (empty string when the sidecar omits them).

<a id="reporting.simapro_cf_lookup.SimaProCfEntry.sp_cf"></a>

#### sp\_cf

<a id="reporting.simapro_cf_lookup.SimaProCfEntry.provenance"></a>

#### provenance

<a id="reporting.simapro_cf_lookup.SimaProCfEntry.sp_name"></a>

#### sp\_name

<a id="reporting.simapro_cf_lookup.SimaProCfEntry.ef_name"></a>

#### ef\_name

<a id="reporting.simapro_cf_lookup.SimaProCfLookup"></a>

## SimaProCfLookup Objects

```python
@dataclass(frozen=True)
class SimaProCfLookup()
```

Map ``(code, method_category) -> SimaProCfEntry``.

<a id="reporting.simapro_cf_lookup.SimaProCfLookup.by_key"></a>

#### by\_key

<a id="reporting.simapro_cf_lookup.SimaProCfLookup.REQUIRED_COLUMNS"></a>

#### REQUIRED\_COLUMNS

<a id="reporting.simapro_cf_lookup.SimaProCfLookup.from_parquet"></a>

#### from\_parquet

```python
@classmethod
def from_parquet(cls, path: Path) -> SimaProCfLookup
```

<a id="reporting.simapro_cf_lookup.SimaProCfLookup.from_dataframe"></a>

#### from\_dataframe

```python
@classmethod
def from_dataframe(cls, df: pd.DataFrame) -> SimaProCfLookup
```

<a id="reporting.simapro_cf_lookup.SimaProCfLookup.get"></a>

#### get

```python
def get(code: str, method_category: str) -> SimaProCfEntry | None
```
