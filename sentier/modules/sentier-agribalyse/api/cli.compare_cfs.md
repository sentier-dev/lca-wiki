**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.compare_cfs` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.compare_cfs cfg.yml > cli.compare_cfs.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.compare_cfs"></a>

# cli.compare\_cfs

``dds-compare-cfs`` — print per-method CF distribution stats side-by-side.

Compares ``cache/simapro-EF31-adapted-cfs.parquet`` (SimaPro's adapted EF 3.1
method export) against one of:

* ``registry/method_cfs/*.parquet`` — the built EF v3.1 CF registry that
  the scoring pipeline actually uses. **This is the default.** For every
  ecoinvent biosphere flow the registry has a CF for, ``FlowLevelCfJoiner``
  looks up the SimaPro CF for the same substance/compartment, then the
  per-method stats are computed over the joined ``(sp_cf, ef_cf)`` pairs.
  Both sides of every stat are now at the same granularity, so deltas
  measure real CF disagreement rather than data-shape mismatch.
* ``source/EF-LCIAMethod_CF(EF-v3.1)__lciamethods_CF.parquet`` — the raw JRC
  EF v3.1 reference (opt-in via ``--source raw``). Computes distribution
  stats over the full SimaPro and JRC substance × compartment exports
  independently. Useful for build-pipeline debugging and to inspect the
  EF v3.1 universe without the registry's flow-matching applied.

Output is one block per LCIA method on stdout (count/min/max/mean/
median/std/sum on each side).

<a id="cli.compare_cfs.MethodNameNormalizer"></a>

## MethodNameNormalizer Objects

```python
class MethodNameNormalizer()
```

Normalize SimaPro and EF31 LCIA method names so equivalents collide.

**Examples**:

  ``"Climate change - Biogenic"`` and ``"Climate change-Biogenic"``
  both → ``"climate change biogenic"``.
  
  ``"Ionising radiation, human health"`` → ``"ionising radiation"``
  (matches SimaPro's ``"Ionising radiation"``).
  
  ``"Climate change - Land use and LU change"`` →
  ``"climate change land use and land use change"`` to match the EF31
  ``"Climate change-Land use and land use change"``.

<a id="cli.compare_cfs.MethodNameNormalizer.normalize"></a>

#### normalize

```python
@classmethod
def normalize(cls, s: str) -> str
```

<a id="cli.compare_cfs.MethodAliasResolver"></a>

## MethodAliasResolver Objects

```python
@dataclass(frozen=True)
class MethodAliasResolver()
```

Map SimaPro LCIA method names to the built registry's method names.

Wraps :data:`SimaProEFCfTable.METHOD_TO_OUR_KEY` — the project's single
source of truth for SimaPro ↔ registry method-name aliasing. Also folds
SimaPro's ``- inorganics`` / ``- organics`` sub-methods into their root
parent (the registry only stores the parent).

<a id="cli.compare_cfs.MethodAliasResolver.strip_submethod"></a>

#### strip\_submethod

```python
def strip_submethod(simapro_method: str) -> str
```

<a id="cli.compare_cfs.MethodAliasResolver.simapro_to_registry"></a>

#### simapro\_to\_registry

```python
def simapro_to_registry(simapro_method: str) -> str | None
```

Return the registry category name, or ``None`` if no alias exists.

<a id="cli.compare_cfs.CfStatsComputer"></a>

## CfStatsComputer Objects

```python
class CfStatsComputer()
```

Compute the 7-stat summary for a pandas CF series.

<a id="cli.compare_cfs.CfStatsComputer.STAT_KEYS"></a>

#### STAT\_KEYS

<a id="cli.compare_cfs.CfStatsComputer.compute"></a>

#### compute

```python
@classmethod
def compute(cls, series: pd.Series) -> dict[str, float]
```

<a id="cli.compare_cfs.SimaproCfLoader"></a>

## SimaproCfLoader Objects

```python
@dataclass(frozen=True)
class SimaproCfLoader()
```

Read the SimaPro adapted-CFs parquet, return ``(method_raw, cf)``.

<a id="cli.compare_cfs.SimaproCfLoader.path"></a>

#### path

<a id="cli.compare_cfs.SimaproCfLoader.load"></a>

#### load

```python
def load() -> pd.DataFrame
```

<a id="cli.compare_cfs.Ef31CfLoader"></a>

## Ef31CfLoader Objects

```python
@dataclass(frozen=True)
class Ef31CfLoader()
```

Read the JRC EF v3.1 CFs parquet, return ``(method_raw, cf)``.

<a id="cli.compare_cfs.Ef31CfLoader.path"></a>

#### path

<a id="cli.compare_cfs.Ef31CfLoader.load"></a>

#### load

```python
def load() -> pd.DataFrame
```

<a id="cli.compare_cfs.MethodCfsRegistryLoader"></a>

## MethodCfsRegistryLoader Objects

```python
@dataclass(frozen=True)
class MethodCfsRegistryLoader()
```

Read the built EF v3.1 CF registry under ``registry/method_cfs/``.

The directory contains one parquet per method plus ``_index.json``
mapping each method's 4-tuple key (database, EF version, category,
indicator) to its parquet slug. ``load()`` concatenates every per-method
parquet's ``amount`` column into a single ``(method_raw, cf)`` DataFrame
where ``method_raw`` is the registry's category name (the 3rd element of
the key tuple, e.g. ``"energy resources: non-renewable"``).

<a id="cli.compare_cfs.MethodCfsRegistryLoader.path"></a>

#### path

<a id="cli.compare_cfs.MethodCfsRegistryLoader.load"></a>

#### load

```python
def load() -> pd.DataFrame
```

<a id="cli.compare_cfs.MethodRow"></a>

## MethodRow Objects

```python
@dataclass(frozen=True)
class MethodRow()
```

One row of the comparison table: per-method SimaPro and EF31 stat blocks.

<a id="cli.compare_cfs.MethodRow.display_name"></a>

#### display\_name

<a id="cli.compare_cfs.MethodRow.norm_key"></a>

#### norm\_key

<a id="cli.compare_cfs.MethodRow.simapro_stats"></a>

#### simapro\_stats

<a id="cli.compare_cfs.MethodRow.ef31_stats"></a>

#### ef31\_stats

<a id="cli.compare_cfs.CfComparator"></a>

## CfComparator Objects

```python
@dataclass(frozen=True)
class CfComparator()
```

Build comparison rows from the two loaders, applying name filters.

When ``alias_resolver`` is ``None`` (default), both sides are normalized
with :class:`MethodNameNormalizer` — appropriate when the right-hand side
is the raw EF31 parquet that uses similar method names to SimaPro.

When ``alias_resolver`` is set, the SimaPro side is mapped to the
registry's category names via :data:`SimaProEFCfTable.METHOD_TO_OUR_KEY`
(and sub-method suffixes are folded into the root). The right-hand side
is the built registry, whose category names are already canonical, so
they're only lowercased/stripped.

<a id="cli.compare_cfs.CfComparator.simapro_loader"></a>

#### simapro\_loader

<a id="cli.compare_cfs.CfComparator.ef31_loader"></a>

#### ef31\_loader

<a id="cli.compare_cfs.CfComparator.method_filters"></a>

#### method\_filters

<a id="cli.compare_cfs.CfComparator.alias_resolver"></a>

#### alias\_resolver

<a id="cli.compare_cfs.CfComparator.build_rows"></a>

#### build\_rows

```python
def build_rows() -> list[MethodRow]
```

<a id="cli.compare_cfs.JoinedFlowCfComparator"></a>

## JoinedFlowCfComparator Objects

```python
@dataclass(frozen=True)
class JoinedFlowCfComparator()
```

Build :class:`MethodRow` list by joining registry CFs against SimaPro
at the ecoinvent biosphere flow level.

Per registry method:

1. Load ``registry/method_cfs/<slug>/cfs.parquet`` (cols: database,
   code, amount = ef_cf).
2. Apply :class:`FlowLevelCfJoiner` to attach an ``sp_cf`` to every
   row via the biosphere catalog + context normaliser + SP index.
3. Compute :class:`CfStatsComputer.compute` on the ``sp_cf`` and
   ``ef_cf`` columns directly. pandas' default NaN-skipping means
   SP-side stats automatically ignore flows that didn't match in SP.

Returns the rows plus the list of joined frames (the frames are a
byproduct of the per-method stat computation; the CLI uses only the rows).

<a id="cli.compare_cfs.JoinedFlowCfComparator.registry_dir"></a>

#### registry\_dir

<a id="cli.compare_cfs.JoinedFlowCfComparator.joiner"></a>

#### joiner

<a id="cli.compare_cfs.JoinedFlowCfComparator.method_filters"></a>

#### method\_filters

<a id="cli.compare_cfs.JoinedFlowCfComparator.build_rows"></a>

#### build\_rows

```python
def build_rows() -> tuple[list[MethodRow], list[JoinedFlowFrame]]
```

<a id="cli.compare_cfs.ConsoleReporter"></a>

## ConsoleReporter Objects

```python
@dataclass(frozen=True)
class ConsoleReporter()
```

Format ``MethodRow`` lists as side-by-side stat blocks on stdout.

<a id="cli.compare_cfs.ConsoleReporter.decimals"></a>

#### decimals

<a id="cli.compare_cfs.ConsoleReporter.render"></a>

#### render

```python
def render(rows: list[MethodRow], stream: TextIO | None = None) -> None
```

<a id="cli.compare_cfs.CompareConfig"></a>

## CompareConfig Objects

```python
@dataclass(frozen=True)
class CompareConfig()
```

Per-run knobs (not paths — those come from ``Settings.paths``).

<a id="cli.compare_cfs.CompareConfig.SOURCE_REGISTRY"></a>

#### SOURCE\_REGISTRY

<a id="cli.compare_cfs.CompareConfig.SOURCE_RAW"></a>

#### SOURCE\_RAW

<a id="cli.compare_cfs.CompareConfig.VALID_SOURCES"></a>

#### VALID\_SOURCES

<a id="cli.compare_cfs.CompareConfig.decimals"></a>

#### decimals

<a id="cli.compare_cfs.CompareConfig.method_filters"></a>

#### method\_filters

<a id="cli.compare_cfs.CompareConfig.source"></a>

#### source

<a id="cli.compare_cfs.CompareConfig.emit"></a>

#### emit

<a id="cli.compare_cfs.CompareConfig.used_only"></a>

#### used\_only

<a id="cli.compare_cfs.CompareCfsCli"></a>

## CompareCfsCli Objects

```python
class CompareCfsCli(BaseCli)
```

``dds-compare-cfs`` entry point.

<a id="cli.compare_cfs.CompareCfsCli.PROG"></a>

#### PROG

<a id="cli.compare_cfs.CompareCfsCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.compare_cfs.CompareCfsCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.compare_cfs.CompareCfsCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.compare_cfs.main"></a>

#### main

```python
def main() -> int
```
