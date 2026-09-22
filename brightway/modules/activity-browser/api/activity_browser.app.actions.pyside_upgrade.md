**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.actions.pyside_upgrade` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.actions.pyside_upgrade cfg.yml > activity_browser.app.actions.pyside_upgrade.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.actions.pyside_upgrade"></a>

# activity\_browser.app.actions.pyside\_upgrade

<a id="activity_browser.app.actions.pyside_upgrade.PysideUpgrade"></a>

## PysideUpgrade Objects

```python
class PysideUpgrade(ABAction)
```

ABAction to install PySide6 through PyPI/pip. Installs PySide6, sets the environment variable for QtPy to use
PySide6 and then restarts the Activity Browser through a subprocess.

<a id="activity_browser.app.actions.pyside_upgrade.PysideUpgrade.icon"></a>

#### icon

<a id="activity_browser.app.actions.pyside_upgrade.PysideUpgrade.text"></a>

#### text

<a id="activity_browser.app.actions.pyside_upgrade.PysideUpgrade.run"></a>

#### run

```python
@classmethod
@exception_dialogs
def run(cls)
```

<a id="activity_browser.app.actions.pyside_upgrade.PysideUpgrade.in_conda"></a>

#### in\_conda

```python
@staticmethod
def in_conda() -> bool
```

Returns true when the current shell is in a Conda environment.

<a id="activity_browser.app.actions.pyside_upgrade.PySideUpgradeThread"></a>

## PySideUpgradeThread Objects

```python
class PySideUpgradeThread(threading.ABThread)
```

<a id="activity_browser.app.actions.pyside_upgrade.PySideUpgradeThread.exit"></a>

#### exit

<a id="activity_browser.app.actions.pyside_upgrade.PySideUpgradeThread.run_safely"></a>

#### run\_safely

```python
def run_safely()
```

<a id="activity_browser.app.actions.pyside_upgrade.PySideUpgradeThread.pip_installation"></a>

#### pip\_installation

```python
def pip_installation()
```

Install PySide6 from PyPI using a subprocess.Popen call

<a id="activity_browser.app.actions.pyside_upgrade.PySideUpgradeThread.restart"></a>

#### restart

```python
def restart()
```

Restarts the Activity Browser through a subprocess. Sleeps 5 seconds to allow the user to register
the restart.
