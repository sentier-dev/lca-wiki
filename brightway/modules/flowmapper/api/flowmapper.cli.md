**Generated API reference** · package `flowmapper` 0.4 · module `flowmapper.cli` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'flowmapper==0.4'
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
  -I "$SP" -m flowmapper.cli cfg.yml > flowmapper.cli.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="flowmapper.cli"></a>

# flowmapper.cli

<a id="flowmapper.cli.logger"></a>

#### logger

<a id="flowmapper.cli.app"></a>

#### app

<a id="flowmapper.cli.version_callback"></a>

#### version\_callback

```python
def version_callback(value: bool)
```

<a id="flowmapper.cli.main"></a>

#### main

```python
@app.callback()
def main(version: Annotated[
    Optional[bool],
    typer.Option("--version", callback=version_callback, is_eager=True),
] = None)
```

Generate mappings between elementary flows lists

<a id="flowmapper.cli.map"></a>

#### map

```python
@app.command()
def map(
    source: Annotated[Path,
                      typer.Argument(help="Path to source flowlist")],
    target: Annotated[Path,
                      typer.Argument(help="Path to target flowlist")],
    output_dir: Annotated[
        Path,
        typer.Option(help="Directory to save mapping and diagnostics files"
                     )] = Path("."),
    format: Annotated[
        OutputFormat,
        typer.Option(help="Mapping file output format", case_sensitive=False),
    ] = "all",
    default_transformations: Annotated[
        bool,
        typer.Option(
            help="Include default context and unit transformations?")] = True,
    transformations: Annotated[
        Optional[list[Path]],
        typer.Option(
            "--transformations",
            "-t",
            help=
            "Randonneur data migration file with changes to be applied to source flows before matching. Can be included multiple times.",
        ),
    ] = None,
    unmatched_source: Annotated[
        bool,
        typer.Option(
            help="Write original source unmatched flows into separate file?"),
    ] = True,
    unmatched_target: Annotated[
        bool,
        typer.Option(
            help="Write original target unmatched flows into separate file?"),
    ] = True,
    matched_source: Annotated[
        bool,
        typer.Option(
            help="Write original source matched flows into separate file?"),
    ] = False,
    matched_target: Annotated[
        bool,
        typer.Option(
            help="Write original target matched flows into separate file?"),
    ] = False)
```

<a id="flowmapper.cli.extract_simapro_csv"></a>

#### extract\_simapro\_csv

```python
@app.command()
def extract_simapro_csv(
    simapro_csv_filepath: Annotated[
        Path, typer.Argument(help="Path to source SimaPro CSV file")],
    output_dir: Annotated[
        Path,
        typer.Argument(help="Directory to save mapping and diagnostics files")]
) -> None
```

<a id="flowmapper.cli.extract_ecospold2"></a>

#### extract\_ecospold2

```python
@app.command()
def extract_ecospold2(
    elementary_exchanges_filepath: Annotated[
        Path,
        typer.Argument(help="Path to source `ElementaryExchanges.xml` file")],
    output_dir: Annotated[
        Path,
        typer.Argument(help="Directory to save mapping and diagnostics files")]
) -> None
```
