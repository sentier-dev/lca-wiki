**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.core.context` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.core.context cfg.yml > sentier_importers.core.context.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.core.context"></a>

# sentier\_importers.core.context

Per-run configuration shared across all pipeline stages.

<a id="sentier_importers.core.context.RunContext"></a>

## RunContext Objects

```python
@dataclass(frozen=True)
class RunContext()
```

Configuration for one importer run.

- ``cache_dir``: content-addressed fetch cache location.
- ``output_dir``: where emitted files are staged before delivery.
- ``dry_run``: when True (default), never open a PR — stage locally only.
- ``offline``: when True, a fetch cache miss is an error (used in tests/CI).
- ``schema_dir``: when set, validate against schemas in this local directory instead
  of fetching the target repo's pinned ref — for co-developing data and schema before
  the schema change is pushed.
- ``deliver_local_root``: when set, copy emitted files into this local checkout of
  the target repo (no git/gh involved) — the regenerate-locally flow for sources
  whose data cannot be delivered upstream yet.

<a id="sentier_importers.core.context.RunContext.cache_dir"></a>

#### cache\_dir

<a id="sentier_importers.core.context.RunContext.output_dir"></a>

#### output\_dir

<a id="sentier_importers.core.context.RunContext.dry_run"></a>

#### dry\_run

<a id="sentier_importers.core.context.RunContext.offline"></a>

#### offline

<a id="sentier_importers.core.context.RunContext.schema_dir"></a>

#### schema\_dir

<a id="sentier_importers.core.context.RunContext.deliver_local_root"></a>

#### deliver\_local\_root
