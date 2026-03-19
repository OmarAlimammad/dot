export PATH="$HOME/.cargo/bin:$PATH"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export EDITOR="nvim"

alias cl="clear"
alias nv="nvim"
alias tm="tmux"
alias py="python"
alias ls="eza --icons -la"

source ~/.zsh/fsh/fsh.plugin.zsh
source ~/.zsh/cp.zsh
