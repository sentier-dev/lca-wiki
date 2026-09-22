**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.ecoinvent_exchanges` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.ecoinvent_exchanges cfg.yml > scoring.ecoinvent_exchanges.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.ecoinvent_exchanges"></a>

# scoring.ecoinvent\_exchanges

``EcoinventExchangesIngester`` — runtime reader for the ecoinvent snapshot.

Companion to ``cli.snapshot_ecoinvent_exchanges``. Reads
``source/ecoinvent-3.9.1-cutoff-exchanges.parquet`` and projects every
row to the long-form schema the ``ExchangeFrame`` matrix builders
expect — keyed by the same ``flow_id_for`` integer hash as
``ExchangeFrameBuilder.from_sp_data``, so concatenating AGB rows with
ecoinvent rows yields a single coherent technosphere.

Why ingest the full ecoinvent universe and not just the reachable
subset:

* The pre-refactor ``Database.process()`` walker also pulled all
  reachable activities (and the closure of their consumption edges).
  In practice this collapses to "all of ``ecoinvent-3.9.1-cutoff``"
  because every product is consumed somewhere.
* Pre-factorisation cost on a 40 k square A is dominated by fill-in,
  not size; with one big LU cached on the ``NativeLciaScorer``
  instance, every subsequent score is a triangular solve. Selectively
  pruning rows would save a few MB at best and reduce reuse — net
  loss for any backtest with more than a handful of products.

<a id="scoring.ecoinvent_exchanges.EcoinventExchangesIngester"></a>

## EcoinventExchangesIngester Objects

```python
@dataclass(frozen=True)
class EcoinventExchangesIngester()
```

Read the parquet snapshot and emit long-form exchange rows.

The output is a ``pd.DataFrame`` with the columns the
``ExchangeFrame`` constructor needs plus ``allocation_factor`` so
the downstream ``Allocator`` is a no-op for ecoinvent (every
activity is single-product).

<a id="scoring.ecoinvent_exchanges.EcoinventExchangesIngester.path"></a>

#### path

<a id="scoring.ecoinvent_exchanges.EcoinventExchangesIngester.load_long"></a>

#### load\_long

```python
def load_long() -> pd.DataFrame
```
