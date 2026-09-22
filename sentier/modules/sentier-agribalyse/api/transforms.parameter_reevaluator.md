**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.parameter_reevaluator` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.parameter_reevaluator cfg.yml > transforms.parameter_reevaluator.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.parameter_reevaluator"></a>

# transforms.parameter\_reevaluator

``ParameterReevaluator`` — re-evaluate exchange formulas under overrides.

Mirrors ``bw_simapro_csv``'s process-level resolution
(``Process.resolve_local_parameters``): input-parameter amounts feed
``bw2parameters.ParameterSet`` for the calculated parameters, then a
``bw2parameters.Interpreter`` evaluates each exchange formula. Run with no
overrides it reproduces the baked amounts exactly — the invariant the
integration tests pin.

All AGB 3.2 parameters are process-local (the database/project blocks in the
export are empty), so the blast radius of an override is the set of processes
that define the parameter. Only **input** parameters are editable; calculated
parameters are formula-derived and refuse overrides.

<a id="transforms.parameter_reevaluator.GLOBAL_SCOPE"></a>

#### GLOBAL\_SCOPE

<a id="transforms.parameter_reevaluator.UnknownParameterError"></a>

## UnknownParameterError Objects

```python
class UnknownParameterError(ValueError)
```

Raised when an override names a parameter that does not exist.

<a id="transforms.parameter_reevaluator.UnknownProcessError"></a>

## UnknownProcessError Objects

```python
class UnknownProcessError(ValueError)
```

Raised when an override targets a process that does not define the parameter.

<a id="transforms.parameter_reevaluator.CalculatedParameterOverrideError"></a>

## CalculatedParameterOverrideError Objects

```python
class CalculatedParameterOverrideError(ValueError)
```

Raised when an override targets a calculated (formula-derived) parameter.

<a id="transforms.parameter_reevaluator.ExchangeChange"></a>

## ExchangeChange Objects

```python
@dataclass(frozen=True)
class ExchangeChange()
```

One exchange amount that changed under the overrides.

<a id="transforms.parameter_reevaluator.ExchangeChange.process_code"></a>

#### process\_code

<a id="transforms.parameter_reevaluator.ExchangeChange.exchange_index"></a>

#### exchange\_index

<a id="transforms.parameter_reevaluator.ExchangeChange.exchange_name"></a>

#### exchange\_name

<a id="transforms.parameter_reevaluator.ExchangeChange.old_amount"></a>

#### old\_amount

<a id="transforms.parameter_reevaluator.ExchangeChange.new_amount"></a>

#### new\_amount

<a id="transforms.parameter_reevaluator.ReevaluationResult"></a>

## ReevaluationResult Objects

```python
@dataclass(frozen=True)
class ReevaluationResult()
```

<a id="transforms.parameter_reevaluator.ReevaluationResult.data"></a>

#### data

<a id="transforms.parameter_reevaluator.ReevaluationResult.changes"></a>

#### changes

<a id="transforms.parameter_reevaluator.ReevaluationResult.warnings"></a>

#### warnings

<a id="transforms.parameter_reevaluator.ParameterReevaluator"></a>

## ParameterReevaluator Objects

```python
@dataclass(frozen=True)
class ParameterReevaluator()
```

Re-evaluate exchange amounts for processes affected by overrides.

``parameters`` are the rows of ``ParsedSimaProCsv.parameters``.

<a id="transforms.parameter_reevaluator.ParameterReevaluator.parameters"></a>

#### parameters

<a id="transforms.parameter_reevaluator.ParameterReevaluator.resolve_name"></a>

#### resolve\_name

```python
def resolve_name(user_name: str) -> str
```

Resolve a user-facing name to the normalized formula name.

Raises ``UnknownParameterError`` (with closest matches) or
``CalculatedParameterOverrideError`` (with an example formula).

<a id="transforms.parameter_reevaluator.ParameterReevaluator.defining_processes"></a>

#### defining\_processes

```python
def defining_processes(norm_name: str) -> list[str]
```

<a id="transforms.parameter_reevaluator.ParameterReevaluator.plan"></a>

#### plan

```python
def plan(
    overrides: list[ParameterOverride]
) -> tuple[dict[str, dict[str, float]], dict[str, list[str]]]
```

Map overrides to per-process environments: ``{code: {norm_name: value}}``.

Precedence: a process-specific override beats a ``*`` override for
the same parameter. Also returns ``{user_name: target codes}`` per
override for effect reporting.

<a id="transforms.parameter_reevaluator.ParameterReevaluator.reevaluate"></a>

#### reevaluate

```python
def reevaluate(data: list[dict],
               overrides: list[ParameterOverride]) -> ReevaluationResult
```

Return a new dataset list with affected exchange amounts recomputed.

Absolute mode — for parse-level data: the formula's value IS the
new amount. Use ``ratio_patch`` for post-transform (linked) data.

<a id="transforms.parameter_reevaluator.ParameterReevaluator.ratio_patch"></a>

#### ratio\_patch

```python
def ratio_patch(data: list[dict],
                overrides: list[ParameterOverride]) -> ReevaluationResult
```

Ratio mode — for post-transform (linked) data.

Between the parse and the exchange frame, transforms rescale
amounts multiplicatively (unit conversions, MJ→kWh, ...), so the
stored amount is no longer the formula's value. Scaling by
``new_eval / baseline_eval`` preserves whatever linear factor was
applied. Exchanges whose baseline evaluation is 0 but new value
isn't cannot be ratio-patched (unknown scale) — they surface as
warnings and keep their baseline amount.
