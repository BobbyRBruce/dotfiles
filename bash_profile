GPG_TTY=$(tty)
export GPG_TTY

# Add the ~/.bin to the path.
export "PATH=$HOME/.bin:$PATH"

# Docker buildx.
export BUILDX_NO_DEFAULT_ATTESTATIONS=1
