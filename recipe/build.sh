#!/bin/bash
set -euo pipefail

# macOS on Conda is ancient so doesn't have MAP_ANONYMOUS:
sed -i -e 's/MAP_ANONYMOUS/MAP_ANON/' filpreload/src/_filpreload.c

# Build and install Python code:
export PIP_LOG=/dev/stdout
$PYTHON setup.py bdist_wheel --dist-dir=dist
$PYTHON -m pip install --find-links=dist --no-deps --ignore-installed --no-cache-dir -vvv filprofiler
