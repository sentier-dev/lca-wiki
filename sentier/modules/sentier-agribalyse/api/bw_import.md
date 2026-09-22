**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `bw_import` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_import cfg.yml > bw_import.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_import"></a>

# bw\_import

Standalone customer-side importer for the Brightway export.

The single module here is copied verbatim into every export by
``dds-build-bw-package`` and runs in the *user's* Brightway environment. It is
deliberately function-based, stdlib + numpy + pandas only — a documented
exception to the project's OOP-only rule: it must import nothing from this
package (enforced by tests/unit/bw_import) so the copied file works anywhere.
