#!/bin/bash
set -euo pipefail

# macOS on Conda is ancient so doesn't have MAP_ANONYMOUS:
sed -i -e 's/MAP_ANONYMOUS/MAP_ANON/' filpreload/src/_filpreload.c

# Try to fix a bug temporarily?
sed -i -e 's/def pymalloc(size):/def pymalloc(size: uint64_t):/' tests/test-scripts/malloc.py

# Build and install Python code:
export PIP_LOG=/dev/stdout
$PYTHON -m pip install . -vv
