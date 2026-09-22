**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `cli.llm_suggest` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-agribalyse repo && git -C repo checkout 3d0df56
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
  -I "$SP" -m cli.llm_suggest cfg.yml > cli.llm_suggest.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="cli.llm_suggest"></a>

# cli.llm\_suggest

``dds-llm-suggest-mappings`` — auto-resolve residual unlinked AGB flows.

Runs after a full ``dds-link-all`` so ``unlinked/biosphere_unlinked.xlsx``
is fresh. The CLI loads the registry to know which flows already have a
deterministic mapping, asks the LLM (CLI by default, API opt-in) to pick a
target for each truly-missing residual, and appends accepted picks straight
into ``source/agribalyse-3.2-biosphere-residuals-llm-reviewed.xlsx`` with
``decision="accept"``. No sidecar file, no human gate.

To pick up the new mappings: re-run ``dds-build-registry`` then
``dds-link-all`` — they enter at tier 10 (``LLM_OVERRIDES``).

<a id="cli.llm_suggest.LlmSuggestCli"></a>

## LlmSuggestCli Objects

```python
class LlmSuggestCli(BaseCli)
```

<a id="cli.llm_suggest.LlmSuggestCli.PROG"></a>

#### PROG

<a id="cli.llm_suggest.LlmSuggestCli.DESCRIPTION"></a>

#### DESCRIPTION

<a id="cli.llm_suggest.LlmSuggestCli.parser"></a>

#### parser

```python
@classmethod
def parser(cls) -> argparse.ArgumentParser
```

<a id="cli.llm_suggest.LlmSuggestCli.execute"></a>

#### execute

```python
def execute(args: argparse.Namespace) -> None
```

<a id="cli.llm_suggest.main"></a>

#### main

```python
def main() -> int
```
