**Generated API reference** · package `bw2data` 4.7 · module `bw2data.logs` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.logs cfg.yml > bw2data.logs.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.logs"></a>

# bw2data.logs

<a id="bw2data.logs.FakeLog"></a>

## FakeLog Objects

```python
class FakeLog()
```

Like a log object, but does nothing

<a id="bw2data.logs.FakeLog.fake_function"></a>

#### fake\_function

```python
def fake_function(cls, *args, **kwargs)
```

<a id="bw2data.logs.FakeLog.__getattr__"></a>

#### \_\_getattr\_\_

```python
def __getattr__(attr)
```

<a id="bw2data.logs.get_logger"></a>

#### get\_logger

```python
def get_logger(name, level=logging.INFO)
```

<a id="bw2data.logs.get_stdout_feedback_logger"></a>

#### get\_stdout\_feedback\_logger

```python
def get_stdout_feedback_logger(name: str, level: int = logging.INFO)
```

<a id="bw2data.logs.get_structlog_stdout_feedback_logger"></a>

#### get\_structlog\_stdout\_feedback\_logger

```python
def get_structlog_stdout_feedback_logger(level: int = logging.INFO)
```

<a id="bw2data.logs.get_io_logger"></a>

#### get\_io\_logger

```python
def get_io_logger(name)
```

Build a logger that records only relevent data for display later as HTML.

<a id="bw2data.logs.get_verbose_logger"></a>

#### get\_verbose\_logger

```python
def get_verbose_logger(name, level=logging.WARNING)
```

<a id="bw2data.logs.close_log"></a>

#### close\_log

```python
def close_log(log)
```

Detach log handlers; flush to disk
