# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="eastwood"

# Update the autoupdater automatically, without asking.
zstyle ':omz:update' mode auto

# Autoudate frequency
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    colored-man-pages
    dirhistory
    docker
    docker-machine
    gh
    git-auto-fetch
    macos
    mongocli
    systemd
    command-not-found
    history
    brew
    z
)
source $ZSH/oh-my-zsh.sh

# Set Github CoPilot Alias.
eval "$(gh copilot alias -- zsh)"
