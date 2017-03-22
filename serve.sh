#!/usr/bin/env bash

# Automatic error detection
set -e
# Go to current working directory
cd "$(dirname "$0")"


# Install
./install.sh

# Serve
gitbook serve
