**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.methods` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_brightway.methods cfg.yml > sentier_brightway.methods.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.methods"></a>

# sentier\_brightway.methods

Read EF 3.1 methods and their global characterization factors from sentier-methods.

<a id="sentier_brightway.methods.METHOD_COLUMNS"></a>

#### METHOD\_COLUMNS

<a id="sentier_brightway.methods.CF_COLUMNS"></a>

#### CF\_COLUMNS

<a id="sentier_brightway.methods.MethodSpec"></a>

## MethodSpec Objects

```python
@dataclass(frozen=True)
class MethodSpec()
```

<a id="sentier_brightway.methods.MethodSpec.key"></a>

#### key

<a id="sentier_brightway.methods.MethodSpec.method_id"></a>

#### method\_id

<a id="sentier_brightway.methods.MethodSpec.unit"></a>

#### unit

<a id="sentier_brightway.methods.MethodSpec.description"></a>

#### description

<a id="sentier_brightway.methods.MethodSpec.cfs"></a>

#### cfs

(ef_flow_code, factor)

<a id="sentier_brightway.methods.MethodSpec.flow_context"></a>

#### flow\_context

ef_flow_code -> context path

<a id="sentier_brightway.methods.MethodSpec.flow_name"></a>

#### flow\_name

<a id="sentier_brightway.methods.load_methods"></a>

#### load\_methods

```python
def load_methods(data_root: Path) -> tuple[MethodSpec, ...]
```
