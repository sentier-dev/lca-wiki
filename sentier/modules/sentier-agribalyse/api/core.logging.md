**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `core.logging` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m core.logging cfg.yml > core.logging.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="core.logging"></a>

# core.logging

Logging facade. Class-based, no module-level configuration helpers.

<a id="core.logging.Logging"></a>

## Logging Objects

```python
class Logging()
```

Central logging configuration. Idempotent.

Usage::

    Logging.configure(level=logging.INFO)
    log = Logging.get(__name__)

<a id="core.logging.Logging.configure"></a>

#### configure

```python
@classmethod
def configure(cls,
              level: int = logging.INFO,
              *,
              line_buffered: bool = True) -> None
```

<a id="core.logging.Logging.get"></a>

#### get

```python
@classmethod
def get(cls, name: str | None = None) -> Any
```

Return a bound logger; safe even before ``configure()``.

<a id="core.logging.StepTimer"></a>

## StepTimer Objects

```python
class StepTimer()
```

Context manager: emits ``step.start`` / ``step.done`` with elapsed seconds.

Use for long-running steps so silence never looks like a hang::

    with StepTimer(log, "csv.parse", path=csv) as bound:
        bound.info("...")

<a id="core.logging.StepTimer.__init__"></a>

#### \_\_init\_\_

```python
def __init__(log: Any, name: str, **bind: Any) -> None
```

<a id="core.logging.StepTimer.__enter__"></a>

#### \_\_enter\_\_

```python
def __enter__() -> Any
```

<a id="core.logging.StepTimer.__exit__"></a>

#### \_\_exit\_\_

```python
def __exit__(exc_type, exc, tb) -> None
```

<a id="core.logging.IdleHeartbeat"></a>

## IdleHeartbeat Objects

```python
class IdleHeartbeat()
```

Emit a heartbeat every N seconds while waiting on an external job.

Use as a thread/loop ``while not done: heartbeat.tick()``. Avoids the
"looks identical to hung" problem during long idle waits.

<a id="core.logging.IdleHeartbeat.__init__"></a>

#### \_\_init\_\_

```python
def __init__(log: Any, interval_s: float = 10.0, **bind: Any) -> None
```

<a id="core.logging.IdleHeartbeat.tick"></a>

#### tick

```python
def tick(**fields: Any) -> None
```
