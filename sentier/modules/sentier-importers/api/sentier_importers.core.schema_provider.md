**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.core.schema_provider` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.core.schema_provider cfg.yml > sentier_importers.core.schema_provider.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.core.schema_provider"></a>

# sentier\_importers.core.schema\_provider

Resolve a target repo's schema file at its pinned git ref via the cached fetcher.

The schema is fetched from GitHub's raw-content host at the target's pinned
``schema_ref`` and cached on disk, so validation is reproducible and offline
tests can pre-seed the cache.

LinkML schemas are multi-file: ``product.yaml`` does ``imports: [common]`` and so on.
``SchemaView`` resolves a relative import by name against the loaded file's directory,
so every locally-imported schema is fetched too and written beside the main file under
its bare ``<name>.yaml``. CURIE imports (``linkml:types``) are provided by LinkML itself
and are skipped.


<a id="sentier_importers.core.schema_provider.resolve_schema"></a>

#### resolve\_schema

```python
def resolve_schema(target: Target, schema_id: str, ctx: RunContext) -> Path
```

Resolve ``schema_id`` for ``target`` and return the local path of the main file.

With ``ctx.schema_dir`` set, read ``<schema_dir>/<schema_id>.yaml`` directly (its
imports already sit beside it) — used to validate against an unpushed local schema.
Otherwise fetch the schema and its local imports from the target's pinned ref.
Raises ``ValidationError`` on a missing local file or an unpinned remote target.
