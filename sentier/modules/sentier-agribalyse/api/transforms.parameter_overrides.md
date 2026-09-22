**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.parameter_overrides` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.parameter_overrides cfg.yml > transforms.parameter_overrides.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.parameter_overrides"></a>

# transforms.parameter\_overrides

``ParameterOverridesStore`` + ``ParameterOverridesApplier``.

``source/parameter_overrides.csv`` is the single source of override truth
(gitignored — it is local what-if state, not canonical AGB data, so the
"same CSV → bit-identical outputs" guarantee holds for the canonical build).
``dds-set-parameter`` writes it; ``dds-reset`` deletes it (opt out with
``--keep-overrides``); the applier folds it into BOTH pipelines on the
fully LINKED graph in ratio mode — in ``LinkAllPipeline`` directly after
the pristine ``LinkedSpCache`` snapshot, and in ``FastRescorePipeline``
after loading that snapshot — so the two paths share the exact same
override semantics. The scoring-package content hash covers the exchange
frame bytes, so overridden and baseline runs land in distinct cached
packages.

File format (``;``-separated, ``.`` decimals, header row):
``parameter_name;scope;value;set_at;comment`` — ``scope`` is a process code
or ``*`` (every process defining the parameter). A process-specific row
beats a ``*`` row for the same parameter.

<a id="transforms.parameter_overrides.ParameterOverride"></a>

## ParameterOverride Objects

```python
@dataclass(frozen=True)
class ParameterOverride()
```

One override row. ``scope`` is a process code or ``*``.

<a id="transforms.parameter_overrides.ParameterOverride.parameter_name"></a>

#### parameter\_name

<a id="transforms.parameter_overrides.ParameterOverride.scope"></a>

#### scope

<a id="transforms.parameter_overrides.ParameterOverride.value"></a>

#### value

<a id="transforms.parameter_overrides.ParameterOverride.set_at"></a>

#### set\_at

<a id="transforms.parameter_overrides.ParameterOverride.comment"></a>

#### comment

<a id="transforms.parameter_overrides.ParameterOverride.key"></a>

#### key

```python
def key() -> tuple[str, str]
```

<a id="transforms.parameter_overrides.ParameterOverridesStore"></a>

## ParameterOverridesStore Objects

```python
@dataclass(frozen=True)
class ParameterOverridesStore()
```

Read/write ``source/parameter_overrides.csv``.

<a id="transforms.parameter_overrides.ParameterOverridesStore.settings"></a>

#### settings

<a id="transforms.parameter_overrides.ParameterOverridesStore.path"></a>

#### path

```python
@property
def path()
```

<a id="transforms.parameter_overrides.ParameterOverridesStore.load"></a>

#### load

```python
def load() -> list[ParameterOverride]
```

<a id="transforms.parameter_overrides.ParameterOverridesStore.save"></a>

#### save

```python
def save(overrides: list[ParameterOverride]) -> None
```

<a id="transforms.parameter_overrides.ParameterOverridesStore.upsert"></a>

#### upsert

```python
def upsert(override: ParameterOverride) -> ParameterOverride
```

Insert or replace the row with the same (name, scope). Returns the
stamped override actually written.

<a id="transforms.parameter_overrides.ParameterOverridesStore.clear"></a>

#### clear

```python
def clear(name: str | None = None, scope: str | None = None) -> int
```

Remove matching rows; both filters ``None`` removes everything.

Returns the number of rows removed. Deletes the file when nothing
remains, so a cleared state is indistinguishable from pristine.

<a id="transforms.parameter_overrides.ParameterOverridesApplier"></a>

## ParameterOverridesApplier Objects

```python
@dataclass(frozen=True)
class ParameterOverridesApplier()
```

Fold the overrides file into a freshly loaded ``ParsedSimaProCsv``.

<a id="transforms.parameter_overrides.ParameterOverridesApplier.settings"></a>

#### settings

<a id="transforms.parameter_overrides.ParameterOverridesApplier.apply"></a>

#### apply

```python
def apply(sp: Any) -> dict[str, Any]
```
