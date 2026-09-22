**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.perennial_lifecycle_filter` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.perennial_lifecycle_filter cfg.yml > scoring.perennial_lifecycle_filter.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.perennial_lifecycle_filter"></a>

# scoring.perennial\_lifecycle\_filter

``PerennialLifecycleFilter`` — drop acid-relevant biosphere edges on perennial non-prod / grubbing-up.

ADEME's published synthese excludes acidification emissions (NH3) of
plantation establishment and grubbing-up lifecycle stages — a common
LCA capital-goods convention applied to *combustion-style* emissions
but **not** to biogenic CO2 or land use, which ADEME's reference
*does* include from those same activities.

AGB's SimaPro recipes include all biosphere emissions of the
non-productive / grubbing-up stages and amortise them across the
productive output. For the 14 spices that share the
``Black pepper, dried, consumption mix {FR}`` proxy, the NH3 piece
drives every SKU to +55.5 % over ADEME's acidification reference.

This filter drops only the **ammonia** biosphere edges on the
non-productive / grubbing-up activities, leaving the carbon / land /
water flows intact so biogenic CC and land use methods stay aligned.
First attempt (2026-05-17) cut the aggregator → non-productive
technosphere edges entirely; closed acid 14 → 1 but introduced 14
new biogenic-CC and 14 new land-use outliers at −60 % / −53 % (the
spec's capital-goods premise was wrong for those methods). The
biosphere-level filter is the surgical fix.

Scope
-----

Black pepper (Vietnam) only. The same naming pattern exists for
``Kiwifruit FR`` but its SKU
(``Kiwi, pulpe et graines, cru``) passes baseline acidification at
+10.2 %; dropping its NH3 would regress it. Expand scope after
measuring per-SKU effect.

<a id="scoring.perennial_lifecycle_filter.PerennialLifecycleFilter"></a>

## PerennialLifecycleFilter Objects

```python
@dataclass(frozen=True)
class PerennialLifecycleFilter()
```

Stateless: ``purge(frame, sp_data=..., biosphere_catalog=...)``
returns a frame with the acid-relevant biosphere edges on
non-productive / grubbing-up activities dropped, plus a stats
dict summarising what was removed.

<a id="scoring.perennial_lifecycle_filter.PerennialLifecycleFilter.biosphere_catalog"></a>

#### biosphere\_catalog

<a id="scoring.perennial_lifecycle_filter.PerennialLifecycleFilter.target_db_name"></a>

#### target\_db\_name

<a id="scoring.perennial_lifecycle_filter.PerennialLifecycleFilter.NON_PRODUCTIVE_NAMES"></a>

#### NON\_PRODUCTIVE\_NAMES

<a id="scoring.perennial_lifecycle_filter.PerennialLifecycleFilter.ACID_FLOW_NAMES"></a>

#### ACID\_FLOW\_NAMES

<a id="scoring.perennial_lifecycle_filter.PerennialLifecycleFilter.SCORED_DATABASES"></a>

#### SCORED\_DATABASES

<a id="scoring.perennial_lifecycle_filter.PerennialLifecycleFilter.purge"></a>

#### purge

```python
def purge(frame: ExchangeFrame, *,
          sp_data: Iterable[dict]) -> tuple[ExchangeFrame, dict[str, Any]]
```
