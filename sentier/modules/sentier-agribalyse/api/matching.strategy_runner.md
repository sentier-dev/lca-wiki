**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `matching.strategy_runner` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matching.strategy_runner cfg.yml > matching.strategy_runner.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matching.strategy_runner"></a>

# matching.strategy\_runner

Run a bw2io strategy and capture exceptions explicitly.

Replaces ``contextlib.suppress(Exception)`` in the legacy linker
(fix 1.g): every failed strategy is recorded with type+message, the run
report surfaces totals.

<a id="matching.strategy_runner.StrategyRunner"></a>

## StrategyRunner Objects

```python
@dataclass(frozen=True)
class StrategyRunner()
```

Apply a strategy callable; on exception, log + record without crashing the pipeline.

<a id="matching.strategy_runner.StrategyRunner.suppressed_log"></a>

#### suppressed\_log

<a id="matching.strategy_runner.StrategyRunner.apply"></a>

#### apply

```python
def apply(strategy: Callable[..., Any],
          *args: Any,
          label: str = "",
          **kwargs: Any) -> Any
```

Call ``strategy(*args, **kwargs)``. Returns its result, or ``None`` on failure.
