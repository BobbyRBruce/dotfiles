# Copyright (c) 2024 Bobby R. Bruce
# SPDX-License-Identifier: MIT

if [ -d "/opt/homebrew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$(brew --prefix)/lib"
fi

# Ensure that headers and libraries installed via homebrew are added to CPATH
# and LIBRARY PATH.
export CPATH="$HOMEBREW_PREFIX/include:$CPATH"
export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"

# Not necessary but improves readability of output given by homebrew
export HOMEBREW_NO_ENV_HINTS=1

# This maps `python` to `python3`, `pip` to `pip3`, etc.
export PATH=$HOMEBREW_PREFIX/opt/python3/libexec/bin:$PATH

# Setup LLVM PATHS.
export PATH="$HOMEBREW_PREFIX/opt/llvm/bin:$PATH"
export LIBRARY_PATH="$HOMEBREW_PREFIX/opt/llvm/lib:$LIBRARY_PATH"
export INCLUDE_PATH="$HOMEBREW_PREFIX/opt/llvm/include:$INCLUDE_PATH"

# Updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]
then
    . "$HOME/google-cloud-sdk/path.zsh.inc"
fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]
then
    . "$HOME/google-cloud-sdk/completion.zsh.inc"
fi
