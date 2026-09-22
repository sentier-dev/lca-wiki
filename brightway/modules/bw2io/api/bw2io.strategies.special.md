**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.strategies.special` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2io==0.9.17'
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
  -I "$SP" -m bw2io.strategies.special cfg.yml > bw2io.strategies.special.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.strategies.special"></a>

# bw2io.strategies.special

<a id="bw2io.strategies.special.add_dummy_processes_and_rename_exchanges"></a>

#### add\_dummy\_processes\_and\_rename\_exchanges

```python
def add_dummy_processes_and_rename_exchanges(db)
```

Add new processes to link to so-called "dummy" processes in the US LCI database.

This function adds new processes to link to dummy processes found in the US LCI
database and renames the exchanges accordingly.

Parameters
----------
db : list
    A list of datasets containing exchanges with dummy processes.

Returns
-------
list
    A modified list of datasets with new processes added and exchanges renamed.

Examples
--------
>>> db = [
        {
            "database": "uslci",
            "exchanges": [
                {
                    "name": "dummy_Production",
                    "input": ("uslci", "dummy_Production"),
                    "type": "production",
                    "amount": 1
                }
            ]
        }
    ]
>>> add_dummy_processes_and_rename_exchanges(db)
[
    {
        "database": "uslci",
        "exchanges": [
            {
                "name": "dummy_Production",
                "input": ("uslci", "Production"),
                "type": "production",
                "amount": 1
            }
        ]
    },
    {
        "name": "Production",
        "database": "uslci",
        "code": "Production",
        "categories": ("dummy",),
        "location": "GLO",
        "type": "process",
        "exchanges": [
            {
                "input": ("uslci", "Production"),
                "type": "production",
                "amount": 1
            }
        ]
    }
]
