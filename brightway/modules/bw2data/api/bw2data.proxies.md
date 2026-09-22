**Generated API reference** · package `bw2data` 4.7 · module `bw2data.proxies` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.proxies cfg.yml > bw2data.proxies.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.proxies"></a>

# bw2data.proxies

<a id="bw2data.proxies.ProxyBase"></a>

## ProxyBase Objects

```python
class ProxyBase(MutableMapping)
```

<a id="bw2data.proxies.ProxyBase.__init__"></a>

#### \_\_init\_\_

```python
def __init__(data, *args, **kwargs)
```

<a id="bw2data.proxies.ProxyBase.as_dict"></a>

#### as\_dict

```python
def as_dict()
```

<a id="bw2data.proxies.ProxyBase.__str__"></a>

#### \_\_str\_\_

```python
def __str__() -> str
```

<a id="bw2data.proxies.ProxyBase.__repr__"></a>

#### \_\_repr\_\_

<a id="bw2data.proxies.ProxyBase.__contains__"></a>

#### \_\_contains\_\_

```python
def __contains__(key)
```

<a id="bw2data.proxies.ProxyBase.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

<a id="bw2data.proxies.ProxyBase.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```

<a id="bw2data.proxies.ProxyBase.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(key)
```

<a id="bw2data.proxies.ProxyBase.__setitem__"></a>

#### \_\_setitem\_\_

```python
def __setitem__(key, value)
```

<a id="bw2data.proxies.ProxyBase.__delitem__"></a>

#### \_\_delitem\_\_

```python
def __delitem__(key)
```

<a id="bw2data.proxies.ProxyBase.__eq__"></a>

#### \_\_eq\_\_

```python
def __eq__(other)
```

<a id="bw2data.proxies.ProxyBase.__hash__"></a>

#### \_\_hash\_\_

```python
def __hash__()
```

<a id="bw2data.proxies.ActivityProxyBase"></a>

## ActivityProxyBase Objects

```python
class ActivityProxyBase(ProxyBase)
```

<a id="bw2data.proxies.ActivityProxyBase.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```

<a id="bw2data.proxies.ActivityProxyBase.key"></a>

#### key

```python
@property
def key()
```

<a id="bw2data.proxies.ActivityProxyBase.__eq__"></a>

#### \_\_eq\_\_

```python
def __eq__(other)
```

<a id="bw2data.proxies.ActivityProxyBase.__lt__"></a>

#### \_\_lt\_\_

```python
def __lt__(other)
```

<a id="bw2data.proxies.ActivityProxyBase.__hash__"></a>

#### \_\_hash\_\_

```python
def __hash__()
```

<a id="bw2data.proxies.ActivityProxyBase.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(key)
```

<a id="bw2data.proxies.ActivityProxyBase.__delitem__"></a>

#### \_\_delitem\_\_

```python
def __delitem__(key)
```

<a id="bw2data.proxies.ActivityProxyBase.valid"></a>

#### valid

```python
def valid(why=False)
```

<a id="bw2data.proxies.ActivityProxyBase.lca"></a>

#### lca

```python
def lca(method=None, amount=1.0)
```

Shortcut to construct an LCA object for this activity.

<a id="bw2data.proxies.ExchangeProxyBase"></a>

## ExchangeProxyBase Objects

```python
class ExchangeProxyBase(ProxyBase)
```

<a id="bw2data.proxies.ExchangeProxyBase.__str__"></a>

#### \_\_str\_\_

```python
def __str__() -> str
```

<a id="bw2data.proxies.ExchangeProxyBase.__lt__"></a>

#### \_\_lt\_\_

```python
def __lt__(other)
```

<a id="bw2data.proxies.ExchangeProxyBase.__eq__"></a>

#### \_\_eq\_\_

```python
def __eq__(other)
```

<a id="bw2data.proxies.ExchangeProxyBase.__hash__"></a>

#### \_\_hash\_\_

```python
def __hash__()
```

<a id="bw2data.proxies.ExchangeProxyBase.input"></a>

#### input

<a id="bw2data.proxies.ExchangeProxyBase.output"></a>

#### output

<a id="bw2data.proxies.ExchangeProxyBase.__setitem__"></a>

#### \_\_setitem\_\_

```python
def __setitem__(key, value)
```

<a id="bw2data.proxies.ExchangeProxyBase.valid"></a>

#### valid

```python
def valid(why=False)
```

<a id="bw2data.proxies.ExchangeProxyBase.unit"></a>

#### unit

```python
@property
def unit()
```

Get exchange unit.

Separate property because the unit is a property of the input, not the exchange itself.

<a id="bw2data.proxies.ExchangeProxyBase.amount"></a>

#### amount

```python
@property
def amount()
```

<a id="bw2data.proxies.ExchangeProxyBase.uncertainty"></a>

#### uncertainty

```python
@property
def uncertainty()
```

Get uncertainty dictionary that can be used in uncertainty analysis.

<a id="bw2data.proxies.ExchangeProxyBase.uncertainty_type"></a>

#### uncertainty\_type

```python
@property
def uncertainty_type()
```

Get uncertainty type as a ``stats_arrays`` class.

<a id="bw2data.proxies.ExchangeProxyBase.random_sample"></a>

#### random\_sample

```python
def random_sample(n=100)
```

Draw a random sample from this exchange.

<a id="bw2data.proxies.ExchangeProxyBase.lca"></a>

#### lca

```python
def lca(method=None, amount=None)
```

Shortcut to construct an LCA object for this exchange **input**.

Uses the exchange amount if no other amount is provided.
