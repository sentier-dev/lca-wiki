**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.strategies.internal` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.strategies.internal cfg.yml > transforms.strategies.internal.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.strategies.internal"></a>

# transforms.strategies.internal

Internal-only strategies — no external bw2 dependency.

The remaining bw2io callables the linker still drove through ``ParsedSimaProCsv``:

* ``set_metadata_using_single_functional_exchange`` — set ``name`` /
  ``unit`` / ``reference product`` / ``production amount`` from the
  process's single functional edge.
* ``split_simapro_name_geo`` — split SimaPro-form names like ``foo/CH U``
  into ``name`` + ``location``.
* ``drop_unlinked`` — remove every exchange that lacks an ``input``.
* ``link_iterable_by_fields`` — internal name+unit linking between
  process exchanges and product nodes (the ``processes_to_products``
  pass that ``InternalAgbLinker`` runs).

All four are pure dict transforms.

<a id="transforms.strategies.internal.SetMetadataUsingSingleFunctionalExchange"></a>

## SetMetadataUsingSingleFunctionalExchange Objects

```python
@dataclass(frozen=True)
class SetMetadataUsingSingleFunctionalExchange()
```

Lift dataset metadata from the single functional exchange when missing.

<a id="transforms.strategies.internal.SetMetadataUsingSingleFunctionalExchange.name"></a>

#### name

<a id="transforms.strategies.internal.SetMetadataUsingSingleFunctionalExchange.missing_value"></a>

#### missing\_value

<a id="transforms.strategies.internal.SetMetadataUsingSingleFunctionalExchange.__call__"></a>

#### \_\_call\_\_

```python
def __call__(data: list[dict]) -> list[dict]
```

<a id="transforms.strategies.internal.SplitSimaproNameGeo"></a>

## SplitSimaproNameGeo Objects

```python
@dataclass(frozen=True)
class SplitSimaproNameGeo()
```

Split SimaPro names like ``foo/CH U`` into ``name`` + ``location``.

<a id="transforms.strategies.internal.SplitSimaproNameGeo.name"></a>

#### name

<a id="transforms.strategies.internal.SplitSimaproNameGeo.__call__"></a>

#### \_\_call\_\_

```python
def __call__(data: list[dict]) -> list[dict]
```

<a id="transforms.strategies.internal.DropUnlinkedExchanges"></a>

## DropUnlinkedExchanges Objects

```python
@dataclass(frozen=True)
class DropUnlinkedExchanges()
```

Remove exchanges that have no ``input`` set.

<a id="transforms.strategies.internal.DropUnlinkedExchanges.name"></a>

#### name

<a id="transforms.strategies.internal.DropUnlinkedExchanges.__call__"></a>

#### \_\_call\_\_

```python
def __call__(data: list[dict]) -> list[dict]
```

<a id="transforms.strategies.internal.ActivityHash"></a>

## ActivityHash Objects

```python
class ActivityHash()
```

Lifted from ``bw2io.utils.activity_hash`` — pure-string MD5 over fields.

<a id="transforms.strategies.internal.ActivityHash.of"></a>

#### of

```python
@staticmethod
def of(obj: dict,
       fields: Iterable[str] | None = None,
       case_insensitive: bool = True) -> str
```

<a id="transforms.strategies.internal.LinkIterableByFields"></a>

## LinkIterableByFields Objects

```python
@dataclass(frozen=True)
class LinkIterableByFields()
```

Link unlinked exchanges to nodes in ``other`` (or self) by hashed field tuple.

Direct lift of ``bw2io.strategies.generic.link_iterable_by_fields``.
Uses an MD5 hash over the chosen field values; ambiguous keys leave
the exchange unlinked (raise behaviour replaced with skip — bw2io's
``StrategyError`` was the legacy contract; for our internal-only
use we prefer "leave unlinked" which matches the catalog matchers).

<a id="transforms.strategies.internal.LinkIterableByFields.fields"></a>

#### fields

<a id="transforms.strategies.internal.LinkIterableByFields.edge_kinds"></a>

#### edge\_kinds

<a id="transforms.strategies.internal.LinkIterableByFields.this_node_kinds"></a>

#### this\_node\_kinds

<a id="transforms.strategies.internal.LinkIterableByFields.other_node_kinds"></a>

#### other\_node\_kinds

<a id="transforms.strategies.internal.LinkIterableByFields.internal"></a>

#### internal

<a id="transforms.strategies.internal.LinkIterableByFields.relink"></a>

#### relink

<a id="transforms.strategies.internal.LinkIterableByFields.apply"></a>

#### apply

```python
def apply(unlinked: list[dict], other: list[dict] | None = None) -> list[dict]
```
