#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_DIR="${HOME}/.offsec-workstation-backups/$(date +%Y%m%d_%H%M%S)"

mkdir -p "$BACKUP_DIR" "$HOME/.config"

backup_if_exists() {
  local path="$1"
  if [[ -e "$path" && ! -L "$path" ]]; then
    mkdir -p "$BACKUP_DIR/$(dirname "$path")"
    cp -a "$path" "$BACKUP_DIR/$path"
  fi
}

link_force() {
  local src="$1" dst="$2"
  backup_if_exists "$dst"
  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"
}

echo "[*] Backups: $BACKUP_DIR"

# tmux
link_force "$ROOT/dotfiles/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

# nvim
link_force "$ROOT/dotfiles/nvim/init.lua" "$HOME/.config/nvim/init.lua"

# zsh: source-only drop-in (do NOT overwrite ~/.zshrc)
mkdir -p "$HOME/.config/offsec-workstation"
link_force "$ROOT/dotfiles/zsh/offsec.zsh" "$HOME/.config/offsec-workstation/offsec.zsh"

if ! rg -q 'offsec-workstation/offsec\.zsh' "$HOME/.zshrc"; then
  echo '[*] Adding source line to ~/.zshrc'
  printf '\n# offsec-workstation\nsource "$HOME/.config/offsec-workstation/offsec.zsh"\n' >> "$HOME/.zshrc"
else
  echo "[*] ~/.zshrc already sources offsec-workstation"
fi

echo "[*] Done. Restart your shell or run: source ~/.zshrc"
