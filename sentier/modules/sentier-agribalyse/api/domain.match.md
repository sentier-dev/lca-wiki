**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `domain.match` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m domain.match cfg.yml > domain.match.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="domain.match"></a>

# domain.match

Match-outcome value objects emitted by the matchers.

<a id="domain.match.MatchOutcome"></a>

## MatchOutcome Objects

```python
@dataclass(frozen=True)
class MatchOutcome()
```

Result of attempting to match one exchange against the registry.

<a id="domain.match.MatchOutcome.matched"></a>

#### matched

<a id="domain.match.MatchOutcome.tier"></a>

#### tier

<a id="domain.match.MatchOutcome.target_db"></a>

#### target\_db

<a id="domain.match.MatchOutcome.target_code"></a>

#### target\_code

<a id="domain.match.MatchOutcome.target_unit"></a>

#### target\_unit

<a id="domain.match.MatchOutcome.unit_conversion"></a>

#### unit\_conversion

<a id="domain.match.MatchOutcome.provenance"></a>

#### provenance

<a id="domain.match.MatchOutcome.skipped_reason"></a>

#### skipped\_reason

<a id="domain.match.MatchOutcome.hit"></a>

#### hit

```python
@classmethod
def hit(cls,
        *,
        tier: Tier,
        target_db: str,
        target_code: str,
        target_unit: str,
        unit_conversion: float = 1.0,
        provenance: str = "") -> MatchOutcome
```

<a id="domain.match.MatchOutcome.miss"></a>

#### miss

```python
@classmethod
def miss(cls, reason: str = "") -> MatchOutcome
```

<a id="domain.match.TierStats"></a>

## TierStats Objects

```python
@dataclass(frozen=True)
class TierStats()
```

Per-tier counters summed into the run report.

<a id="domain.match.TierStats.tier"></a>

#### tier

<a id="domain.match.TierStats.n_attempted"></a>

#### n\_attempted

<a id="domain.match.TierStats.n_matched"></a>

#### n\_matched

<a id="domain.match.TierStats.n_overrode"></a>

#### n\_overrode

<a id="domain.match.TierStats.n_skipped_unit"></a>

#### n\_skipped\_unit

<a id="domain.match.TierStats.n_skipped_ambiguous"></a>

#### n\_skipped\_ambiguous
