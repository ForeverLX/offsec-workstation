# offsec-workstation zsh drop-in
# Sourced from ~/.zshrc — keep this file safe and additive.

# Neovim shortcut
alias v="nvim"

# Yazi: exit into the last directory you visited
function y() {
  local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  command yazi "$@" --cwd-file="$tmp"
  cwd="$(cat -- "$tmp" 2>/dev/null || true)"
  [[ -n "$cwd" && -d "$cwd" && "$cwd" != "$PWD" ]] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# Fuzzy file picker with preview
# Requires: bat, rg, fzf
alias ff='rg --files | fzf --preview "bat --style=numbers --color=always {}"'

# zoxide (smart directory jumping)
eval "$(zoxide init zsh)"
