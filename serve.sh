#!/usr/bin/env bash

# Automatic error detection
set -e
# Fetch script directory
dir="$(dirname "$0")"


# Install
${dir}/install.sh

# Serve
gitbook serve
