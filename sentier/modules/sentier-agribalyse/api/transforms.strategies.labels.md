**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.strategies.labels` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.strategies.labels cfg.yml > transforms.strategies.labels.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.strategies.labels"></a>

# transforms.strategies.labels

Label-normalisation strategies — lifted from ``bw2io.strategies``.

Pure dict transforms.

<a id="transforms.strategies.labels.NormalizeSimaproLabelsToBrightwayStandard"></a>

## NormalizeSimaproLabelsToBrightwayStandard Objects

```python
@dataclass(frozen=True)
class NormalizeSimaproLabelsToBrightwayStandard()
```

Rename ``context`` → ``categories`` and ``identifier`` → ``code`` on
unlinked exchanges. Mirrors
``bw2io.strategies.normalize_simapro_labels_to_brightway_standard``.

Some randonneur transformations use the more standard (non-Brightway)
labels; the SimaPro/EF datapackages produced by ``RandonneurPackagesExporter``
end up with ``context`` keys that the linker expects to see as
``categories`` afterwards.

<a id="transforms.strategies.labels.NormalizeSimaproLabelsToBrightwayStandard.name"></a>

#### name

<a id="transforms.strategies.labels.NormalizeSimaproLabelsToBrightwayStandard.__call__"></a>

#### \_\_call\_\_

```python
def __call__(data: list[dict]) -> list[dict]
```
