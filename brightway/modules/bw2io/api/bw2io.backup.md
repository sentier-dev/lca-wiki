**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.backup` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.backup cfg.yml > bw2io.backup.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.backup"></a>

# bw2io.backup

<a id="bw2io.backup.backup_data_directory"></a>

#### backup\_data\_directory

```python
def backup_data_directory(timestamp: Optional[bool] = True,
                          dir_backup: Optional[Union[str, Path]] = None)
```

Backup the Brightway2 data directory to a `.tar.gz` (compressed tar archive) in a specified directory, or in the user's home directory by default.

The file name is of the form "brightway2-data-backup.{timestamp}.tar.gz", unless `timestamp` is False, in which case the file name is "brightway2-data-backup.tar.gz".

Parameters
----------
timestamp : bool, optional
    If True, append a timestamp to the backup file name.

dir_backup : str, Path, optional
    Directory to backup. If None, use the user's home directory.

Raises
------
FileNotFoundError
    If the backup directory does not exist.
PermissionError
    If the backup directory is not writable.

Examples
--------
>>> import bw2io
>>> bw2io.bw2setup()
>>> bw2io.backup.backup_data_directory()
Creating backup archive - this could take a few minutes...

<a id="bw2io.backup.backup_project_directory"></a>

#### backup\_project\_directory

```python
def backup_project_directory(
        project: str,
        timestamp: Optional[bool] = True,
        dir_backup: Optional[Union[str, Path]] = None) -> Path
```

Backup project data directory to a ``.tar.gz`` (compressed tar archive) in the user's home directory, or a directory specified by ``dir_backup``.

File name is of the form ``brightway2-project-{project}-backup{timestamp}.tar.gz``, unless ``timestamp`` is False, in which case the file name is ``brightway2-project-{project}-backup.tar.gz``.

Parameters
----------
project : str
    Name of the project to backup.

timestamp : bool, optional
    If True, append a timestamp to the backup file name.

dir_backup : str, Path, optional
    Directory to backup. If None, use the default (home)).

Returns
-------
filepath : Path
    pathlib.Path of archive file

Raises
------
ValueError
   If the project does not exist.
FileNotFoundError
    If the backup directory does not exist.
PermissionError
    If the backup directory is not writable.

See Also
--------
bw2io.backup.restore_project_directory: To restore a project directory from a backup.

<a id="bw2io.backup.restore_project_directory"></a>

#### restore\_project\_directory

```python
def restore_project_directory(fp: Union[str, Path],
                              project_name: Optional[str] = None,
                              overwrite_existing: Optional[bool] = False,
                              switch: bool = False)
```

Restore a backed up project data directory from a ``.tar.gz`` (compressed tar archive) specified by ``fp``. Choose a custom name, or use the name of the project in the archive. If the project already exists, you must set ``overwrite_existing`` to True.

Parameters
----------
fp : str, Path
    File path of the project to restore.
project_name : str, optional
    Name of new project to create.
overwrite_existing : bool, optional
switch: bool, optional.
    Switch to new project after restoring it.

Returns
-------
project_name : str, Path
    Name of the project that was restored.

Raises
------
FileNotFoundError
    If the file path does not exist.
ValueError
    If the project name cannot be found in the archive.
    If the project exists and ``overwrite_existing`` is False.

See Also
--------
bw2io.backup.backup_project_directory: To backup a project directory.
