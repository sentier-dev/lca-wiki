**Generated API reference** · package `bw2data` 4.7 · module `bw2data.subclass_mapping` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2data==4.7'
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
  -I "$SP" -m bw2data.subclass_mapping cfg.yml > bw2data.subclass_mapping.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.subclass_mapping"></a>

# bw2data.subclass\_mapping

<a id="bw2data.subclass_mapping.DATABASE_BACKEND_MAPPING"></a>

#### DATABASE\_BACKEND\_MAPPING

<a id="bw2data.subclass_mapping.NODE_PROCESS_CLASS_MAPPING"></a>

#### NODE\_PROCESS\_CLASS\_MAPPING
