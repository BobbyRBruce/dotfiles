# Copyright (c) 2024 Bobby R. Bruce
# SPDX-License-Identifier: MIT

# [NOT REQUIRED] Improves readability of output given by homebrew.
# Homebrew hints tend to make its output too noisy
export HOMEBREW_NO_ENV_HINTS=1

# Required in some environments for gpg to work correctly.
export GPG_TTY=$(tty)

# Ensures when we build multplatform docker images the Manifest doesn't not
# contain default attestations; something which the GitHub Container Registry
# fails to parse correctly.
export BUILDX_NO_DEFAULT_ATTESTATIONS=1
