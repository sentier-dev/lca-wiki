#!/usr/bin/env bash
# Verify and unpack a BAFU release you have already downloaded.
#
# This script downloads nothing. A BAFU release is handed over only after the terms
# of use have been accepted on the publisher's download page, and no documented
# stable direct file URL exists; see fetch.md. Download the components yourself,
# then point this script at the directory holding them.
#
# Usage:  ./fetch.sh <directory with the release files>
#
# It expects a CHECKSUMS.txt in that directory, with one sha256sum line per file,
# as fetch.md describes. It verifies those checksums, then unpacks the two zip
# archives into an "extracted" subdirectory. The .zolca package is left alone:
# import it in openLCA rather than unzipping it.

set -euo pipefail

release_dir="${1:-}"
if [ -z "${release_dir}" ]; then
  echo "usage: $0 <directory with the release files>" >&2
  exit 2
fi
if [ ! -d "${release_dir}" ]; then
  echo "not a directory: ${release_dir}" >&2
  exit 2
fi
if [ ! -f "${release_dir}/CHECKSUMS.txt" ]; then
  echo "no CHECKSUMS.txt in ${release_dir}; see fetch.md for how to make one" >&2
  exit 2
fi

echo "verifying checksums in ${release_dir}"
( cd "${release_dir}" && sha256sum --check --ignore-missing CHECKSUMS.txt )

target="${release_dir}/extracted"
mkdir -p "${target}"

shopt -s nullglob
found_any=0
for archive in "${release_dir}"/*.zip; do
  found_any=1
  echo "unpacking $(basename "${archive}")"
  unzip -q -o "${archive}" -d "${target}"
done
shopt -u nullglob

if [ "${found_any}" -eq 0 ]; then
  echo "no .zip components found in ${release_dir}; nothing to unpack" >&2
fi

echo "done. Extracted files are under ${target}."
echo "The .zolca package, if present, was left as is: import it in openLCA."
