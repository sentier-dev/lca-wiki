**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.deletions` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.deletions cfg.yml > transforms.deletions.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.deletions"></a>

# transforms.deletions

``AggregateDeleter`` — applies the ``deletions.parquet`` registry file.

Replaces the ad-hoc ``delete-aggregated-ecoinvent-{processes,products}.json``
loop in the legacy linker. Tightens matching by code where available
(fix 1.m): for processes we use ``code``, for products we fall back to
``name``-only matching only when no code is registered.

System-process safeguard (fix for FIX_DATA.md § 2 — ionising radiation
30–60× under-score). The deletions list mixes two kinds of AGB activities:

* **unit processes** — direct biosphere emissions plus technosphere
  inputs to upstream activities. These ARE genuine duplicates of an
  ecoinvent namesake; deleting them and routing to ecoinvent loses
  nothing because ecoinvent carries the same direct emissions and
  ecoinvent's supply chain produces the upstream contributions.
* **system processes** — direct biosphere emissions only, *no*
  technosphere inputs. AGB exported these with the cradle-to-gate
  upstream chain pre-aggregated into the direct biosphere edges
  (e.g. ``chemical factory construction, organics RER`` carries 2 971
  direct biosphere edges including 1.3×10¹⁰ kBq Radon-222 from
  upstream uranium-bearing cement and steel; ecoinvent's namesake has
  zero direct radon and reaches it only via its technosphere chain).
  Deleting these strips ~4.6×10¹⁰ kBq of Radon-222 (and similar
  fractions of every other long-lived radionuclide) from the entire
  AGB matrix and routes consumers to ecoinvent versions whose
  pass-through chains don't reproduce the same totals.

We therefore *skip* the deletion when the AGB activity has zero
``technosphere`` exchanges and at least one ``biosphere`` exchange. The
deduplicator then sees both AGB-system-process and ecoinvent-namesake
producers for the same product and resolves to one of them; AGB
consumers (every food activity in the system) reach the AGB system
process via the pre-existing technosphere link.

<a id="transforms.deletions.AggregateDeleter"></a>

## AggregateDeleter Objects

```python
@dataclass(frozen=True)
class AggregateDeleter()
```

Apply the registry's deletions to a SimaPro importer.

Skips deletions on AGB system processes — see module docstring.

<a id="transforms.deletions.AggregateDeleter.registry"></a>

#### registry

<a id="transforms.deletions.AggregateDeleter.apply"></a>

#### apply

```python
def apply(sp) -> dict[str, int]
```
