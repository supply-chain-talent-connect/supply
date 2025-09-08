#!/bin/sh
set -e

# This wrapper is designed to work with the listmonk base image's entrypoint

echo "Starting listmonk wrapper..."
echo "Current directory: $(pwd)"
echo "Script location: $0"
echo "Environment PORT: ${PORT}"

# Use PORT env variable if set by Cloud Run, otherwise default to 9000
LISTEN_PORT="${PORT:-9000}"
echo "Will listen on port: ${LISTEN_PORT}"

ls -la /listmonk/

# Wait a moment for Cloud SQL proxy
sleep 3

# Create config from environment variables  
echo "Creating config file..."
cat > /listmonk/config.toml <<EOF
[app]
address = "0.0.0.0:${LISTEN_PORT}"

[db]
host = "/cloudsql/supply-chain-talent-connect:us-central1:supply-postgres-micro"
port = 5432
user = "postgres"
password = "${DATABASE_PASSWORD}"
database = "listmonk_db"
ssl_mode = "disable"
max_open = 25
max_idle = 25
max_lifetime = "300s"
params = ""
EOF

echo "Config file created."

# Initialize database if needed
echo "Checking database initialization..."
if ./listmonk --install --idempotent --yes --config /listmonk/config.toml; then
    echo "Database initialization complete."
else
    echo "Database already initialized or initialization failed (continuing anyway)."
fi

# Start listmonk
echo "Starting listmonk server..."
exec ./listmonk --config /listmonk/config.toml