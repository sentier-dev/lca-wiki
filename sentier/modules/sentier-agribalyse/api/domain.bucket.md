**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `domain.bucket` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m domain.bucket cfg.yml > domain.bucket.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="domain.bucket"></a>

# domain.bucket

Compartment bucket classification — air / water / soil / resource / unspecified.

Lives as a class-with-classmethods rather than a free function. The bucket
collapses both SimaPro-style cats (``Emissions to air``, ``Resources``) and
ecoinvent-style cats (``air``, ``natural resource``) onto a single vocabulary
so ``(name, bucket)`` keys align across sources.

<a id="domain.bucket.Bucket"></a>

## Bucket Objects

```python
class Bucket(StrEnum)
```

Top-level compartment bucket. Values are the canonical lowercase strings.

<a id="domain.bucket.Bucket.AIR"></a>

#### AIR

<a id="domain.bucket.Bucket.WATER"></a>

#### WATER

<a id="domain.bucket.Bucket.SOIL"></a>

#### SOIL

<a id="domain.bucket.Bucket.RESOURCE"></a>

#### RESOURCE

<a id="domain.bucket.Bucket.UNSPECIFIED"></a>

#### UNSPECIFIED

<a id="domain.bucket.Bucket.from_categories"></a>

#### from\_categories

```python
@classmethod
def from_categories(cls, cats: tuple[str, ...] | list[str] | None) -> Bucket
```

Map any compartment tuple to its top-level bucket.

Walks every element so EF's ``('Emissions', 'Emissions to water', ...)``
and ``('Resources', 'Resources from ground', ...)`` schemas resolve
correctly — the compartment word lives in element 1, not 0. Earlier
elements take priority so ecoinvent's ``('natural resource', 'in air')``
still maps to ``RESOURCE`` (cat[0]) rather than ``AIR`` (cat[1]).

<a id="domain.bucket.Bucket.from_harmonised_iri"></a>

#### from\_harmonised\_iri

```python
@classmethod
def from_harmonised_iri(cls, context_iri: str) -> Bucket
```

Map a harmonised-flows ``context_iri`` to its bucket.

IRIs encode the compartment as the last path segment, e.g.
``envi-air-indr-unkn``, ``envi-wate-suwa``, ``reso-grou``.
