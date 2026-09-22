**Generated API reference** · package `randonneur` 0.7.2 · module `randonneur.constants` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m randonneur.constants cfg.yml > randonneur.constants.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="randonneur.constants"></a>

# randonneur.constants

<a id="randonneur.constants.MappingConstants"></a>

## MappingConstants Objects

```python
class MappingConstants()
```

<a id="randonneur.constants.MappingConstants.SIMAPRO_CSV"></a>

#### SIMAPRO\_CSV

<a id="randonneur.constants.MappingConstants.ECOSPOLD2"></a>

#### ECOSPOLD2

<a id="randonneur.constants.MappingConstants.ECOSPOLD1_BIO"></a>

#### ECOSPOLD1\_BIO

<a id="randonneur.constants.MappingConstants.ECOSPOLD2_BIO"></a>

#### ECOSPOLD2\_BIO

<a id="randonneur.constants.MappingConstants.ECOSPOLD2_BIO_FLOWMAPPER"></a>

#### ECOSPOLD2\_BIO\_FLOWMAPPER

<a id="randonneur.constants.MappingConstants.ILCD_BIO"></a>

#### ILCD\_BIO
