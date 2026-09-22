**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.metadata.fields` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'activity-browser==3.0.0b202608291724'
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
  -I "$SP" -m activity_browser.bwutils.metadata.fields cfg.yml > activity_browser.bwutils.metadata.fields.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.metadata.fields"></a>

# activity\_browser.bwutils.metadata.fields

<a id="activity_browser.bwutils.metadata.fields.primary_types"></a>

#### primary\_types

<a id="activity_browser.bwutils.metadata.fields.secondary_types"></a>

#### secondary\_types

<a id="activity_browser.bwutils.metadata.fields.search_engine_whitelist"></a>

#### search\_engine\_whitelist

<a id="activity_browser.bwutils.metadata.fields.all_types"></a>

#### all\_types

<a id="activity_browser.bwutils.metadata.fields.primary"></a>

#### primary

<a id="activity_browser.bwutils.metadata.fields.secondary"></a>

#### secondary

<a id="activity_browser.bwutils.metadata.fields.all_fields"></a>

#### all\_fields
