# Functions
tmux_attach_or_new() {
  local session="${1:?Usage: tmux_attach_or_new <session-name>}"

  if [[ -n "$TMUX" ]]; then
    echo "Already inside a tmux session. Use 'tmux switch-client -t $session' instead." >&2
    return 1
  fi

  if tmux has-session -t "$session" 2>/dev/null; then
    tmux attach-session -t "$session"
  else
    tmux new-session -s "$session"
  fi
}

if [ -f "${HOME}/.zsh_work" ]; then
  source "${HOME}/.zsh_work"
fi

# Stop the hostname appearing in the prompt
DEFAULT_USER=$USER

# Only press enter once when I'm happy with my selection
bindkey -M menuselect '^M' .accept-line

# On an ambiguous completion, automatically list choices when the completion function is called twice in succession.
setopt BASH_AUTO_LIST

# Enable option stacking for Docker
zstyle ':completion:*:*:docker:*' optional-stacking yes
zstyle ':completion:*:*:docker-:*' optional-stacking yes

if [ ! -f "${HOME}/.zsh_work" ]; then
  export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
fi

export HOMEBREW_NO_AUTO_UPDATE=1
export UV_PYTHON_PREFERENCE=only-managed

# ZSH zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias ca="chezmoi apply"
alias cad="chezmoi add"
alias cat="bat"
alias ccd="chezmoi cd"
alias ce="chezmoi edit"
alias cra='chezmoi re-add --verbose'
alias cv="chezmoi verify"
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias ffe='$EDITOR "$(ff)"'
alias gp='git pull'
alias gs='git status'
alias lg="lazygit"
alias tn='tmux_attach_or_new'
alias v="nvim"
alias vim="nvim"
alias zj="ZELLIJ_SOCKET_DIR=/tmp/zellij-test zellij"

# Starship
export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"

