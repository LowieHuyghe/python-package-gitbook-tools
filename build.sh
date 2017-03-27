#!/usr/bin/env bash

# Automatic error detection
set -e
# Fetch script directory
dir="$(dirname "$0")"


# Install
${dir}/install.sh

# Remove existing
rm -rf ./_book

# Serve
./node_modules/gitbook-cli/bin/gitbook.js build
