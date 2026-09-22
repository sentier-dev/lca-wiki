**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.activity_location_overrides` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.activity_location_overrides cfg.yml > scoring.activity_location_overrides.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.activity_location_overrides"></a>

# scoring.activity\_location\_overrides

``ActivityLocationOverrides`` — per-activity ISO-2 location overrides.

AGB stand-in activities frequently inherit aggregate ecoinvent locations
(``GLO`` / ``RoW`` / ``RER``) that hide the regional context ADEME's
synthese assumes. The default resolver collapses those aggregates to
``AGGREGATE_FALLBACK = None`` (see ``link_all.py``) which leaves the
scorer on the global CF — fine for tropical-fruit GLOs where the global
mean is roughly right, but catastrophically wrong for FR-greenhouse
crops where ADEME implicitly applies a FR water context (sweet pepper
greenhouse: score 1.42 vs ADEME 0.29, 4.8× over).

This class loads a curated JSON of ``(database, code) → ISO-2`` rows
that the link pipeline applies *after* the catalog / name-parser passes,
so the override is final for the listed activities and leaves every
other column at its parsed/global resolution. Curation is intentional —
we tested a blanket ``GLO → FR`` fallback and it broke the tropical
products it doesn't apply to (mean |Δ| 35.9% → 66.9%, outliers 307 →
980; see ``link_all.py:566-577``).

File format::

    {
      "version": 1,
      "overrides": [
        {
          "database": "agribalyse-3.2",
          "code": "AGRIBALU000000003101321",
          "location": "FR",
          "rationale": "free-form note kept for human review"
        }
      ]
    }

Missing file → empty overrides (no-op). Duplicate ``(database, code)``
pairs raise at load time so the file stays the single source of truth.

<a id="scoring.activity_location_overrides.ActivityLocationOverrides"></a>

## ActivityLocationOverrides Objects

```python
@dataclass(frozen=True)
class ActivityLocationOverrides()
```

Frozen view over the curated ``(database, code) → location`` table.

<a id="scoring.activity_location_overrides.ActivityLocationOverrides.SCHEMA_VERSION"></a>

#### SCHEMA\_VERSION

<a id="scoring.activity_location_overrides.ActivityLocationOverrides.empty"></a>

#### empty

```python
@classmethod
def empty(cls) -> ActivityLocationOverrides
```

<a id="scoring.activity_location_overrides.ActivityLocationOverrides.load"></a>

#### load

```python
@classmethod
def load(cls, path: Path) -> ActivityLocationOverrides
```

Load overrides from a JSON file. Missing file → empty (no-op).

<a id="scoring.activity_location_overrides.ActivityLocationOverrides.location_for"></a>

#### location\_for

```python
def location_for(database: str, code: str) -> str | None
```

<a id="scoring.activity_location_overrides.ActivityLocationOverrides.items"></a>

#### items

```python
def items() -> Iterator[tuple[str, str, str]]
```

Yield ``(database, code, location)`` tuples for all overrides.

<a id="scoring.activity_location_overrides.ActivityLocationOverrides.__len__"></a>

#### \_\_len\_\_

```python
def __len__() -> int
```

<a id="scoring.activity_location_overrides.ActivityLocationOverrides.__bool__"></a>

#### \_\_bool\_\_

```python
def __bool__() -> bool
```
