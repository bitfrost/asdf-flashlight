#!/usr/bin/env bash

releases_path=https://api.github.com/repos/bamlab/flashlight/releases
cmd="curl -s --netrc-optional"
cmd="$cmd $releases_path"

# Fetch all tag names, and get only second column. Then remove all unnecessary characters.
versions=$(eval $cmd | grep -oE "tag_name\": \".{1,15}\"," | sed 's/tag_name\": \"//;s/\",//' | sort --version-sort)
echo $versions