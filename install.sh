#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ./install.sh --profile local-only|solo-operator|team-operator [--yes] [--dry-run]

Options:
  --yes      Unattended install (passes --noconfirm to pacman)
  --dry-run  Print what would be installed; do not change the system

Notes:
- Installs pacman packages defined in profiles/*.profile (which reference manifests/*.pacman.txt)
- Does NOT apply dotfiles. Use scripts/apply-dotfiles.sh for that.
USAGE
}

PROFILE=""
YES=0
DRY_RUN=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile) PROFILE="${2:-}"; shift 2 ;;
    --yes) YES=1; shift ;;
    --dry-run) DRY_RUN=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown arg: $1"; usage; exit 1 ;;
  esac
done

[[ -n "$PROFILE" ]] || { echo "Missing --profile"; usage; exit 1; }

PROFILE_FILE="profiles/${PROFILE}.profile"
[[ -f "$PROFILE_FILE" ]] || { echo "Profile not found: $PROFILE_FILE"; exit 1; }

PACMAN_INSTALL_ARGS=(--needed)
if [[ "$YES" -eq 1 ]]; then
  PACMAN_INSTALL_ARGS+=(--noconfirm)
fi

echo "[*] Profile: $PROFILE"
echo "[*] Profile file: $PROFILE_FILE"
echo "[*] Mode: $([[ "$DRY_RUN" -eq 1 ]] && echo DRY-RUN || echo APPLY)"
echo "[*] pacman install args: ${PACMAN_INSTALL_ARGS[*]}"

# Gather packages from manifests listed in the profile
PKGS=()
while IFS= read -r manifest; do
  [[ -z "$manifest" ]] && continue
  [[ -f "$manifest" ]] || { echo "Missing manifest: $manifest"; exit 1; }

  echo "[*] Reading manifest: $manifest"
  while IFS= read -r line; do
    [[ -z "$line" ]] && continue
    [[ "$line" =~ ^[[:space:]]*# ]] && continue
    PKGS+=("$line")
  done < "$manifest"
done < "$PROFILE_FILE"

echo
echo "[*] Packages to install (${#PKGS[@]}):"
printf '  - %s\n' "${PKGS[@]}"
echo

echo "[*] Standard directories to ensure:"
echo "  - $HOME/engage"
echo "  - $HOME/loot (chmod 700)"
echo "  - $HOME/notes"
echo "  - $HOME/exploitdev"
echo "  - $HOME/projects"
echo

if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "[*] Dry run complete. No changes made."
  exit 0
fi

echo "[*] Updating package DB + upgrading system..."
if [[ "$YES" -eq 1 ]]; then
  sudo pacman -Syu --noconfirm
else
  sudo pacman -Syu
fi

echo "[*] Installing packages..."
if [[ "${#PKGS[@]}" -gt 0 ]]; then
  sudo pacman -S "${PACMAN_INSTALL_ARGS[@]}" "${PKGS[@]}"
fi

mkdir -p "$HOME/engage" "$HOME/loot" "$HOME/notes" "$HOME/exploitdev" "$HOME/projects"
chmod 700 "$HOME/loot" || true

echo "[*] Step 1 Complete. Next Command: scripts/apply-dotfiles.sh"

