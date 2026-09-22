**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.method_config` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2calc==2.5.0'
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
  -I "$SP" -m bw2calc.method_config cfg.yml > bw2calc.method_config.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.method_config"></a>

# bw2calc.method\_config

<a id="bw2calc.method_config.MethodConfig"></a>

## MethodConfig Objects

```python
class MethodConfig(BaseModel)
```

A class that stores the logical relationships between impact categories, normalization, and
weighting.

The basic object in all three categories is an identifying tuple, i.e. tuples of strings. In
implementations other than `bw2data` these can also simply be strings.

`impact_categories` is a list of tuples or strings which identify each impact category
(`bw2data.Method`).

`normalizations` link normalization factors to impact categories. They are optional. If
provided, they take the form of a dictionary, with keys of tuples or strings which identify each
normalization (`bw2data.Normalization`), and values of *lists* of impact categories tuples or
strings.

If `normalizations` is defined, **all** impact categories must have a normalization.

`weightings` link weighting factors to either normalizations *or* impact categories. They are
optional. If provided, they take the form of a dictionary, with keys of tuples or strings which
identify each weighting (`bw2data.Weighting`), and values of *lists* of normalizations or impact
categories tuples or strings. The keys identify the weighting data, and the values refer to
either impact categories or normalizations - mixing impact categories and normalizations is not
allowed.

If `normalizations` is defined, **all** impact categories or normalizations must have a
weighting.

The identifying tuples for `impact_categories`, `normalizations`, and `weightings` must all be
unique.

Example
-------

```python
{
    "impact_categories": [
        ("climate change", "100 years"),
        ("climate change", "20 years"),
        "eutrophication",  # String accepted as-is
    ],
    "normalizations": {
        ("climate change", "global normalization"): [
            ("climate change", "100 years"),
            ("climate change", "20 years"),
        ],
        "eut european reference": [  # String key accepted as-is
            "eutrophication",  # String value accepted as-is
        ]
    },
    "weightings": {
        ("climate change", "bad"): [
            ("how bad?", "dead", "people")
        ],
        "eutrophication": [  # String key accepted as-is
            ("how bad?", "dead", "fish")
        ]
    }
}
```

<a id="bw2calc.method_config.MethodConfig.impact_categories"></a>

#### impact\_categories

<a id="bw2calc.method_config.MethodConfig.normalizations"></a>

#### normalizations

<a id="bw2calc.method_config.MethodConfig.weightings"></a>

#### weightings

<a id="bw2calc.method_config.MethodConfig.normalizations_reference_impact_categories"></a>

#### normalizations\_reference\_impact\_categories

```python
@model_validator(mode="after")
def normalizations_reference_impact_categories()
```

<a id="bw2calc.method_config.MethodConfig.normalizations_unique_from_impact_categories"></a>

#### normalizations\_unique\_from\_impact\_categories

```python
@model_validator(mode="after")
def normalizations_unique_from_impact_categories()
```

<a id="bw2calc.method_config.MethodConfig.normalizations_cover_all_impact_categories"></a>

#### normalizations\_cover\_all\_impact\_categories

```python
@model_validator(mode="after")
def normalizations_cover_all_impact_categories()
```

<a id="bw2calc.method_config.MethodConfig.weightings_reference_impact_categories_or_normalizations"></a>

#### weightings\_reference\_impact\_categories\_or\_normalizations

```python
@model_validator(mode="after")
def weightings_reference_impact_categories_or_normalizations()
```

<a id="bw2calc.method_config.MethodConfig.weightings_unique_from_impact_categories"></a>

#### weightings\_unique\_from\_impact\_categories

```python
@model_validator(mode="after")
def weightings_unique_from_impact_categories()
```

<a id="bw2calc.method_config.MethodConfig.weightings_unique_from_normalizations"></a>

#### weightings\_unique\_from\_normalizations

```python
@model_validator(mode="after")
def weightings_unique_from_normalizations()
```

<a id="bw2calc.method_config.MethodConfig.weightings_cant_have_mixed_references"></a>

#### weightings\_cant\_have\_mixed\_references

```python
@model_validator(mode="after")
def weightings_cant_have_mixed_references()
```

<a id="bw2calc.method_config.MethodConfig.weightings_cover_all_impact_categories"></a>

#### weightings\_cover\_all\_impact\_categories

```python
@model_validator(mode="after")
def weightings_cover_all_impact_categories()
```

<a id="bw2calc.method_config.MethodConfig.weightings_cover_all_normalizations"></a>

#### weightings\_cover\_all\_normalizations

```python
@model_validator(mode="after")
def weightings_cover_all_normalizations()
```
