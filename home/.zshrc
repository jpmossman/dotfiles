# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="julia"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Set prompt engine
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/julia.yaml)"
source $ZSH/oh-my-zsh.sh
# export STARSHIP_CONFIG=~/.config/starship/julia.toml
# eval "$(starship init zsh)"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Add stuff to path
export PATH=~/.local/bin:$PATH
export PATH=~/scripts:$PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
. "$HOME/.cargo/env"

# Add personal aliases
alias dmenu='rofi -dmenu'
alias python=python3
alias ls="exa --icons"
alias la="ls -lah"
alias ll="ls -l"
alias lla="ls -lah"
alias cat="bat"
alias lTree="exa --icons -T --git-ignore -I .git"
alias cz="chezmoi"

# Setup autocompletion for one password
eval "$(op completion zsh)"; compdef _op op

# Use beam instead of block cursor
echo -ne '\e[5 q'

