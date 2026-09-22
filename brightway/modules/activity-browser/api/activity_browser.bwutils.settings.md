**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.settings` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.settings cfg.yml > activity_browser.bwutils.settings.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.settings"></a>

# activity\_browser.bwutils.settings

<a id="activity_browser.bwutils.settings.defaults"></a>

#### defaults

<a id="activity_browser.bwutils.settings.Settings"></a>

## Settings Objects

```python
class Settings()
```

<a id="activity_browser.bwutils.settings.Settings.__new__"></a>

#### \_\_new\_\_

```python
def __new__(cls)
```

<a id="activity_browser.bwutils.settings.Settings.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="activity_browser.bwutils.settings.Settings.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(key)
```

<a id="activity_browser.bwutils.settings.Settings.__setitem__"></a>

#### \_\_setitem\_\_

```python
def __setitem__(key, value)
```

<a id="activity_browser.bwutils.settings.Settings.save"></a>

#### save

```python
def save()
```

<a id="activity_browser.bwutils.settings.Settings.load_global_settings"></a>

#### load\_global\_settings

```python
def load_global_settings()
```

<a id="activity_browser.bwutils.settings.Settings.load_project_settings"></a>

#### load\_project\_settings

```python
def load_project_settings(*args, **kwargs)
```

<a id="activity_browser.bwutils.settings.Settings.load_virtual_settings"></a>

#### load\_virtual\_settings

```python
def load_virtual_settings()
```

<a id="activity_browser.bwutils.settings.Settings.restore_defaults"></a>

#### restore\_defaults

```python
def restore_defaults()
```
