#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 BACKUP_FILE NEW_VOLUME"
    exit 1
fi

BACKUP_FILE="$(realpath "$1")"
VOLUME="$2"

if [[ ! -f "$BACKUP_FILE" ]]; then
    echo "Error: Backup file not found"
    exit 1
fi

if ! [[ "$VOLUME" =~ ^[a-zA-Z0-9][a-zA-Z0-9_.-]*$ ]]; then
    echo "Error: Invalid volume name"
    exit 1
fi

if docker volume inspect "$VOLUME" >/dev/null 2>&1; then
    echo "Error: Volume already exists. Use a new volume name."
    exit 1
fi

gzip -t "$BACKUP_FILE"

docker volume create "$VOLUME"

docker run --rm \
    -v "${VOLUME}:/restore" \
    -v "$(dirname "$BACKUP_FILE"):/backup:ro" \
    alpine:3.22 \
    tar xzf "/backup/$(basename "$BACKUP_FILE")" -C /restore

echo "Restore completed into volume: $VOLUME"
