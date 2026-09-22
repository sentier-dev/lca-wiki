**Generated API reference** · package `randonneur` 0.7.2 · module `randonneur.generic_transformation` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'randonneur==0.7.2'
SP="$(pkg/bin/python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
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
  -I "$SP" -m randonneur.generic_transformation cfg.yml > randonneur.generic_transformation.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="randonneur.generic_transformation"></a>

# randonneur.generic\_transformation

<a id="randonneur.generic_transformation.generic_transformation"></a>

#### generic\_transformation

```python
def generic_transformation(
        graph: List[dict],
        migrations: dict,
        verb_dispatch: Dict[str, Callable],
        is_edges: bool = True,
        config: Optional[MigrationConfig] = None) -> List[dict]
```
