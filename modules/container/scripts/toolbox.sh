#!/usr/bin/env bash
set -euo pipefail

IMAGE="${IMAGE:-offsec-toolbox:local}"

# Directory contract (create if missing)
mkdir -p "$HOME/engage" "$HOME/loot" "$HOME/notes" "$HOME/exploitdev" "$HOME/projects"
chmod 700 "$HOME/loot" 2>/dev/null || true

exec podman run --rm -it \
  --userns=keep-id \
  --security-opt=no-new-privileges \
  -v "$HOME/engage:/home/operator/engage:Z" \
  -v "$HOME/loot:/home/operator/loot:Z" \
  -v "$HOME/notes:/home/operator/notes:Z" \
  -v "$HOME/exploitdev:/home/operator/exploitdev:Z" \
  -v "$HOME/projects:/home/operator/projects:Z" \
  "$IMAGE"

