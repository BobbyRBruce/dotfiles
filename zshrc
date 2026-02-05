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

# Setup Homrbrew if available.
if [[ -v HOMEBREW_PREFIX ]]
then
   # Ensures that headers and libraries installed via homebrew are set to CPATH
  # and LIBRARY PATH.
  export CPATH="$HOMEBREW_PREFIX/include:$CPATH"
  export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"

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
 # Sets up the brew shell env (allows for brew-related auto-completion).
  eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"
  export PATH="/opt/homebrew/opt/trash/bin:$PATH"
fi

# Added to enable Docker CLI completions.
fpath=(/Users/bobbyrbruce/.docker/completions $fpath)
autoload -Uz compinit
compinit

# Adds the ~/.bin directory to the PATH.
export PATH="$HOME/.bin:$PATH"
