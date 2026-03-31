eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export EDITOR="nvim"

alias nv="nvim"
alias tm="tmux"
alias cl="clear"
alias py="python"
alias jv="java"
alias ls="eza --icons -la"

if [[ -z "$TMUX" ]]; then
  tmux a || tmux
fi

source ~/.zsh/fsh/fsh.plugin.zsh
source ~/.zsh/cp.zsh
