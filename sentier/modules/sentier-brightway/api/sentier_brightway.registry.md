**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.registry` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-brightway repo && git -C repo checkout a9dba75
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
  -I "$SP" -m sentier_brightway.registry cfg.yml > sentier_brightway.registry.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.registry"></a>

# sentier\_brightway.registry

Flat parquet registry with integer ``bw_id`` columns, the file-mode twin of the bw2data DBs.

Downstream (``datapackage.py``) conventions baked into these frames:

- A production exchange is identified by ``type == "production"``, never by
  ``input_bw_id == process_bw_id``: the real BAFU-2026 inventory has 78 technosphere
  self-loops (a process consuming its own reference product as an input), so that
  equality does not distinguish production from technosphere rows.
- ``negative`` is a nullable boolean; ``pd.NA`` means "not flagged", i.e. false.
- ``uncertainty_type`` is a nullable ``Int64``; ``pd.NA`` means undefined (bw2data's
  ``uncertainty type`` code 0), not "unknown".

<a id="sentier_brightway.registry.CATEGORY_SEP"></a>

#### CATEGORY\_SEP

<a id="sentier_brightway.registry.KEY_SEP"></a>

#### KEY\_SEP

<a id="sentier_brightway.registry.TABLE_COLUMNS"></a>

#### TABLE\_COLUMNS

<a id="sentier_brightway.registry.TABLE_NAMES"></a>

#### TABLE\_NAMES

<a id="sentier_brightway.registry.Registry"></a>

## Registry Objects

```python
@dataclass(frozen=True)
class Registry()
```

<a id="sentier_brightway.registry.Registry.processes"></a>

#### processes

<a id="sentier_brightway.registry.Registry.biosphere"></a>

#### biosphere

<a id="sentier_brightway.registry.Registry.exchanges"></a>

#### exchanges

<a id="sentier_brightway.registry.Registry.methods"></a>

#### methods

<a id="sentier_brightway.registry.Registry.characterization_factors"></a>

#### characterization\_factors

<a id="sentier_brightway.registry.build_registry"></a>

#### build\_registry

```python
def build_registry(result: BuildResult) -> Registry
```

Assign contiguous integer ``bw_id`` values (processes first, then biosphere nodes) and
flatten ``result`` into the five ``Registry`` frames, ``TABLE_COLUMNS`` order and dtypes.

<a id="sentier_brightway.registry.write_registry"></a>

#### write\_registry

```python
def write_registry(registry: Registry, folder: Path) -> Path
```

Write each ``Registry`` frame as its own parquet file under ``folder``.

<a id="sentier_brightway.registry.load_registry"></a>

#### load\_registry

```python
def load_registry(folder: Path) -> Registry
```

Read back a folder written by ``write_registry``.

Raises ``FileNotFoundError`` for a missing table and ``ValueError`` (naming the file and
the missing columns) for a table that is present but does not match ``TABLE_COLUMNS`` --
guards against a stale or hand-edited registry folder being fed into ``datapackage.py``.
