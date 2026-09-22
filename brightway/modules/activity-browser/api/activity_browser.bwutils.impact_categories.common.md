**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.impact_categories.common` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'activity-browser==3.0.0b202608291724'
SP="$(pkg/bin/python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
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
  -I "$SP" -m activity_browser.bwutils.impact_categories.common cfg.yml > activity_browser.bwutils.impact_categories.common.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.impact_categories.common"></a>

# activity\_browser.bwutils.impact\_categories.common

Shared helpers for impact-category (LCIA) file interchange.

<a id="activity_browser.bwutils.impact_categories.common.ConflictMode"></a>

## ConflictMode Objects

```python
class ConflictMode(str, Enum)
```

<a id="activity_browser.bwutils.impact_categories.common.ConflictMode.SKIP"></a>

#### SKIP

<a id="activity_browser.bwutils.impact_categories.common.ConflictMode.OVERWRITE"></a>

#### OVERWRITE

<a id="activity_browser.bwutils.impact_categories.common.ConflictMode.RENAME_PREFIX"></a>

#### RENAME\_PREFIX

<a id="activity_browser.bwutils.impact_categories.common.ImportStats"></a>

## ImportStats Objects

```python
@dataclass
class ImportStats()
```

<a id="activity_browser.bwutils.impact_categories.common.ImportStats.written"></a>

#### written

<a id="activity_browser.bwutils.impact_categories.common.ImportStats.skipped"></a>

#### skipped

<a id="activity_browser.bwutils.impact_categories.common.ImportStats.unlinked"></a>

#### unlinked

<a id="activity_browser.bwutils.impact_categories.common.CancelledError"></a>

## CancelledError Objects

```python
class CancelledError(Exception)
```

Raised when the user cancels a long-running LCIA file job.

<a id="activity_browser.bwutils.impact_categories.common.raise_if_cancelled"></a>

#### raise\_if\_cancelled

```python
def raise_if_cancelled(check) -> None
```

<a id="activity_browser.bwutils.impact_categories.common.join_tuple_path"></a>

#### join\_tuple\_path

```python
def join_tuple_path(parts: Sequence[Any]) -> str
```

<a id="activity_browser.bwutils.impact_categories.common.split_tuple_path"></a>

#### split\_tuple\_path

```python
def split_tuple_path(value: str | None) -> tuple[str, ...]
```

<a id="activity_browser.bwutils.impact_categories.common.cell_str"></a>

#### cell\_str

```python
def cell_str(value: Any) -> str
```

Coerce a spreadsheet cell to ``str``; blank for missing/NaN.

<a id="activity_browser.bwutils.impact_categories.common.apply_name_conflicts"></a>

#### apply\_name\_conflicts

```python
def apply_name_conflicts(
        data: list[dict],
        existing: set[tuple],
        *,
        mode: ConflictMode,
        prefix: str | None = None,
        renames: dict[tuple, tuple] | None = None) -> list[dict]
```

Return a new method list after applying conflict policy (pure transform).

<a id="activity_browser.bwutils.impact_categories.common.cf_amount_and_uncertainty"></a>

#### cf\_amount\_and\_uncertainty

```python
def cf_amount_and_uncertainty(cf_data: Any) -> dict[str, Any]
```

<a id="activity_browser.bwutils.impact_categories.common.uncertainty_from_series"></a>

#### uncertainty\_from\_series

```python
def uncertainty_from_series(row: Mapping[str, Any]) -> dict[str, Any]
```

Typed uncertainty fields from a spreadsheet row (skip missing/NaN).

<a id="activity_browser.bwutils.impact_categories.common.activity_for_cf_key"></a>

#### activity\_for\_cf\_key

```python
def activity_for_cf_key(key: Any)
```

<a id="activity_browser.bwutils.impact_categories.common.unlinked_exchanges"></a>

#### unlinked\_exchanges

```python
def unlinked_exchanges(data: list[dict]) -> list[dict]
```

<a id="activity_browser.bwutils.impact_categories.common.exchange_link_counts"></a>

#### exchange\_link\_counts

```python
def exchange_link_counts(data: list[dict]) -> tuple[int, int]
```

Return ``(linked_cf_count, unlinked_cf_count)`` after strategies.

<a id="activity_browser.bwutils.impact_categories.common.drop_unlinked_exchanges"></a>

#### drop\_unlinked\_exchanges

```python
def drop_unlinked_exchanges(data: list[dict]) -> list[dict]
```
