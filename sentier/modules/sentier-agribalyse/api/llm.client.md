**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `llm.client` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m llm.client cfg.yml > llm.client.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="llm.client"></a>

# llm.client

Two interchangeable LLM clients for :class:`LlmMappingSuggester`.

* :class:`ClaudeCliClient` — default. Shells out to the local ``claude`` CLI
  in ``--print`` mode, so no API key is needed; auth comes from whatever the
  user has set up for their CLI.
* :class:`AnthropicApiClient` — opt-in via ``--use-api``. Defaults to Sonnet
  for cost; the suggester only needs short structured responses.

Both expose the same one-method surface: ``ask(system, user) -> str``. The
suggester then parses JSON out of the returned text. Tests inject a stub
that returns canned strings — no real CLI or network calls in CI.

<a id="llm.client.LlmClient"></a>

## LlmClient Objects

```python
class LlmClient(Protocol)
```

Anything with this shape is a valid client for the suggester.

<a id="llm.client.LlmClient.ask"></a>

#### ask

```python
def ask(system: str, user: str) -> str
```

<a id="llm.client.ClaudeCliClient"></a>

## ClaudeCliClient Objects

```python
@dataclass(frozen=True)
class ClaudeCliClient()
```

Run a prompt via the local ``claude`` CLI in ``--print`` mode.

The CLI is invoked with the system prompt prepended to the user prompt
(separated by a blank line) on stdin. Output goes to stdout and is
returned verbatim.

<a id="llm.client.ClaudeCliClient.binary"></a>

#### binary

<a id="llm.client.ClaudeCliClient.extra_args"></a>

#### extra\_args

<a id="llm.client.ClaudeCliClient.timeout_s"></a>

#### timeout\_s

<a id="llm.client.ClaudeCliClient.ask"></a>

#### ask

```python
def ask(system: str, user: str) -> str
```

<a id="llm.client.AnthropicApiClient"></a>

## AnthropicApiClient Objects

```python
@dataclass(frozen=True)
class AnthropicApiClient()
```

Wraps ``anthropic.Anthropic.messages.create``. Sonnet by default for cost.

<a id="llm.client.AnthropicApiClient.client"></a>

#### client

anthropic.Anthropic — kept as Any so we don't import the SDK at module load

<a id="llm.client.AnthropicApiClient.model"></a>

#### model

<a id="llm.client.AnthropicApiClient.max_tokens"></a>

#### max\_tokens

<a id="llm.client.AnthropicApiClient.ask"></a>

#### ask

```python
def ask(system: str, user: str) -> str
```
