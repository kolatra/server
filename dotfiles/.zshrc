export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="aphrodite/aphrodite"

HYPHEN_INSENSITIVE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.

alias vim="nvim"
alias refresh="source ~/.zshrc && echo 'Reloaded'"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimconfig="nvim ~/.config/nvim"
alias exa='eza' # no more typo
alias ls='exa -lh --all --group-directories-first --sort=name --time-style=long-iso --git --icons'
alias lsm='exa -lh --all --group-directories-first --sort=mod --time-style=long-iso --git --icons'
alias .='ls'
# alias ls='ls -Failh'
alias df='df -h'
alias du='du -ch'

export PATH="/home/tyler/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
