# Setup homebrew
export PATH=/opt/homebrew/bin:$PATH
export EDITOR=nvim
alias vim="nvim"

# Attach to the main tmux session, or create it if it doesn't exist
if [ -z "$TMUX" ]; then
  tmux a -t main || tmux new-session -A -s main
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

