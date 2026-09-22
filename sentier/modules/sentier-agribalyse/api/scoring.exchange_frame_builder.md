**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.exchange_frame_builder` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.exchange_frame_builder cfg.yml > scoring.exchange_frame_builder.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.exchange_frame_builder"></a>

# scoring.exchange\_frame\_builder

``ExchangeFrameBuilder`` — bridge from SimaPro-shape data to ExchangeFrame.

The linker's output (``SimaProImporter.data``) is a list of dicts with
nested ``exchanges`` arrays, each carrying string ``(database, code)``
references. We project that nested shape into a flat long-form frame
keyed by integer ids — ready for the ``Allocator`` and the matrix
builders.

Id assignment: deterministic. Each ``(database, code)`` string pair is
hashed into a 63-bit integer via SHA-256 truncation. Collisions across
a real database (≤100k activities) are vanishingly improbable, and
this avoids the need to coordinate sequential counters across runs.
The same ``(database, code)`` always maps to the same id, so caches
keyed by content hash remain stable.

This is the Phase 5 building block: with it, ``LinkAllPipeline`` can
emit a ``ScoringPackage`` directly from ``sp.data`` and never touch
``bw2data.Database.process()``.

<a id="scoring.exchange_frame_builder.ExchangeFrameBuilder"></a>

## ExchangeFrameBuilder Objects

```python
@dataclass(frozen=True)
class ExchangeFrameBuilder()
```

Stateless builder. ``from_sp_data(data)`` returns an ``ExchangeFrame``.

<a id="scoring.exchange_frame_builder.ExchangeFrameBuilder.from_sp_data"></a>

#### from\_sp\_data

```python
def from_sp_data(data: Iterable[dict]) -> ExchangeFrame
```

Project a list of activity dicts into a long-form frame.

Each activity ``ds`` contributes one row per ``ds["exchanges"]``
entry. The activity's own ``(database, code)`` is the row's
``output_id``; the exchange's ``input`` is the ``input_id``.
Allocation factors are read from ``properties["manual_allocation"]``
when present, defaulting to 1.0 for single-product activities.

<a id="scoring.exchange_frame_builder.ExchangeFrameBuilder.long_from_sp_data"></a>

#### long\_from\_sp\_data

```python
def long_from_sp_data(data: Iterable[dict]) -> pd.DataFrame
```

Public projection helper. Returns the long-form DataFrame —
same schema as the parquet snapshots — so callers can ``pd.concat``
AGB rows with ecoinvent rows and rebuild a single ExchangeFrame
in one go (see ``frame_from_long``).

<a id="scoring.exchange_frame_builder.ExchangeFrameBuilder.frame_from_long"></a>

#### frame\_from\_long

```python
def frame_from_long(df: pd.DataFrame) -> ExchangeFrame
```

Public alias for ``_frame_from_long`` — preserves
``allocation_factor`` through ``ExchangeFrame.from_long``'s
column-stripping. Use when concatenating multiple long-form
sources (AGB sp.data + ecoinvent parquet snapshot).

<a id="scoring.exchange_frame_builder.ExchangeFrameBuilder.flow_id_for"></a>

#### flow\_id\_for

```python
@classmethod
def flow_id_for(cls, key: tuple[str, str]) -> int
```

SHA-256 → 63-bit integer for a ``(database, code)`` key.

This is the canonical key→id hash for the entire SQL-free data
plane: every consumer that needs to join an external flow table
(method CFs, product catalog, etc.) against the technosphere /
biosphere row maps must compute its integer ids through this
classmethod. Sharing the function guarantees the integer space
stays consistent — the alternative is duplicated hash logic
drifting silently.

Stable across runs and platforms: SHA-256 + truncation to 63 bits
keeps every value safely within ``int64``.
