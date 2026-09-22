**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `matching.regional_suffix` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matching.regional_suffix cfg.yml > matching.regional_suffix.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matching.regional_suffix"></a>

# matching.regional\_suffix

``RegionalSuffixParser`` — extract regional codes embedded in SimaPro flow names.

SimaPro encodes the country/region of extraction inside the flow name
itself (``Water, well, CN``, ``Water, unspecified natural origin, RoW``,
``Water, lake, FR``). The bw2io biosphere catalog has no such regional
dimension — every flow is just (uuid, name, categories) — so once the
linker collapses regional variants onto a base UUID, the per-region
deprivation CFs SimaPro carries on AGB's reference method are lost.

This parser surfaces the regional suffix so downstream linkers can
preserve it as part of the flow identity. Each successfully linked
regional flow ends up with a synthetic code ``"<base_uuid>@<region>"``
in the inventory matrix; the CF registry then emits one row per
(base_uuid, region) using SimaPro's per-region CFs as the source of
truth.

The parser is allowlist-driven by ISO-3166 alpha-2 codes plus a small
set of well-known aggregate regions. Without an allowlist the regex
``,\s*[A-Z][A-Z0-9-]{1,9}$`` matches things that are NOT regions —
e.g. ``Methane, dichloro-, HCC-30`` (chemical formula suffix) or
``Ethane, 1,1,2-trichloro-1,2,2-trifluoro-, CFC-113``. Misclassifying
those as regions would shatter the matcher's flow identity.

<a id="matching.regional_suffix.RegionalSuffixParser"></a>

## RegionalSuffixParser Objects

```python
@dataclass(frozen=True)
class RegionalSuffixParser()
```

Extract an ISO-2 country code or aggregate region from a flow name.

``parse(name)`` returns ``(base_name, region)``. ``region`` is the
empty string when the trailing token is not a recognised region,
OR when there is no comma-prefixed trailing token at all.

The parser is deterministic and stateless. The allowlist is held as
class-level immutable sets, so instantiation is cheap and the same
instance can be reused everywhere.

<a id="matching.regional_suffix.RegionalSuffixParser.ISO2"></a>

#### ISO2

<a id="matching.regional_suffix.RegionalSuffixParser.AGGREGATE"></a>

#### AGGREGATE

<a id="matching.regional_suffix.RegionalSuffixParser.SUFFIX_RE"></a>

#### SUFFIX\_RE

<a id="matching.regional_suffix.RegionalSuffixParser.parse"></a>

#### parse

```python
def parse(source_name: str) -> tuple[str, str]
```

Return ``(base_name, region)``.

``region`` is empty when the trailing token is not in the
``ISO2`` / ``AGGREGATE`` allowlists (or matches the sub-regional
``<ISO2>-<sub>`` pattern). The base name is the original
string with the recognised suffix stripped.
