**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `domain.audit` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m domain.audit cfg.yml > domain.audit.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="domain.audit"></a>

# domain.audit

Audit-trail data classes. One row per override / drop / suppression.

<a id="domain.audit.OverrideKind"></a>

## OverrideKind Objects

```python
class OverrideKind(StrEnum)
```

<a id="domain.audit.OverrideKind.NEW_LINK"></a>

#### NEW\_LINK

A previously-unlinked exchange was assigned a target.

<a id="domain.audit.OverrideKind.OVERRIDE"></a>

#### OVERRIDE

A higher-priority tier displaced an existing link.

<a id="domain.audit.OverrideKind.SAME_TIER_OVERRIDE"></a>

#### SAME\_TIER\_OVERRIDE

A row at the same tier displaced another. Always logged for review.

<a id="domain.audit.OverrideKind.REJECTED_LOWER_TIER"></a>

#### REJECTED\_LOWER\_TIER

A row from a lower-priority tier was prevented from claiming a link.

<a id="domain.audit.OverrideKind.REJECTED_UNIT_MISMATCH"></a>

#### REJECTED\_UNIT\_MISMATCH

A candidate was skipped because units didn't match and no conversion exists (fix 1.e).

<a id="domain.audit.OverrideKind.SKIPPED_AMBIGUOUS"></a>

#### SKIPPED\_AMBIGUOUS

Multiple equally-valid candidates with no deterministic tie-breaker (fix 1.f).

<a id="domain.audit.AuditEntry"></a>

## AuditEntry Objects

```python
@dataclass(frozen=True)
class AuditEntry()
```

One row of ``override_audit.parquet``.

<a id="domain.audit.AuditEntry.process_name"></a>

#### process\_name

<a id="domain.audit.AuditEntry.exchange_name"></a>

#### exchange\_name

<a id="domain.audit.AuditEntry.exchange_unit"></a>

#### exchange\_unit

<a id="domain.audit.AuditEntry.exchange_bucket"></a>

#### exchange\_bucket

<a id="domain.audit.AuditEntry.kind"></a>

#### kind

<a id="domain.audit.AuditEntry.new_tier"></a>

#### new\_tier

<a id="domain.audit.AuditEntry.new_target_db"></a>

#### new\_target\_db

<a id="domain.audit.AuditEntry.new_target_code"></a>

#### new\_target\_code

<a id="domain.audit.AuditEntry.new_provenance"></a>

#### new\_provenance

<a id="domain.audit.AuditEntry.prior_tier"></a>

#### prior\_tier

<a id="domain.audit.AuditEntry.prior_target_db"></a>

#### prior\_target\_db

<a id="domain.audit.AuditEntry.prior_target_code"></a>

#### prior\_target\_code

<a id="domain.audit.AuditEntry.reason"></a>

#### reason

<a id="domain.audit.AuditEntry.unit_conversion"></a>

#### unit\_conversion

<a id="domain.audit.AUDIT_COLUMNS"></a>

#### AUDIT\_COLUMNS

<a id="domain.audit.SuppressedStrategy"></a>

## SuppressedStrategy Objects

```python
@dataclass(frozen=True)
class SuppressedStrategy()
```

One row of ``suppressed_strategies.parquet`` — fix 1.g.

Replaces silent ``contextlib.suppress(Exception)`` over the bw2io
strategy chain. Captures what threw so the run report can surface it.

<a id="domain.audit.SuppressedStrategy.strategy"></a>

#### strategy

<a id="domain.audit.SuppressedStrategy.error_type"></a>

#### error\_type

<a id="domain.audit.SuppressedStrategy.error_message"></a>

#### error\_message

<a id="domain.audit.SuppressedStrategy.occurred_at_step"></a>

#### occurred\_at\_step

<a id="domain.audit.DropEvent"></a>

## DropEvent Objects

```python
@dataclass(frozen=True)
class DropEvent()
```

One row of the drop tally — fix 1.i.

Counts ``drop_final_waste_flows`` and
``drop_zero_amount_unlinked_biosphere`` invocations + per-call removed
counts so the report can report drops per strategy.

<a id="domain.audit.DropEvent.strategy"></a>

#### strategy

<a id="domain.audit.DropEvent.n_dropped"></a>

#### n\_dropped

<a id="domain.audit.DropEvent.process_name"></a>

#### process\_name
