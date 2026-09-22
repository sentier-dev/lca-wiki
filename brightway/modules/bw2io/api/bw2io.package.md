**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.package` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.package cfg.yml > bw2io.package.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.package"></a>

# bw2io.package

<a id="bw2io.package.BW2Package"></a>

## BW2Package Objects

```python
class BW2Package(object)
```

This is a format for saving objects which implement the :ref:`datastore` API.

Data is stored as a BZip2-compressed file of JSON data.

This archive format is compatible across Python versions, and is, at least in theory, programming-language agnostic.

Validation is done with ``bw2data.validate.bw2package_validator``.
The data format is:

.. code-block:: python

    {
        'metadata': {},                                     # Dictionary of metadata to be written to metadata-store.
        'name': basestring,                                 # Name of object
        'class': {                                          # Data on the underlying class. A new class is instantiated
                                                            # based on these strings. See _create_class.
            'module': basestring,                           # e.g. "bw2data.database"
            'name': basestring                              # e.g. "Database"
        },
        'unrolled_dict': bool,                              # Flag indicating if dictionary keys needed to
                                                            # be modified for JSON (as JSON keys can't be tuples)
        'data': object                                      # Object data, e.g. LCIA method or LCI database
    }

Warnings
--------
Perfect roundtrips between machines are not guaranteed:
    * All lists are converted to tuples (because JSON does not distinguish between lists and tuples).
    * Absolute filepaths in metadata would be specific to a certain computer and user.

Notes
-----
This class does not need to be instantiated, as all its methods are ``classmethods``, i.e. do ``BW2Package.import_obj("foo")`` instead of ``BW2Package().import_obj("foo")``

<a id="bw2io.package.BW2Package.APPROVED"></a>

#### APPROVED

<a id="bw2io.package.BW2Package.export_objs"></a>

#### export\_objs

```python
@classmethod
def export_objs(cls,
                objs,
                filename,
                folder="export",
                backwards_compatible=False)
```

Export a list of objects. Can have heterogeneous types.

Parameters
----------
objs : list
    List of objects to export.
filename : str
    Name of file to create.
folder : str, optional
    Folder to create file in. Default is ``export``.
backwards_compatible : bool, optional
    Create package compatible with bw2data version 1.

Returns
-------
str
    Filepath of created file.

<a id="bw2io.package.BW2Package.export_obj"></a>

#### export\_obj

```python
@classmethod
def export_obj(cls,
               obj,
               filename=None,
               folder="export",
               backwards_compatible=False)
```

Export an object.

Parameters
----------
obj : object
    Object to export.
filename : str, optional
    Name of file to create. Default is ``obj.name``.
folder : str, optional
    Folder to create file in. Default is ``export``.
backwards_compatible : bool, optional
    Create package compatible with bw2data version 1.

Returns
-------
str
    Filepath of created file.

<a id="bw2io.package.BW2Package.load_file"></a>

#### load\_file

```python
@classmethod
def load_file(cls, filepath, whitelist=True)
```

Load a bw2package file with one or more objects. Does not create new objects.

Parameters
----------
filepath : str
    Path of file to import
whitelist : bool
    Apply whitelist of approved classes to allowed types. Default is ``True``.

Returns
-------
The loaded data in the bw2package dict data format, with the following changes:
    * ``"class"`` is an actual Python class object (but not instantiated).

<a id="bw2io.package.BW2Package.import_file"></a>

#### import\_file

```python
@classmethod
def import_file(cls, filepath, whitelist=True)
```

Import bw2package file, and create the loaded objects, including registering, writing, and processing the created objects.

Parameters
----------
filepath : str
    Path of file to import
whitelist : bool
    Apply whitelist to allowed types. Default is ``True``.

Returns
-------
object or list of objects
    Created object or list of created objects.

<a id="bw2io.package.download_biosphere"></a>

#### download\_biosphere

```python
def download_biosphere()
```

<a id="bw2io.package.download_methods"></a>

#### download\_methods

```python
def download_methods()
```
