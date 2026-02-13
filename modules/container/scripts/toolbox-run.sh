#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IMG="${IMG:-offsec-toolbox:local}"

# podman preferred; docker also works (compat)
ENGINE="${ENGINE:-podman}"
command -v "$ENGINE" >/dev/null 2>&1 || { echo "[!] Missing container engine: $ENGINE"; exit 1; }

echo "[*] Building $IMG from $ROOT/offsec-toolbox/Containerfile"
"$ENGINE" build \
  -t "$IMG" \
  -f "$ROOT/offsec-toolbox/Containerfile" \
  "$ROOT/offsec-toolbox"

