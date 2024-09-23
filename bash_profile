GPG_TTY=$(tty)
export GPG_TTY

# Updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.bin/google-cloud-sdk/path.zsh.inc" ]
then
    . "$HOME/.bin/google-cloud-sdk/path.zsh.inc"
fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]
then
    . "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# Add the ~/.bin to the path.
export "PATH=$HOME/.bin:$PATH"

# Docker buildx.
export BUILDX_NO_DEFAULT_ATTESTATIONS=1
