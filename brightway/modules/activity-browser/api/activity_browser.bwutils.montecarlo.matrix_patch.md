**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.montecarlo.matrix_patch` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.montecarlo.matrix_patch cfg.yml > activity_browser.bwutils.montecarlo.matrix_patch.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.montecarlo.matrix_patch"></a>

# activity\_browser.bwutils.montecarlo.matrix\_patch

Runtime patch for Brightway matrix_utils Monte Carlo NaN sampling.

When ``use_distributions=True`` and a matrix contains both uncertain and
deterministic entries, processed datapackages often store ``loc=NaN`` for
deterministic rows in the ``distributions`` vector. ``stats_arrays`` type 0/1
returns ``loc`` unchanged, so NaN enters technosphere, biosphere, and
characterization matrices.

Upstream fix: ``contrib/brightway-upstream/matrix_utils-resource_group.patch``

<a id="activity_browser.bwutils.montecarlo.matrix_patch.apply_matrix_utils_mc_patch"></a>

#### apply\_matrix\_utils\_mc\_patch

```python
def apply_matrix_utils_mc_patch() -> None
```

Apply the matrix_utils MC patch once (idempotent).
