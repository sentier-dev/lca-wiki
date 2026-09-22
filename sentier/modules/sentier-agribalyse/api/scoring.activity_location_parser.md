**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.activity_location_parser` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.activity_location_parser cfg.yml > scoring.activity_location_parser.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.activity_location_parser"></a>

# scoring.activity\_location\_parser

``ActivityLocationParser`` — extract an ISO/region code from an activity name.

AGB SimaPro datasets generally don't carry the brightway ``location`` field
on the dataset metadata (2 133 of 43 542 do; the rest are ``None``), but
the location IS encoded in the activity name via two recognisable
suffixes:

* ``{XX}`` — explicit, sometimes followed by ``U``, ``[Ciqual code: …]``,
pack/sales channel labels. Example::

"Frozen mango puree, at processing {BR} U"

* trailing ``XX`` — a 2-to-5-char uppercase token separated from the rest
by whitespace. This form is the ecoinvent-imported activities that
AGB took over verbatim. Example::

"mango production BR"
"market for sugar, from sugar beet GLO"

Parser priority is ``{XX}`` first (most reliable) then trailing-token.
Sub-regional codes with a dash (``CA-QC``, ``US-WECC``, ``BR-MG``) are
collapsed to the country prefix so they hit the JRC AWARE table's
country-level row. Aggregated regions that have no national equivalent
(``RoW``, ``GLO``, ``RER``, ``RNA``, ``RLA``, ``OECD``, ``Europe``,
``World``) deliberately don't match any regional CF — the scorer falls
back to the global CF for them, which is the correct behaviour (a
location-free activity gets the global mean).

The parser is the difference between 2 077 corrected activity columns
(ecoinvent-catalog-only fallback) and the full ~14 000 columns that
actually carry a regional water emission upstream of every AGB product.

<a id="scoring.activity_location_parser.ActivityLocationParser"></a>

## ActivityLocationParser Objects

```python
@dataclass(frozen=True)
class ActivityLocationParser()
```

Stateless extractor — instantiate once, call ``location_for`` per name.

<a id="scoring.activity_location_parser.ActivityLocationParser.BRACE_RE"></a>

#### BRACE\_RE

<a id="scoring.activity_location_parser.ActivityLocationParser.TRAILING_RE"></a>

#### TRAILING\_RE

<a id="scoring.activity_location_parser.ActivityLocationParser.AGGREGATE_REGIONS"></a>

#### AGGREGATE\_REGIONS

<a id="scoring.activity_location_parser.ActivityLocationParser.location_for"></a>

#### location\_for

```python
def location_for(name: str | None) -> str | None
```

Return the canonical ISO/region code, or ``None`` if nothing
recognisable trails the name.
