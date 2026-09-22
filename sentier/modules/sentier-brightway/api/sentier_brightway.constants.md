**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.constants` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-brightway repo && git -C repo checkout a9dba75
SP=repo/src
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
  -I "$SP" -m sentier_brightway.constants cfg.yml > sentier_brightway.constants.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.constants"></a>

# sentier\_brightway.constants

Names shared by every module. Change here, nowhere else.

<a id="sentier_brightway.constants.INVENTORY_DB"></a>

#### INVENTORY\_DB

<a id="sentier_brightway.constants.BIOSPHERE_DB"></a>

#### BIOSPHERE\_DB

<a id="sentier_brightway.constants.RESIDUAL_DB"></a>

#### RESIDUAL\_DB

<a id="sentier_brightway.constants.METHOD_PREFIX"></a>

#### METHOD\_PREFIX

<a id="sentier_brightway.constants.EF_SOURCE_IRI"></a>

#### EF\_SOURCE\_IRI

<a id="sentier_brightway.constants.BAFU_SOURCE_IRI"></a>

#### BAFU\_SOURCE\_IRI

<a id="sentier_brightway.constants.FLOW_IRI_PREFIX"></a>

#### FLOW\_IRI\_PREFIX

<a id="sentier_brightway.constants.BRIDGE_FOLDER"></a>

#### BRIDGE\_FOLDER

<a id="sentier_brightway.constants.NOMENCLATURE_KIND_ORDER"></a>

#### NOMENCLATURE\_KIND\_ORDER

package order whose targets carry no EF factor

<a id="sentier_brightway.constants.METHODS_FOLDER"></a>

#### METHODS\_FOLDER

<a id="sentier_brightway.constants.CITATION"></a>

#### CITATION

<a id="sentier_brightway.constants.REPO_INVENTORY"></a>

#### REPO\_INVENTORY

<a id="sentier_brightway.constants.REPO_VOCAB"></a>

#### REPO\_VOCAB

<a id="sentier_brightway.constants.REPO_METHODS"></a>

#### REPO\_METHODS

<a id="sentier_brightway.constants.REPO_MAPPINGS"></a>

#### REPO\_MAPPINGS
