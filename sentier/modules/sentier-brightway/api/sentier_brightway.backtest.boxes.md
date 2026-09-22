**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.backtest.boxes` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-brightway repo && git -C repo checkout a9dba75
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
  -I "$SP" -m sentier_brightway.backtest.boxes cfg.yml > sentier_brightway.backtest.boxes.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.backtest.boxes"></a>

# sentier\_brightway.backtest.boxes

Box-plot statistics per sector and category, and the worst-N rows per category, over
the compared pct frame. Pure functions of ``Compared``; ``emit.py`` serialises them.

``Box``/``box_stats`` are defined in ``compare.py`` (the summary uses them too) and
re-exported here.

<a id="sentier_brightway.backtest.boxes.ALL_SECTORS"></a>

#### ALL\_SECTORS

<a id="sentier_brightway.backtest.boxes.WORST_N"></a>

#### WORST\_N

<a id="sentier_brightway.backtest.boxes.WORST_KEYS"></a>

#### WORST\_KEYS

row schema

<a id="sentier_brightway.backtest.boxes.boxes_payload"></a>

#### boxes\_payload

```python
def boxes_payload(compared: Compared, categories: tuple[Category,
                                                        ...]) -> dict
```

``{"sectors", "categories", "boxes": {sector: {short: box}}}`` with ``"all"`` first;
sectors are the distinct sector values of the mapped rows, sorted case-insensitively
(``_sorted_sectors``). The ``"all"`` boxes
keep up to ``OUTLIER_CAP`` outliers, a named sector's up to ``SECTOR_OUTLIER_CAP``.

<a id="sentier_brightway.backtest.boxes.worst_rows"></a>

#### worst\_rows

```python
def worst_rows(compared: Compared,
               cat: Category,
               n: int = WORST_N) -> list[dict]
```

The ``n`` mapped rows with the largest |pct| for ``cat`` (finite pct only), sorted by
|pct| descending then code; ``ours``/``ref`` are in the table's unit.
