**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.core.dedup` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.core.dedup cfg.yml > sentier_importers.core.dedup.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.core.dedup"></a>

# sentier\_importers.core.dedup

Deterministic, in-repo dedup — supersedes the deferred ``sentier_mappings`` layer.

A term's identity is its ``iri``. Sources mint IRIs deterministically from a stable
source key via :func:`slugify`, so re-running a source yields identical IRIs. The
``dedup`` stage then guarantees a source introduces no duplicate terms:

- **Layer A (intra-source, always on):** collapse identical same-``iri`` rows, raise on
  conflicting same-``iri`` rows (a transform bug), warn on same-label/different-``iri``.
- **Layer B (against the target vocab, default on for schema-bearing targets):** read the
  target's existing ``data/<category>/*.yaml`` collections at the pinned ref and apply an
  ``on_existing`` policy (``skip`` | ``error`` | ``overwrite``) to colliding IRIs.

No fuzzy matching, no external files — fully deterministic and offline-testable.

<a id="sentier_importers.core.dedup.slugify"></a>

#### slugify

```python
def slugify(value: str) -> str
```

Return a lowercase, ASCII, hyphen-separated slug — stable and URL-safe.

<a id="sentier_importers.core.dedup.dedup"></a>

#### dedup

```python
def dedup(rows: Rows, config: SourceConfig, target: Target,
          ctx: RunContext) -> Rows
```

Run Layer A (always) then Layer B (when configured) and return reconciled rows.
