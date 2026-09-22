**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `exports.randonneur_packages` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m exports.randonneur_packages cfg.yml > exports.randonneur_packages.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="exports.randonneur_packages"></a>

# exports.randonneur\_packages

``RandonneurPackagesExporter`` — author the AGB-3.2 randonneur datapackages.

Replaces the legacy ``scripts/build_randonneur_packages.py``. Reads the
SimaPro CSV via ``SimaProImporter`` and writes:

* ``source/randonneur_packages/agribalyse-3.2-delete-aggregated-ecoinvent.json``
* ``source/randonneur_packages/agribalyse-3.2-restore-simapro-ecoinvent-names.json``
* ``to_review/agribalyse-3.2-biosphere-residuals-for-review.xlsx``

Once human review fills in the residuals xlsx, the resulting
``-biosphere-manual-matches.json`` is promoted by hand into
``source/randonneur_packages/`` and the registry picks it up on the next
build (REFACTOR.md §0.2).

<a id="exports.randonneur_packages.RandonneurPackagesExporter"></a>

## RandonneurPackagesExporter Objects

```python
@dataclass(frozen=True)
class RandonneurPackagesExporter()
```

<a id="exports.randonneur_packages.RandonneurPackagesExporter.settings"></a>

#### settings

<a id="exports.randonneur_packages.RandonneurPackagesExporter.CC_BY_LICENSE"></a>

#### CC\_BY\_LICENSE

<a id="exports.randonneur_packages.RandonneurPackagesExporter.export"></a>

#### export

```python
def export() -> dict[str, str]
```
