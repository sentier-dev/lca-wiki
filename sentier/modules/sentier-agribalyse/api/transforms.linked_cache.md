**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.linked_cache` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.linked_cache cfg.yml > transforms.linked_cache.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.linked_cache"></a>

# transforms.linked\_cache

``LinkedSpCache`` — pickle the fully linked ``ParsedSimaProCsv``.

Written by ``dds-link-all`` immediately before the parameter-overrides
stage and the scoring-package emit (post-transforms, post-matching), so
the snapshot is always the PRISTINE baseline regardless of what the
overrides store holds. The fast rescore path (``dds-set-parameter
--fast``) loads it, applies the overrides store with the same applier the
full path uses, and replays only the emit stage — skipping the parse,
transforms, and matching that dominate link runtime.

The exchanges still carry their ``formula`` keys here (transforms rescale
``amount`` in place but preserve unknown keys), which is what makes the
ratio patch possible on post-transform amounts.

Size note: this pickles the entire linked graph (~1.2GB); it lives in
the gitignored ``cache/`` and is cleared by ``dds-reset``. Writes are
atomic (temp file + ``os.replace``) so a crash mid-write never destroys
the previous good cache.

<a id="transforms.linked_cache.LinkedCacheMissingError"></a>

## LinkedCacheMissingError Objects

```python
class LinkedCacheMissingError(FileNotFoundError)
```

Raised when the fast path is requested but no linked cache exists.

<a id="transforms.linked_cache.LinkedCacheCorruptError"></a>

## LinkedCacheCorruptError Objects

```python
class LinkedCacheCorruptError(RuntimeError)
```

Raised when the linked cache exists but cannot be unpickled.

<a id="transforms.linked_cache.LinkedCacheStaleError"></a>

## LinkedCacheStaleError Objects

```python
class LinkedCacheStaleError(RuntimeError)
```

Raised when the linked cache was built from a different source CSV.

<a id="transforms.linked_cache.LinkedSpCache"></a>

## LinkedSpCache Objects

```python
@dataclass(frozen=True)
class LinkedSpCache()
```

Read/write ``cache/linked_cache.pkl``.

<a id="transforms.linked_cache.LinkedSpCache.settings"></a>

#### settings

<a id="transforms.linked_cache.LinkedSpCache.SCHEMA_VERSION"></a>

#### SCHEMA\_VERSION

<a id="transforms.linked_cache.LinkedSpCache.path"></a>

#### path

```python
@property
def path()
```

<a id="transforms.linked_cache.LinkedSpCache.write"></a>

#### write

```python
def write(sp: Any) -> None
```

<a id="transforms.linked_cache.LinkedSpCache.load"></a>

#### load

```python
def load() -> Any
```
