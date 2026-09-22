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
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.inventory"></a>

# sentier\_brightway.inventory

Read sentier-inventory sector folders into two flat frames.

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

<a id="sentier_brightway.inventory.load_inventory"></a>

#### load\_inventory

```python
def load_inventory(data_root: Path) -> Inventory
```

Concatenate every ``data/<NN>-<sector>/`` folder of sentier-inventory.

Sectors such as ``99-obsolete`` are intentionally included: their processes are
still link targets for exchanges recorded in other sectors.
