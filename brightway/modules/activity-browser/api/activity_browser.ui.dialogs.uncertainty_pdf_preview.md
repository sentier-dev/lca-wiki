**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.dialogs.uncertainty_pdf_preview` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.dialogs.uncertainty_pdf_preview cfg.yml > activity_browser.ui.dialogs.uncertainty_pdf_preview.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.dialogs.uncertainty_pdf_preview"></a>

# activity\_browser.ui.dialogs.uncertainty\_pdf\_preview

PDF/PMF preview: ``stats_arrays`` :meth:`pdf` first, SciPy only where missing.

<a id="activity_browser.ui.dialogs.uncertainty_pdf_preview.PreviewDensity"></a>

## PreviewDensity Objects

```python
class PreviewDensity(NamedTuple)
```

<a id="activity_browser.ui.dialogs.uncertainty_pdf_preview.PreviewDensity.x"></a>

#### x

<a id="activity_browser.ui.dialogs.uncertainty_pdf_preview.PreviewDensity.y"></a>

#### y

<a id="activity_browser.ui.dialogs.uncertainty_pdf_preview.PreviewDensity.kind"></a>

#### kind

<a id="activity_browser.ui.dialogs.uncertainty_pdf_preview.PreviewDensity.xlabel"></a>

#### xlabel

<a id="activity_browser.ui.dialogs.uncertainty_pdf_preview.PreviewDensity.vline_legend"></a>

#### vline\_legend

<a id="activity_browser.ui.dialogs.uncertainty_pdf_preview.preview_density"></a>

#### preview\_density

```python
def preview_density(dist,
                    structured_array: np.ndarray,
                    n_points: int = 400) -> Optional[PreviewDensity]
```

Density or PMF for *dist* (authoritative type) and the first parameter row.
