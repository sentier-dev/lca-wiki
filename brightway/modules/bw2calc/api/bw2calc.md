**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2calc==2.5.0'
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
  -I "$SP" -m bw2calc cfg.yml > bw2calc.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc"></a>

# bw2calc

<a id="bw2calc.__version__"></a>

#### \_\_version\_\_

<a id="bw2calc.ARM"></a>

#### ARM

<a id="bw2calc.AMD_INTEL"></a>

#### AMD\_INTEL

<a id="bw2calc.UMFPACK_WARNING"></a>

#### UMFPACK\_WARNING

<a id="bw2calc.PYPARDISO_WARNING"></a>

#### PYPARDISO\_WARNING
