#!/usr/bin/env bash

# Copyright (c) 2024 Bobby R. Bruce
# SPDX-License-Identifier: MIT
#
# A pre-commit script to ensure I don't commit to my gem5 fork's 'develop' or
# 'stable' branches. The gem5 project does not allow direct commits to these
# branches (PRs only), and github's fork sync feature breaks if I update
# these branches.

rev_parse=$(git rev-parse --abbrev-ref HEAD@{upstream} 2>&1)
if [ $? != 0 ]; then
    # if `git rev-parse` fails it's almost certainly because no upstream
    # exits for this branch. In which case there's no problem
    exit 0
fi

remote=$(echo $rev_parse | cut -d/ -f2)
branch=$(echo $rev_parse | cut -d/ -f3)
remote_url=$(git remote get-url $remote |  rev | cut -d/ -f 1-2 | rev)


if [ "$remote_url" = "bobbyrbruce/gem5" ] || \
[ "$remote_url" = "bobbyrbruce/gem5.git" ]; then


if [ "$branch" = "stable" ] || [ "$branch" = "develop" ]; then
        >&2 echo "You can't commit directly to $branch branch"
        >&2 echo "Remote: $remote"
        >&2 echo "Remote URL: $remote_url"
        exit 1
    fi
fi
