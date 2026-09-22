**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.bafu.packages` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.bafu.packages cfg.yml > sentier_importers.sources.bafu.packages.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.bafu.packages"></a>

# sentier\_importers.sources.bafu.packages

Canonical package names for the ``bafu-2026-v1 -> ef-3.1`` pair in sentier-mappings.

One name per package file in ``data/bafu-2026-v1__ef-3.1/``, in build order and
precedence: each later package was built over what the earlier ones leave unmapped
(see ``docs/repos/sentier-mappings.md``). Defined once here and imported by
``mappings_biosphere_nomenclature``, ``mappings_biosphere_coverage`` and the registry
tests, so the coverage sidecar's ``package`` field and the runtime messages always
spell them the same way as the registry's ``emit_filename`` values.

<a id="sentier_importers.sources.bafu.packages.CURATED"></a>

#### CURATED

<a id="sentier_importers.sources.bafu.packages.INFERRED"></a>

#### INFERRED

<a id="sentier_importers.sources.bafu.packages.MATCHED"></a>

#### MATCHED

<a id="sentier_importers.sources.bafu.packages.NOMENCLATURE"></a>

#### NOMENCLATURE
