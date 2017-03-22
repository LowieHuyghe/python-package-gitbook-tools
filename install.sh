#!/usr/bin/env bash

# Automatic error detection
set -e
# Fetch script directory
dir="$(dirname "$0")"


# Install when necessary
if ! command -v gitbook > /dev/null
then
    npm install -g gitbook-cli
fi

# Install plugins
gitbook install
