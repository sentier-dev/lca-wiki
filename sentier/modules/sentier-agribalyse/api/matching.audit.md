**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `matching.audit` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matching.audit cfg.yml > matching.audit.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matching.audit"></a>

# matching.audit

``AuditLog`` — accumulates audit entries and writes them as a parquet.

Every match decision that overrides a previously-set link goes here
(REFACTOR.md §6 + fix 1.e). Every silently-suppressed exception in the
bw2io strategy chain goes into ``SuppressedStrategyLog`` (fix 1.g).
Every drop from the cleanup strategies goes into ``DropTallyTracker``
(fix 1.i).

<a id="matching.audit.AuditLog"></a>

## AuditLog Objects

```python
@dataclass
class AuditLog()
```

Accumulates audit entries for the run and writes them to parquet.

<a id="matching.audit.AuditLog.output_path"></a>

#### output\_path

<a id="matching.audit.AuditLog.entries"></a>

#### entries

<a id="matching.audit.AuditLog.record"></a>

#### record

```python
def record(entry: AuditEntry) -> None
```

<a id="matching.audit.AuditLog.record_new_link"></a>

#### record\_new\_link

```python
def record_new_link(*,
                    process_name: str,
                    exchange_name: str,
                    exchange_unit: str,
                    exchange_bucket: str,
                    new_tier: Tier,
                    new_target_db: str,
                    new_target_code: str,
                    new_provenance: str,
                    unit_conversion: float = 1.0) -> None
```

<a id="matching.audit.AuditLog.record_override"></a>

#### record\_override

```python
def record_override(*,
                    process_name: str,
                    exchange_name: str,
                    exchange_unit: str,
                    exchange_bucket: str,
                    new_tier: Tier,
                    new_target_db: str,
                    new_target_code: str,
                    new_provenance: str,
                    prior_tier: Tier | None,
                    prior_target_db: str,
                    prior_target_code: str,
                    unit_conversion: float = 1.0,
                    reason: str = "") -> None
```

<a id="matching.audit.AuditLog.record_unit_mismatch"></a>

#### record\_unit\_mismatch

```python
def record_unit_mismatch(*, process_name: str, exchange_name: str,
                         exchange_unit: str, exchange_bucket: str,
                         candidate_tier: Tier, candidate_target_db: str,
                         candidate_target_code: str, candidate_provenance: str,
                         candidate_unit: str) -> None
```

<a id="matching.audit.AuditLog.record_ambiguous"></a>

#### record\_ambiguous

```python
def record_ambiguous(*, process_name: str, exchange_name: str,
                     exchange_unit: str, exchange_bucket: str,
                     candidate_tier: Tier, n_candidates: int) -> None
```

<a id="matching.audit.AuditLog.write"></a>

#### write

```python
def write() -> Path
```

<a id="matching.audit.AuditLog.__len__"></a>

#### \_\_len\_\_

```python
def __len__() -> int
```

<a id="matching.audit.SuppressedStrategyLog"></a>

## SuppressedStrategyLog Objects

```python
@dataclass
class SuppressedStrategyLog()
```

Captures exceptions that the legacy linker silently suppressed (fix 1.g).

<a id="matching.audit.SuppressedStrategyLog.output_path"></a>

#### output\_path

<a id="matching.audit.SuppressedStrategyLog.entries"></a>

#### entries

<a id="matching.audit.SuppressedStrategyLog.record"></a>

#### record

```python
def record(strategy: str,
           exc: BaseException,
           *,
           occurred_at_step: str = "") -> None
```

<a id="matching.audit.SuppressedStrategyLog.counts_by_strategy"></a>

#### counts\_by\_strategy

```python
def counts_by_strategy() -> dict[str, int]
```

<a id="matching.audit.SuppressedStrategyLog.write"></a>

#### write

```python
def write() -> Path
```

<a id="matching.audit.DropTallyTracker"></a>

## DropTallyTracker Objects

```python
@dataclass
class DropTallyTracker()
```

Counts drops from cleanup strategies (fix 1.i).

<a id="matching.audit.DropTallyTracker.events"></a>

#### events

<a id="matching.audit.DropTallyTracker.record"></a>

#### record

```python
def record(strategy: str, n_dropped: int, process_name: str = "") -> None
```

<a id="matching.audit.DropTallyTracker.totals_by_strategy"></a>

#### totals\_by\_strategy

```python
def totals_by_strategy() -> dict[str, int]
```
