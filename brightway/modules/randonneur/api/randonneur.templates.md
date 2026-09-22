**Generated API reference** · package `randonneur` 0.7.2 · module `randonneur.templates` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'randonneur==0.7.2'
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
  -I "$SP" -m randonneur.templates cfg.yml > randonneur.templates.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="randonneur.templates"></a>

# randonneur.templates

<a id="randonneur.templates.ROLES"></a>

#### ROLES

<a id="randonneur.templates.MAPPINGS"></a>

#### MAPPINGS

<a id="randonneur.templates.LICENSES"></a>

#### LICENSES

<a id="randonneur.templates.create_excel_template"></a>

#### create\_excel\_template

```python
def create_excel_template(data: List[dict],
                          filepath: Path,
                          replace_existing: bool = False) -> Path
```

Create an Excel template with optionally some data for a new matching data file.

`data` should be a list of dictionaries like `{'source': {}, 'target': {}}`. The keys and values
in these sub-dictionaries should be strings, or castable to strings in a way that can be
reversed. This function doesn't do any type conversion or other data handling.

`filepath` should be the complete filepath of the file to be created, including directory and
suffix.

`replace_existing`: Flag on whether to overwrite `filepath` if it exists.

Returns the filepath of the created file.

<a id="randonneur.templates.read_excel_template"></a>

#### read\_excel\_template

```python
def read_excel_template(filepath: Path,
                        worksheet: str = "Matching",
                        license_mapping: Optional[dict] = None,
                        field_mapping: Optional[dict] = None) -> Datapackage
```
