# Setup homebrew
export PATH=/opt/homebrew/bin:$PATH
export EDITOR=nvim
alias vim="nvim"

# Attach to the main tmux session, or create it if it doesn't exist
if [ -z "$TMUX" ]; then
  tmux a -t home || tmux new-session -A -s home
fi

# Setup the route to package manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit"

# Download zinit if it doesn't exist
if [[ ! -d $ZINIT_HOME ]]; then
    mkdir -p $ZINIT_HOME
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "$ZINIT_HOME/zinit.zsh"

# Load core zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit

# keybindings
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Setup history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Routes are custom config files for individual machines
if [ -f ~/.routes ]; then
  source ~/.routes
fi

# ocaml setup
[[ ! -r ~/.opam/opam-init/init.zsh ]] || source ~/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# starship setup
eval "$(starship init zsh)"
# zoxide
eval "$(zoxide init zsh)"
#fzf
eval "$(fzf --zsh)"


[ -f "${HOME}/.ghcup/env" ] && . "${HOME}/.ghcup/env" # ghcup-env
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.3.5 # run chruby to see actual version

function connect_server() {
    local server_name=$1
    tmux switch -t $server_name || tmuxinator start ssh $server_name
    
}

alias cs=connect_server


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/patrick/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/patrick/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/patrick/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/patrick/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

