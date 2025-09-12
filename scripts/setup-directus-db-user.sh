#!/usr/bin/env bash
set -euo pipefail

# Create/update the directus_user in Postgres and grant required privileges.
# Assumes you can reach the DB (e.g., via Cloud SQL Proxy on localhost).

DB_NAME="${DB_NAME:-directus_db}"
DB_HOST="${DB_HOST:-127.0.0.1}"
DB_PORT="${DB_PORT:-5432}"
DB_SUPERUSER="${DB_SUPERUSER:-postgres}"
DIRECTUS_PASSWORD="${DIRECTUS_PASSWORD:-}"

usage() {
  echo "Usage: DB_NAME=directus_db DB_HOST=127.0.0.1 DB_PORT=5432 DB_SUPERUSER=postgres DIRECTUS_PASSWORD=... $0" >&2
}

if [[ -z "${DIRECTUS_PASSWORD}" ]]; then
  echo -n "Enter password for new/updated role 'directus_user': " >&2
  read -rs DIRECTUS_PASSWORD
  echo >&2
fi

echo "Connecting to ${DB_HOST}:${DB_PORT}, database=${DB_NAME}, as ${DB_SUPERUSER}" >&2

psql \
  -h "${DB_HOST}" \
  -p "${DB_PORT}" \
  -U "${DB_SUPERUSER}" \
  -d "${DB_NAME}" \
  -v ON_ERROR_STOP=1 \
  -v DIRECTUS_PASSWORD="${DIRECTUS_PASSWORD}" \
  -f "$(dirname "$0")/create-directus-db-user.sql"

echo "directus_user created/updated and granted privileges on ${DB_NAME}" >&2

