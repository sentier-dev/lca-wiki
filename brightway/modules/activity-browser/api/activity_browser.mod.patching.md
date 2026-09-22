**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.mod.patching` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.mod.patching cfg.yml > activity_browser.mod.patching.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.mod.patching"></a>

# activity\_browser.mod.patching

<a id="activity_browser.mod.patching.blacklist"></a>

#### blacklist

<a id="activity_browser.mod.patching.patch_superclass"></a>

#### patch\_superclass

```python
def patch_superclass(cls)
```

Class decorator that will patch any methods that differ from the superclass onto said superclass during runtime.

<a id="activity_browser.mod.patching.patch_attribute"></a>

#### patch\_attribute

```python
def patch_attribute(obj, name)
```

Product decorator to patch single attributes of a class. Handy when the superclass is already patched by
another library and will be too different to use patch_superclass on. Pass the class you want to patch as argument

<a id="activity_browser.mod.patching.Patched"></a>

## Patched Objects

```python
class Patched(dict)
```

<a id="activity_browser.mod.patching.Patched.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(obj)
```

We subclass this method because we also want subclasses to work for this.

<a id="activity_browser.mod.patching.patched"></a>

#### patched
