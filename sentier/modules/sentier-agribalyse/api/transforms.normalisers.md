**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.normalisers` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.normalisers cfg.yml > transforms.normalisers.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.normalisers"></a>

# transforms.normalisers

Coarse normalisation stages — now driven by in-house strategy classes.

Each class wraps a small group of dict transforms (lifted from bw2io
into ``transforms.strategies`` per REFACTOR_FINAL phase F3). The legacy
``BioStrategyChain``, which used to call ``sp.match_database(bio_db, ...)``
against ``bw2data``, is replaced by ``BiosphereCatalogPrelinker`` —
which reads the same biosphere flow universe from the parquet catalog.

<a id="transforms.normalisers.InternalAgbLinker"></a>

## InternalAgbLinker Objects

```python
@dataclass(frozen=True)
class InternalAgbLinker()
```

Default-strategy chain + initial intra-AGB exchange linking.

The default chain (``set_metadata_using_single_functional_exchange``,
``drop_unspecified_subcategories``, ``split_simapro_name_geo``) lives
on ``ParsedSimaProCsv.strategies``. The internal match links AGB
process exchanges to AGB product nodes via name+unit.

<a id="transforms.normalisers.InternalAgbLinker.runner"></a>

#### runner

<a id="transforms.normalisers.InternalAgbLinker.apply"></a>

#### apply

```python
def apply(sp: Any) -> None
```

<a id="transforms.normalisers.BiosphereLabelNormaliser"></a>

## BiosphereLabelNormaliser Objects

```python
@dataclass
class BiosphereLabelNormaliser()
```

Run the lifted biosphere normalisation chain via ``StrategyRunner``.

<a id="transforms.normalisers.BiosphereLabelNormaliser.runner"></a>

#### runner

<a id="transforms.normalisers.BiosphereLabelNormaliser.settings"></a>

#### settings

<a id="transforms.normalisers.BiosphereLabelNormaliser.chain"></a>

#### chain

<a id="transforms.normalisers.BiosphereLabelNormaliser.apply"></a>

#### apply

```python
def apply(sp: Any) -> None
```

<a id="transforms.normalisers.StandardLabelNormaliser"></a>

## StandardLabelNormaliser Objects

```python
@dataclass(frozen=True)
class StandardLabelNormaliser()
```

Brightway-standard labels + units; the post-flowmap finishing pass.

``normalize_labels_to_brightway_standard`` is now driven by the
lifted ``NormalizeSimaproLabelsToBrightwayStandard`` strategy. The
randonneur datapackage is still applied via the wrapper (no bw2data
needed — randonneur reads stored datapackages directly).

<a id="transforms.normalisers.StandardLabelNormaliser.runner"></a>

#### runner

<a id="transforms.normalisers.StandardLabelNormaliser.apply"></a>

#### apply

```python
def apply(sp: Any) -> None
```

<a id="transforms.normalisers.BioStrategyChain"></a>

## BioStrategyChain Objects

```python
@dataclass
class BioStrategyChain()
```

Pre-pass biosphere linking via the parquet catalog (no bw2data).

Drives ``BiosphereCatalogPrelinker`` followed by the
``RemoveBiosphereLocationPrefixIfFlowInSameLocation`` strategy.
Replaces the legacy class of the same name that called
``sp.match_database(bio_db, ...)`` against the SQLite biosphere DB.

<a id="transforms.normalisers.BioStrategyChain.runner"></a>

#### runner

<a id="transforms.normalisers.BioStrategyChain.bio_db_name"></a>

#### bio\_db\_name

<a id="transforms.normalisers.BioStrategyChain.catalog"></a>

#### catalog

<a id="transforms.normalisers.BioStrategyChain.apply"></a>

#### apply

```python
def apply(sp: Any) -> dict[str, int]
```

<a id="transforms.normalisers.RestoreSimaproNamesTransform"></a>

## RestoreSimaproNamesTransform Objects

```python
@dataclass(frozen=True)
class RestoreSimaproNamesTransform()
```

Apply ``simapro-ecoinvent-3.9.1-cutoff`` + restore-names datapackages.

The restore-names datapackage may not be registered in older
``randonneur_data`` versions; record the suppression rather than
silently swallow the failure.

<a id="transforms.normalisers.RestoreSimaproNamesTransform.runner"></a>

#### runner

<a id="transforms.normalisers.RestoreSimaproNamesTransform.apply"></a>

#### apply

```python
def apply(sp: Any) -> None
```
