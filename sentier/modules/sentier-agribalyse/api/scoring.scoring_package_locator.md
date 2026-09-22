**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.scoring_package_locator` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.scoring_package_locator cfg.yml > scoring.scoring_package_locator.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.scoring_package_locator"></a>

# scoring.scoring\_package\_locator

``ScoringPackageLocator`` — run_report.json → cached ``ScoringPackage``.

The link pipeline records the content hash of the ScoringPackage it built
under ``stages.scoring_package.content_hash`` in ``dashboard/run_report.json``.
Every consumer that wants "the package of the last link run" (backtest,
decompose, the Brightway export) resolves it the same way; this class is that
one shared way.

<a id="scoring.scoring_package_locator.ScoringPackageLocator"></a>

## ScoringPackageLocator Objects

```python
@dataclass(frozen=True)
class ScoringPackageLocator()
```

Resolve and load the ScoringPackage referenced by the last link run.

<a id="scoring.scoring_package_locator.ScoringPackageLocator.settings"></a>

#### settings

<a id="scoring.scoring_package_locator.ScoringPackageLocator.content_hash"></a>

#### content\_hash

```python
def content_hash() -> str
```

<a id="scoring.scoring_package_locator.ScoringPackageLocator.load"></a>

#### load

```python
def load() -> ScoringPackage
```
