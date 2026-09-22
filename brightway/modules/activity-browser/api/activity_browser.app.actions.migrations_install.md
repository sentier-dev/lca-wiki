**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.actions.migrations_install` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'activity-browser==3.0.0b202608291724'
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
  -I "$SP" -m activity_browser.app.actions.migrations_install cfg.yml > activity_browser.app.actions.migrations_install.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.actions.migrations_install"></a>

# activity\_browser.app.actions.migrations\_install

<a id="activity_browser.app.actions.migrations_install.MigrationsInstall"></a>

## MigrationsInstall Objects

```python
class MigrationsInstall(ABAction)
```

ABAction to install the default migrations from bw2io

<a id="activity_browser.app.actions.migrations_install.MigrationsInstall.icon"></a>

#### icon

<a id="activity_browser.app.actions.migrations_install.MigrationsInstall.text"></a>

#### text

<a id="activity_browser.app.actions.migrations_install.MigrationsInstall.run"></a>

#### run

```python
@staticmethod
@exception_dialogs
def run()
```

<a id="activity_browser.app.actions.migrations_install.MigrationsInstallThread"></a>

## MigrationsInstallThread Objects

```python
class MigrationsInstallThread(threading.ABThread)
```

<a id="activity_browser.app.actions.migrations_install.MigrationsInstallThread.run_safely"></a>

#### run\_safely

```python
def run_safely()
```
