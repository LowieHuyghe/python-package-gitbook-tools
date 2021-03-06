#!/usr/bin/env bash

# Automatic error detection
set -e
# Fetch script directory
dir="$(dirname "$0")"


# Arguments
git_remote_url="$1"
git_branch="$2"

# Git user
if [ ! -z "$GH_NAME" ] && [ ! -z "$GH_EMAIL" ]
then
	git config --global user.name "$GH_NAME"
	git config --global user.email "$GH_EMAIL"
elif [ -z "$( git config --global user.name )" ] || [ -z "$( git config --global user.email )" ]
then
	>&2 echo '*** Please tell git who you are.'
	>&2 echo ''
	>&2 echo 'Run'
	>&2 echo ''
	>&2 echo '  git config --global user.email "you@example.com"'
	>&2 echo '  git config --global user.name "Your Name"'
	>&2 echo ''
	>&2 echo 'Or set'
	>&2 echo ''
	>&2 echo '  GH_EMAIL="you@example.com"'
	>&2 echo '  GH_NAME="Your Name"'
	exit 1
fi

# Build
${dir}/build.sh

# Copy CI config
ci_configs=( '.travis.yml' 'circle.yml' )
for ci_config in ${ci_configs[@]}
do
	if [ -f "$ci_config" ]
	then
		cp "$ci_config" "_book/$ci_config"
	fi
done

# Go into generated folder
cd _book
# Initiate git
git init
# Commit empty commit
git commit --allow-empty -m 'Update docs'
# Checkout given branch
git checkout -b "$git_branch"
# Add every change
git add .
# Commit the change
git commit -am 'Update docs'
# Push it to the given repo and branch
git push "$git_remote_url" "$git_branch" --force
