**Generated API reference** · package `flowmapper` 0.4 · module `flowmapper.match` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m flowmapper.match cfg.yml > flowmapper.match.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="flowmapper.match"></a>

# flowmapper.match

<a id="flowmapper.match.logger"></a>

#### logger

<a id="flowmapper.match.format_match_result"></a>

#### format\_match\_result

```python
def format_match_result(s: Flow, t: Flow, conversion_factor: float,
                        match_info: dict)
```

<a id="flowmapper.match.match_identical_identifier"></a>

#### match\_identical\_identifier

```python
def match_identical_identifier(s: Flow,
                               t: Flow,
                               comment: str = "Identical identifier")
```

<a id="flowmapper.match.match_identical_names_in_synonyms"></a>

#### match\_identical\_names\_in\_synonyms

```python
def match_identical_names_in_synonyms(s: Flow,
                                      t: Flow,
                                      comment: str = "Identical synonyms")
```

<a id="flowmapper.match.match_identical_cas_numbers"></a>

#### match\_identical\_cas\_numbers

```python
def match_identical_cas_numbers(s: Flow,
                                t: Flow,
                                comment: str = "Identical CAS numbers")
```

<a id="flowmapper.match.match_identical_names"></a>

#### match\_identical\_names

```python
def match_identical_names(s: Flow, t: Flow, comment="Identical names")
```

<a id="flowmapper.match.match_identical_names_without_commas"></a>

#### match\_identical\_names\_without\_commas

```python
def match_identical_names_without_commas(
        s: Flow, t: Flow, comment="Identical names when commas removed")
```

<a id="flowmapper.match.match_resources_with_wrong_subcontext"></a>

#### match\_resources\_with\_wrong\_subcontext

```python
def match_resources_with_wrong_subcontext(s: Flow, t: Flow)
```

<a id="flowmapper.match.match_identical_names_except_missing_suffix"></a>

#### match\_identical\_names\_except\_missing\_suffix

```python
def match_identical_names_except_missing_suffix(
        s: Flow,
        t: Flow,
        suffix: str,
        comment: str = "Identical names except missing suffix") -> dict
```

<a id="flowmapper.match.match_names_with_roman_numerals_in_parentheses"></a>

#### match\_names\_with\_roman\_numerals\_in\_parentheses

```python
def match_names_with_roman_numerals_in_parentheses(
        s: Flow,
        t: Flow,
        comment="With/without roman numerals in parentheses")
```

<a id="flowmapper.match.match_custom_names_with_location_codes"></a>

#### match\_custom\_names\_with\_location\_codes

```python
def match_custom_names_with_location_codes(
        s: Flow, t: Flow, comment="Custom names with location code")
```

Matching which pulls out location codes but also allows for custom name transformations.

<a id="flowmapper.match.match_names_with_location_codes"></a>

#### match\_names\_with\_location\_codes

```python
def match_names_with_location_codes(s: Flow,
                                    t: Flow,
                                    comment="Name matching with location code"
                                    )
```

<a id="flowmapper.match.match_resource_names_with_location_codes_and_parent_context"></a>

#### match\_resource\_names\_with\_location\_codes\_and\_parent\_context

```python
def match_resource_names_with_location_codes_and_parent_context(
        s: Flow,
        t: Flow,
        comment="Name matching with location code and parent context")
```

Sometimes we have flows in a parent context,

<a id="flowmapper.match.match_non_ionic_state"></a>

#### match\_non\_ionic\_state

```python
def match_non_ionic_state(s: Flow,
                          t: Flow,
                          comment="Non-ionic state if no better match")
```

<a id="flowmapper.match.match_biogenic_to_non_fossil"></a>

#### match\_biogenic\_to\_non\_fossil

```python
def match_biogenic_to_non_fossil(
        s: Flow, t: Flow, comment="Biogenic to non-fossil if no better match")
```

<a id="flowmapper.match.match_resources_with_suffix_in_ground"></a>

#### match\_resources\_with\_suffix\_in\_ground

```python
def match_resources_with_suffix_in_ground(s: Flow, t: Flow)
```

<a id="flowmapper.match.match_flows_with_suffix_unspecified_origin"></a>

#### match\_flows\_with\_suffix\_unspecified\_origin

```python
def match_flows_with_suffix_unspecified_origin(s: Flow, t: Flow)
```

<a id="flowmapper.match.match_resources_with_suffix_in_water"></a>

#### match\_resources\_with\_suffix\_in\_water

```python
def match_resources_with_suffix_in_water(s: Flow, t: Flow)
```

<a id="flowmapper.match.match_resources_with_suffix_in_air"></a>

#### match\_resources\_with\_suffix\_in\_air

```python
def match_resources_with_suffix_in_air(s: Flow, t: Flow)
```

<a id="flowmapper.match.match_emissions_with_suffix_ion"></a>

#### match\_emissions\_with\_suffix\_ion

```python
def match_emissions_with_suffix_ion(s: Flow, t: Flow)
```

<a id="flowmapper.match.match_rules"></a>

#### match\_rules

```python
def match_rules()
```
