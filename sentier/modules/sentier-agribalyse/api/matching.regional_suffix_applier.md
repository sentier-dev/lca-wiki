**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `matching.regional_suffix_applier` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matching.regional_suffix_applier cfg.yml > matching.regional_suffix_applier.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matching.regional_suffix_applier"></a>

# matching.regional\_suffix\_applier

``RegionalSuffixApplier`` — postprocess linked exchanges with regional codes.

The :class:`matching.biosphere.BiosphereMatcher` applies the
``@<region>`` suffix on the synthetic code it emits, but the matcher
only runs for exchanges whose ``_best_candidate`` resolves a new
outcome. Many AGB exchanges are already linked by earlier pipeline
steps — :class:`transforms.biosphere_prelinker.BiospherePrelinker`
matches ~5.5M exchanges by ``code`` alone, before the matcher visits
them. For those the matcher's outcome may stay equal to the prior
link, and the regional dimension would be silently lost.

This applier closes that gap by sweeping every linked biosphere
exchange after all matching has completed and rewriting the
``input`` tuple to its ``<base_code>@<region>`` synthetic form when
the source name carries a recognised regional suffix.

The pass is idempotent: codes that already carry the ``@`` separator
are left untouched.

<a id="matching.regional_suffix_applier.RegionalSuffixApplierStats"></a>

## RegionalSuffixApplierStats Objects

```python
@dataclass(frozen=True)
class RegionalSuffixApplierStats()
```

<a id="matching.regional_suffix_applier.RegionalSuffixApplierStats.n_visited"></a>

#### n\_visited

<a id="matching.regional_suffix_applier.RegionalSuffixApplierStats.n_rewritten"></a>

#### n\_rewritten

<a id="matching.regional_suffix_applier.RegionalSuffixApplierStats.n_already_synthetic"></a>

#### n\_already\_synthetic

<a id="matching.regional_suffix_applier.RegionalSuffixApplierStats.n_unsupported_db"></a>

#### n\_unsupported\_db

<a id="matching.regional_suffix_applier.RegionalSuffixApplierStats.n_no_input"></a>

#### n\_no\_input

<a id="matching.regional_suffix_applier.RegionalSuffixApplierStats.n_skipped_non_water"></a>

#### n\_skipped\_non\_water

<a id="matching.regional_suffix_applier.RegionalSuffixApplier"></a>

## RegionalSuffixApplier Objects

```python
@dataclass(frozen=True)
class RegionalSuffixApplier()
```

Apply the ``@<region>`` synthetic code suffix to every regional
biosphere flow already linked in ``sp.data``.

Mirrors :class:`matching.biosphere.BiosphereMatcher`'s allow-list
so the suffix lands only on the databases the augmented catalog
knows how to synthesise rows for.

<a id="matching.regional_suffix_applier.RegionalSuffixApplier.REGIONAL_DB_ALLOWLIST"></a>

#### REGIONAL\_DB\_ALLOWLIST

<a id="matching.regional_suffix_applier.RegionalSuffixApplier.SEPARATOR"></a>

#### SEPARATOR

<a id="matching.regional_suffix_applier.RegionalSuffixApplier.CANONICAL_NAME_ALLOWLIST_PREFIXES"></a>

#### CANONICAL\_NAME\_ALLOWLIST\_PREFIXES

<a id="matching.regional_suffix_applier.RegionalSuffixApplier.SNAPSHOT_FIELD"></a>

#### SNAPSHOT\_FIELD

<a id="matching.regional_suffix_applier.RegionalSuffixApplier.parser"></a>

#### parser

<a id="matching.regional_suffix_applier.RegionalSuffixApplier.apply"></a>

#### apply

```python
def apply(sp_data: list[dict]) -> RegionalSuffixApplierStats
```
