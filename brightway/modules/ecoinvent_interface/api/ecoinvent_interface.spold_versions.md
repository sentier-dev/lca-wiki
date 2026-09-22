**Generated API reference** · package `ecoinvent_interface` 3.1 · module `ecoinvent_interface.spold_versions` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ecoinvent_interface.spold_versions cfg.yml > ecoinvent_interface.spold_versions.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ecoinvent_interface.spold_versions"></a>

# ecoinvent\_interface.spold\_versions

<a id="ecoinvent_interface.spold_versions.major_minor_from_string"></a>

#### major\_minor\_from\_string

```python
def major_minor_from_string(version: str) -> Tuple[int, int]
```

<a id="ecoinvent_interface.spold_versions.check_inputs"></a>

#### check\_inputs

```python
def check_inputs(filepath: Path, major_version: int,
                 minor_version: int) -> None
```

<a id="ecoinvent_interface.spold_versions.fix_version_upr"></a>

#### fix\_version\_upr

```python
def fix_version_upr(filepath: Path, major_version: int,
                    minor_version: int) -> None
```

<a id="ecoinvent_interface.spold_versions.fix_version_meta"></a>

#### fix\_version\_meta

```python
def fix_version_meta(filepath: Path, major_version: int,
                     minor_version: int) -> None
```
