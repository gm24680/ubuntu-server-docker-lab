
#!/usr/bin/env bash
set -euo pipefail

VOLUME="${1:-docker-storage-compose_website_data}"
BACKUP_DIR="${HOME}/docker-backups"

mkdir -p "$BACKUP_DIR"

BACKUP_FILE="${VOLUME}-$(date +%Y%m%d-%H%M%S).tar.gz"
docker volume inspect "$VOLUME" >/dev/null
docker run --rm \
  -v "${VOLUME}:/data:ro" \
  -v "${BACKUP_DIR}:/backup" \
  alpine:3.22 \
  tar czf "/backup/${BACKUP_FILE}" -C /data .

gzip -t "${BACKUP_DIR}/${BACKUP_FILE}"

echo "Backup verified: ${BACKUP_DIR}/${BACKUP_FILE}"

