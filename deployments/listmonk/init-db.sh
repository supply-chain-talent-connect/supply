#!/bin/bash
set -e

echo "Initializing listmonk database..."

# Set environment variables that listmonk expects
export LISTMONK_db__host="${DB_HOST:-localhost}"
export LISTMONK_db__port="${DB_PORT:-5432}"
export LISTMONK_db__user="${DB_USER:-postgres}"
export LISTMONK_db__password="${DB_PASSWORD}"
export LISTMONK_db__database="${DB_NAME:-listmonk_db}"
export LISTMONK_db__ssl_mode="disable"

# Run listmonk install command
echo "Running listmonk --install..."
./listmonk --install --idempotent --yes

echo "Database initialization complete!"