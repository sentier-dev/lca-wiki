**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.superstructure.scenario_overlay` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'activity-browser==3.0.0b202608291724'
SP="$(pkg/bin/python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
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
  -I "$SP" -m activity_browser.bwutils.superstructure.scenario_overlay cfg.yml > activity_browser.bwutils.superstructure.scenario_overlay.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.superstructure.scenario_overlay"></a>

# activity\_browser.bwutils.superstructure.scenario\_overlay

Precomputed scenario matrix overlay (shared by SuperstructureMLCA and Monte Carlo).

<a id="activity_browser.bwutils.superstructure.scenario_overlay.ScenarioOverlay"></a>

## ScenarioOverlay Objects

```python
@dataclass(frozen=True)
class ScenarioOverlay()
```

Precomputed scenario amounts and matrix coordinates for MC overlay.

<a id="activity_browser.bwutils.superstructure.scenario_overlay.ScenarioOverlay.name"></a>

#### name

<a id="activity_browser.bwutils.superstructure.scenario_overlay.ScenarioOverlay.indices"></a>

#### indices

<a id="activity_browser.bwutils.superstructure.scenario_overlay.ScenarioOverlay.matrix_indices"></a>

#### matrix\_indices

<a id="activity_browser.bwutils.superstructure.scenario_overlay.ScenarioOverlay.amounts"></a>

#### amounts

<a id="activity_browser.bwutils.superstructure.scenario_overlay.ScenarioOverlay.uncertain"></a>

#### uncertain

<a id="activity_browser.bwutils.superstructure.scenario_overlay.uncertainty_flags_for_indices"></a>

#### uncertainty\_flags\_for\_indices

```python
def uncertainty_flags_for_indices(indices: np.ndarray) -> np.ndarray
```

Return a bool array: True where the exchange has MC-relevant uncertainty.

Any ``stats_arrays`` distribution (type id >= 2) is resampled when the
technosphere/biosphere MC layer is on; only undefined/no-uncertainty are
treated as deterministic for scenario pinning.

<a id="activity_browser.bwutils.superstructure.scenario_overlay.matrix_indices_for_multilca"></a>

#### matrix\_indices\_for\_multilca

```python
def matrix_indices_for_multilca(lca: bc.MultiLCA,
                                indices: np.ndarray) -> np.ndarray
```

Resolve ``(row, col, flip)`` on a ``MultiLCA`` (once per calculate).

<a id="activity_browser.bwutils.superstructure.scenario_overlay.apply_scenario_overlay"></a>

#### apply\_scenario\_overlay

```python
def apply_scenario_overlay(lca: bc.MultiLCA,
                           overlay: ScenarioOverlay,
                           *,
                           include_technosphere: bool,
                           include_biosphere: bool,
                           repin_only: bool = False) -> None
```

Write scenario amounts into LCA matrices.

Initial pass (``repin_only=False``): pin every scenario cell that should
hold a fixed amount (layer off, or layer on but exchange deterministic).

Re-pin pass (``repin_only=True``): only layers being MC-resampled; used after
``next()`` restored DB draws on uncertain cells while leaving pinned cells to
be overwritten from the datapackage.

<a id="activity_browser.bwutils.superstructure.scenario_overlay.exchange_uncertainty_type"></a>

#### exchange\_uncertainty\_type

```python
def exchange_uncertainty_type(index: Index) -> int
```
