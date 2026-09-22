---
title: Define and evaluate parameters
type: use-case
summary: Put a small parameterised model into a ParameterSet, get the evaluation order and the resolved amounts, and see what a circular or missing reference does.
audience: [P1]
updated: 2026-09-22
sources: [bw2parameters-docs, pypi-bw2parameters, brightway-cheatsheet]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with bw2parameters 1.1.0, Linux x86-64
related: [../commands.md, ../classes.md, ../gotchas.md, ../../bw2data/commands.md]
---

# Define and evaluate parameters

**Persona:** P1 practitioner whose model has a handful of driving numbers rather than a
fixed inventory · **GICS sector:** any

## Goal

A set of named amounts and formulas, resolved in dependency order into concrete numbers,
with the failure modes understood before they appear in a project.

## Prerequisites

- `bw2parameters` 1.1.0. Nothing else: no project, no database, no network.
- `bw2parameters` is the evaluation engine only. Parameters stored in a project are
  `bw2data`'s `bd.parameters`; see [../../bw2data/commands.md](../../bw2data/commands.md).

## Steps

1. Write the model as a dictionary. A parameter has either an `amount` or a `formula`.

   ```python
   from bw2parameters import ParameterSet

   params = {
       "oven_kwh_per_batch": {"amount": 3.2},
       "loaves_per_batch": {"amount": 20},
       "electricity_per_loaf": {"formula": "oven_kwh_per_batch / loaves_per_batch"},
       "flour_per_loaf": {"amount": 0.7},
       "flour_losses": {"amount": 0.03},
       "flour_input": {"formula": "flour_per_loaf * (1 + flour_losses)"},
   }
   ps = ParameterSet(params)
   ```

2. Ask for the evaluation order before evaluating. This is where a cycle is caught.

   ```python
   ps.get_order()
   ```

3. Evaluate. The result is a plain dictionary of names to numbers.

   ```python
   result = ps.evaluate()
   ```

4. Write the results back into the `amount` field of your dictionary, when the consumer
   wants amounts rather than a separate result.

   ```python
   ps.evaluate_and_set_amount_field()
   params["flour_input"]["amount"]
   ```

5. Pass values a formula refers to but the set does not define, as global parameters.

   ```python
   ps2 = ParameterSet(
       {"co2_per_loaf": {"formula": "grid_intensity * 0.16"}},
       global_params={"grid_intensity": 0.128},
   )
   ps2.evaluate()
   ```

6. Sample a parameter with an uncertainty distribution, when you want a range rather
   than a point.

   ```python
   ParameterSet({
       "flour_per_loaf": {"amount": 0.7, "uncertainty_type": 3, "loc": 0.7, "scale": 0.05},
       "flour_input": {"formula": "flour_per_loaf * 1.03"},
   }).evaluate_monte_carlo(iterations=5)
   ```

## Expected output

- `get_order()` returns the six names with every dependency before its dependants:
  `oven_kwh_per_batch`, `loaves_per_batch`, `electricity_per_loaf`, `flour_per_loaf`,
  `flour_losses`, `flour_input`. It is an order, not a sort: independent names keep the
  order you wrote them in.
- `evaluate()` returns all six names, the two formulas resolved to `0.16` and `0.721`.
- After `evaluate_and_set_amount_field()`, `params["flour_input"]["amount"]` is `0.721`.
  The call mutates your dictionary.
- The globals example returns both `grid_intensity` and `co2_per_loaf`, at `0.128` and
  `0.02048`: a global parameter appears in the result.
- `evaluate_monte_carlo(iterations=5)` returns a dictionary of arrays, one per
  parameter, five values each. The dependent formula is sampled through, so
  `flour_input` varies with `flour_per_loaf` around 0.72.
- A cycle raises `ParameterError`, printing the unresolved references as a dictionary:
  `{'a': {'b'}, 'b': {'a'}}`.
- A free variable raises the same `ParameterError` with the undefined name listed:
  `{'a': {'zzz'}}`. Undefined and circular are one error class here, which is worth
  knowing when you read the message.

## Pitfalls

- **`evaluate_and_set_amount_field()` takes no arguments** in 1.1.0 and works on the
  dictionary you constructed the set with. It mutates it; copy first if you need the
  original. See [../gotchas.md](../gotchas.md).
- **`__version__` is a tuple,** `(1, 1, 0)`, not a string. Use
  `importlib.metadata.version` when you need one.
- **`get_references()` returns empty sets** for a set whose formulas were already
  resolved by an earlier `evaluate()` call in the same object. Read it before
  evaluating, or on a fresh set.
- **Formulas are restricted Python.** `asteval` allows mathematics and the `math` and
  `numpy` names, not imports or arbitrary attribute access. Treat that as deliberate:
  formulas often arrive from someone else's spreadsheet.
- **Units are opt-in.** `ParameterSet` ignores a `unit` field; only `PintParameterSet`
  and `PintInterpreter` do anything with it.
- **In a project, parameters do not apply themselves.** After changing them call
  `bd.parameters.recalculate()`, and process the affected databases before calculating
  (source: brightway-cheatsheet).
- **The PyPI summary for this package is wrong,** a leftover from a project template.
  Read the README (source: pypi-bw2parameters).

## Related vocabulary

- [Property](../../../../vocabulary.md#property)
- [Field](../../../../vocabulary.md#field)
- [Uncertainty](../../../../vocabulary.md#uncertainty)
- [Exchange](../../../../vocabulary.md#exchange)
- [Foreground](../../../../vocabulary.md#foreground)
- [Assumption scenario](../../../../vocabulary.md#assumption-scenario)
- [Models](../../../../vocabulary.md#models)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`bw2parameters` 1.1.0, Linux x86-64. Every number and every error message above is what
the run printed, including the two `ParameterError` messages and a Monte Carlo sample of
`[0.7314, 0.7344, 0.7274, 0.6325, 0.7561]` for `flour_input`, which will differ on your
machine because the sampler is not seeded here. Duration: under 2 seconds.
