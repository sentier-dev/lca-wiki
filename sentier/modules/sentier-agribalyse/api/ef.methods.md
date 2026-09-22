**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `ef.methods` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ef.methods cfg.yml > ef.methods.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ef.methods"></a>

# ef.methods

``EfMethodFilter`` — predicate helpers for EF v3.1 method tuples.

``bw2data.methods`` mixes EF, IPCC, ReCiPe, and other LCIA methods. The EF
flow registry and the per-method CF registry both need the same "is this
an EF v3.1 method?" check; keeping the predicate in one place stops the
two callers from drifting (different shape checks → different filtered
sets → silently divergent parquets).

<a id="ef.methods.EfMethodFilter"></a>

## EfMethodFilter Objects

```python
class EfMethodFilter()
```

Stateless EF v3.1 method-tuple predicates.

The class form keeps the OOP rule satisfied — a free helper module
would not. Both consumers (``EfFlowsRegistryBuilder``,
``MethodCfRegistryBuilder``) call ``EfMethodFilter.is_ef_v31(m_key)``.

<a id="ef.methods.EfMethodFilter.EF_VERSION_TAG"></a>

#### EF\_VERSION\_TAG

<a id="ef.methods.EfMethodFilter.is_ef_v31"></a>

#### is\_ef\_v31

```python
@classmethod
def is_ef_v31(cls, m_key: Any) -> bool
```

True iff ``m_key`` is the canonical 4-tuple shape with ``EF v3.1`` second.
