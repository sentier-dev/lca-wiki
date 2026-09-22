**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `pipelines.link_all` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m pipelines.link_all cfg.yml > pipelines.link_all.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="pipelines.link_all"></a>

# pipelines.link\_all

``LinkAllPipeline`` — orchestrate every linking step.

Replaces the legacy ``scripts/link_all.py`` (~1633 lines) with a
composition of small classes. Each step is named so the run report
can attribute behavior to it.

Order:

1. Brightway project bootstrap + ecoinvent.
2. EF layer precondition (parquets must exist on disk).
3. SimaPro CSV (cached).
4. ``AggregateDeleter``.
5. Internal AGB linker (apply_strategies + first match_database).
6. Restore SimaPro names + simapro→ecoinvent transform.
7. Edge label corrector + biosphere flowmap (NaN-cf patched).
8. Standard label normaliser.
9. Production reclassifier (functional=False → technosphere).
10. Biosphere label normaliser + parquet-backed prelinker (StrategyRunner-wrapped).
11. ``BiosphereMatcher`` walks tiers.
12. ``TechnosphereMatcher``.
13. Pre-write coverage snapshot + ``UnlinkedExporter``.
14. NaN guard.
15. ``ScoringPackage`` emit:
    drop_unlinked → ``ExchangeFrameBuilder`` → ``Allocator`` →
    ``MethodCfRegistryLoader`` → ``ScoringPackageBuilder`` →
    ``ScoringPackageStore.write`` (+ ``ProductCatalogBuilder``).
16. ``RunReport`` writes JSON; ``AuditLog`` + ``SuppressedStrategyLog`` write parquet.

<a id="pipelines.link_all.LinkAllOptions"></a>

## LinkAllOptions Objects

```python
@dataclass(frozen=True)
class LinkAllOptions()
```

Pipeline options.

``skip_ecoinvent`` is a vestigial flag — the runtime no longer loads
ecoinvent into a bw2data project (REFACTOR_FINAL F4). It is kept
here so existing CLI invocations don't break; build-time downloads
happen in ``dds-build-ecoinvent-catalog``.

<a id="pipelines.link_all.LinkAllOptions.skip_ecoinvent"></a>

#### skip\_ecoinvent

<a id="pipelines.link_all.LinkAllPipeline"></a>

## LinkAllPipeline Objects

```python
@dataclass
class LinkAllPipeline()
```

<a id="pipelines.link_all.LinkAllPipeline.settings"></a>

#### settings

<a id="pipelines.link_all.LinkAllPipeline.options"></a>

#### options

<a id="pipelines.link_all.LinkAllPipeline.report"></a>

#### report

<a id="pipelines.link_all.LinkAllPipeline.run"></a>

#### run

```python
def run() -> RunReport
```

<a id="pipelines.link_all.LinkAllPipeline.emit_scoring_package"></a>

#### emit\_scoring\_package

```python
@classmethod
def emit_scoring_package(cls, sp: Any, settings: Settings,
                         report: RunReport) -> dict[str, Any]
```

Public entry for the emit stage — used by ``FastRescorePipeline``
to rebuild the package from a linked-cache snapshot without
re-running parse/transforms/matching.

<a id="pipelines.link_all.LinkAllPipeline.AGGREGATE_REGIONS"></a>

#### AGGREGATE\_REGIONS

<a id="pipelines.link_all.LinkAllPipeline.AGGREGATE_FALLBACK"></a>

#### AGGREGATE\_FALLBACK
