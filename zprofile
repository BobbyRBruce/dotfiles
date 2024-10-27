# Copyright (c) 2024 Bobby R. Bruce
# SPDX-License-Identifier: MIT

# If brew is installed then the "HOMEBREW_PREFIX" env var will be set to the
# directory in which homebrew and the packages it manages are stored. Otherwise
# This env var is not set.
if [[ -v HOMEBREW_PREFIX ]]
then
  # Sets up the brew shell env (allows for brew-related auto-completion).
  eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"

  # Ensures that headers and libraries installed via homebrew are set to CPATH
  # and LIBRARY PATH.
  export CPATH="$HOMEBREW_PREFIX/include:$CPATH"
  export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"

  # [NOT REQUIRED] Improves readability of output given by homebrew.
  # Homebrew hints tend to make its output too noisy
  export HOMEBREW_NO_ENV_HINTS=1

  # [NOT REQUIRED] Maps `python` to `python3`, `pip` to `pip3`, etc.
  export PATH=$HOMEBREW_PREFIX/opt/python3/libexec/bin:$PATH

  # Add the Homebrew LLVM to the PATH, LIBRARY_PATH, INCLUDE_PATH
  # We ensure these are at the beginning of the path so it takes
  # priority over any other LLVM installs on the system.
  export PATH="$HOMEBREW_PREFIX/opt/llvm/bin:$PATH"
  export LIBRARY_PATH="$HOMEBREW_PREFIX/opt/llvm/lib:$LIBRARY_PATH"
  export INCLUDE_PATH="$HOMEBREW_PREFIX/opt/llvm/include:$INCLUDE_PATH"

  # Sets the Homebrew LLVM stdlib and inc. files to the default via LDFLAGS and
  # CPPFLAGS.
  export LDFLAGS="-L${HOMEBREW_PREFIX}/opt/llvm/lib"
  export CPPFLAGS="-I${HOMEBREW_PREFIX}/opt/llvm/include"
fi

# Updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.bin/google-cloud-sdk/path.zsh.inc" ]
then
  . "$HOME/.bin/google-cloud-sdk/path.zsh.inc"
fi

# Enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]
then
  . "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# Required in some environments for gpg to work correctly.
export GPG_TTY=$(tty)

# Adds the ~/.bin directory to the PATH.
export PATH="$HOME/.bin:$PATH"

# Ensures when we build multplatform docker images the Manifest doesn't not
# contain default attestations; something which the GitHub Container Registry
# fails to parse correctly.
export BUILDX_NO_DEFAULT_ATTESTATIONS=1
