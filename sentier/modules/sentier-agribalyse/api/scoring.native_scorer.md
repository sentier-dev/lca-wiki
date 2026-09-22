**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.native_scorer` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.native_scorer cfg.yml > scoring.native_scorer.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.native_scorer"></a>

# scoring.native\_scorer

``NativeLciaScorer`` — score directly from a ``ScoringPackage``.

Phase 5 of the SQLite refactor. ``LciaScorer`` (the legacy class) goes
through ``bw2calc.LCA``, which is fine but adds:

* an extra layer of indirection (``data_objs`` plumbing),
* an internal demand-vector dictionary keyed by activity id,
* a method-switch hook that re-binds the characterization on every
  method change.

The native scorer skips all three: with the matrices already loaded as
``scipy.sparse`` CSR, scoring is just ``Q @ B @ spsolve(A, demand)``.
Factorization is cached on the first call so subsequent products reuse
the LU. With pypardiso the factorization is shared via its singleton
solver; with scipy we cache an LU on this scorer instance.

Crucially, this scorer never touches ``bw2data``. With it in place,
the runtime image of the agent doesn't need bw2data, peewee, or the
SQLite ``databases.db`` file. ``bw2data`` is build-time only — used by
``SimaProImporter`` to parse the input CSV and by ``ExchangeFrameBuilder``
to produce the input frame, but neither runs at scoring time.

<a id="scoring.native_scorer.NativeLciaScorer"></a>

## NativeLciaScorer Objects

```python
@dataclass
class NativeLciaScorer()
```

Score products against methods using only ``scipy.sparse``.

Build it with a fully-loaded ``ScoringPackage``; call ``score(...)``
with a sequence of ``(process_key, product_id)`` tuples. The scorer
caches the LU after the first solve so subsequent products are
millisecond-scale.

<a id="scoring.native_scorer.NativeLciaScorer.package"></a>

#### package

<a id="scoring.native_scorer.NativeLciaScorer.use_pardiso"></a>

#### use\_pardiso

<a id="scoring.native_scorer.NativeLciaScorer.score"></a>

#### score

```python
def score(
    products: Sequence[tuple[tuple[str, str], int]],
    methods: Sequence[tuple[str,
                            ...]]) -> dict[tuple[str, str], ScoringResult]
```

Score every product against every method.

``products`` is a sequence of ``(process_key, product_id)``: the
key indexes the result dict (matching the legacy ``LciaScorer``
contract); the id is the integer that lives in the technosphere
matrix's row map.

<a id="scoring.native_scorer.NativeWorkerPayload"></a>

## NativeWorkerPayload Objects

```python
@dataclass(frozen=True)
class NativeWorkerPayload()
```

Pickle-friendly worker input for native scoring — store paths + product ids only.

<a id="scoring.native_scorer.NativeWorkerPayload.store_root"></a>

#### store\_root

<a id="scoring.native_scorer.NativeWorkerPayload.content_hash"></a>

#### content\_hash

<a id="scoring.native_scorer.NativeWorkerPayload.products"></a>

#### products

<a id="scoring.native_scorer.NativeWorkerPayload.methods"></a>

#### methods

<a id="scoring.native_scorer.NativeWorkerPayload.use_pardiso"></a>

#### use\_pardiso

<a id="scoring.native_scorer.NativeScoreWorker"></a>

## NativeScoreWorker Objects

```python
@dataclass(frozen=True)
class NativeScoreWorker()
```

Callable worker — picklable under the 'spawn' context.

A frozen dataclass with ``__call__`` satisfies both the OOP rule (no module-level
functions doing real work) and ProcessPoolExecutor's pickle requirement.

<a id="scoring.native_scorer.NativeScoreWorker.__call__"></a>

#### \_\_call\_\_

```python
def __call__(
        payload: NativeWorkerPayload) -> dict[tuple[str, str], ScoringResult]
```
