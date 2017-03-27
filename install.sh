#!/usr/bin/env bash

# Automatic error detection
set -e
# Fetch script directory
dir="$(dirname "$0")"


# Install when necessary
if [ ! -f "./node_modules/gitbook-cli/bin/gitbook.js" ]
then
	npm install gitbook-cli
fi

# Install plugins
./node_modules/gitbook-cli/bin/gitbook.js install
