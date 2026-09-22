**Generated API reference** · package `ecoinvent_interface` 3.1 · module `ecoinvent_interface.core` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'ecoinvent_interface==3.1'
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
  -I "$SP" -m ecoinvent_interface.core cfg.yml > ecoinvent_interface.core.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ecoinvent_interface.core"></a>

# ecoinvent\_interface.core

<a id="ecoinvent_interface.core.logger"></a>

#### logger

<a id="ecoinvent_interface.core.logged_in"></a>

#### logged\_in

```python
def logged_in(f)
```

<a id="ecoinvent_interface.core.fresh_login"></a>

#### fresh\_login

```python
def fresh_login(f)
```

<a id="ecoinvent_interface.core.URLS"></a>

#### URLS

<a id="ecoinvent_interface.core.SYSTEM_MODELS"></a>

#### SYSTEM\_MODELS

<a id="ecoinvent_interface.core.SYSTEM_MODELS_REVERSE"></a>

#### SYSTEM\_MODELS\_REVERSE

<a id="ecoinvent_interface.core.format_dict"></a>

#### format\_dict

```python
def format_dict(obj: dict) -> dict
```

<a id="ecoinvent_interface.core.InterfaceBase"></a>

## InterfaceBase Objects

```python
class InterfaceBase()
```

<a id="ecoinvent_interface.core.InterfaceBase.__init__"></a>

#### \_\_init\_\_

```python
def __init__(settings: Settings,
             urls: Optional[dict] = None,
             custom_headers: Optional[dict] = None)
```

<a id="ecoinvent_interface.core.InterfaceBase.login"></a>

#### login

```python
def login() -> None
```

<a id="ecoinvent_interface.core.InterfaceBase.refresh_tokens"></a>

#### refresh\_tokens

```python
@logged_in
def refresh_tokens() -> None
```

<a id="ecoinvent_interface.core.InterfaceBase.list_versions"></a>

#### list\_versions

```python
def list_versions() -> list
```

<a id="ecoinvent_interface.core.InterfaceBase.list_system_models"></a>

#### list\_system\_models

```python
def list_system_models(version: str, translate: Optional[bool] = True) -> list
```
