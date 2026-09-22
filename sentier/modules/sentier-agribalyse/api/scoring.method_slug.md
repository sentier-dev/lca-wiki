**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.method_slug` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.method_slug cfg.yml > scoring.method_slug.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.method_slug"></a>

# scoring.method\_slug

``MethodSlug`` — filesystem-safe encoding for method tuples.

Used by both ``ScoringPackageStore`` and ``MethodCfRegistryBuilder`` so a
method tuple resolves to the same on-disk slug everywhere. URL-quoting
each component keeps every character round-trippable: spaces, parens,
slashes — anything bw2data hands us — survives a path-write/read cycle.

The encoding is ``urllib.parse.quote`` with ``safe=""`` per component
**and an explicit underscore escape**, joined by a literal ``"__"``.
Without the underscore escape, a component containing a literal ``__``
would be indistinguishable from the separator at decode time and
``decode(encode(tuple))`` would return the wrong arity.

<a id="scoring.method_slug.MethodSlug"></a>

## MethodSlug Objects

```python
@dataclass(frozen=True)
class MethodSlug()
```

Stateless encoder/decoder for method tuples.

Both methods are ``classmethod`` because there is no instance state;
the class form keeps callers consistent (``MethodSlug.encode(t)``)
and the OOP rule satisfied — a free helper module would not.

<a id="scoring.method_slug.MethodSlug.SEPARATOR"></a>

#### SEPARATOR

<a id="scoring.method_slug.MethodSlug.encode"></a>

#### encode

```python
@classmethod
def encode(cls, method: tuple[str, ...]) -> str
```

URL-quote each tuple component (including ``_``) and join with ``__``.

<a id="scoring.method_slug.MethodSlug.decode"></a>

#### decode

```python
@classmethod
def decode(cls, slug: str) -> tuple[str, ...]
```

Inverse of :meth:`encode` — split on the separator + unquote.
