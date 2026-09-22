**Generated API reference** · package `bw2data` 4.7 · module `bw2data.signals` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2data==4.7'
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
  -I "$SP" -m bw2data.signals cfg.yml > bw2data.signals.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.signals"></a>

# bw2data.signals

<a id="bw2data.signals.signaleddataset_on_save"></a>

#### signaleddataset\_on\_save

<a id="bw2data.signals.signaleddataset_on_delete"></a>

#### signaleddataset\_on\_delete

<a id="bw2data.signals.on_activity_database_change"></a>

#### on\_activity\_database\_change

<a id="bw2data.signals.on_activity_code_change"></a>

#### on\_activity\_code\_change

<a id="bw2data.signals.on_database_metadata_change"></a>

#### on\_database\_metadata\_change

<a id="bw2data.signals.on_database_delete"></a>

#### on\_database\_delete

<a id="bw2data.signals.on_database_reset"></a>

#### on\_database\_reset

<a id="bw2data.signals.on_database_write"></a>

#### on\_database\_write

<a id="bw2data.signals.on_project_parameter_recalculate"></a>

#### on\_project\_parameter\_recalculate

<a id="bw2data.signals.on_project_parameter_update_formula_parameter_name"></a>

#### on\_project\_parameter\_update\_formula\_parameter\_name

<a id="bw2data.signals.on_database_parameter_recalculate"></a>

#### on\_database\_parameter\_recalculate

<a id="bw2data.signals.on_database_parameter_update_formula_project_parameter_name"></a>

#### on\_database\_parameter\_update\_formula\_project\_parameter\_name

<a id="bw2data.signals.on_database_parameter_update_formula_database_parameter_name"></a>

#### on\_database\_parameter\_update\_formula\_database\_parameter\_name

<a id="bw2data.signals.on_activity_parameter_recalculate"></a>

#### on\_activity\_parameter\_recalculate

<a id="bw2data.signals.on_activity_parameter_recalculate_exchanges"></a>

#### on\_activity\_parameter\_recalculate\_exchanges

<a id="bw2data.signals.on_activity_parameter_update_formula_project_parameter_name"></a>

#### on\_activity\_parameter\_update\_formula\_project\_parameter\_name

<a id="bw2data.signals.on_activity_parameter_update_formula_database_parameter_name"></a>

#### on\_activity\_parameter\_update\_formula\_database\_parameter\_name

<a id="bw2data.signals.on_activity_parameter_update_formula_activity_parameter_name"></a>

#### on\_activity\_parameter\_update\_formula\_activity\_parameter\_name

<a id="bw2data.signals.project_changed"></a>

#### project\_changed

<a id="bw2data.signals.project_created"></a>

#### project\_created

<a id="bw2data.signals.SignaledDataset"></a>

## SignaledDataset Objects

```python
class SignaledDataset(Model)
```

<a id="bw2data.signals.SignaledDataset.save"></a>

#### save

```python
@override
def save(signal: bool = True, *args, **kwargs) -> None
```

Receives a mapper to convert the data to the expected dictionary format

<a id="bw2data.signals.SignaledDataset.delete_instance"></a>

#### delete\_instance

```python
@override
def delete_instance(signal: bool = True, *args, **kwargs) -> None
```
