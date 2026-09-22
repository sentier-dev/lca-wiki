**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.remote` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2io==0.9.17'
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
  -I "$SP" -m bw2io.remote cfg.yml > bw2io.remote.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.remote"></a>

# bw2io.remote

<a id="bw2io.remote.PROJECTS_BW2"></a>

#### PROJECTS\_BW2

<a id="bw2io.remote.PROJECTS_BW25"></a>

#### PROJECTS\_BW25

<a id="bw2io.remote.BASE_URL"></a>

#### BASE\_URL

<a id="bw2io.remote.cache_dir"></a>

#### cache\_dir

<a id="bw2io.remote.get_projects"></a>

#### get\_projects

```python
def get_projects(update_config: bool = True, base_url: str = BASE_URL) -> dict
```

<a id="bw2io.remote.install_project"></a>

#### install\_project

```python
def install_project(project_key: str,
                    project_name: Optional[str] = None,
                    projects_config: Optional[dict] = None,
                    url: Optional[str] = BASE_URL,
                    overwrite_existing: Optional[bool] = False,
                    __recursive: Union[bool, None] = False)
```

Install an existing Brightway project archive.

By default uses ``https://files.brightway.dev/`` as the file repository, but you can run your own.

Parameters
----------
project_key: str
    A string uniquely identifying a project, e.g. ``ecoinvent-3.8-biosphere``.
project_name: str, optional
    The name of the new project to create. If not provided will be taken from the archive file.
projects_config: dict, optional
    A dictionary that maps ``project_key`` values to filenames at the repository
url: str, optional
    The URL, with trailing slash ``/``, where the file can be found.
overwrite_existing: bool, optional
    Allow overwriting an existing project
__recursive : bool
    Internal flag used to determine if this function has errored out already

Returns
-------
str
    The name of the created project.
