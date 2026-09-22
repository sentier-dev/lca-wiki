**Generated API reference** · package `ecoinvent_interface` 3.1 · module `ecoinvent_interface.settings` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ecoinvent_interface.settings cfg.yml > ecoinvent_interface.settings.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ecoinvent_interface.settings"></a>

# ecoinvent\_interface.settings

<a id="ecoinvent_interface.settings.Settings"></a>

## Settings Objects

```python
class Settings(BaseSettings)
```

<a id="ecoinvent_interface.settings.Settings.model_config"></a>

#### model\_config

<a id="ecoinvent_interface.settings.Settings.username"></a>

#### username

<a id="ecoinvent_interface.settings.Settings.password"></a>

#### password

<a id="ecoinvent_interface.settings.Settings.client_id"></a>

#### client\_id

<a id="ecoinvent_interface.settings.Settings.output_path"></a>

#### output\_path

<a id="ecoinvent_interface.settings.permanent_setting"></a>

#### permanent\_setting

```python
def permanent_setting(key: str, value: str) -> None
```

Write a setting value permanently.

Only accepts keys of `username`, `password`, and `output_path`.

We are using [pydantic settings](https://docs.pydantic.dev/latest/usage/pydantic_settings/).
As the main things being stored are secrets, we use their file-based
secrets system.

Manually-specified or environment variable values will always take
precedence over the file-based values.

One tricky bit is the the filenames need to use the `env_prefix`. See
[this issue](https://github.com/pydantic/pydantic/issues/1279).
