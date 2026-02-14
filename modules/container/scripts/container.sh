#!/bin/bash
# Unified container build/run script
# Usage: ./container.sh [build|run] [toolbox|ad|re|web]

set -euo pipefail

ACTION=${1:-run}      # Default action is "run"
PROFILE=${2:-toolbox} # Default profile is "toolbox"

# Map profile to folder and tag
declare -A FOLDERS=(
  ["toolbox"]="toolbox"
  ["ad"]="ad"
  ["re"]="re"
  ["web"]="web"
)
declare -A TAGS=(
  ["toolbox"]="localhost/offsec-toolbox:0.1.0"
  ["ad"]="localhost/offsec-ad:0.1.0"
  ["re"]="localhost/offsec-re:0.1.0"
  ["web"]="localhost/offsec-web:0.1.0"
)

FOLDER=${FOLDERS[$PROFILE]:?Unknown profile $PROFILE}
TAG=${TAGS[$PROFILE]:?Unknown profile $PROFILE}

case $ACTION in
  build)
    echo "[*] Building $PROFILE container..."
    podman build -t "$TAG" \
  -f "modules/container/$FOLDER/Containerfile" \
  .
    ;;
  run)
    echo "[*] Running $PROFILE container..."
    podman run --rm -it -v "$PWD:/work:Z" "$TAG"
    ;;
  *)
    echo "Usage: $0 [build|run] [toolbox|ad|re|web]"
    exit 1
    ;;
esac

