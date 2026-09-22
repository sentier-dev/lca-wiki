**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `ef.cf_table` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ef.cf_table cfg.yml > ef.cf_table.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ef.cf_table"></a>

# ef.cf\_table

``EfCfTable`` — load + collapse the EF v3.1 CF parquet.

<a id="ef.cf_table.EfCfTable"></a>

## EfCfTable Objects

```python
@dataclass(frozen=True)
class EfCfTable()
```

Loaded view of ``EF-LCIAMethod_CF(EF-v3.1)__lciamethods_CF.parquet``.

<a id="ef.cf_table.EfCfTable.path"></a>

#### path

<a id="ef.cf_table.EfCfTable.parquet"></a>

#### parquet

type: ignore[assignment]

<a id="ef.cf_table.EfCfTable.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__() -> None
```

<a id="ef.cf_table.EfCfTable.raw"></a>

#### raw

```python
@cached_property
def raw() -> pd.DataFrame
```

<a id="ef.cf_table.EfCfTable.global_cfs"></a>

#### global\_cfs

```python
@cached_property
def global_cfs() -> pd.DataFrame
```

One CF per (LCIAMethod_name, FLOW_uuid) — prefer NULL-location else mean.
