**Generated API reference** · package `bw_timex` 1.4.0 · module `bw_timex.validation` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_timex==1.4.0'
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
  -I "$SP" -m bw_timex.validation cfg.yml > bw_timex.validation.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_timex.validation"></a>

# bw\_timex.validation

<a id="bw_timex.validation.DynamicLCIAMetric"></a>

#### DynamicLCIAMetric

<a id="bw_timex.validation.TimexLCAInputs"></a>

## TimexLCAInputs Objects

```python
class TimexLCAInputs(BaseModel)
```

Validates inputs to TimexLCA.__init__

<a id="bw_timex.validation.TimexLCAInputs.model_config"></a>

#### model\_config

<a id="bw_timex.validation.TimexLCAInputs.demand"></a>

#### demand

<a id="bw_timex.validation.TimexLCAInputs.method"></a>

#### method

<a id="bw_timex.validation.TimexLCAInputs.database_dates"></a>

#### database\_dates

<a id="bw_timex.validation.TimexLCAInputs.scenario"></a>

#### scenario

<a id="bw_timex.validation.TimexLCAInputs.create_missing"></a>

#### create\_missing

<a id="bw_timex.validation.TimexLCAInputs.premise_key"></a>

#### premise\_key

<a id="bw_timex.validation.TimexLCAInputs.ecoinvent_credentials"></a>

#### ecoinvent\_credentials

<a id="bw_timex.validation.TimexLCAInputs.validate_demand"></a>

#### validate\_demand

```python
@field_validator("demand")
@classmethod
def validate_demand(cls, v: dict) -> dict
```

<a id="bw_timex.validation.TimexLCAInputs.validate_method"></a>

#### validate\_method

```python
@field_validator("method")
@classmethod
def validate_method(cls, v: tuple) -> tuple
```

<a id="bw_timex.validation.TimexLCAInputs.validate_method_exists"></a>

#### validate\_method\_exists

```python
@model_validator(mode="after")
def validate_method_exists() -> "TimexLCAInputs"
```

<a id="bw_timex.validation.TimexLCAInputs.validate_database_dates"></a>

#### validate\_database\_dates

```python
@field_validator("database_dates")
@classmethod
def validate_database_dates(cls, v: Optional[dict]) -> Optional[dict]
```

<a id="bw_timex.validation.TimexLCAInputs.validate_database_dates_exist"></a>

#### validate\_database\_dates\_exist

```python
@model_validator(mode="after")
def validate_database_dates_exist() -> "TimexLCAInputs"
```

<a id="bw_timex.validation.TimexLCAInputs.validate_scenario"></a>

#### validate\_scenario

```python
@field_validator("scenario")
@classmethod
def validate_scenario(cls, v: Optional[dict]) -> Optional[dict]
```

<a id="bw_timex.validation.TimexLCAInputs.validate_demand_in_dynamic_databases"></a>

#### validate\_demand\_in\_dynamic\_databases

```python
@model_validator(mode="after")
def validate_demand_in_dynamic_databases() -> "TimexLCAInputs"
```

<a id="bw_timex.validation.TimexLCAInputs.validate_create_missing"></a>

#### validate\_create\_missing

```python
@model_validator(mode="after")
def validate_create_missing() -> "TimexLCAInputs"
```

<a id="bw_timex.validation.BuildTimelineInputs"></a>

## BuildTimelineInputs Objects

```python
class BuildTimelineInputs(BaseModel)
```

Validates inputs to TimexLCA.build_timeline

<a id="bw_timex.validation.BuildTimelineInputs.model_config"></a>

#### model\_config

<a id="bw_timex.validation.BuildTimelineInputs.starting_datetime"></a>

#### starting\_datetime

<a id="bw_timex.validation.BuildTimelineInputs.temporal_grouping"></a>

#### temporal\_grouping

<a id="bw_timex.validation.BuildTimelineInputs.interpolation_type"></a>

#### interpolation\_type

<a id="bw_timex.validation.BuildTimelineInputs.edge_filter_function"></a>

#### edge\_filter\_function

<a id="bw_timex.validation.BuildTimelineInputs.cutoff"></a>

#### cutoff

<a id="bw_timex.validation.BuildTimelineInputs.max_calc"></a>

#### max\_calc

<a id="bw_timex.validation.BuildTimelineInputs.graph_traversal"></a>

#### graph\_traversal

<a id="bw_timex.validation.BuildTimelineInputs.traverse_background"></a>

#### traverse\_background

<a id="bw_timex.validation.BuildTimelineInputs.validate_starting_datetime"></a>

#### validate\_starting\_datetime

```python
@field_validator("starting_datetime")
@classmethod
def validate_starting_datetime(
        cls, v: Union[datetime, str]) -> Union[datetime, str]
```

<a id="bw_timex.validation.BuildTimelineInputs.normalize_interpolation_type"></a>

#### normalize\_interpolation\_type

```python
@field_validator("interpolation_type")
@classmethod
def normalize_interpolation_type(cls, v: str) -> str
```

<a id="bw_timex.validation.LCIInputs"></a>

## LCIInputs Objects

```python
class LCIInputs(BaseModel)
```

Validates inputs to TimexLCA.lci

<a id="bw_timex.validation.LCIInputs.build_dynamic_biosphere"></a>

#### build\_dynamic\_biosphere

<a id="bw_timex.validation.LCIInputs.expand_technosphere"></a>

#### expand\_technosphere

<a id="bw_timex.validation.LCIInputs.keep_activity_dimension"></a>

#### keep\_activity\_dimension

<a id="bw_timex.validation.LCIInputs.group_background_by_time"></a>

#### group\_background\_by\_time

<a id="bw_timex.validation.LCIInputs.validate_combination"></a>

#### validate\_combination

```python
@model_validator(mode="after")
def validate_combination() -> "LCIInputs"
```

<a id="bw_timex.validation.DynamicLCIAInputs"></a>

## DynamicLCIAInputs Objects

```python
class DynamicLCIAInputs(BaseModel)
```

Validates inputs to TimexLCA.dynamic_lcia

<a id="bw_timex.validation.DynamicLCIAInputs.model_config"></a>

#### model\_config

<a id="bw_timex.validation.DynamicLCIAInputs.metric"></a>

#### metric

<a id="bw_timex.validation.DynamicLCIAInputs.time_horizon"></a>

#### time\_horizon

<a id="bw_timex.validation.DynamicLCIAInputs.fixed_time_horizon"></a>

#### fixed\_time\_horizon

<a id="bw_timex.validation.DynamicLCIAInputs.time_horizon_start"></a>

#### time\_horizon\_start

<a id="bw_timex.validation.DynamicLCIAInputs.characterization_functions"></a>

#### characterization\_functions

<a id="bw_timex.validation.DynamicLCIAInputs.characterization_function_co2"></a>

#### characterization\_function\_co2

<a id="bw_timex.validation.DynamicLCIAInputs.use_disaggregated_lci"></a>

#### use\_disaggregated\_lci

<a id="bw_timex.validation.TemporalDistributionExchangeInputs"></a>

## TemporalDistributionExchangeInputs Objects

```python
class TemporalDistributionExchangeInputs(BaseModel)
```

Validates inputs to add_temporal_distribution_to_exchange

<a id="bw_timex.validation.TemporalDistributionExchangeInputs.model_config"></a>

#### model\_config

<a id="bw_timex.validation.TemporalDistributionExchangeInputs.temporal_distribution"></a>

#### temporal\_distribution

<a id="bw_timex.validation.TemporalDistributionExchangeInputs.validate_temporal_distribution"></a>

#### validate\_temporal\_distribution

```python
@field_validator("temporal_distribution", mode="before")
@classmethod
def validate_temporal_distribution(cls, v)
```

<a id="bw_timex.validation.TemporalEvolutionExchangeInputs"></a>

## TemporalEvolutionExchangeInputs Objects

```python
class TemporalEvolutionExchangeInputs(BaseModel)
```

Validates inputs to add_temporal_evolution_to_exchange

<a id="bw_timex.validation.TemporalEvolutionExchangeInputs.temporal_evolution_factors"></a>

#### temporal\_evolution\_factors

<a id="bw_timex.validation.TemporalEvolutionExchangeInputs.temporal_evolution_amounts"></a>

#### temporal\_evolution\_amounts

<a id="bw_timex.validation.TemporalEvolutionExchangeInputs.temporal_evolution_reference"></a>

#### temporal\_evolution\_reference

<a id="bw_timex.validation.TemporalEvolutionExchangeInputs.validate_mutual_exclusivity"></a>

#### validate\_mutual\_exclusivity

```python
@model_validator(mode="after")
def validate_mutual_exclusivity() -> "TemporalEvolutionExchangeInputs"
```

<a id="bw_timex.validation.TemporalEvolutionExchangeInputs.validate_temporal_evolution_dict"></a>

#### validate\_temporal\_evolution\_dict

```python
@field_validator("temporal_evolution_factors", "temporal_evolution_amounts")
@classmethod
def validate_temporal_evolution_dict(cls, v: Optional[dict]) -> Optional[dict]
```

<a id="bw_timex.validation.PlotDynamicInventoryInputs"></a>

## PlotDynamicInventoryInputs Objects

```python
class PlotDynamicInventoryInputs(BaseModel)
```

Validates inputs to TimexLCA.plot_dynamic_inventory

<a id="bw_timex.validation.PlotDynamicInventoryInputs.bio_flows"></a>

#### bio\_flows

<a id="bw_timex.validation.PlotDynamicInventoryInputs.cumulative"></a>

#### cumulative

<a id="bw_timex.validation.PlotDynamicInventoryInputs.validate_bio_flows"></a>

#### validate\_bio\_flows

```python
@field_validator("bio_flows")
@classmethod
def validate_bio_flows(cls, v: list) -> list
```

<a id="bw_timex.validation.DatabaseMetadataInputs"></a>

## DatabaseMetadataInputs Objects

```python
class DatabaseMetadataInputs(BaseModel)
```

Validates inputs to set_database_metadata

<a id="bw_timex.validation.DatabaseMetadataInputs.model_config"></a>

#### model\_config

<a id="bw_timex.validation.DatabaseMetadataInputs.database"></a>

#### database

<a id="bw_timex.validation.DatabaseMetadataInputs.metadata"></a>

#### metadata

<a id="bw_timex.validation.DatabaseMetadataInputs.validate_metadata"></a>

#### validate\_metadata

```python
@field_validator("metadata")
@classmethod
def validate_metadata(cls, v: dict) -> dict
```

<a id="bw_timex.validation.ScenarioBuildInputs"></a>

## ScenarioBuildInputs Objects

```python
class ScenarioBuildInputs(BaseModel)
```

Validates the arguments handed to ensure_scenario_databases

<a id="bw_timex.validation.ScenarioBuildInputs.model_config"></a>

#### model\_config

<a id="bw_timex.validation.ScenarioBuildInputs.scenario"></a>

#### scenario

<a id="bw_timex.validation.ScenarioBuildInputs.ecoinvent_credentials"></a>

#### ecoinvent\_credentials

<a id="bw_timex.validation.ScenarioBuildInputs.validate_ecoinvent_credentials"></a>

#### validate\_ecoinvent\_credentials

```python
@field_validator("ecoinvent_credentials")
@classmethod
def validate_ecoinvent_credentials(cls, v: Optional[tuple]) -> Optional[tuple]
```

<a id="bw_timex.validation.ScenarioBuildInputs.validate_scenario"></a>

#### validate\_scenario

```python
@field_validator("scenario")
@classmethod
def validate_scenario(cls, v: dict) -> dict
```
