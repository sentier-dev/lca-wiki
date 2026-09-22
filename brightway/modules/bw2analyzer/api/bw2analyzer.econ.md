**Generated API reference** · package `bw2analyzer` 0.11.8 · module `bw2analyzer.econ` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2analyzer==0.11.8'
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
  -I "$SP" -m bw2analyzer.econ cfg.yml > bw2analyzer.econ.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2analyzer.econ"></a>

# bw2analyzer.econ

<a id="bw2analyzer.econ.gini_coefficient"></a>

#### gini\_coefficient

```python
def gini_coefficient(x)
```

Return computed Gini coefficient.

See https://en.wikipedia.org/wiki/Gini_coefficient

Adapted from econpy library.
copyright: 2005-2009 Alan G. Isaac
license: MIT license
contact: aisaac AT american.edu

**Arguments**:

- `*x*` _list or array_ - Data
  

**Returns**:

  Gini coefficient (float)

<a id="bw2analyzer.econ.herfindahl_index"></a>

#### herfindahl\_index

```python
def herfindahl_index(x, normalize=True)
```

Return computed Herfindahl index.

See https://en.wikipedia.org/wiki/Herfindahl_index

Normalized scores are bounded [0, 1]; non-normalized scores are [1/len(x), 1]. Normalization only counts non-zero values.

**Arguments**:

- `*x*` _list or array_ - Data
- `*normalize*` _bool, default=True_ - Flag to normalize scores.
  

**Returns**:

  Herfindahl index (float)

<a id="bw2analyzer.econ.concentration_ratio"></a>

#### concentration\_ratio

```python
def concentration_ratio(x, number=4)
```

Return computed concentration ratio.

See https://en.wikipedia.org/wiki/Concentration_ratio

The concentration ratio measures the share of the market controlled by the top *number* firms. Returned ratio values vary from 0 to 1.

**Arguments**:

- `*x*` _list or array_ - Data
- `*number*` _int, default=4_ - Number of values to consider. 4 and 8 are commonly used.
  

**Returns**:

  Concentration ratio (float)

<a id="bw2analyzer.econ.theil_index"></a>

#### theil\_index

```python
def theil_index(x)
```

Return Theil entropy index.

See https://en.wikipedia.org/wiki/Theil_Index

The Theil index is a measure of economic inequality based on information theory. It is the difference between a dataset's maximum possible entropy and observed entropy.

**Arguments**:

- `*x*` _list or array_ - Data
  

**Returns**:

  Theil index (float)
