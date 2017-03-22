#!/usr/bin/env bash

# Automatic error detection
set -e
# Go to current working directory
cd "$(dirname "$0")"


# Install
./install.sh

# Remove existing
rm -rf ./_book

# Serve
gitbook build
