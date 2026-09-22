**Generated API reference** · package `bw2data` 4.7 · module `bw2data.validate` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2data==4.7'
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
  -I "$SP" -m bw2data.validate cfg.yml > bw2data.validate.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.validate"></a>

# bw2data.validate

<a id="bw2data.validate.valid_tuple"></a>

#### valid\_tuple

```python
def valid_tuple(obj)
```

<a id="bw2data.validate.uncertainty_dict"></a>

#### uncertainty\_dict

<a id="bw2data.validate.exchange"></a>

#### exchange

<a id="bw2data.validate.lci_dataset"></a>

#### lci\_dataset

<a id="bw2data.validate.db_validator"></a>

#### db\_validator

<a id="bw2data.validate.maybe_uncertainty"></a>

#### maybe\_uncertainty

<a id="bw2data.validate.ia_validator"></a>

#### ia\_validator

<a id="bw2data.validate.weighting_validator"></a>

#### weighting\_validator

<a id="bw2data.validate.normalization_validator"></a>

#### normalization\_validator
