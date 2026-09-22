**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.core.fetch` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.core.fetch cfg.yml > sentier_importers.core.fetch.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.core.fetch"></a>

# sentier\_importers.core.fetch

Content-addressed cached fetcher for file:// and http(s):// sources.

<a id="sentier_importers.core.fetch.fetch"></a>

#### fetch

```python
def fetch(url: str, ctx: RunContext) -> RawData
```

Retrieve ``url`` with on-disk content caching.

The cache is keyed by the SHA-256 of the URL under ``ctx.cache_dir``. A cache
hit short-circuits the source. In offline mode a cache miss raises
``FetchError``. Supports ``file://`` and ``http(s)://`` schemes.

<a id="sentier_importers.core.fetch.local_path"></a>

#### local\_path

```python
def local_path(url: str | None, name: str) -> Path
```

Filesystem ``Path`` for a ``file://`` input that must be read directly from
disk (e.g. a directory) rather than through the content-addressed cache above.

``name`` identifies the input in the error message. Raises ``FetchError`` when
``url`` is ``None``, blank, or not a ``file://`` URL.
