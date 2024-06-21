#!/bin/zsh

which brew 2>&1 >/dev/null
if [[ $? == 0 ]]
then
    # brew is already present. No need to install.
    exit 0
fi

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
