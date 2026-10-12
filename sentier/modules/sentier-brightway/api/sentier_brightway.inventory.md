**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.inventory` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_brightway.inventory cfg.yml > sentier_brightway.inventory.md
```

Generated file: do not edit by hand; regenerate with the command above.
Exception recorded here: on 2026-10-12 the docstrings and the `load_inventory` signature
below were updated by hand to commit `3239a4e` (pull request #3), which replaced the
sector-folder reader with a source-folder one; the rest of the file is as generated.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.inventory"></a>

# sentier\_brightway.inventory

Read one source folder of sentier-inventory (``data/<source>-<version>/``) into two frames.

<a id="sentier_brightway.inventory.PROCESS_COLUMNS"></a>

#### PROCESS\_COLUMNS

<a id="sentier_brightway.inventory.EXCHANGE_COLUMNS"></a>

#### EXCHANGE\_COLUMNS

<a id="sentier_brightway.inventory.UNCERTAINTY_COLUMNS"></a>

#### UNCERTAINTY\_COLUMNS

<a id="sentier_brightway.inventory.Inventory"></a>

## Inventory Objects

```python
@dataclass(frozen=True)
class Inventory()
```

<a id="sentier_brightway.inventory.Inventory.processes"></a>

#### processes

<a id="sentier_brightway.inventory.Inventory.exchanges"></a>

#### exchanges

<a id="sentier_brightway.inventory.Inventory.source_version"></a>

#### source\_version

``metadata.source_version`` of the folder read

<a id="sentier_brightway.inventory.Inventory.sectors"></a>

#### sectors

``metadata.sectors`` of the folder read, sorted

<a id="sentier_brightway.inventory.load_inventory"></a>

#### load\_inventory

```python
def load_inventory(data_root: Path,
                   source: str = DEFAULT_SOURCE,
                   source_version: str | None = None) -> Inventory
```

The processes and exchanges of one inventory ``source`` release.

sentier-inventory keeps one folder per published release, ``data/<source>-<version>/``,
with ``sector`` as a column on the processes. Folder selection reads only each folder's
``metadata.json`` (``source``, ``source_version``, ``sectors``), so other sources' parquet
is never opened. Without ``source_version`` the source must be present exactly once; with
it, that release is read. The ``sector`` column stays on the returned frame.
