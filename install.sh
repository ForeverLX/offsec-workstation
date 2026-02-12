#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ./install.sh --profile local-only|solo-operator|team-operator

Notes:
- This installs pacman packages defined in profiles/*.profile (which reference manifests/*.pacman.txt)
- It does NOT apply dotfiles. Use scripts/apply-dotfiles.sh for that.
USAGE
}

PROFILE=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile) PROFILE="${2:-}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown arg: $1"; usage; exit 1 ;;
  esac
done

[[ -n "$PROFILE" ]] || { echo "Missing --profile"; usage; exit 1; }

PROFILE_FILE="profiles/${PROFILE}.profile"
[[ -f "$PROFILE_FILE" ]] || { echo "Profile not found: $PROFILE_FILE"; exit 1; }

echo "[*] Profile: $PROFILE"
echo "[*] Welcome Solo Operator..."
sudo pacman -Syu --noconfirm

while IFS= read -r manifest; do
  [[ -z "$manifest" ]] && continue
  [[ -f "$manifest" ]] || { echo "Missing manifest: $manifest"; exit 1; }

  echo "[*] Installing manifest: $manifest"
  pkgs="$(grep -Ev '^\s*(#|$)' "$manifest" | tr '\n' ' ')"
  [[ -n "$pkgs" ]] && sudo pacman -S --needed --noconfirm $pkgs
done < "$PROFILE_FILE"

# Standard directories (safe to run repeatedly)
mkdir -p "$HOME/engage" "$HOME/loot" "$HOME/notes" "$HOME/exploitdev" "$HOME/projects"
chmod 700 "$HOME/loot" || true

echo "[*] Done. Next: scripts/apply-dotfiles.sh"
