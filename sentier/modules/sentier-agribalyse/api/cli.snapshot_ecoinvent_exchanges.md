**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.snapshot_ecoinvent_exchanges` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m cli.snapshot_ecoinvent_exchanges cfg.yml > cli.snapshot_ecoinvent_exchanges.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.snapshot_ecoinvent_exchanges"></a>

# cli.snapshot\_ecoinvent\_exchanges

``python -m cli.snapshot_ecoinvent_exchanges`` — bootstrap-time exchange dump.

Reads a ``bw2data``-shaped SQLite (``activitydataset`` + ``exchangedataset``
tables) and emits ``source/ecoinvent-3.9.1-cutoff-exchanges.parquet`` —
the long-form snapshot the runtime ScoringPackage builder concatenates
with the AGB frame to form a full square technosphere.

The runtime never reads SQLite. This CLI is bootstrap-only: it lifts
the exchanges out of a Brightway project once, then the runtime works
from the parquet alone. Pure ``stdlib + pandas + pyarrow`` — no
``bw2data`` import — so the snapshot can be regenerated even on a
machine that only has the bootstrap deps absent.

<a id="cli.snapshot_ecoinvent_exchanges.EcoinventSqliteReader"></a>

## EcoinventSqliteReader Objects

```python
@dataclass(frozen=True)
class EcoinventSqliteReader()
```

Read all exchanges owned by activities of one ``database`` from a
bw2data SQLite. The ``data`` BLOB is a pickled dict; we only pull
the fields the runtime actually needs (input ref, amount, type) so
the parquet stays compact.

<a id="cli.snapshot_ecoinvent_exchanges.EcoinventSqliteReader.sqlite_path"></a>

#### sqlite\_path

<a id="cli.snapshot_ecoinvent_exchanges.EcoinventSqliteReader.db_name"></a>

#### db\_name

<a id="cli.snapshot_ecoinvent_exchanges.EcoinventSqliteReader.read_exchanges"></a>

#### read\_exchanges

```python
def read_exchanges() -> pd.DataFrame
```

<a id="cli.snapshot_ecoinvent_exchanges.EcoinventExchangesSnapshotter"></a>

## EcoinventExchangesSnapshotter Objects

```python
@dataclass(frozen=True)
class EcoinventExchangesSnapshotter()
```

One-shot writer. Bootstrapping responsibility: reader → parquet.

<a id="cli.snapshot_ecoinvent_exchanges.EcoinventExchangesSnapshotter.reader"></a>

#### reader

<a id="cli.snapshot_ecoinvent_exchanges.EcoinventExchangesSnapshotter.output_path"></a>

#### output\_path

<a id="cli.snapshot_ecoinvent_exchanges.EcoinventExchangesSnapshotter.snapshot"></a>

#### snapshot

```python
def snapshot() -> dict[str, int]
```

<a id="cli.snapshot_ecoinvent_exchanges.SnapshotEcoinventExchangesCli"></a>

## SnapshotEcoinventExchangesCli Objects

```python
@dataclass
class SnapshotEcoinventExchangesCli(BaseCli)
```

<a id="cli.snapshot_ecoinvent_exchanges.SnapshotEcoinventExchangesCli.PROG"></a>

#### PROG

<a id="cli.snapshot_ecoinvent_exchanges.SnapshotEcoinventExchangesCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.snapshot_ecoinvent_exchanges.SnapshotEcoinventExchangesCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.snapshot_ecoinvent_exchanges.SnapshotEcoinventExchangesCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.snapshot_ecoinvent_exchanges.main"></a>

#### main

```python
def main() -> int
```
