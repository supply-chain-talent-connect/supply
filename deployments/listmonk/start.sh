#!/bin/sh
set -e

echo "Starting listmonk..."

# Use PORT from Cloud Run
PORT="${PORT:-9000}"

# Create config file
cat > /listmonk/config.toml <<EOF
[app]
address = "0.0.0.0:${PORT}"

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

# Initialize database
echo "Initializing database..."
/listmonk/listmonk --install --idempotent --yes --config /listmonk/config.toml || echo "Database init skipped"

# Start server
echo "Starting server on port ${PORT}..."
exec /listmonk/listmonk --config /listmonk/config.toml