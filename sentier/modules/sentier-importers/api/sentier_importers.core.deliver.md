**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.core.deliver` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-importers repo && git -C repo checkout dac2e67
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
  -I "$SP" -m sentier_importers.core.deliver cfg.yml > sentier_importers.core.deliver.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.core.deliver"></a>

# sentier\_importers.core.deliver

Deliver stage: clone the target repo, branch, copy emitted files into the target's
path, commit, push, and open a PR via ``gh``. A no-op in dry-run mode.

<a id="sentier_importers.core.deliver.deliver_local"></a>

#### deliver\_local

```python
def deliver_local(files: list[Path], target: Target, *, category: str,
                  root: Path) -> list[Path]
```

Copy emitted ``files`` into a local checkout of ``target`` — no git, no PR.

Places each file at ``root/<output_subdir>/<category>/<name>``, preserving the
category folder (unlike :func:`deliver`, which currently flattens). This is the
regenerate-locally delivery path for sources whose data cannot be pushed to a
public repo yet; ``root`` must be an existing directory.

<a id="sentier_importers.core.deliver.deliver"></a>

#### deliver

```python
def deliver(files: list[Path], target: Target, *, branch: str, title: str,
            body: str, ctx: RunContext) -> str | None
```

Open a PR adding ``files`` to ``target``. Returns the PR URL, or None in dry-run.

In dry-run mode this performs no git/gh operations. Otherwise it clones the
target into a working dir under the cache, creates ``branch``, copies the files
into ``target.output_subdir``, commits, pushes, and runs ``gh pr create``.
