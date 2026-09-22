**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.flows` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_brightway.flows cfg.yml > sentier_brightway.flows.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.flows"></a>

# sentier\_brightway.flows

Read elementary-flow terms from sentier-vocab, split by upstream source.

<a id="sentier_brightway.flows.SHARD_COLUMNS"></a>

#### SHARD\_COLUMNS

<a id="sentier_brightway.flows.load_ef_flows"></a>

#### load\_ef\_flows

```python
def load_ef_flows(data_root: Path) -> pd.DataFrame
```

EF 3.1 flows: columns ``code, name, categories, cas_number``.

<a id="sentier_brightway.flows.load_bafu_flows"></a>

#### load\_bafu\_flows

```python
def load_bafu_flows(data_root: Path) -> pd.DataFrame
```

BAFU-2026 flows: same columns; ``categories`` = (compartment, sub_compartment).
