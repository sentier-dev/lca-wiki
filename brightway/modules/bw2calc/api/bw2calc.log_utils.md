**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.log_utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2calc==2.5.0'
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
  -I "$SP" -m bw2calc.log_utils cfg.yml > bw2calc.log_utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.log_utils"></a>

# bw2calc.log\_utils

<a id="bw2calc.log_utils.BUILTIN_ATTRS"></a>

#### BUILTIN\_ATTRS

<a id="bw2calc.log_utils.JSONFormatter"></a>

## JSONFormatter Objects

```python
class JSONFormatter(logging.Formatter)
```

<a id="bw2calc.log_utils.JSONFormatter.json_lib"></a>

#### json\_lib

<a id="bw2calc.log_utils.JSONFormatter.format"></a>

#### format

```python
def format(record)
```

<a id="bw2calc.log_utils.JSONFormatter.to_json"></a>

#### to\_json

```python
def to_json(record)
```

<a id="bw2calc.log_utils.JSONFormatter.extra_from_record"></a>

#### extra\_from\_record

```python
def extra_from_record(record)
```

<a id="bw2calc.log_utils.JSONFormatter.json_record"></a>

#### json\_record

```python
def json_record(message, extra, record)
```

<a id="bw2calc.log_utils.create_logger"></a>

#### create\_logger

```python
def create_logger(dirpath=None, name=None, **kwargs)
```

Create a ``logger`` instance named ``bw2calc`` that can be used to log calculations.

``dirpath`` is the directory where the log file is saved. If ``dirpath`` is ``None``, no logger
is created.

``name`` is the name of the calculation run, used to construct the log filepath.

You can add other types of loggers, just add another handler to the ``bw2calc`` named logger
before starting your calculations.

Returns the filepath of the created log file.

TODO: Decide on whether we copy safe_filepath to this package or create a common core package.
