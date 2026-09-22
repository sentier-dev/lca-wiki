**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `llm` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m llm cfg.yml > llm.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="llm"></a>

# llm

LLM-assisted mapping for residual unlinked AGB biosphere flows.

Runs LAST in the linking workflow — after every deterministic tier has had
its chance. The LLM's job is constrained: pick the best-matching existing
biosphere flow from a pre-filtered candidate pool, OR mark the flow as
unmappable. It never invents flow IDs.

Decisions are auto-accepted; new rows are appended to
``source/agribalyse-3.2-biosphere-residuals-llm-reviewed.xlsx`` with
``decision="accept"`` so the next ``dds-build-registry`` picks them up at
tier 10. No sidecar file, no human gate.
