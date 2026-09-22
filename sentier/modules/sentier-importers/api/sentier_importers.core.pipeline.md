**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.core.pipeline` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-importers repo && git -C repo checkout dac2e67
SP=repo/app
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
  -I "$SP" -m sentier_importers.core.pipeline cfg.yml > sentier_importers.core.pipeline.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.core.pipeline"></a>

# sentier\_importers.core.pipeline

Pipeline driver: run a source through
fetch → parse → transform → dedup → assemble → validate → emit → deliver.

<a id="sentier_importers.core.pipeline.validate_source"></a>

#### validate\_source

```python
def validate_source(source: Source, ctx: RunContext) -> int
```

Run the pipeline up to and including validation; return the row count.

<a id="sentier_importers.core.pipeline.run_source"></a>

#### run\_source

```python
def run_source(source: Source, ctx: RunContext) -> Path
```

Run the full pipeline. Emits to ``output_dir``; delivers a PR unless dry-run.
