**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.mod.bw2analyzer.contribution` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.mod.bw2analyzer.contribution cfg.yml > activity_browser.mod.bw2analyzer.contribution.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.mod.bw2analyzer.contribution"></a>

# activity\_browser.mod.bw2analyzer.contribution

<a id="activity_browser.mod.bw2analyzer.contribution.ABContributionAnalysis"></a>

## ABContributionAnalysis Objects

```python
class ABContributionAnalysis(ContributionAnalysis)
```

Activity Browser version of bw2analyzer.ContributionAnalysis

<a id="activity_browser.mod.bw2analyzer.contribution.ABContributionAnalysis.sort_array"></a>

#### sort\_array

```python
def sort_array(data: np.array,
               limit: float = 25,
               limit_type: str = "number",
               total: Optional[float] = None) -> np.array
```

Activity Browser version of bw2analyzer.ContributionAnalysis.sort_array.

Should be removed once https://github.com/brightway-lca/brightway2-analyzer/pull/32 is merged.
See PR above on why we overwrite this function.
