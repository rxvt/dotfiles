# Disable Fish greeting
set -g fish_greeting

set -gx EDITOR nvim

# Homebrew
/opt/homebrew/bin/brew shellenv | source
set -gx HOMEBREW_NO_AUTO_UPDATE 1

# ASDF
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# Bun
set -gx BUN_INSTALL "$HOME/Library/Application Support/reflex/bun"
set -gx --prepend PATH "$BUN_INSTALL/bin"

# UV
set -gx UV_PYTHON_PREFERENCE only-managed

# direnv
direnv hook fish | source

# fzf
fzf --fish | source

# 1Password
set -gx SSH_AUTH_SOCK "$HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Starship
set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
starship init fish | source

# Zoxide
zoxide init fish | source

# Bat
set -gx BAT_THEME "Catppuccin Macchiato"

# Aliases
alias cd="z"
alias cad="chezmoi add"
alias ca="chezmoi apply"
alias cra="chezmoi re-add --verbose"
alias cat="bat"
alias ccd="chezmoi cd"
alias ce="chezmoi edit"
alias cv="chezmoi verify"
alias fzfp="fzf --preview 'bat --color=always {}'"
alias lg="lazygit"
alias ll="eza --icons -l"
alias ls="eza --icons"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"
alias mc="VIEWER=mc_pager mc"
alias venv="source ./.venv/bin/activate"
alias vim="nvim"
alias v="nvim"
alias zj="zellij"

if status is-interactive
    # Commands to run in interactive sessions can go here
end
