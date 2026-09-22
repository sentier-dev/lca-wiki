**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.regional_source_name_snapshotter` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.regional_source_name_snapshotter cfg.yml > transforms.regional_source_name_snapshotter.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.regional_source_name_snapshotter"></a>

# transforms.regional\_source\_name\_snapshotter

``RegionalSourceNameSnapshotter`` — preserve the pre-flowmap name.

The biosphere flowmap (``BiosphereFlowmapApplier``) rewrites
``exc["name"]`` from the AGB-side SimaPro spelling (``Water, IN``) to
the bio3 canonical name (``Water``), erasing the country-of-extraction
suffix that downstream
:class:`matching.regional_suffix_applier.RegionalSuffixApplier` needs
to construct the synthetic ``@<region>`` matrix-row identity.

This transform runs once, RIGHT BEFORE the flowmap, and records every
biosphere exchange's name under ``exc["_regional_source_name"]`` so
the applier can recover the regional suffix even after the canonical
rename has happened. Standalone class, frozen dataclass, no
constructor args — pure batch mutation.

<a id="transforms.regional_source_name_snapshotter.RegionalSourceNameSnapshotter"></a>

## RegionalSourceNameSnapshotter Objects

```python
@dataclass(frozen=True)
class RegionalSourceNameSnapshotter()
```

Tag every biosphere exchange with its pre-flowmap source name.

<a id="transforms.regional_source_name_snapshotter.RegionalSourceNameSnapshotter.FIELD"></a>

#### FIELD

<a id="transforms.regional_source_name_snapshotter.RegionalSourceNameSnapshotter.apply"></a>

#### apply

```python
def apply(sp_data: list[dict]) -> dict[str, int]
```
