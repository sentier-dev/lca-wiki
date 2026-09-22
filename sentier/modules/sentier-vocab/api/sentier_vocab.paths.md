**Generated API reference** · package `sentier-vocab` 0.0.2 · module `sentier_vocab.paths` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-vocab repo && git -C repo checkout ef440c6
SP=repo/app
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
  -I "$SP" -m sentier_vocab.paths cfg.yml > sentier_vocab.paths.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_vocab.paths"></a>

# sentier\_vocab.paths

Repo-root-relative path constants (app/sentier_vocab/paths.py -> repo root is parents[2]).

<a id="sentier_vocab.paths.REPO_ROOT"></a>

#### REPO\_ROOT

<a id="sentier_vocab.paths.SCHEMAS_DIR"></a>

#### SCHEMAS\_DIR

<a id="sentier_vocab.paths.DATA_DIR"></a>

#### DATA\_DIR

<a id="sentier_vocab.paths.OUTPUT_DIR"></a>

#### OUTPUT\_DIR
