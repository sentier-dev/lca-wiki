**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `config.settings` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m config.settings cfg.yml > config.settings.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="config.settings"></a>

# config.settings

Pipeline-level settings. Frozen dataclass; pass to every component.

<a id="config.settings.Settings"></a>

## Settings Objects

```python
@dataclass(frozen=True)
class Settings()
```

End-to-end pipeline configuration. Immutable; use ``with_*`` to evolve.

<a id="config.settings.Settings.DEFAULT_ECOINVENT_FOR_AGRIBALYSE"></a>

#### DEFAULT\_ECOINVENT\_FOR\_AGRIBALYSE

<a id="config.settings.Settings.agribalyse_version"></a>

#### agribalyse\_version

<a id="config.settings.Settings.ecoinvent_version"></a>

#### ecoinvent\_version

<a id="config.settings.Settings.ecoinvent_system_model"></a>

#### ecoinvent\_system\_model

<a id="config.settings.Settings.ef_version"></a>

#### ef\_version

<a id="config.settings.Settings.project_name"></a>

#### project\_name

<a id="config.settings.Settings.biosphere_db_name"></a>

#### biosphere\_db\_name

<a id="config.settings.Settings.agribalyse_db_name"></a>

#### agribalyse\_db\_name

<a id="config.settings.Settings.ef_db_name"></a>

#### ef\_db\_name

<a id="config.settings.Settings.apply_llm_overrides"></a>

#### apply\_llm\_overrides

``--no-llm`` toggles this. Gates BOTH LLM overrides (tier 10) AND the
curated synonym fallback (tier 11) — fix 1.j.

<a id="config.settings.Settings.apply_transitive_layer"></a>

#### apply\_transitive\_layer

The 'ecoinvent flows - EF v3.1 map' transitive sheet (806 rows). Off by default.

<a id="config.settings.Settings.paths"></a>

#### paths

<a id="config.settings.Settings.default_ecoinvent_for"></a>

#### default\_ecoinvent\_for

```python
@classmethod
def default_ecoinvent_for(cls, agribalyse_version: str) -> str
```

<a id="config.settings.Settings.resolved_ecoinvent_version"></a>

#### resolved\_ecoinvent\_version

```python
@property
def resolved_ecoinvent_version() -> str
```

<a id="config.settings.Settings.resolved_project_name"></a>

#### resolved\_project\_name

```python
@property
def resolved_project_name() -> str
```

<a id="config.settings.Settings.resolved_agribalyse_db_name"></a>

#### resolved\_agribalyse\_db\_name

```python
@property
def resolved_agribalyse_db_name() -> str
```

<a id="config.settings.Settings.ecoinvent_db_name"></a>

#### ecoinvent\_db\_name

```python
@property
def ecoinvent_db_name() -> str
```

<a id="config.settings.Settings.with_ecoinvent"></a>

#### with\_ecoinvent

```python
def with_ecoinvent(version: str | None) -> Settings
```

<a id="config.settings.Settings.with_no_llm"></a>

#### with\_no\_llm

```python
def with_no_llm() -> Settings
```
