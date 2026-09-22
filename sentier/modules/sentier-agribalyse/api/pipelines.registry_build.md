**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `pipelines.registry_build` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m pipelines.registry_build cfg.yml > pipelines.registry_build.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="pipelines.registry_build"></a>

# pipelines.registry\_build

``RegistryBuildPipeline`` — own-pipeline wrapper around ``RegistryBuilder``.

Exists so the build is a first-class pipeline addressable by CLI
(``python -m cli.build_registry``) and by other pipelines that depend
on the registry being current.

<a id="pipelines.registry_build.RegistryBuildPipeline"></a>

## RegistryBuildPipeline Objects

```python
@dataclass(frozen=True)
class RegistryBuildPipeline()
```

<a id="pipelines.registry_build.RegistryBuildPipeline.settings"></a>

#### settings

<a id="pipelines.registry_build.RegistryBuildPipeline.run"></a>

#### run

```python
def run() -> dict[str, Any]
```
