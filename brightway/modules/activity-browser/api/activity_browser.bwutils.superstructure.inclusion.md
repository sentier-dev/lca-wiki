**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.superstructure.inclusion` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.superstructure.inclusion cfg.yml > activity_browser.bwutils.superstructure.inclusion.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.superstructure.inclusion"></a>

# activity\_browser.bwutils.superstructure.inclusion

Scenario inclusion set S — pure algebra (no Qt).

<a id="activity_browser.bwutils.superstructure.inclusion.MODE_PRODUCT"></a>

#### MODE\_PRODUCT

<a id="activity_browser.bwutils.superstructure.inclusion.MODE_ADDITION"></a>

#### MODE\_ADDITION

<a id="activity_browser.bwutils.superstructure.inclusion.Axes"></a>

#### Axes

<a id="activity_browser.bwutils.superstructure.inclusion.join_parts"></a>

#### join\_parts

```python
def join_parts(parts: Iterable[str]) -> str
```

<a id="activity_browser.bwutils.superstructure.inclusion.split_combination"></a>

#### split\_combination

```python
def split_combination(name: str, n_files: int) -> tuple[str, ...]
```

<a id="activity_browser.bwutils.superstructure.inclusion.product_universe"></a>

#### product\_universe

```python
def product_universe(axes: Axes) -> list[str]
```

<a id="activity_browser.bwutils.superstructure.inclusion.extend_universe"></a>

#### extend\_universe

```python
def extend_universe(axes: Axes) -> list[str]
```

<a id="activity_browser.bwutils.superstructure.inclusion.full_universe"></a>

#### full\_universe

```python
def full_universe(axes: Axes, mode: str) -> list[str]
```

<a id="activity_browser.bwutils.superstructure.inclusion.all_included"></a>

#### all\_included

```python
def all_included(axes: Axes, mode: str) -> list[str]
```

<a id="activity_browser.bwutils.superstructure.inclusion.order_included"></a>

#### order\_included

```python
def order_included(included: Sequence[str], axes: Axes,
                   mode: str) -> list[str]
```

Return members of S in scenario-file / product universe order.

<a id="activity_browser.bwutils.superstructure.inclusion.derive_file_flags"></a>

#### derive\_file\_flags

```python
def derive_file_flags(included: Sequence[str], axes: Axes,
                      mode: str) -> list[list[bool]]
```

<a id="activity_browser.bwutils.superstructure.inclusion.uncheck_name"></a>

#### uncheck\_name

```python
def uncheck_name(included: Sequence[str], axes: Axes, file_index: int,
                 name: str, mode: str) -> list[str]
```

<a id="activity_browser.bwutils.superstructure.inclusion.check_name"></a>

#### check\_name

```python
def check_name(included: Sequence[str], axes: Axes, file_index: int, name: str,
               mode: str) -> list[str]
```

<a id="activity_browser.bwutils.superstructure.inclusion.toggle_combination"></a>

#### toggle\_combination

```python
def toggle_combination(included: Sequence[str],
                       combination: str,
                       axes: Axes | None = None,
                       mode: str | None = None) -> list[str]
```

<a id="activity_browser.bwutils.superstructure.inclusion.ReconcileResult"></a>

## ReconcileResult Objects

```python
@dataclass(frozen=True)
class ReconcileResult()
```

<a id="activity_browser.bwutils.superstructure.inclusion.ReconcileResult.included"></a>

#### included

<a id="activity_browser.bwutils.superstructure.inclusion.ReconcileResult.mismatched"></a>

#### mismatched

<a id="activity_browser.bwutils.superstructure.inclusion.reconcile_included"></a>

#### reconcile\_included

```python
def reconcile_included(saved_included: Sequence[str], saved_axes: Axes,
                       current_axes: Axes, mode: str) -> ReconcileResult
```

Restore S against current axes.

If saved axes differ from current axes, treat as mismatch and return the
full current universe. Otherwise keep saved members that still exist.
