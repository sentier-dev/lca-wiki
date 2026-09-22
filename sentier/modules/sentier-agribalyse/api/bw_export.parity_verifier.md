**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `bw_export.parity_verifier` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_export.parity_verifier cfg.yml > bw_export.parity_verifier.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_export.parity_verifier"></a>

# bw\_export.parity\_verifier

``ParityVerifier`` — prove the datapackage equals the ScoringPackage.

Three guards: (1) the technosphere is square, (2) it factorizes (no
singular-matrix error), (3) scores computed from the emitted datapackages
match ``NativeLciaScorer`` within tolerance for a sample of products across
all methods.

The technosphere factorization is the expensive step, and it depends only
on the product demand — not the LCIA method. So we factorize **once per
product** through a single ``bw2calc`` LCA (built with one "anchor" method),
reuse the resulting inventory vector to characterise every other method by a
cheap dot product, and assert that this reused dot reproduces ``bw2calc``'s
own ``lcia`` for the anchor method (so the dot path is provably equivalent to
stock bw2calc). This turns an ``n_products x n_methods`` factorization loop
into ``n_products`` factorizations.

<a id="bw_export.parity_verifier.ParityResult"></a>

## ParityResult Objects

```python
@dataclass(frozen=True)
class ParityResult()
```

<a id="bw_export.parity_verifier.ParityResult.passed"></a>

#### passed

<a id="bw_export.parity_verifier.ParityResult.n_checked"></a>

#### n\_checked

<a id="bw_export.parity_verifier.ParityResult.max_rel_error"></a>

#### max\_rel\_error

<a id="bw_export.parity_verifier.ParityResult.tolerance"></a>

#### tolerance

<a id="bw_export.parity_verifier.ParityVerifier"></a>

## ParityVerifier Objects

```python
@dataclass(frozen=True)
class ParityVerifier()
```

<a id="bw_export.parity_verifier.ParityVerifier.tolerance"></a>

#### tolerance

<a id="bw_export.parity_verifier.ParityVerifier.assert_square"></a>

#### assert\_square

```python
def assert_square(package: ScoringPackage) -> None
```

<a id="bw_export.parity_verifier.ParityVerifier.assert_solvable"></a>

#### assert\_solvable

```python
def assert_solvable(package: ScoringPackage) -> None
```

<a id="bw_export.parity_verifier.ParityVerifier.verify"></a>

#### verify

```python
def verify(*, package: ScoringPackage, written: WriteResult,
           product_ids: list[int], methods: list[tuple[str,
                                                       ...]]) -> ParityResult
```
