**Generated API reference** · package `ecoinvent_interface` 3.1 · module `ecoinvent_interface.release` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ecoinvent_interface.release cfg.yml > ecoinvent_interface.release.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ecoinvent_interface.release"></a>

# ecoinvent\_interface.release

<a id="ecoinvent_interface.release.logger"></a>

#### logger

<a id="ecoinvent_interface.release.ReleaseType"></a>

## ReleaseType Objects

```python
class ReleaseType(Enum)
```

<a id="ecoinvent_interface.release.ReleaseType.ecospold"></a>

#### ecospold

<a id="ecoinvent_interface.release.ReleaseType.matrix"></a>

#### matrix

<a id="ecoinvent_interface.release.ReleaseType.lci"></a>

#### lci

<a id="ecoinvent_interface.release.ReleaseType.lcia"></a>

#### lcia

<a id="ecoinvent_interface.release.ReleaseType.cumulative_lci"></a>

#### cumulative\_lci

<a id="ecoinvent_interface.release.ReleaseType.cumulative_lcia"></a>

#### cumulative\_lcia

<a id="ecoinvent_interface.release.ReleaseType.filename"></a>

#### filename

```python
def filename(version: str, system_model_abbr: str) -> str
```

<a id="ecoinvent_interface.release.EcoinventRelease"></a>

## EcoinventRelease Objects

```python
class EcoinventRelease(InterfaceBase)
```

<a id="ecoinvent_interface.release.EcoinventRelease.list_report_files"></a>

#### list\_report\_files

```python
def list_report_files() -> dict
```

<a id="ecoinvent_interface.release.EcoinventRelease.get_report"></a>

#### get\_report

```python
def get_report(filename: str,
               extract: Optional[bool] = True,
               force_redownload: Optional[bool] = False) -> Path
```

<a id="ecoinvent_interface.release.EcoinventRelease.list_extra_files"></a>

#### list\_extra\_files

```python
def list_extra_files(version: str) -> dict
```

<a id="ecoinvent_interface.release.EcoinventRelease.get_extra"></a>

#### get\_extra

```python
def get_extra(version: str,
              filename: str,
              extract: Optional[bool] = True,
              force_redownload: Optional[bool] = False) -> Path
```

<a id="ecoinvent_interface.release.EcoinventRelease.get_release_files"></a>

#### get\_release\_files

```python
def get_release_files(version: str) -> list
```

<a id="ecoinvent_interface.release.EcoinventRelease.get_release"></a>

#### get\_release

```python
def get_release(version: str,
                system_model: str,
                release_type: ReleaseType,
                extract: Optional[bool] = True,
                force_redownload: Optional[bool] = False,
                fix_version: Optional[bool] = True) -> Path
```

<a id="ecoinvent_interface.release.get_excel_lcia_file_for_version"></a>

#### get\_excel\_lcia\_file\_for\_version

```python
def get_excel_lcia_file_for_version(release: EcoinventRelease,
                                    version: str) -> Path
```

The Excel LCIA file has varying names depending on the version. This
function download the LCIA file, if necessary, and returns the filepath
of the Excel file for further use.

Parameters
----------
release
    An instance of `EcoinventRelease` with valid settings
version
    The ecoinvent version for which the LCIA file should be found

Returns
-------
A `pathlib.Path` filepath
