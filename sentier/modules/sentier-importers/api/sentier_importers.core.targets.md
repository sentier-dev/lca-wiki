**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.core.targets` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.core.targets cfg.yml > sentier_importers.core.targets.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.core.targets"></a>

# sentier\_importers.core.targets

Registry of target repositories that imported data is delivered to.

Adding a new target (e.g. a future bulk-data repo) is a single entry here.
``schema_ref`` pins the git ref/release used for validation; ``validator``
selects a strategy registered in :mod:`sentier_importers.core.validate`.

<a id="sentier_importers.core.targets.Target"></a>

## Target Objects

```python
@dataclass(frozen=True)
class Target()
```

A repository imported data is delivered to.

<a id="sentier_importers.core.targets.Target.name"></a>

#### name

<a id="sentier_importers.core.targets.Target.repo"></a>

#### repo

git/https remote URL

<a id="sentier_importers.core.targets.Target.output_subdir"></a>

#### output\_subdir

path within the target repo where emitted files land

<a id="sentier_importers.core.targets.Target.schema_ref"></a>

#### schema\_ref

pinned git ref/release for schema validation

<a id="sentier_importers.core.targets.Target.validator"></a>

#### validator

validation strategy id (see validate.py)

<a id="sentier_importers.core.targets.TARGETS"></a>

#### TARGETS

<a id="sentier_importers.core.targets.get_target"></a>

#### get\_target

```python
def get_target(name: str) -> Target
```

Return the registered :class:`Target` for ``name`` or raise ``RegistryError``.
