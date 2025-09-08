#!/bin/sh

# Simple startup script that listmonk can understand
echo "Listmonk startup script starting..."

# Use PORT from Cloud Run or default to 9000
PORT="${PORT:-9000}"

# Set environment variables that listmonk understands
export LISTMONK_app__address="0.0.0.0:${PORT}"
export LISTMONK_db__host="/cloudsql/supply-chain-talent-connect:us-central1:supply-postgres-micro"
export LISTMONK_db__port="5432"
export LISTMONK_db__user="postgres"
export LISTMONK_db__password="${DATABASE_PASSWORD}"
export LISTMONK_db__database="listmonk_db"
export LISTMONK_db__ssl_mode="disable"

echo "Waiting for Cloud SQL proxy..."
sleep 5

echo "Initializing database..."
/listmonk/listmonk --install --idempotent --yes || true

echo "Starting listmonk on port ${PORT}..."
exec /listmonk/listmonk