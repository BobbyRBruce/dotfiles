#!/bin/zsh
# Copyright (c) 2024 Bobby R. Bruce
# SPDX-License-Identifier: MIT

which brew 2>&1 >/dev/null
if [[ $? == 0 ]]
then
    # brew is already present. No need to install.
    exit 0
fi

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
