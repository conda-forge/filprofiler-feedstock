#!/bin/bash
set -euo pipefail

# macOS on Conda is ancient so doesn't have MAP_ANONYMOUS:
sed -i -e 's/MAP_ANONYMOUS/MAP_ANON/' filprofiler/_filpreload.c

# Build and install Python code:
export PIP_LOG=/dev/stdout
$PYTHON -m pip install . -vv
